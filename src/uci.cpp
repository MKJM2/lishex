#include "uci.h"

#include <iostream>
#include <iomanip>
#include <sstream>

#include "board.h"
#include "time.h"
#include "search.h"
#include "threads.h"
#include "order.h"
#include "eval.h"

namespace {

// TODO: Pass the istringstream from the UCI loop by reference
void parse_position(board_t *board, const std::string& pos_str) {
    size_t start_pos = pos_str.find("startpos");
    size_t fen_pos = pos_str.find("fen");
    size_t moves_pos = pos_str.find("moves");

    if (start_pos != std::string::npos) {
        setup(board, start_FEN);
    } else if (fen_pos != std::string::npos) {
        size_t fen_start_pos = pos_str.find_first_not_of(" ", fen_pos + 3);
        size_t fen_end_pos = pos_str.find(" moves", fen_start_pos);
        if (moves_pos == std::string::npos) {
          fen_end_pos = pos_str.size();
        }
        std::string fen_string = pos_str.substr(fen_start_pos, fen_end_pos - fen_start_pos);
        setup(board, fen_string);
    } else {
        setup(board, start_FEN);
    }

    if (moves_pos != std::string::npos) {
        size_t movesStartPos = pos_str.find_first_not_of(" ", moves_pos + 5);
        if (movesStartPos == std::string::npos) return;
        std::string movesString = pos_str.substr(movesStartPos);
        std::istringstream iss(movesString);
        std::string move_string;

        while (iss >> move_string) {
            move_t move = str_to_move(board, move_string);
            if (move != NULLMV) {
                make_move(board, move);
            }
            board->ply = 0;
        }
    }
}

void parse_go(board_t *board, searchinfo_t *info, std::istringstream &iss) {
    int movestogo = 25, movetime = -1, depth = -1;
    int time = -1, inc = 0;
    info->time_set = false;

    std::string token;
    while (iss >> token) {
        if (token == "depth") {
            iss >> info->depth;
            info->depth = std::min(info->depth, MAX_DEPTH);
        }
        else if (token == "wtime") {
            iss >> time; // Consume the token
            if (board->turn) info->time = time;
        }
        else if (token == "btime") {
            iss >> time; // Consume the token
            if (!board->turn) info->time = time;
        }
        else if (token == "winc") {
            iss >> inc;
            if (board->turn) info->inc = inc;
        }
        else if (token == "binc") {
            iss >> inc;
            if (!board->turn) info->inc = inc;
        }
        else if (token == "movestogo") {
            iss >> movestogo;
        }
        else if (token == "movetime") {
            iss >> movetime;
        }
        else if (token == "infinite") {
            // search until 'stop' sent from the GUI
            info->depth = MAX_DEPTH;
        }
        else {
            std::cout << "Unrecognized or unsupported token '"
                      << token << "'" << std::endl;
        }
    }

    // @TODO: Simple time management based on
    // E[# halfmoves until end of game | material on board]
    if (movetime != -1) {
      time = movetime;
      movestogo = 1;
    } else {
      //movestogo = est_moves_left(*this);
      movestogo = 25;
    }

    info->start = now();

    // Time management
    if (time != -1) {
        info->time_set = true;
        time /= movestogo;

        // to be safe we don't run out of time
        time -= 50;
        info->end = info->start + time + inc;
    }

    if (info->depth == -1) {
        info->depth = MAX_DEPTH;
    }
}

} // namespace

/* UCI driver loop */
void loop(int argc, char* argv[]) {
    // @TODO: Handle command-line args
    (void) argc;
    (void) argv;

    board_t board[1];
    setup(board, start_FEN);

    searchinfo_t info[1];

    // Thread used for searching, the main thread will handle the UCI loop
    std::thread search_thread;
    // Initially the engine isn't searching anything
    info->state = ENGINE_STOPPED;

    LOG("Starting the UCI loop...");

    std::string input, token;
    while (!info->quit) {
        if (!std::getline(std::cin, input)) {
            info->quit = true;
        }
        std::istringstream iss(input);
        token.clear();
        iss >> std::skipws >> token;
        if (token == "uci") {
            std::cout << "id name " << NAME << std::endl;
            std::cout << "id author " << AUTHOR << std::endl;
            std::cout << "uciok" << std::endl;
        } else if (token == "isready")  {
            std::cout << "readyok" << std::endl;
        } else if (token == "ucinewgame") {
            parse_position(board, "position startpos\n");
        } else if (token == "stop") {
            search_stop(search_thread, info);
        } else if (token == "quit") {
            info->quit = true;
            info->state = ENGINE_QUIT;
            break;
        } else if (token == "print" || token == "d") {
            print(board);
        } else if (token == "move") {
            std::string move_string = "";
            iss >> move_string;
            move_t m = str_to_move(board, move_string);
            if (m != NULLMV) {
                make_move(board, m);
            }
            print(board);
            if (is_repetition(board)) {
                LOG("Repetition detected!");
            }
        } else if (token == "undo") {
            undo_move(board);
            print(board);
        } else if (token == "moves") { // Print pseudo-legal move
            movelist_t moves;
            generate_moves(board, &moves);
            for (const move_t move : moves) {
                std::cout << move_to_str(move) << " ";
            }
            std::cout << std::endl;
        } else if (token == "movescore") { // Move-ordering scores
            movelist_t moves;
            generate_moves(board, &moves);
            score_and_sort(board, &moves, NULLMV);
            for (const scored_move_t move : moves) {
                std::cout << move_to_str(move) << ": " << move.score << std::endl;
            }
            std::cout << std::endl;

        } else if (token == "test") {
            test(board);
        } else if (token == "perft") {
            // Get user argument
            std::string depth_str;
            iss >> depth_str;

            int depthSet = depth_str.empty() ? 5 : stoi(depth_str);
            uint64_t node_no;

            // Pretty print a table of perft results
            /*
            std::cout << std::right << "DEPTH\t";
            std::cout << std::setw(10) << "NODES\t";
            std::cout << std::setw(2) << "TIME (ms)\t";
            std::cout << std::setw(2) << "NPS" << std::endl;
            */
            std::cout <<
                "DEPTH	       NODES       TIME (ms)    NPS" << std::endl;
            std::string s (43, '-');
            std::cout << s << std::endl;
            for (int depth = 1; depth <= depthSet; ++depth) {
                unsigned NPS = 0; // # Nodes per (mili)second
                uint64_t start = now();
                node_no = perft(board, depth);
                uint64_t elapsed = now() - start + 1; // handle div-by-zero
                // nodes per millisecond -> nodes per s
                NPS = node_no * 1000 / elapsed;
                std::cout << std::right << std::setw(5) << depth << '\t';
                std::cout << std::right << std::setw(12) << node_no << '\t';
                std::cout << std::right << std::setw(7) << elapsed << '\t';
                std::cout << std::right << std::setw(11) << NPS << std::endl;
                /*
                printf("Depth: %2d Nodes: %10lu Time: %5ld NPS: %7.0d\n",
                                depth,     node_no,     elapsed,  NPS);
                */
            }
        } else if (token == "divide") {
            // Get user argument
            std::string depth_str;
            iss >> depth_str;
            int depth = depth_str.empty() ? 1 : stoi(depth_str);

            uint64_t node_no = perft(board, depth, true);
            std::cout << std::endl;
            std::cout << node_no << std::endl;
        } else if (token == "position") {
            // Parse the position command and update the board accordingly
            // Example: position startpos moves e2e4 e7e5
            std::string position_str;
            std::getline(iss, position_str);
            parse_position(board, position_str);
        } else if (token == "go"){
            // Stop any ongoing search
            search_stop(search_thread, info);
            // Parse the go, populating the info struct with search requirements
            parse_go(board, info, iss);
            LOG("Starting search with depth " << info->depth << " time " << info->time
                                            << " inc " << info->inc);
            // search(board, info);
            search_start(search_thread, board, info);
        } else if (token == "eval") {
            eval_t eval[1];
            evaluate(board, eval);
            eval->print();
        } else if (token == "dumphistory") {
            for (piece_t p = NO_PIECE; p < PIECE_NO; ++p) {
                std::cout << piece_to_ascii[p] << ": \n";
                for (square_t sq = A1; sq <= H8; ++sq) {
                    std::cout << "  " << board->history_h[p][sq] << std::endl;
                }
            }
        } else {
            std::cout << "Unknown command: '" << token << "'" << std::endl;
        }
    };

    // Make sure the search thread was joined before exiting
    if (search_thread.joinable()) {
        search_thread.join();
    }

    LOG("Quitting the UCI loop...");
}

move_t str_to_move(board_t *board, const std::string& s) {
    // TODO: Implement with a move generator to only convert to *legal* moves
    movelist_t moves;
    generate_moves(board, &moves);
    for (const move_t move : moves) {
        if (move_to_str(move) == s) {
            return move;
        }
    }
    std::cout << "Move '" << s << "' is invalid!" << std::endl;
    return NULLMV;
}
