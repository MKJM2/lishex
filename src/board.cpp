#include <cstring> //std::memset

#include "bitboard.h"
#include "board.h"

/* Zeroes out the entire position */
void reset(board_t *board) {

    // Throws compiler warnings:
    // std::memset(board, 0, sizeof(board_t));

    // Clear board history
    memset(board->history, 0, MAX_MOVES * sizeof(undo_t));

    // Reset all bitboards
    for (piece_t pc : pieces) {
        board->bitboards[pc] = 0ULL;
    }

    // Reset the turn
    board->turn = BOTH;

    // Reset the en passant square
    board->ep_square = NO_SQ;

    // Reset the plies
    board->ply = 0;
    board->history_ply = 0;

    // Reset castling rights
    board->castle_rights = 0;

    // Reset 50rule counter
    board->fifty_move = 0;

    // Clear Zobrist board key
    board->key = 0ULL;

    // Reset king squares
    board->king_square[WHITE] = board->king_square[BLACK] = NO_SQ;
}

/* Initializes the board from given FEN string */
void setup(board_t *board, const std::string& fen) {
    // Split the input FEN into 6 parts
    // - position
    // - side to move
    // - castling rights
    // - en passant square
    // - halfmove clock
    // - fullmove clock
    std::string fen_parts[6];
    int idx = 0;
    size_t i = 0;
    for (; i < fen.size(); ++i) {
        if (fen[i] == ' ') {
            ++idx;
        } else {
            fen_parts[idx] += fen[i];
        }
    }

    // Make sure the board is reset
    reset(board);

    // Fill the bitboards with pieces from FEN
    int sq = A8;
    char c;
    for (i = 0; i < fen_parts[0].size(); ++i) {
        c = fen_parts[0][i];
        if (c == '/') {
            sq -= 2 * NORTH;
        } else if (isdigit(c)) {
            sq += (int)c - '0';
        } else {
            std::cout << c << ": setting sq " << sq << " on bitboard for " \
                      << char_to_piece[c] << " (" << c << ")" << std::endl;
            SETBIT(board->bitboards[char_to_piece[c]], sq);
            ++sq;
        }
    }

    // Set the side to move
    board->turn = (fen_parts[1] == "w") ? WHITE : BLACK;

    // Set the castling rights
    board->castle_rights = 0;
    if (fen_parts[2] != "-") {
        if (fen_parts[2].find('K') != std::string::npos) {
            board->castle_rights |= WK;
        }
        if (fen_parts[2].find('Q') != std::string::npos) {
            board->castle_rights |= WQ;
        }
        if (fen_parts[2].find('k') != std::string::npos) {
            board->castle_rights |= BK;
        }
        if (fen_parts[2].find('q') != std::string::npos) {
            board->castle_rights |= BQ;
        }
    }

    // Set the en passant square
    if (fen_parts[3] != "-") {
        int file = fen_parts[3][0] - 'a';
        int rank = fen_parts[3][1] - '1';
        board->ep_square = rank * 8 + file;
    } else {
        board->ep_square = NO_SQ;
    }

    // Set the halfmove clock since last capture/pawn push
    if (fen_parts[4].size()) {
        board->ply = stoi(fen_parts[4]);
    }

    // TODO: Set the fullmove clock (currently not being used!)
}

void print(board_t *board) {
    std::cout << "Printing bitboards" << std::endl;
    for (piece_t pc : pieces) {
        printBB(board->bitboards[pc]);
        std::cout << std::endl;
    }

    // TODO: We might want to use " ╚═╔├ "?
    static const std::string horizontal_line = "  +---+---+---+---+---+---+---+---+";

    std::cout << horizontal_line << std::endl;
    // Loop over all ranks
    for (int rank = RANK_8; rank >= RANK_1; --rank) {
        std::cout << rank + 1 << " ";
        // Loop over all files
        for (int file = A_FILE; file <= H_FILE; ++file) {
            // Current square to print
            square_t sq = rank * RANK_NO + file;

            piece_t piece_on_sq = NO_PIECE;
            // Check if any bitboards contain a piece on sq
            //for (piece_t piece = P; piece <= k; ++piece) {
            for (piece_t pc : pieces) {
                if (GETBIT(board->bitboards[pc], sq)) {
                    piece_on_sq = pc;
                    break;
                }
            }
            // Print the piece
            std::cout << "| " << piece_to_ascii[piece_on_sq] << " ";
        }
        // Print rank number to the right of current rank
        std::cout << "|" << std::endl;
        std::cout << horizontal_line << std::endl;
    }
    // Print files underneath the board
    std::cout << "    a   b   c   d   e   f   g   h" << std::endl;

    /*
    if (!verbose) return;
    // Print additional information, like castle permissions
    std::cout << "Side to play: " \
              << ((turn == Piece::White) ? "White" : "Black") << std::endl;
    std::cout << "En Passant square: " \
              << ((epSquare == NO_SQ) ? "null" : toString(epSquare)) << std::endl;
    std::cout << "Castle permissions: ";

    // TODO: Make into a separate function
    std::string s;
    if (castlePerm & WKCastle) s.push_back('K');
    if (castlePerm & WQCastle) s.push_back('Q');
    if (castlePerm & BKCastle) s.push_back('k');
    if (castlePerm & BQCastle) s.push_back('q');
    std::cout << s << std::endl;

    std::cout << "Zobrist hash key: " \
              << posKey << std::endl;

    std::cout << "King squares: White at " \
              << toString(kingSquare[1]) << ", Black at " \
              << toString(kingSquare[0]) << std::endl;
    std::cout << "Piece counts: " << std::endl;
    std::cout << "White pawns: ";
    std::cout << pceCount[Piece::White | Piece::Pawn] << std::endl;
    std::cout << "Black pawns: ";
    std::cout << pceCount[Piece::Black | Piece::Pawn] << std::endl;
    std::cout << "White Knights: ";
    std::cout << pceCount[Piece::White | Piece::Knight] << std::endl;
    std::cout << "Black Knights: ";
    std::cout << pceCount[Piece::Black | Piece::Knight] << std::endl;
    std::cout << "White Bishops: ";
    std::cout << pceCount[Piece::White | Piece::Bishop] << std::endl;
    std::cout << "Black Bishops: ";
    std::cout << pceCount[Piece::Black | Piece::Bishop] << std::endl;
    std::cout << "White Rooks: ";
    std::cout << pceCount[Piece::White | Piece::Rook] << std::endl;
    std::cout << "Black Rooks: ";
    std::cout << pceCount[Piece::Black | Piece::Rook] << std::endl;
    std::cout << "White Queens: ";
    std::cout << pceCount[Piece::White | Piece::Queen] << std::endl;
    std::cout << "Black Queens: ";
    std::cout << pceCount[Piece::Black | Piece::Queen] << std::endl;
    std::cout << "Fifty Move Counter: " << fiftyMoveCounter << "\n";
    */
}
