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
constexpr size_t particles_no = 100;
constexpr int max_iter = 1000;
constexpr int entries_no = 1'000'000;
constexpr double inertia_weight = 0.8;
constexpr double cognitive_weight = 0.8;
constexpr double social_weight = 2.0;

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
    &passed_pawn[0],
    &passed_pawn[1],
    &passed_pawn[2],
    &passed_pawn[3],
    &passed_pawn[4],
    &passed_pawn[5],
    &passed_pawn[6],
    &passed_pawn[7],
    &bishop_pair,
    &rook_open_file,
    &rook_semiopen_file,
    &queen_open_file,
    &queen_semiopen_file,
};

std::vector<std::pair<int, int>> bounds = {
    {0, 25},
    {-25, 0},
    {-25, 0},
    {0, 25},
    {0, 35},
    {0, 40},
    {0, 50},
    {0, 60},
    {0, 70},
    {0, 80},
    {0, 90},
    {0, 100},
    {0, 35},
    {0, 15},
    {0, 12},
    {0, 15},
    {0, 12},
};


// Particle struct representing a potential solution
typedef struct particle {
    std::vector<param_t> position;
    std::vector<int> velocity;
    double mse;

    particle(int params_no) {
        position.resize(params_no);
        velocity.resize(params_no);
        mse = 0.0;
    }
} particle;

// Random number generator for initializing positions and velocities
std::random_device rd;
std::mt19937 gen(rd());

inline double rand_within(int lower, int upper) {
    std::uniform_real_distribution<double> unif(lower, upper);
    return unif(gen);
}

// Fast sigmoid function approximation
double sigmoid(double x) {
    return 0.5 * ((x / (1 + std::fabs(x))) + 1);
}

// Since we deal with unnormalized scores in centipawns, we need to scale them
// before passing them into sigmoid. K is a scaling constant
double scale_score(int score, double K = 1.0) {
    return score * K / 100;
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
    return error / N;
}

// Initialize the swarm of particles for PSO
void initialize(std::vector<particle>& particles, int params_no) {
    for (size_t i = 0; i < particles_no; ++i) {
        particles[i] = particle(params_no);
        for (int j = 0; j < params_no; ++j) {
            particles[i].position[j].value = rand_within(bounds[j].first, bounds[j].second);
            particles[i].velocity[j] = rand_within(-1, 1);
        }
    }
}

inline double evaluate_particle([[maybe_unused]] particle& p) {
    return quiescence(-oo, +oo, bench_board, bench_info);
}

// Update a particle's position (taking care to handle bounds)
void update_particle(particle& p) {
    for (size_t i = 0; i < p.position.size(); ++i) {
        p.position[i].value += p.velocity[i];

        // Ensure the parameter value stays within the bounds
        p.position[i].value = std::max(p.position[i].value, p.position[i].lowerbound);
        p.position[i].value = std::min(p.position[i].value, p.position[i].upperbound);
    }
}

void update_engine_params(particle& p) {
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
    std::vector<int> evals;

    std::vector<double> observed;  // Populated with the dataset evals, passed through sigmoid
    std::vector<double> predicted; // Populated with engine's evals, also passed through sigmoid

    // Read in the input .csv file (the two columns should be a FEN string, and an evaluation score)
    std::string filename;
    std::cout << "Enter the dataset filename: ";
    std::cin >> filename;
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
        int evaluation = std::stoi(tokens[1]);

        positions.push_back(fen);
        evals.push_back(evaluation);

    }
    file.close();

    std::cout << "File '" << filename << "' opened successfully" << std::endl;

    // Initialize the swarm
    std::vector<particle> particles(particles_no, particle(params_no));
    initialize(particles, params_no);

    // Initialize the global best position and MSE
    std::vector<param_t> best_params(params_no);
    double best_mse = std::numeric_limits<double>::max();

    // PSO loop
    for (int iter = 0; iter < max_iter; ++iter) {
        // Evaluate each particle and update personal best positions
        for (size_t i = 0; i < particles_no; ++i) {
            // Run the chess engine with the current parameters and obtain the predicted outcomes

            particles[i].mse = MSE(predicted, observed);

            // Update personal best position if necessary
            if (particles[i].mse < particles[i].mse) {
                particles[i].position = particles[i].position;
                particles[i].mse = particles[i].mse;
            }

            // Update global best position
            for (size_t j = 0; j < particles_no; ++j) {
                if (particles[j].mse < best_mse) {
                    best_mse = particles[j].mse;
                    best_params = particles[j].position;
                }
            }

            // Update particle velocities and positions
            for (size_t j = 0; j < particles_no; ++j) {
                for (int k = 0; k < params_no; ++k) {
                    double r1 = rand_within(-1, 1);
                    double r2 = rand_within(-1, 1);

                    // Update particle's velocity
                    particles[j].velocity[k] = inertia_weight * particles[j].velocity[k] +
                                            cognitive_weight * r1 * (particles[j].position[k].value - particles[j].position[k].value) +
                                            social_weight * r2 * (best_params[k].value - particles[j].position[k].value);

                    // Update particle's position (bounded)
                    update_particle(particles[j]);
                }
            }

            // Update the parameters of the engine according to the particle's parameters
            update_engine_params(particles[i]);
        }

        std::cout << "[Iteration " << iter << "] MSE = " << best_mse << ", best parameters: ";
        for (int idx = 0; idx < params_no; ++idx) {
            std::cout << best_params[idx].value << ' ';
        }
        std::cout << std::endl;
    }

    // Cleanup
    delete bench_board;
    delete bench_info;
}
