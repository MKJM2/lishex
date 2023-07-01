#include "uci.h"
#include <iostream>
#include <sstream>


const std::string start_FEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";

/* UCI driver loop */
void loop(int argc, char* argv[]) {
    // TODO: Handle command-line args
    (void) argc;
    (void) argv;

    board_t board[1];
    //setup(board, start_FEN);
    setup(board, "r3k2r/p1ppqpb1/bn2pnp1/3PN3/1p2P3/2N2Q1p/PPPBBPPP/R3K2R w KQkq - 0 1");

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
        } else if (token == "moves") {
            movelist_t moves;
            generate_moves(board, &moves);
            for (const move_t* it = moves.begin(); it != moves.end(); ++it) {
                std::cout << move_to_str(*it) << " ";
            }
            std::cout << std::endl;
        } else if (token == "test") {
            test(board);
        } else {
            std::cout << "Unknown command: '" << token << "'" << std::endl;
        }
    };
}

std::string move_to_str(const move_t m) {

    if (m == NULLMV) return "null";

    square_t from = get_from(m);
    square_t to = get_to(m);
    int flags = get_flags(m);

    std::string s = square_to_str(from) + square_to_str(to);

    // Handle promotions
    if (is_promotion(m)) {
        char c;
        switch (flags & ~CAPTURE) {
            case KNIGHTPROMO: c = 'n'; break;
            case ROOKPROMO:   c = 'r'; break;
            case BISHOPPROMO: c = 'b'; break;
            default:          c = 'q'; break;
        }
        s.push_back(c);
    }
    return s;
}

move_t str_to_move(std::string& s) {
    // TODO: Implement with a move generatior to only convert to *legal* moves
    (void) s;
    return NULLMV;
}
