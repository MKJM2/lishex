/*
**
    /\ \       __/\  _`\ /\ \/\ \         /\ \ /\ \
    \ \ \     /\_\ \,\L\_\ \ \_\ \     __ \ `\`\/'/'
     \ \ \  __\/\ \/_\__ \\ \  _  \  /'__`\`\/ > <
      \ \ \L\ \\ \ \/\ \L\ \ \ \ \ \/\  __/   \/'/\`\
       \ \____/ \ \_\ `\____\ \_\ \_\ \____\  /\_\\ \_\
        \/___/   \/_/\/_____/\/_/\/_/\/____/  \/_/ \/_/;
** 
*/
#include <iostream>
#include <chrono>
#include <stack>
#include "Board.h"
#include "Move.h"
#include "MoveGenerator.h"

using namespace std::chrono;
int main() {
    Board gameboard;

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
            std::string positionStr;
            std::getline(iss, positionStr);
            gameboard.readPosition(positionStr);

        } else if (command == "go") {
            // Parse and handle the go command
            // Example: go wtime 300000 btime 300000
            // Extract and handle the search parameters (time, depth, etc.)

            // search
            searchinfo_t info[1];
            //std::string testFEN3 = "2rr3k/pp3pp1/1nnqbN1p/3pN3/2pP4/2P3Q1/PPB4P/R4RK1 w - - 0 1";
            //gameboard.readFEN(testFEN3);
            info->depth = 4;
            search(gameboard, info);


        } else if (command == "stop") {
            // Ignore the stop command if the engine is not calculating
            continue;
        } else if (command == "quit") {
            break;
        } else if (command == "move") { // testing
            // Get user input
            std::string moveString;
            iss >> moveString;

            // Validate the move (ugly way to handle flags but works for now)
            std::vector<Move> moves = generateMoves(gameboard);
            std::vector<std::string> movesStr;
            for (Move& m : moves) {
                movesStr.push_back(m.toString());
            }
            for (size_t i = 0; i < movesStr.size(); i++) {
                if (movesStr[i] == moveString) {
                    gameboard.makeMove(moves[i]);
                    gameboard.print(true);
                }
            }
        } else if (command == "perft") {
            // Get user argument
            std::string depthStr;
            iss >> depthStr;

            int depth = depthStr.empty() ? 5 : stoi(depthStr);
            unsigned long long node_no;
            int NPS = 0; // # Nodes per (mili)second
            auto start = high_resolution_clock::now();
            node_no = perft(gameboard, depth, true);
            auto end = high_resolution_clock::now();
            auto elapsed =
                duration_cast<milliseconds>(end - start).count();
            NPS = static_cast<double>(node_no) / elapsed;
            NPS *= 1000; // nodes per ms -> nodes per s
            /*
            printf("Depth: %2d Nodes: %10llu Time: %5ld NPS: %5.0d\n",
                            depth,     node_no,     elapsed,  NPS);
            */
            std::cout << std::endl;
            std::cout << node_no << std::endl;
        } else if (command == "moves") {
            std::vector<Move> moves = generateMoves(gameboard);
            for (Move& m : moves) {
                std::cout << m.toString() << " ";
            }
            std::cout << "\n";
        } else if (command == "undo") {
            // Get user input
            std::string moveString;
            iss >> moveString;

            // Undo the specified move
            if (moveString.empty()) {
                gameboard.undoLast();
            } else {
                gameboard.undoMove(Move(moveString));
            }
            gameboard.print(true); // verbose = true

        } else if (command == "print" || command == "d") {
            gameboard.print(true);
        } else if (command == "fen") {
            std::cout << gameboard.toFEN() << std::endl;
        } else if (command == "test") {
            std::string testFEN1 = "8/6q1/8/8/8/2Q5/8/8 w - - 0 1";
            std::string testFEN2 = "3k4/3q4/2Q5/8/8/8/8/3K4 b - - 0 1";
            gameboard.readFEN(testFEN2);
            gameboard.printAttacked();
        }
    }
    return 0;
}
