#include <iostream>
#include <sstream>
#include <chrono>
#include "Board.h"
#include "Move.h"
#include "MoveGenerator.h"

using namespace std::chrono;
int main() {
    Board gameboard;
    gameboard.readFEN(startFEN);
    gameboard.print();
    gameboard.printFEN();

    // UCI
    while (true) {
        std::string input;
        std::getline(std::cin, input);

        // Remove trailing whitespace characters
        input.erase(input.find_last_not_of(" \t\n\r\f\v") + 1);

        if (input.empty()) {
            continue;
        }

        std::istringstream iss(input);
        std::string command;
        iss >> command;

        if (command == "uci") {
            std::cout << "id name LiSHeX" << std::endl;
            std::cout << "id author Michal Kurek" << std::endl;
            std::cout << "uciok" << std::endl;
        } else if (command == "isready") {
            // initialization
            std::cout << "readyok" << std::endl;
        } else if (command == "position") {
            // Parse the position command and update the board accordingly
            // Example: position startpos moves e2e4 e7e5
            // Parse the FEN or moves and update the board

            // Handle the "startpos" or "fen" keyword

            // Handle the moves provided (if any)

        } else if (command == "go") {
            // Parse and handle the go command
            // Example: go wtime 300000 btime 300000
            // Extract and handle the search parameters (time, depth, etc.)

            // search

            // the best move:
            std::cout << "bestmove " << "= ?" << std::endl;
        } else if (command == "stop") {
            // Ignore the stop command if the engine is not calculating
            continue;
        } else if (command == "quit") {
            break;
        } else if (command == "move") { // testing
            std::string moveString;
            iss >> moveString;
            Move move(moveString);
            gameboard.makeMove(move);
            gameboard.print();
        } else if (command == "perft") {
            // iterative deepening
            int depthMax = 7;
            unsigned long long node_no;
            int NPS = 0; // # Nodes per (mili)second
            for (int depth = 0; depth <= depthMax; depth++) {
                auto start = high_resolution_clock::now();
                node_no = perft(gameboard, depth);
                auto end = high_resolution_clock::now();
                auto elapsed =
                    duration_cast<milliseconds>(end - start).count();
                NPS = static_cast<double>(node_no) / elapsed;
                printf("Depth: %2d Nodes: %10llu Time: %5ld NPS: %5.0d\n",
                               depth,     node_no,     elapsed,  NPS);
            }
        } else if (command == "moves") {
            std::vector<Move> moves = generateMoves(gameboard);
            for (Move& m : moves) {
                std::cout << m.toString() << " ";
            }
            std::cout << "\n";
        }
    }
    return 0;
}
