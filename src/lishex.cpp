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
#include <algorithm>
#include "Board.h"
#include "Move.h"
#include "MoveGenerator.h"

using namespace std::chrono;
int main() {
    Board gameboard;
    searchinfo_t info[1];
    clearForSearch(gameboard, info);
    info->quit = false;
    info->depth = 0;
    info->timeSet = -1;

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
            // gameboard.reset();
            std::cout << "readyok" << std::endl;
        } else if (command == "position") {
            // Parse the position command and update the board accordingly
            // Example: position startpos moves e2e4 e7e5
            std::string positionStr;
            std::getline(iss, positionStr);
            gameboard.reset();
            gameboard.readPosition(positionStr);
        } else if (command == "ucinewgame") {
            gameboard.reset();
            gameboard.readFEN(startFEN);
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
            std::string moveString = "";
            iss >> moveString;

            // Validate the move (to handle flags)
            movelist_t moves[1];
            generateMoves(gameboard, moves);
            std::vector<std::string> movesStr;
            for (size_t i = 0; i < moves->size(); ++i) {
                movesStr.push_back(toString(moves->moveList[i]));
            }
            for (size_t i = 0; i < movesStr.size(); i++) {
                if (movesStr[i] == moveString) {
                    gameboard.makeMove(moves->moveList[i]);
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
            movelist_t moves[1];
            generateMoves(gameboard, moves);
            for (size_t i = 0; i < moves->size(); ++i) {
                std::cout << toString(moves->moveList[i]) << " ";
            }
            std::cout << "\n";
        } else if (command == "mirror") {
            gameboard.mirror();
            gameboard.print(true);
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
            //mirrorEvalTest(gameboard);
            //std::string testFen = "r2qkb1r/pb1npppp/2p5/8/1p1Pn3/3BPN2/PP3PPP/R1BQK2R w KQkq - 0 1";
            debugTest(gameboard);
            //mirrorEvalTest(gameboard);
        }
        else if (command == "movescore") {
            movelist_t moves[1];
            generateMoves(gameboard, moves);
            for (size_t i = 0; i < moves->size(); ++i) {
              std::cout << toString(moves->moveList[i]) << " "
                        << getScore(moves->moveList[i]) << std::endl;
            }
            std::cout << "\n";

        } else if (command == "dumphistory") {
            for (int p = 0; p < 24; ++p) {
                std::cout << p << ": \n";
                for (int i = 0; i < 64; ++i) {
                    std::cout << "  " << gameboard.historyH[p][i] << std::endl;
                }
            }
        }
        if (info->quit) break;
    }
    return 0;
}
