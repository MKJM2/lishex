#ifndef BOARD_H_
#define BOARD_H_

#include <string>

#include "types.h"
#include "bitboard.h"

/************************/
/* Board representation */
/************************/

// The Board type
typedef struct board_t {
    // We store a separate bitboard for each piece (type, color)
    bb_t bitboards[PIECE_NO];
    // Additionally, we store bitboards of all pieces for a given side
    bb_t pieces[BOTH];
    // Side to play (Black = 0, White = 1)
    int turn = 1;
    // Material for each side (TODO: might not be necessary)
    int material[BOTH];
    // Ply of the game in the current search
    int ply = 0;
    // How many halfmoves have been made until current position
    int history_ply = 0;
    // Current castle rights for both players
    int castle_rights = WK | WQ | BK | BQ;
    // Fifty move counter
    int fifty_move;
    // En passant square (if any)
    square_t ep_square = NO_SQ;
    // Kings' squares
    square_t king_square[BOTH] = {E8, E1};
    // Zobrist hash key for the current position
    uint64_t key = 0;
    // History of previous positions
    undo_t history[MAX_MOVES];
} board_t;

extern void init_keys();

extern void reset(board_t *board);

extern void setup(board_t *board, const std::string& fen);

extern void print(board_t *board, bool verbose = true);

extern void test(board_t *board);

extern uint64_t generate_pos_key(const board_t *board);

inline bb_t all_pieces(const board_t *board) {
    return board->pieces[BLACK] | board->pieces[WHITE];
}

/* TODO: */
// Helpers handling bitboard manipulation & hashing:
// add_piece
// rm_piece
// mv_piece


#ifdef DEBUG
extern bool check(const board_t *board);
#endif // DEBUG


#endif // BOARD_H_
