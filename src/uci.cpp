#include "uci.h"

#include <iostream>
#include <iomanip>
#include <sstream>

#include "board.h"
#include "time.h" // now()
#include "search.h"

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
    std::string token;
    int movestogo = 30, movetime = -1;
    int time = -1, inc = 0;

    while (iss >> token) {
        if (token == "depth") {
            iss >> info->depth;
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
        else {
            std::cout << "Unrecognized or unsupported token '"
                      << token << "'" << std::endl;
        }
    }

    // Simple time management based on
    // E[# halfmoves until end of game | material on board]
    if (movetime != -1) {
      time = movetime;
      movestogo = 1;
    } else {
      //movestogo = est_moves_left(*this);
      movestogo = 25;
    }

    // Time management
    if (time != -1) {
        time /= movestogo;

        // to be safe we don't run out of time
        time -= 50;
    }

    if (info->depth == -1) {
        info->depth = MAX_MOVES;
    }

    LOG("Starting search with depth " << info->depth << " time " << info->time
                                      << "inc " << info->inc);
    search(board, info);
}

} // namespace

/* UCI driver loop */
void loop(int argc, char* argv[]) {
    // TODO: Handle command-line args
    (void) argc;
    (void) argv;

    board_t board[1];
    //setup(board, start_FEN);
    setup(board, start_FEN);

    searchinfo_t info[1];

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
        } else if (token == "stop" || token == "quit") { // TODO: no stop?
            info->quit = true;
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
        } else if (token == "undo") {
            undo_move(board);
            print(board);
        } else if (token == "moves") {
            movelist_t moves;
            generate_moves(board, &moves);
            for (const move_t* it = moves.begin(); it != moves.end(); ++it) {
                std::cout << move_to_str(*it) << " ";
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
            std::cout << std::setw(2) << "TIME (μs)\t";
            std::cout << std::setw(2) << "NPS" << std::endl;
            */
            std::cout <<
                "DEPTH	       NODES       TIME (μs)    NPS" << std::endl;
            std::string s (43, '-');
            std::cout << s << std::endl;
            for (int depth = 1; depth <= depthSet; ++depth) {
                int NPS = 0; // # Nodes per (mili)second
                uint64_t start = now();
                node_no = perft(board, depth);
                uint64_t elapsed = now() - start;
                // nodes per microsecond -> nodes per s
                NPS = node_no * 1'000'000 / elapsed;
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
            parse_go(board, info, iss);
        } else {
            std::cout << "Unknown command: '" << token << "'" << std::endl;
        }
    };
}

move_t str_to_move(board_t *board, const std::string& s) {
    // TODO: Implement with a move generator to only convert to *legal* moves
    movelist_t moves;
    generate_moves(board, &moves);
    for (const move_t *it = moves.begin(); it != moves.end(); ++it) {
        if (move_to_str(*it) == s) {
            return *it;
        }
    }
    std::cout << "Move '" << s << "' is invalid!" << std::endl;
    return NULLMV;
}
