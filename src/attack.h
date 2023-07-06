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
    inline uint32_t key(const bb_t occupied) {
        if constexpr (bmi2) {
            return static_cast<uint32_t>(_pext_u64(occupied, mask));
        } else {
            return ((occupied & mask) * magic) >> shift;
        }
    }
} magic_t;

extern magic_t bishop_magics[SQUARE_NO];
extern magic_t rook_magics[SQUARE_NO];

constexpr uint64_t precomputed_bishop_magics[SQUARE_NO] = {
        0x68403801c10208e0, 0x1005100882008201, 0x61022082000400,
        0x6009040300200001, 0x1104000010000,    0x2010423000800,
        0x200420210420050,  0xb20228c00884000,  0x8014040490040300,
        0x108020404018200,  0x206500400882400,  0x82060404029080c0,
        0x8000040420024002, 0x2324008a50400840, 0x2500124808090800,
        0x40004248441000,   0x15024810040800,   0x8414001010038908,
        0x1002004042020021, 0x1408010082004102, 0x804004a15201001,
        0x80110080c010,     0x446080988142200,  0xa000032110400,
        0x4484402110072840, 0x1821300204500200, 0x10100100400a2,
        0x341040000440080,  0x431010002114000,  0x10202200210100c,
        0x20820040c4010880, 0x408420008420200,  0x804d83c04d121000,
        0x221081900600300,  0x804441000820020,  0x1148a00800010810,
        0x90024040402c0100, 0x2002008200090260, 0x10184100c0010820,
        0x182004502020080,  0x94301210080808,   0x444044028840a000,
        0x2010082290020801, 0x1200084204800800, 0x38012012060900,
        0x13c044088c080080, 0xa2300200840600,   0x1a42020020ca01,
        0x2002020120080012, 0x4820801040092,    0x70010100411000c0,
        0x4008008084040000, 0x20002c04ad040082, 0x1e08202420000,
        0x4206086204040a20, 0x8008010104010000, 0x1016212200400,
        0x8848222822000,    0x810104050080b004, 0x4510010220840400,
        0x8010000040082208, 0x404400208024c,    0x118040444080600,
        0x2180800808600,
};

constexpr uint64_t precomputed_rook_magics[SQUARE_NO] = {
    0x2280001080400020, 0x40006000401000,   0x2200108200220840,
    0x2100201001000844, 0x448008010c000280, 0x100180100020400,
    0x100020021004084,  0x8801080004c2100,  0x4480004003a081,
    0x8801004002208900, 0x1440803000a00088, 0x1a09000810010024,
    0x800800400680080,  0x110800200040080,  0x12002402001308,
    0x90290001c2008100, 0x180004020004000,  0x110808020024008,
    0xc1410011012004,   0x10048008021080,   0xc01010018000450,
    0x4020808002000c00, 0x81c0240030052288, 0x9010120004008049,
    0x800400480008038,  0x80200040100040,   0x4a0080040100040,
    0xa00052020008a042, 0x100280280240080,  0x8206000200102408,
    0x8800040101000200, 0x3408004200088104, 0x8280008103002048,
    0x40a000401000,     0x42200c2003081,    0x5008041000801880,
    0x4800401800800,    0x1103404408011020, 0x8002100c000108,
    0x20c12046000084,   0x400080208000,     0x20008440008020,
    0x410020030010,     0x880d008810010020, 0x40110008010004,
    0x2001004420008,    0x280051002040088,  0x4212009100420024,
    0x4482080010300,    0x10002000c0008080, 0x2221c10010e00100,
    0x811000180080,     0xa1001048000500,   0x1002000488102200,
    0x40100281280400,   0x9040090240a40200, 0x448410420820492,
    0x8020201040008101, 0x1008150009406001, 0x1400042101100019,
    0x140100102c020801, 0x1000400080613,    0x2010802100084,
    0x2e101840042
};

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
bb_t generate_attacks(const square_t from, const bb_t blockers);

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
        return m.attack_ptr[m.key(blockers)];
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

        // We use the Carry-Ripler trick to iterate over all subsets
        // of occupiers for the given occupancy mask
        // (https://www.chessprogramming.org/Traversing_Subsets_of_a_Set)
        subset = 0ULL; subsets_no = 0;
        do {
            // Store the subset
            blockers[subsets_no] = subset;
            // Generate attacks for the subset the regular (slow) way
            slider_attacks[subsets_no] = generate_attacks<PIECE_T>(sq, subset);

            if constexpr (bmi2) {
                magic.attack_ptr[magic.key(subset)] = slider_attacks[subsets_no];
            }

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

        // If not using the BMI2 instruction set, the pext function isn't available and we
        // have to generate magics // TODO: Precompute the magics
        if constexpr (!bmi2) {

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
