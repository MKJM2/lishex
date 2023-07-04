#include "uci.h"

#include <iostream>
#include <sstream>

#include "board.h"

/* UCI driver loop */
void loop(int argc, char* argv[]) {
    // TODO: Handle command-line args
    (void) argc;
    (void) argv;

    board_t board[1];
    //setup(board, start_FEN);
    setup(board, test2_FEN);

    searchinfo_t info[1];

    std::string input, token;
    while (!info->quit) {
        //fflush(stdout); // for printf calls (if any)
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
            for (int depth = 0; depth < depthSet; ++depth) {
                int NPS = 0; // # Nodes per (mili)second
                //auto start = high_resolution_clock::now();
                //auto start = getTime();
                node_no = perft(board, depth);
                //auto end = high_resolution_clock::now();
                //auto end = getTime();
                //auto elapsed = end - start;
                //auto elapsed =
                    //duration_cast<milliseconds>(end - start).count();
                auto elapsed = 0UL;
                //NPS = static_cast<double>(node_no) / elapsed;
                //NPS *= 1000; // nodes per ms -> nodes per s
                NPS = 0;
                printf("Depth: %2d Nodes: %10lu Time: %5ld NPS: %7.0d\n",
                                depth,     node_no,     elapsed,  NPS);
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
