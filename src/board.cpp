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
    for (int i = 0; i < PIECE_NB; ++i) {
        board->bitboards[i] = 0ULL;
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

    // Make sure the board is reset (TODO: Try not to call reset too much)
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
            SETBIT(board->bitboards[char_to_piece[c]], sq);
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
}
