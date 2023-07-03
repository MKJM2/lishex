#include "uci.h"
#include <iostream>
#include <sstream>


const std::string start_FEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
const std::string kiwipete_FEN = "r3k2r/p1ppqpb1/bn2pnp1/3PN3/1p2P3/2N2Q1p/PPPBBPPP/R3K2R w KQkq - 0 1";

/* UCI driver loop */
void loop(int argc, char* argv[]) {
    // TODO: Handle command-line args
    (void) argc;
    (void) argv;

    board_t board[1];
    //setup(board, start_FEN);
    setup(board, kiwipete_FEN);

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
        } else if (token == "stop" || token == "quit") {
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
        } else {
            std::cout << "Unknown command: '" << token << "'" << std::endl;
        }
    };
}

move_t str_to_move(board_t *board, std::string& s) {
    // TODO: Implement with a move generator to only convert to *legal* moves
    movelist_t moves;
    generate_moves(board, &moves);
    for (const move_t *it = moves.begin(); it != moves.end(); ++it) {
        if (move_to_str(*it) == s) {
            std::cout << "Move '" << s << "' made!" << std::endl;
            return *it;
        }
    }
    std::cout << "Move '" << s << "' is invalid!" << std::endl;
    return NULLMV;
}
