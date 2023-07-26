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

/* Evaluation tuning technique inspired by Texel's tuning method:
 * https://www.chessprogramming.org/Texel%27s_Tuning_Method
 * Since this file's code is written more so to maximize convenience
 * than performance, we make heavy use of the C++ standard library
 * */
#include "tune.h"

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

// PSO parameters
constexpr size_t particles_no = 500;
constexpr int max_iter = 50;
constexpr int entries_no = 2'000'000;
constexpr double inertia_weight = 0.8;
constexpr double cognitive_weight = 0.2;
constexpr double social_weight = 0.1;

board_t *bench_board = nullptr;
searchinfo_t *bench_info = nullptr;


/* We utilize the Particle Swarm Optimization technique */

// A given parameter can have a lower and upper bound on its value
typedef struct param_t {
    int value = 0;
    int lowerbound = 0;
    int upperbound = 0;
} param_t;

// A list of all tunnable parameters with lower and upper bounds for their values
std::vector<int*> tunable_params = {
    &tempo_bonus,
    &isolated_pawn,
    &doubled_pawn,
    &pawn_supported,
    &pawn_bonuses[2],
    &pawn_bonuses[3],
    &pawn_bonuses[4],
    &pawn_bonuses[5],
    &pawn_bonuses[6],
    &pawn_bonuses[7],
    &bishop_pair_mg,
    &bishop_pair_eg,
    &rook_open_file,
    &rook_semiopen_file,
    &queen_open_file,
    &queen_semiopen_file,
};

/*
std::vector<std::pair<int, int>> bounds = {
    {0, 25},
    {-25, 0},
    {-25, 0},
    {0, 25},
    {0, 15},
    {0, 25},
    {0, 45},
    {0, 70},
    {0, 80},
    {0, 90},
    {1, 35},
    {15, 65},
    {1, 15},
    {1, 12},
    {1, 15},
    {1, 12},
};
*/
std::vector<std::pair<int, int>> bounds = {
    {2, 15},
    {-15, 0},
    {-25, -5},
    {0, 25},
    {0, 10},
    {0, 12},
    {15, 45},
    {10, 70},
    {45, 85},
    {45, 90},
    {1, 35},
    {15, 65},
    {3, 15},
    {2, 10},
    {3, 15},
    {2, 10},
};

std::vector<param_t> best_params(tunable_params.size());

// Particle struct representing a potential solution
typedef struct particle {
    std::vector<double> velocity;

    std::vector<param_t> position;
    double mse;

    std::vector<param_t> best_position;
    double best_mse;

    particle(int params_no) {
        position.resize(params_no);
        velocity.resize(params_no);
        mse = best_mse = std::numeric_limits<double>::max();
    }
} particle;

// Random number generator for initializing positions and velocities
std::random_device rd;
std::mt19937 gen(rd());

inline double rand_within(int lower, int upper) {
    std::uniform_real_distribution<double> unif(lower, upper);
    return unif(gen);
}

// TODO: https://www.chessprogramming.org/Pawn_Advantage,_Win_Percentage,_and_Elo
// Sigmoid(s)=1/(1+10^(-K/400))
// where K is a scaling constant minimizing MSE
inline double winning_prob(double score) {
    return 1.0 / (1.0 + std::pow(10.0, -static_cast<double>(score) / 4.0));
}

// Fast sigmoid function approximation
double sigmoid(double x) {
    return 0.5 * ((x / (1 + std::fabs(x))) + 1);
}

// Since we deal with unnormalized scores in centipawns, we need to scale them
// before passing them into sigmoid. K is a scaling constant
double scale_score(int score, double K = 1.0) {
    return static_cast<double>(score) * K / 100.0;
}

// Mean square error
double MSE(std::vector<double>& predicted, std::vector<double>& observed) {
    int N = predicted.size();
    assert(observed.size() == N);

    double error = 0, tmp = 0;
    for (int i = 0; i < N; ++i) {
        tmp = (predicted[i] - observed[i]);
        error += tmp * tmp;
    }
    return error / double(N);
}

inline double evaluate_particle([[maybe_unused]] particle& p) {
    //return sigmoid(scale_score(quiescence(-oo, +oo, bench_board, bench_info)));
    return winning_prob(scale_score(quiescence(-oo, +oo, bench_board, bench_info)));
}

// Initialize the swarm of particles for PSO
void initialize(std::vector<particle>& particles, int params_no) {
    for (size_t i = 0; i < particles_no; ++i) {
        particles[i] = particle(params_no);
        // Initialize the particle's position with a uniformly distributed random vector
        // (within parameter bounds)
        auto &p = particles[i];
        for (int j = 0; j < params_no; ++j) {
            auto &pos = p.position[j];
            pos = {
                .value = static_cast<int>(rand_within(bounds[j].first, bounds[j].second)),
                .lowerbound = bounds[j].first,
                .upperbound = bounds[j].second
            };

            p.velocity[j] = rand_within(-1.0, 1.0);
        }
        // Initialize the best position
        p.best_position = p.position;
    }
}


// Update a particle's position (taking care to handle bounds)
inline void update_particle(particle& p) {
    for (size_t i = 0; i < p.position.size(); ++i) {
        auto &pos = p.position[i];
        pos.value += p.velocity[i];

        // Ensure the parameter value stays within the bounds
        pos.value = std::clamp(pos.value, pos.lowerbound, pos.upperbound);
    }
}

inline void update_engine_params(particle& p) {
    for (size_t j = 0; j < tunable_params.size(); ++j) {
        *tunable_params[j] = p.position[j].value;
    }
}

} // namespace


void tune() {
    // Read in test positions
    int params_no = tunable_params.size();

    // Initialize the board
    bench_board = new board_t;
    bench_info = new searchinfo_t;

    // Each test position is represented by a fen
    std::vector<std::string> positions;
    std::vector<double> observed;  // Populated with the dataset outcomes
    std::vector<double> predicted; // Populated with engine's evals, also passed through sigmoid
                                   // to get a win probability

    // Read in the input .csv file (the two columns should be a FEN string, and an evaluation score)
    std::string filename;
    std::cout << "Enter the dataset filename: ";
    //std::cin >> filename;
    filename = "/home/mkjm/Projects/lishex/tune/dataset.csv";
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
        if (count >= entries_no) break;
        count++;
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
        // 1 for Won, 0.5 for draw, 0 for Lost
        double outcome = std::stod(tokens[1]);

        positions.push_back(fen);
        observed.push_back(outcome);

    }
    file.close();

    std::cout << "File '" << filename << "' opened successfully" << std::endl;

    // For each position we get the corresponding value
    predicted.resize(positions.size());
    for (size_t i = 0; i < positions.size(); ++i) {
        //observed[i] = sigmoid(scale_score(outcomes[i]));
        //std::cout << observed[i] << " ";
    }
    //std::cout << std::endl;

    std::cout << count << " observed values initialized" << std::endl;

    // Initialize the swarm
    std::vector<particle> particles(particles_no, particle(params_no));
    initialize(particles, params_no);
    std::cout << particles_no << " particles initialized" << std::endl;

    // Initialize the global best position and MSE
    double best_mse = std::numeric_limits<double>::max();
    double prev_best_mse = best_mse;

    std::cout << "Starting the particle swarm loop..."<< std::endl;
    // PSO loop
    for (int iter = 0; iter < max_iter; ++iter) {
        // Evaluate each particle and update personal best positions
        for (size_t i = 0; i < particles_no; ++i) {
            std::cout << "Processing particle " << i << "\r";
            std::cout.flush();

            // Update the parameters of the engine according to the best particle's parameters
            update_engine_params(particles[i]);

            // Run the chess engine with the current parameters and obtain the predicted outcomes
            for (size_t pos_idx = 0; pos_idx < positions.size(); ++pos_idx) {
                setup(bench_board, positions[pos_idx]);
                predicted[pos_idx] = evaluate_particle(particles[i]);
                //std::cout << predicted[pos_idx] << ' ';
            }
            //std::cout << std::endl;

            // Calculate the mean squared error
            particles[i].mse = MSE(predicted, observed);

            // Update the user with some info
            std::cout << "Particles " << i << " MSE " << particles[i].mse << " with parameters ";
            for (int k = 0; k < params_no; ++k) {
                std::cout << particles[i].position[k].value << ' ';
            }
            std::cout << std::endl;
            std::cout << "                         and velocity ";
            for (int k = 0; k < params_no; ++k) {
                std::cout << particles[i].velocity[k] << ' ';
            }
            std::cout << std::endl;

            // Update personal best position if necessary
            if (particles[i].mse < particles[i].best_mse) {
                particles[i].best_mse = particles[i].mse;
                particles[i].best_position = particles[i].position;

                // Update the swarm's best known position
                if (particles[i].mse < best_mse) {
                    std::cout << "New best MSE: " << particles[i].mse << std::endl;
                    best_mse = particles[i].mse;
                    best_params = particles[i].position;
                }
            }

            // Update the velocities in each direction
            for (int k = 0; k < params_no; ++k) {
                double r1 = rand_within(0.0, 1.0);
                double r2 = rand_within(0.0, 1.0);

                // Update particle's velocity
                particles[i].velocity[k] = inertia_weight * particles[i].velocity[k] +
                                        cognitive_weight * r1 * (particles[i].best_position[k].value - particles[i].position[k].value) +
                                        social_weight * r2 * (best_params[k].value - particles[i].position[k].value);
            }
            // Update particle's position (bounded)
            update_particle(particles[i]);
        }
        std::cout << "[Iteration " << iter << "] MSE = " << best_mse << ", best parameters: ";
        for (int idx = 0; idx < params_no; ++idx) {
            std::cout << best_params[idx].value << ' ';
        }
        std::cout << std::endl;

        if (prev_best_mse - best_mse < 0.000001) {
            std::cout << "MSE hasn't improved since last iteration, terminating..." << std::endl;
            break;
        }

        prev_best_mse = best_mse;
    }

    std::cout << "Done! Best parameters found:" << std::endl;
    for (int idx = 0; idx < params_no; ++idx) {
        std::cout << best_params[idx].value << ' ';
    }
    std::cout << std::endl;

    // Cleanup
    delete bench_board;
    delete bench_info;
}
