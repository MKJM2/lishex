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
constexpr double epsilon = 1e-8;   // Avoid div-by-zeroG

// Tuning Parameters
constexpr bool tune_material    = 1;
constexpr bool tune_pawn_psqt   = 1;
constexpr bool tune_knight_psqt = 1;
constexpr bool tune_bishop_psqt = 1;
constexpr bool tune_rook_psqt   = 1;
constexpr bool tune_queen_psqt  = 1;
constexpr bool tune_king_psqt   = 1;
constexpr bool tune_king_safety = 0;
constexpr bool tune_pawn_eval   = 0;
constexpr bool tune_misc_eval   = 0;
constexpr int datapoints_no = 725'000;
constexpr int epochs_no = 5000;
//size_t batch_size = 262144;
size_t batch_size = 30000;

double K = 1.562245;
//double K = 1.0;
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
inline double error(datapoint_t& x) {
    board_t b[1];
    //searchinfo_t i[1];
    //stack_t s[MAX_MOVES];
    setup(b, x.fen);
    //int score = quiescence(-oo, +oo, b, i, s);
    const int score = evaluate(b);
    //std::cout << "Position result: " << x.result;
    //std::cout << " Static evaluation: " << winning_prob(score) << std::endl;
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

//std::string dataset = "/home/mkjm/Projects/lishex/tune/dataset2.csv";
std::string dataset = "/home/mkjm/Projects/lishex/tune/quiet.csv";

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
        for (piece_t i = PAWN; i <= QUEEN; ++i) {
            parameters.push_back({"value["+std::to_string(i)+"].mg", &(value[i].mg)});
            parameters.push_back({"value["+std::to_string(i)+"].eg", &(value[i].eg)});
        }
    }

    if constexpr (tune_pawn_psqt) {
        std::cout << "Tuning pawn piece-square tables" << std::endl;
        for (int i = A2; i <= H7; ++i) { /* Note: There's never any pawns on ranks 1 and 8*/
            parameters.push_back({"pawn_psqt["+std::to_string(i)+"].mg", &pawn_psqt[i].mg});
            parameters.push_back({"pawn_psqt["+std::to_string(i)+"].eg", &pawn_psqt[i].eg});
        }
    }

    if constexpr (tune_knight_psqt) {
        std::cout << "Tuning knight piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"knight_psqt["+std::to_string(i)+"].mg", &knight_psqt[i].mg});
            parameters.push_back({"knight_psqt["+std::to_string(i)+"].eg", &knight_psqt[i].eg});
        }
    }

    if constexpr (tune_bishop_psqt) {
        std::cout << "Tuning bishop piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"bishop_psqt["+std::to_string(i)+"].mg", &bishop_psqt[i].mg});
            parameters.push_back({"bishop_psqt["+std::to_string(i)+"].eg", &bishop_psqt[i].eg});
        }
    }

    if constexpr (tune_rook_psqt) {
        std::cout << "Tuning rook piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"rook_psqt["+std::to_string(i)+"].mg", &rook_psqt[i].mg});
            parameters.push_back({"rook_psqt["+std::to_string(i)+"].eg", &rook_psqt[i].eg});
        }
    }

    if constexpr (tune_queen_psqt) {
        std::cout << "Tuning queen piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"queen_psqt["+std::to_string(i)+"].mg", &queen_psqt[i].mg});
            parameters.push_back({"queen_psqt["+std::to_string(i)+"].eg", &queen_psqt[i].eg});
        }
    }

    if constexpr (tune_king_psqt) {
        std::cout << "Tuning king piece-square tables" << std::endl;
        for (int i = 0; i < SQUARE_NO; ++i) {
            parameters.push_back({"king_psqt["+std::to_string(i)+"].mg", &king_psqt[i].mg});
            parameters.push_back({"king_psqt["+std::to_string(i)+"].eg", &king_psqt[i].eg});
        }
    }

    if constexpr (tune_king_safety) {
        std::cout << "Tuning king safety" << std::endl;
        parameters.push_back({"PAWN_SHIELD1_BONUS.mg", &PAWN_SHIELD1_BONUS.mg});
        parameters.push_back({"PAWN_SHIELD1_BONUS.eg", &PAWN_SHIELD1_BONUS.eg});
        parameters.push_back({"PAWN_SHIELD2_BONUS.mg", &PAWN_SHIELD2_BONUS.mg});
        parameters.push_back({"PAWN_SHIELD2_BONUS.eg", &PAWN_SHIELD2_BONUS.eg});
        parameters.push_back({"PAWN_STORM_PENALTY.mg", &PAWN_STORM_PENALTY.mg});
        parameters.push_back({"PAWN_STORM_PENALTY.eg", &PAWN_STORM_PENALTY.eg});
    }

    if constexpr (tune_pawn_eval) {
        std::cout << "Tuning miscellaneous pawn evaluation parameters" << std::endl;
        parameters.push_back({"isolated_pawn.mg", &isolated_pawn.mg});
        parameters.push_back({"isolated_pawn.eg", &isolated_pawn.eg});
        parameters.push_back({"doubled_pawn.mg", &doubled_pawn.mg});
        parameters.push_back({"doubled_pawn.eg", &doubled_pawn.eg});
        parameters.push_back({"pawn_supported.mg", &pawn_supported.mg});
        parameters.push_back({"pawn_supported.eg", &pawn_supported.eg});
        parameters.push_back({"pawn_protected_bonus.mg", &pawn_protected_bonus.mg});
        parameters.push_back({"pawn_protected_bonus.eg", &pawn_protected_bonus.eg});
        parameters.push_back({"SAFE_PAWN_ATTACK.mg", &SAFE_PAWN_ATTACK.mg});
        parameters.push_back({"SAFE_PAWN_ATTACK.eg", &SAFE_PAWN_ATTACK.eg});
        // Note: no pawns on rank 1 and 8 (rank indices 0 and 7)
        parameters.push_back({"passed_pawn[1].mg", &passed_pawn[1].mg});
        parameters.push_back({"passed_pawn[2].mg", &passed_pawn[2].mg});
        parameters.push_back({"passed_pawn[3].mg", &passed_pawn[3].mg});
        parameters.push_back({"passed_pawn[4].mg", &passed_pawn[4].mg});
        parameters.push_back({"passed_pawn[5].mg", &passed_pawn[5].mg});
        parameters.push_back({"passed_pawn[6].mg", &passed_pawn[6].mg});
        parameters.push_back({"passed_pawn[1].eg", &passed_pawn[1].eg});
        parameters.push_back({"passed_pawn[2].eg", &passed_pawn[2].eg});
        parameters.push_back({"passed_pawn[3].eg", &passed_pawn[3].eg});
        parameters.push_back({"passed_pawn[4].eg", &passed_pawn[4].eg});
        parameters.push_back({"passed_pawn[5].eg", &passed_pawn[5].eg});
        parameters.push_back({"passed_pawn[6].eg", &passed_pawn[6].eg});
        parameters.push_back({"pawn_bonuses[1].mg", &pawn_bonuses[1].mg});
        parameters.push_back({"pawn_bonuses[2].mg", &pawn_bonuses[2].mg});
        parameters.push_back({"pawn_bonuses[3].mg", &pawn_bonuses[3].mg});
        parameters.push_back({"pawn_bonuses[4].mg", &pawn_bonuses[4].mg});
        parameters.push_back({"pawn_bonuses[5].mg", &pawn_bonuses[5].mg});
        parameters.push_back({"pawn_bonuses[6].mg", &pawn_bonuses[6].mg});
        parameters.push_back({"pawn_bonuses[1].eg", &pawn_bonuses[1].eg});
        parameters.push_back({"pawn_bonuses[2].eg", &pawn_bonuses[2].eg});
        parameters.push_back({"pawn_bonuses[3].eg", &pawn_bonuses[3].eg});
        parameters.push_back({"pawn_bonuses[4].eg", &pawn_bonuses[4].eg});
        parameters.push_back({"pawn_bonuses[5].eg", &pawn_bonuses[5].eg});
        parameters.push_back({"pawn_bonuses[6].eg", &pawn_bonuses[6].eg});
    }

    if constexpr (tune_misc_eval) {
        std::cout << "Tuning miscellaneous evaluation parameters" << std::endl;
        parameters.push_back({"tempo.mg", &tempo.mg});
        parameters.push_back({"tempo.eg", &tempo.eg});

        parameters.push_back({"bishop_pair.mg", &bishop_pair.mg});
        parameters.push_back({"bishop_pair.eg", &bishop_pair.eg});

        //parameters.push_back({"rook_open_file.mg", &rook_open_file.mg});
        //parameters.push_back({"rook_open_file.eg", &rook_open_file.eg});
        //parameters.push_back({"rook_semiopen_file.mg", &rook_semiopen_file.mg});
        //parameters.push_back({"rook_semiopen_file.eg", &rook_semiopen_file.eg});

        //parameters.push_back({"queen_open_file.mg", &queen_open_file.mg});
        //parameters.push_back({"queen_open_file.eg", &queen_open_file.eg});
        //parameters.push_back({"queen_semiopen_file.mg", &queen_open_file.mg});
        //parameters.push_back({"queen_semiopen_file.eg", &queen_open_file.eg});

        parameters.push_back({"KING_PAWN_DIST_BONUS.mg", &KING_PAWN_DIST_BONUS.mg});
        parameters.push_back({"KING_PAWN_DIST_BONUS.eg", &KING_PAWN_DIST_BONUS.eg});

        for (piece_t pce = PAWN; pce <= QUEEN; ++pce) {
            parameters.push_back({"open_file["+std::to_string(pce)+"].mg", &open_file[pce].mg});
            parameters.push_back({"open_file["+std::to_string(pce)+"].eg", &open_file[pce].eg});

            parameters.push_back({"semiopen_file["+std::to_string(pce)+"].mg", &semiopen_file[pce].mg});
            parameters.push_back({"semiopen_file["+std::to_string(pce)+"].eg", &semiopen_file[pce].eg});
        }
    }

    std::cout << "The following will be optimized: " << std::endl;
    for (const param_t& p : parameters) {
        std::cout << p.name << " @ " << p.value << std::endl;
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

        if (epoch % 5 == 0) {
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

            // every 10th epoch print best parameters
            if (epoch % 10 == 0) {
                std::cout << "Printing best parameters" << std::endl;
                print_parameters(best_parameters);
            }
        }
    }
}


// https://github.com/ed-apostol/InvictusChess/blob/master/src/tune.cpp#L84
[[maybe_unused]] void determineK() {
  double min = 0, max = 2, delta = 1, best = 1, error = 100;

  for (int p = 0; p < 7; p++) {
    printf("Determining K: (%.6f, %.6f, %.7f)\n", min, max, delta);

    while (min < max) {
      K = min;
      double e = MSE();
      if (e < error) {
        error = e;
        best = K;
        printf("New best K of %.6f, Error %.10f\n", K, error);
      }
      min += delta;
    }

    min = best - delta;
    max = best + delta;
    delta /= 10;
  }

  K = best;
  printf("Using K of %.6f\n", K);
}


} // namespace

void tune() {
    /*init*/
    register_parameters();
    gradients.resize(parameters.size());
    load_datapoints(dataset);
    batch_size = MIN(batch_size, positions.size());

    //determineK();

    adam();

    print_parameters(best_parameters);
}
