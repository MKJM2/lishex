#ifndef ATTACK_H_
#define ATTACK_H_

#include "types.h"
#include "bitboard.h"

void init_pawn_attacks();
void init_leap_attacks();
void init_bishop_occupancies();
void init_rook_occupancies();
void init_slider_attacks();

// On the fly generation (for generating magics)
bb_t gen_bishop_attacks(square_t sq, bb_t blockers);
bb_t gen_rook_attacks(square_t sq, bb_t blockers);

extern bb_t pawn_attacks[2][SQUARE_NO];

/* Leaping pieces */
extern bb_t knight_attacks[SQUARE_NO];
extern bb_t king_attacks[SQUARE_NO];

/* Sliding pieces */
extern bb_t bishop_occupancies[SQUARE_NO];
extern bb_t rook_occupancies[SQUARE_NO];
extern bb_t bishop_attacks[SQUARE_NO];
extern bb_t rook_attacks[SQUARE_NO];

template<piece_t pt>
inline bb_t attacks(const square_t from);

// Knight (N, n) attacks
template<>
inline bb_t attacks<N>(const square_t from) {
    return knight_attacks[from];
}

template<>
inline bb_t attacks<n>(const square_t from) {
    return knight_attacks[from];
}

// King (K, k) attacks

template<>
inline bb_t attacks<K>(const square_t from) {
    return king_attacks[from];
}

template<>
inline bb_t attacks<k>(const square_t from) {
    return king_attacks[from];
}

// TODO: Sliding pieces

#endif // ATTACK_H_
