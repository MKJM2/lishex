#ifndef BOARD_H_
#define BOARD_H_

#include <string>

#include "types.h"
#include "bitboard.h"

/************************/
/* Board representation */
/************************/

// The Board type
/**
 * @brief The board struct
 * Stores all necessary information about the current board state
*/
typedef struct board_t {
    // We store a separate bitboard for each piece (type, color)
    bb_t bitboards[PIECE_NO];
    // In addition to bitboards, we store a regular 8x8 array
    // for quick piece lookups during move-making
    piece_t pieces[SQUARE_NO];
    // Additionally, we store bitboards of all pieces for a given side
    bb_t sides_pieces[BOTH];
    // Side to play (Black = 0, White = 1)
    int turn = 1;
    // Material for each side (TODO: might not be necessary)
    // int material[BOTH];
    // Ply of the game in the current search
    int ply = 0;
    // How many halfmoves have been made until current position
    int history_ply = 0;
    // Current castle rights for both players
    int castle_rights = WK | WQ | BK | BQ;
    // Fifty move counter
    int fifty_move = 0;
    // En passant square (if any)
    square_t ep_square = NO_SQ;
    // Kings' squares
    // square_t king_square[BOTH] = {E8, E1};
    // Zobrist hash key for the current position
    uint64_t key = 0ULL;
    // History of previous positions
    undo_t history[MAX_MOVES];
} board_t;

extern void init_keys();

extern void reset(board_t *board);

extern void setup(board_t *board, const std::string& fen);

extern void print(const board_t *board, bool verbose = true);

extern void test(board_t *board);

extern uint64_t generate_pos_key(const board_t *board);

bool is_repetition(const board_t *board);

bool make_move(board_t *board, move_t move);

void undo_move(board_t *board, move_t move);
void undo_move(board_t *board); // Undo last move

inline bb_t all_pieces(const board_t *board) {
    return board->sides_pieces[BLACK] | board->sides_pieces[WHITE];
}

inline bb_t king_square_bb(const board_t* board, const int colour) {
    return colour ? board->bitboards[K] : board->bitboards[k];
}

inline square_t king_square(const board_t* board, const int colour) {
    return GETLSB(king_square_bb(board, colour));
}

#ifdef DEBUG
extern void history_trace(const board_t *board, size_t n);
extern bool check(const board_t *board);
extern bool check_against_ref(const board_t* b);
extern void perft_test(board_t *board, const std::string& epd_filename);
#endif // DEBUG


#endif // BOARD_H_
