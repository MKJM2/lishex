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

// TODO: Format
uint64_t precomputed_bishop_magics[] = {
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

uint64_t precomputed_rook_magics[] = {
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

// Initializing magic bitboards at startup
// see: https://www.chessprogramming.org/Looking_for_Magics
//
//

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
bb_t generate_attacks<BISHOP>(square_t sq, bb_t blockers) {

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
bb_t generate_attacks<ROOK>(square_t sq, bb_t blockers) {

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
            std::cout << "Mismatch at " << square_to_str(sq) + ":" << std::endl;
            printBB(b1);
            std::cout << "      vs      \n";
            printBB(b2);
            return false;
        }
        // Bishops
        b1 = generate_attacks<BISHOP>(sq, occupancies);
        b2 = attacks<BISHOP>(sq, occupancies);
        if (b1 != b2) {
            std::cout << "Mismatch at " << square_to_str(sq) + ":" << std::endl;
            printBB(b1);
            std::cout << "      vs      \n";
            printBB(b2);
            return false;
        }
    }
    return true;
}
#endif
