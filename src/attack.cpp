/* File containing code for initializing and lookup of precalculated attack
 * tables */

#include "attack.h"

// For pawns, we index the attack table by [side to move] and [origin square].
// We get a bitboard back, representing the squares being attacked by pawn of
// color [side to move] located on [origin square]
bb_t pawn_attacks[2][SQUARE_NO];

/* Leaping pieces */
bb_t knight_attacks[SQUARE_NO];
bb_t king_attacks[SQUARE_NO];

/* Sliding pieces */
// TODO: Magics, PEXT
bb_t bishop_attacks[SQUARE_NO];
bb_t rook_attacks[SQUARE_NO];

void init_pawn_attacks() {
    // Reset current boards
    for (square_t sq = A1; sq <= H8; ++sq) {
        pawn_attacks[BLACK][sq] = 0ULL;
        pawn_attacks[WHITE][sq] = 0ULL;
    }
    // TODO: set pawn attacks
}

void init_leap_attacks() {
    // Reset current attack boards
    for (square_t sq = A1; sq <= H8; ++sq) {
        knight_attacks[sq] = 0ULL;
        king_attacks[sq] = 0ULL;
    }

    // Compute attacks for the king for each origin square
    bb_t bb;
    for (square_t sq = A1; sq <= H8; ++sq) {
        bb = SQ_TO_BB(sq);
        king_attacks[sq] |= n_shift(bb);
        king_attacks[sq] |= ne_shift(bb);
        king_attacks[sq] |= e_shift(bb);
        king_attacks[sq] |= se_shift(bb);
        king_attacks[sq] |= s_shift(bb);
        king_attacks[sq] |= sw_shift(bb);
        king_attacks[sq] |= w_shift(bb);
        king_attacks[sq] |= nw_shift(bb);
    }

    // Compute attacks for the knight for each origin square
    for (square_t sq = A1; sq <= H8; ++sq) {
        bb = SQ_TO_BB(sq);
        knight_attacks[sq] |= ne_shift(n_shift(bb));
        knight_attacks[sq] |= ne_shift(e_shift(bb));
        knight_attacks[sq] |= se_shift(e_shift(bb));
        knight_attacks[sq] |= se_shift(s_shift(bb));
        knight_attacks[sq] |= sw_shift(s_shift(bb));
        knight_attacks[sq] |= sw_shift(w_shift(bb));
        knight_attacks[sq] |= nw_shift(w_shift(bb));
        knight_attacks[sq] |= nw_shift(n_shift(bb));
    }
}

void init_slider_attacks() {
    for (square_t sq = A1; sq <= H8; ++sq) {
        bishop_attacks[sq] = 0ULL;
        rook_attacks[sq] = 0ULL;
    }
}
