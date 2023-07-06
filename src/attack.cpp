/* File containing code for initializing and lookup of precalculated attack
 * tables */

#include "attack.h"

#include <cstring> // memset

#include "rng.h"
#include "types.h"

// For pawns, we index the attack table by [side to move] and [origin square].
// We get a bitboard back, representing the squares being attacked by pawn of
// color [side to move] located on [origin square]
bb_t pawn_attacks[2][SQUARE_NO];

/* Leaping pieces */
bb_t knight_attacks[SQUARE_NO];
bb_t king_attacks[SQUARE_NO];

/* Sliding pieces */
// TODO: PEXT

/* Fancy Magics */
bb_t bishop_occupancies[SQUARE_NO];
bb_t rook_occupancies[SQUARE_NO];

// The sizes are determined by the number of possible occupancy
// subsets for each given square. See the section on cardinality
// at https://www.chessprogramming.org/Magic_Bitboards
bb_t bishop_attacks[5248];
bb_t rook_attacks[102400];

magic_t bishop_magics[SQUARE_NO];
magic_t rook_magics[SQUARE_NO];


// Initializing magic bitboards at startup
// see: https://www.chessprogramming.org/Looking_for_Magics

/*
template<>
bb_t attacks<B>(square_t from, bb_t blockers);

template<>
bb_t attacks<b>(square_t from, bb_t blockers) {
    return attacks<B>(from, blockers);
}

template<>
bb_t attacks<R>(square_t from, bb_t blockers);

template<>
bb_t attacks<r>(square_t from, bb_t blockers) {
    return attacks<R>(from, blockers);
}
*/

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

// Set relevant occupancy bits for a bishop on each origin square
void init_bishop_occupancies() {

    bb_t occupancies = 0ULL;
    for (square_t sq = A1; sq <= H8; ++sq) {
        occupancies = 0ULL;

        // Bitboard representing the destination square
        bb_t start = SQ_TO_BB(sq);
        bb_t dest = start;

        // NORTH_EAST
        while ((dest = ne_shift(dest))) {
            occupancies |= dest;
        }

        // SOUTH_EAST
        dest = start;
        while ((dest = se_shift(dest))) {
            occupancies |= dest;
        }

        // SOUTH_WEST
        dest = start;
        while ((dest = sw_shift(dest))) {
            occupancies |= dest;
        }

        // NORTH_WEST
        dest = start;
        while ((dest = nw_shift(dest))) {
            occupancies |= dest;
        }

        // For occupancies, we don't care the squares on the border of the board
        bishop_occupancies[sq] = occupancies & ~BORDER_SQ;
    }
}

// Set relevant occupancy bits for a rook on each origin square
void init_rook_occupancies() {

    bb_t occupancies = 0ULL;
    for (square_t sq = A1; sq <= H8; ++sq) {

        // For occupancies, we don't care the squares on the border of the board
        // so we mask them out (we use masks for the edges of the board)
        occupancies = 0ULL;

        // Bitboard representing the destination square
        bb_t start = SQ_TO_BB(sq);
        bb_t dest = start;

        // NORTH
        while ((dest = n_shift(dest))) {
            occupancies |= dest & ~RANK8_BB; // mask the north edge of the board
        }

        // EAST
        dest = start;
        while ((dest = e_shift(dest))) {
            occupancies |= dest & NOT_HFILE; // ~fileBBMask[7]
        }

        // SOUTH
        dest = start;
        while ((dest = s_shift(dest))) {
            occupancies |= dest & ~RANK1_BB;
        }

        // WEST
        dest = start;
        while ((dest = w_shift(dest))) {
            occupancies |= dest & NOT_AFILE;
        }

        rook_occupancies[sq] = occupancies;
    }
}


template<>
bb_t attacks<BISHOP>(square_t sq, bb_t blockers);

template<>
bb_t generate_attacks<BISHOP>(const square_t sq, const bb_t blockers) {

    bb_t attacks = 0ULL;

    // Bitboard representing the destination square
    bb_t start = SQ_TO_BB(sq);
    bb_t dest = start;

    // NORTH_EAST
    while ((dest = ne_shift(dest))) {
        attacks |= dest;
        if (dest & blockers) break;
    }

    // SOUTH_EAST
    dest = start;
    while ((dest = se_shift(dest))) {
        attacks |= dest;
        if (dest & blockers) break;
    }

    // SOUTH_WEST
    dest = start;
    while ((dest = sw_shift(dest))) {
        attacks |= dest;
        if (dest & blockers) break;
    }

    // NORTH_WEST
    dest = start;
    while ((dest = nw_shift(dest))) {
        attacks |= dest;
        if (dest & blockers) break;
    }

    return attacks;
}


template<>
bb_t generate_attacks<ROOK>(const square_t sq, const bb_t blockers) {

    bb_t attacks = 0ULL;

    // Bitboard representing the destination square
    bb_t start = SQ_TO_BB(sq);
    bb_t dest = start;

    // NORTH
    while ((dest = n_shift(dest))) {
        attacks |= dest;
        if (dest & blockers) break;
    }

    // EAST
    dest = start;
    while ((dest = e_shift(dest))) {
        attacks |= dest;
        if (dest & blockers) break;
    }

    // SOUTH
    dest = start;
    while ((dest = s_shift(dest))) {
        attacks |= dest;
        if (dest & blockers) break;
    }

    // WEST
    dest = start;
    while ((dest = w_shift(dest))) {
        attacks |= dest;
        if (dest & blockers) break;
    }

    return attacks;
}


/*
void init_slider_attacks() {
    for (square_t sq = A1; sq <= H8; ++sq) {
        bishop_attacks[sq] = 0ULL;
        rook_attacks[sq] = 0ULL;
    }
}
*/

#ifdef DEBUG
// assert(attack_tables_valid());
bool attack_tbs_valid(const bb_t occupancies) {

    // Testing magic entries
    bb_t b1, b2;
    for (square_t sq = A1; sq <= H8; ++sq) {
        // Rooks
        b1 = generate_attacks<ROOK>(sq, occupancies);
        b2 = attacks<ROOK>(sq, occupancies);
        if (b1 != b2) {
            std::cout << "Rook mismatch at " << square_to_str(sq) + ":" << std::endl;
            printBB(b1);
            std::cout << "      vs      \n";
            printBB(b2);
            return false;
        }
        // Bishops
        b1 = generate_attacks<BISHOP>(sq, occupancies);
        b2 = attacks<BISHOP>(sq, occupancies);
        if (b1 != b2) {
            std::cout << "Bishop mismatch at " << square_to_str(sq) + ":" << std::endl;
            printBB(b1);
            std::cout << "      vs      \n";
            printBB(b2);
            return false;
        }
    }
    return true;
}
#endif
