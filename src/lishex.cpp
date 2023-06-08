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
    searchinfo_t info[1];

    // UCI
    while (true) {
        fflush(stdout);
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
            gameboard.reset();
            std::cout << "readyok" << std::endl;
        } else if (command == "position") {
            // Parse the position command and update the board accordingly
            // Example: position startpos moves e2e4 e7e5
            std::string positionStr;
            std::getline(iss, positionStr);
            gameboard.readPosition(positionStr);
        } else if (command == "ucinewgame") {
            gameboard.reset();
        } else if (command == "go") {
            // Parse and handle the go command
            std::string goStr;
            std::getline(iss, goStr);
            gameboard.readGo(goStr, info);
        } else if (command == "stop") {
            // Ignore the stop command if the engine is not calculating
            continue;
        } else if (command == "quit") {
            info->quit = true;
            break;
        } else if (command == "move") { // testing
            // Get user input
            std::string moveString;
            iss >> moveString;

            // Validate the move (ugly way to handle flags but works for now)
            std::vector<move_t> moves = generateMoves(gameboard);
            std::vector<std::string> movesStr;
            for (move_t& m : moves) {
                movesStr.push_back(toString(m));
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

            int depthSet = depthStr.empty() ? 5 : stoi(depthStr);
            uint64_t node_no;
            for (int depth = 0; depth < depthSet; ++depth) {
                int NPS = 0; // # Nodes per (mili)second
                //auto start = high_resolution_clock::now();
                auto start = getTime();
                node_no = perft(gameboard, depth);
                //auto end = high_resolution_clock::now();
                auto end = getTime();
                auto elapsed = end - start;
                //auto elapsed =
                    //duration_cast<milliseconds>(end - start).count();
                NPS = static_cast<double>(node_no) / elapsed;
                NPS *= 1000; // nodes per ms -> nodes per s
                printf("Depth: %2d Nodes: %10lu Time: %5ld NPS: %7.0d\n",
                                depth,     node_no,     elapsed,  NPS);
            }
            //std::cout << std::endl;
            //std::cout << node_no << std::endl;
        } else if (command == "divide") {
            // Get user argument
            std::string depthStr;
            iss >> depthStr;
            int depth = depthStr.empty() ? 1 : stoi(depthStr);

            uint64_t node_no = 0;
            node_no = perft(gameboard, depth, true);
            std::cout << std::endl;
            std::cout << node_no << std::endl;
        } else if (command == "moves") {
            std::vector<move_t> moves = generateMoves(gameboard);
            for (move_t& m : moves) {
                std::cout << toString(m) << " ";
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
                gameboard.undoMove(fromString(moveString));
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
        if (info->quit) break;
    }
    return 0;
}
