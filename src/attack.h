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

/* Fancy magic bitboards */

// see: https://www.chessprogramming.org/Magic_Bitboards#Fancy
void find_magics();

// We store magics for each square
typedef struct magic_t {
    // Occupancy mask for this particular square
    bb_t mask;
    // Pointer into the attack table for this particular square
    bb_t* attack_ptr;
    // Magic number for sq
    uint64_t magic;
    // Necessary shift (64 - # of 1 bits in the occupancy mask)
    uint32_t shift;
    // Function returning the key into lookup table
    inline uint32_t key(bb_t occupied) {
        return ((occupied & mask) * magic) >> shift;
    }
} magic_t;

extern magic_t bishop_magics[SQUARE_NO];
extern magic_t rook_magics[SQUARE_NO];

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
