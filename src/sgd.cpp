/*
 Lishex (codename 1F98A), a UCI chess engine built in C++
 Copyright (C) 2023 Michal Kurek

 Lishex is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Lishex is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/* SGD implementation influenced by Berserk.
 * We numerically estimate the gradients */
#include "sgd.h"

#include <vector>
#include <cmath>
#include <random>
#include <algorithm>
#include <fstream>
#include <sstream>

#include "board.h"
#include "search.h"
#include "eval.h"

namespace {

// Adam parameters
constexpr double initial_a = 2; // Initial step size
constexpr double b1 = 0.9;         // Decay (forgetting) factor for gradients
constexpr double b2 = 0.999;       // Decay factor for second moments of gradients
constexpr double epsilon = 1e-8;   // Avoid div-by-zero

// Tuning Parameters
constexpr bool tune_material    = 0;
constexpr bool tune_pawn_psqt   = 0;
constexpr bool tune_knight_psqt = 0;
constexpr bool tune_bishop_psqt = 0;
constexpr bool tune_rook_psqt   = 0;
constexpr bool tune_queen_psqt  = 0;
constexpr bool tune_king_psqt   = 0;
constexpr bool tune_king_safety = 0;
constexpr bool tune_pawn_eval   = 1;
constexpr int datapoints_no = 2'000'000;
constexpr int epochs_no = 500;
size_t batch_size = 262144;
//int batch_size = 128;

double K = 0.8649;
// https://www.chessprogramming.org/Pawn_Advantage,_Win_Percentage,_and_Elo
// Sigmoid(s)=1/(1+10^(-K/400))
// where K is a scaling constant
inline double winning_prob(double score) {
    return 1.0 / (1.0 + std::pow(10.0, -K*static_cast<double>(score) / 400.0));
}

// Random number generator for initializing positions and velocities
std::random_device rd;
std::mt19937 rng(rd());

inline double rand_within(int lower, int upper) {
    std::uniform_real_distribution<double> unif(lower, upper);
    return unif(rng);
}

// Vector storing all of our position datapoints
std::vector<datapoint_t> positions;

// Vector storing references to engine parameters
std::vector<param_t> parameters;
std::vector<param_t> best_parameters;

// Vector storing gradients
std::vector<double> gradients;

// Error squared for a single datapoint x
double error(datapoint_t& x) {
    board_t b[1];
    searchinfo_t i[1];
    stack_t s[MAX_MOVES];
    setup(b, x.fen);
    int score = quiescence(-oo, +oo, b, i, s);
    return std::pow(x.result - winning_prob(score), 2);
}

// Mean square error for the batch (if no batch size specified, then for the entire dataset)
double MSE(int batch = -1) {
    if (batch == -1)
        batch = positions.size();

    double total_error = 0;
    for (int i = 0; i < batch; ++i) {
        total_error += error(positions[i]);
    }
    return total_error / double(batch);
}

std::string dataset = "/home/mkjm/Projects/lishex/tune/dataset.csv";

void load_datapoints(std::string &filename) {

    std::fstream file(filename, std::ios::in);

    if (!file.is_open()) {
        std::cout << "Failed to open file '" << filename << "'" << std::endl;
        exit(1);
    }

    std::string line, token;
    // Skip the first line of the CSV (column names)
    std::getline(file, line);

    size_t count = 0;
    // For each line, parse the FEN and the corresponding eval score
    while (std::getline(file, line)) {
        count++;
        if (count >= datapoints_no) break;
        std::cout << "Reading entry " << count << "\r";
        std::cout.flush();

        std::istringstream iss(line);
        std::vector<std::string> tokens;
        while (std::getline(iss, token, ',')) {
            tokens.push_back(token);
        }

        if (tokens.size() != 2) {
            std::cout << "Error parsing line: " << line << std::endl;
            continue;
        }
        std::string fen = tokens[0];
        // 1 for Won, 0.5 for Draw, 0 for Lost
        double outcome = std::stod(tokens[1]);

        if (!fen.empty()) {
            positions.push_back({fen, outcome, 0.0});
        }
    }
    file.close();

    std::cout << "File '" << filename << "' opened successfully" << std::endl;
}

void register_parameters() {

    if constexpr (tune_material) {
        std::cout << "Tuning material values" << std::endl;
        for (int i = 0; i < PIECE_NO; ++i) {
            parameters.push_back({"value_mg["+std::to_string(i)+"]", &value_mg[i]});
            parameters.push_back({"value_eg["+std::to_string(i)+"]", &value_eg[i]});
        }
    }

    if constexpr (tune_pawn_psqt) {
        std::cout << "Tuning pawn piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"pawn_table_mg["+std::to_string(i)+"]", &pawn_table_mg[i]});
            parameters.push_back({"pawn_table_eg["+std::to_string(i)+"]", &pawn_table_eg[i]});
        }
    }

    if constexpr (tune_knight_psqt) {
        std::cout << "Tuning knight piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"knight_table_mg["+std::to_string(i)+"]", &knight_table_mg[i]});
            parameters.push_back({"knight_table_eg["+std::to_string(i)+"]", &knight_table_eg[i]});
        }
    }

    if constexpr (tune_bishop_psqt) {
        std::cout << "Tuning bishop piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"bishop_table_mg["+std::to_string(i)+"]", &bishop_table_mg[i]});
            parameters.push_back({"bishop_table_eg["+std::to_string(i)+"]", &bishop_table_eg[i]});
        }
    }

    if constexpr (tune_rook_psqt) {
        std::cout << "Tuning rook piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"rook_table_mg["+std::to_string(i)+"]", &rook_table_mg[i]});
            parameters.push_back({"rook_table_eg["+std::to_string(i)+"]", &rook_table_eg[i]});
        }
    }

    if constexpr (tune_queen_psqt) {
        std::cout << "Tuning queen piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"queen_table_mg["+std::to_string(i)+"]", &queen_table_mg[i]});
            parameters.push_back({"queen_table_eg["+std::to_string(i)+"]", &queen_table_eg[i]});
        }
    }

    if constexpr (tune_king_psqt) {
        std::cout << "Tuning king piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"king_table_mg["+std::to_string(i)+"]", &king_table_mg[i]});
            parameters.push_back({"king_table_eg["+std::to_string(i)+"]", &king_table_eg[i]});
        }
    }

    if constexpr (tune_king_safety) {
        std::cout << "Tuning king safety" << std::endl;
        parameters.push_back({"PAWN_SHIELD1_BONUS", &PAWN_SHIELD1_BONUS});
        parameters.push_back({"PAWN_SHIELD2_BONUS", &PAWN_SHIELD2_BONUS});
        parameters.push_back({"PAWN_STORM_PENALTY", &PAWN_STORM_PENALTY});
    }

    if constexpr (tune_pawn_eval) {
        std::cout << "Tuning miscellaneous pawn evaluation parameters" << std::endl;
        parameters.push_back({"isolated_pawn", &isolated_pawn});
        parameters.push_back({"doubled_pawn", &doubled_pawn});
        parameters.push_back({"pawn_supported", &pawn_supported});
        parameters.push_back({"pawn_protected_bonus", &pawn_protected_bonus});
        parameters.push_back({"SAFE_PAWN_ATTACK", &SAFE_PAWN_ATTACK});
        // Note: no pawns on rank 1 and 8 (rank indices 0 and 7)
        parameters.push_back({"passed_pawn[1]", &passed_pawn[1]});
        parameters.push_back({"passed_pawn[2]", &passed_pawn[2]});
        parameters.push_back({"passed_pawn[3]", &passed_pawn[3]});
        parameters.push_back({"passed_pawn[4]", &passed_pawn[4]});
        parameters.push_back({"passed_pawn[5]", &passed_pawn[5]});
        parameters.push_back({"passed_pawn[6]", &passed_pawn[6]});
        parameters.push_back({"pawn_bonuses[1]", &pawn_bonuses[1]});
        parameters.push_back({"pawn_bonuses[2]", &pawn_bonuses[2]});
        parameters.push_back({"pawn_bonuses[3]", &pawn_bonuses[3]});
        parameters.push_back({"pawn_bonuses[4]", &pawn_bonuses[4]});
        parameters.push_back({"pawn_bonuses[5]", &pawn_bonuses[5]});
        parameters.push_back({"pawn_bonuses[6]", &pawn_bonuses[6]});
    }

}


void print_parameters(std::vector<param_t>& params) {
    std::cout << "Engine parameters:" << std::endl;
    for (const param_t &p : params) {
        std::cout << p.name << " = " << *p.value << std::endl;
    }
}


// Numerically estimates the gradient of L (the MSE)
void estimate_gradient(const double old_L, const int batch, const int delta = 1) {
    for (size_t i = 0; i < parameters.size(); ++i) {
        // Vary the parameter value by delta
        *parameters[i].value += delta;
        // Estimate the gradient
        gradients[i] = MSE(batch) - old_L;
        // Restore the parameter's value
        *parameters[i].value -= delta;
    }
}

// Adam: Adaptive Moment Estimation variant of SGD (https://arxiv.org/abs/1412.6980)
void adam() {
    double alpha = initial_a, L_t, eta, delta, L_t1;
    double best_mse = MSE();
    std::cout << "Best MSE over the entire dataset: " << best_mse << std::endl;
    int tmp;

    // See: https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Adam
    std::vector<double> M(parameters.size());
    std::vector<double> V(parameters.size());

    for (int epoch = 1; epoch < epochs_no; ++epoch) {
        std::cout << "Epoch " << epoch << std::endl;

        std::shuffle(positions.begin(), positions.end(), rng);

        L_t = MSE(batch_size);
        estimate_gradient(L_t, batch_size);

        // For each dimension (individual parameter)
        for (size_t i = 0; i < parameters.size(); ++i) {
            double &grad   = gradients[i];
            param_t &param = parameters[i];

            M[i] = b1 * M[i] + (1.0 - b1) * grad;
            V[i] = b2 * V[i] + (1.0 - b2) * grad * grad;

            eta = alpha * std::sqrt(1.0 - std::pow(b2, epoch)) / (1.0 - std::pow(b1, epoch));
            delta = eta * M[i] / (std::sqrt(V[i]) + epsilon); // avoid div-by-zero

            tmp = *param.value;
            *param.value -= delta;

            if (*param.value != tmp) {
              std::cout << param.name << ": " << tmp << " -> " << *param.value
                        << std::endl;
            }
        }

        L_t1 = MSE(batch_size);
        std::cout << "Batch MSE before the step: " << L_t
                  << ", after the step: " << L_t1 << std::endl;

        if (epoch % 10 == 0) {
            L_t1 = MSE();
            std::cout << "New MSE over the entire dataset: " << L_t1 << std::endl;
            if (L_t1 > best_mse) {
                alpha /= 2.0;
                std::cout << "Decreasing learning rate to " << alpha << std::endl;
            } else if (L_t1 > best_mse - 1e-8) {
                std::cout << "[Termination condition met]" << std::endl;
                best_parameters = parameters;
                print_parameters(parameters);
                break;
            } else {
                std::cout << "[New best] MSE is " << L_t1 << " with parameters: " << std::endl;
                best_parameters = parameters;
                print_parameters(parameters);
                best_mse = L_t1;
            }
        }
    }
}


} // namespace

void tune() {
    /*init*/
    register_parameters();
    gradients.resize(parameters.size());
    load_datapoints(dataset);
    batch_size = MIN(batch_size, positions.size());

    adam();

    print_parameters(best_parameters);
}
