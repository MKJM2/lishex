/* File containing code for initializing and lookup of precalculated attack
 * tables */

#include "attack.h"

// For pawns, we index the attack table by [side to move] and [origin square].
// We get a bitboard back, representing the squares being attacked by pawn of
// color [side to move] located on [origin square]
uint64_t pawn_attacks[2][SQUARE_NO];

void init_pawn_attacks() {
    for (square_t sq = A1; sq <= H8; ++sq) {
        pawn_attacks[BLACK][sq] = 0ULL;
        pawn_attacks[WHITE][sq] = 0ULL;
    }
}

// TODO: Knight attacks, king attacks

// TODO: Magic bitboards for sliding pieces
