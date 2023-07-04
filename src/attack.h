#ifndef ATTACK_H_
#define ATTACK_H_

#include <cstring>
#include <iostream>

#include "types.h"
#include "bitboard.h"
#include "rng.h"

void init_leap_attacks();
void init_bishop_occupancies();
void init_rook_occupancies();
void init_slider_attacks();

// On the fly generation (for generating magics)

//bb_t gen_bishop_attacks(square_t sq, bb_t blockers);
//bb_t gen_rook_attacks(square_t sq, bb_t blockers);

/* Fancy magic bitboards */

// see: https://www.chessprogramming.org/Magic_Bitboards#Fancy

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

extern uint64_t precomputed_bishop_magics[];
extern uint64_t precomputed_rook_magics[];

extern bb_t pawn_attacks[2][SQUARE_NO];

/* Leaping pieces */
// Indexed by: [origin square]
extern bb_t knight_attacks[SQUARE_NO];
extern bb_t king_attacks[SQUARE_NO];

/* Sliding pieces relevant occupancy bitboards */
// Indexed by: [origin square]
extern bb_t bishop_occupancies[SQUARE_NO];
extern bb_t rook_occupancies[SQUARE_NO];

/* Sliding pieces attacks */
// Indexed by: pointer from a magic entry + offset from magic key
extern bb_t bishop_attacks[5248];
extern bb_t rook_attacks[102400];

// Returns relevant magic array for the given piece type
template<piece_t PIECE_T>
constexpr magic_t *magics = PIECE_T == BISHOP ? bishop_magics : rook_magics;

template<piece_t PIECE_T>
constexpr bb_t *occupancies =
    PIECE_T == BISHOP ? bishop_occupancies : rook_occupancies;


template<piece_t PIECE_T>
constexpr bb_t* attack_table = PIECE_T == BISHOP ? bishop_attacks : rook_attacks;

template<piece_t PIECE_T>
inline bb_t attacks(const square_t from);

template<piece_t PIECE_T>
bb_t generate_attacks(square_t from, bb_t blockers);

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

// Sliding pieces attacks (require a blockers bitboard)
template<piece_t PIECE_T> // BISHOP or ROOK
inline bb_t attacks(square_t from, bb_t blockers) {
    if constexpr (PIECE_T == QUEEN) {
        return attacks<BISHOP>(from, blockers) | attacks<ROOK>(from, blockers);
    } else {
        magic_t& m = magics<PIECE_T>[from];
        blockers &= m.mask;
        blockers *= m.magic;
        blockers >>= m.shift;
        return m.attack_ptr[blockers];
    }
}


// When using template functions, the definitions need to be visible at the
// point of template instantiation.

// Heavily inspired by:
// https://github.com/official-stockfish/Stockfish/blob/master/src/bitboard.cpp

/**
 * @brief Initializing magic bitboards at startup
 * @tparam PIECE_T piece type to initialize magics for (BISHOP or ROOK)
*/
template<piece_t PIECE_T>
void init_magics() {

    // For a given configuration, there can be at most 4096 (2^12)
    // subsets of possible blockers (for rooks, bishops have less)
    bb_t blockers[1 << 12] = {};
    // ...for each of them we compute the possible slider piece attacks
    bb_t slider_attacks[1 << 12] = {};
    // ...and we keep track of what attacks the magics map to
    bb_t magic_attacks[1 << 12] = {};

    // We keep track of the current subset of blockers
    bb_t subset = 0ULL;

    // In addition, we keep track of how many subsets there are
    size_t subsets_no = 0;

    for (square_t sq = A1; sq <= H8; ++sq) {
        magic_t& magic = magics<PIECE_T>[sq];

        // Mask for relevant occupancy bits
        magic.mask = occupancies<PIECE_T>[sq];

        // The shift is 64 - # of set bits in the mask (population count)
        magic.shift = SQUARE_NO - CNT(magic.mask);

        // We store a pointer to the relevant entry in the attacks table
        magic.attack_ptr = (sq == A1) ? attack_table<PIECE_T>
            : magics<PIECE_T>[sq - 1].attack_ptr + subsets_no;

        // We use the Carry-Ripler trick
        // to iterate over all subsets for the given occupancy mask
        // (https://www.chessprogramming.org/Traversing_Subsets_of_a_Set)
        subset = 0ULL; subsets_no = 0;
        do {
            // Store the subset
            blockers[subsets_no] = subset;
            // Generate attacks for the subset the regular (slow) way
            slider_attacks[subsets_no] = generate_attacks<PIECE_T>(sq, subset);
            subset = (subset - magic.mask) & magic.mask;
            ++subsets_no;
        } while (subset);

        /*
        // TODO: Make this cleaner
        // If we have precomputed magics, just use those:
        if (precomputed_bishop_magics) {
            magic.magic = (PIECE_T == BISHOP) ? precomputed_bishop_magics[sq]
                                              : precomputed_rook_magics[sq];
            magic.attack_ptr[]
            continue;
        }
        */

        /* Now that we have all the possible subsets stored in blockers[]
         * and all the attack bitboards generated, we look for magics */

        // We'll break on the first occurance of a valid magic number
        // for the given square sq
        bool valid = false;
        while (!valid) {
            // Generate a random candidate for the magic number
            magic.magic = sparse_uint64();
            valid = true;

            // Clear out whatever attacks the previous magic mapped to
            memset(magic_attacks, 0ULL, sizeof(magic_attacks));

            // For each subset, we verify that the magic index maps to the correct
            // attacks in the attack table.
            for (size_t subset_idx = 0; subset_idx < subsets_no; ++subset_idx) {
                uint32_t key = magic.key(blockers[subset_idx]);

                // Store the mapping if none created so far
                if (magic_attacks[key] == 0ULL) {
                    magic_attacks[key] = slider_attacks[subset_idx];
                    magic.attack_ptr[key] = magic_attacks[key];
                    continue;
                }

                // Check if the magic maps to the correct attack
                if (magic_attacks[key] != slider_attacks[subset_idx]) {
                    // The magic doesn't map to the correct attacks, hence invalid!
                    valid = false;
                    break;
                }
            }
        }
        #ifdef DEBUG
        // std::cout << std::hex << magic.magic << std::dec << "," << std::endl;
        #endif
    }
    // std::cout << std::endl;
}

#ifdef DEBUG
bool attack_tbs_valid(const bb_t occupancies);
#endif

#endif // ATTACK_H_
