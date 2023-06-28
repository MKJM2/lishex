#include <iostream>
#include <sstream>

#include "board.h"

const std::string start_FEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";

/* UCI driver loop */
void loop(int argc, char* argv[]) {
    // TODO: Handle command-line args
    (void) argc;
    (void) argv;

    board_t board[1];
    setup(board, start_FEN);

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
        } else {
            std::cout << "Unknown command: '" << token << "'" << std::endl;
        }
    };
}

std::string move_to_str(move_t m) {

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
