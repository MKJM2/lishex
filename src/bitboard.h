/*
 Lishex (codename 1F98A), a UCI chess engine built in C++
 Copyright (C) 2023 Michal Kurek

 Lishex is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Lishex is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef BITBOARD_H_
#define BITBOARD_H_

#include "types.h" // using bb_t = uint64_t

#include <cstdint>
#include <iostream>

#define SETBIT(bb, sq) ((bb) |=  (1ULL << (sq)))
#define CLRBIT(bb, sq) ((bb) &= ~(1ULL << (sq)))
#define GETBIT(bb, sq) ((bb) & (1ULL << (sq)))
#define SQ_TO_BB(sq) (1ULL << (sq))
#define CLRLSB(bb) ((bb) &= (bb - 1))
#define CNT(bb) (__builtin_popcountll(bb)) // TODO: C++20: Switch to std::popcount()
#define GETLSB(bb) (bit_scan_forward(bb))
#define GETMSB(bb) (bit_scan_reverse(bb))
#define POPLSB(bb) (bit_drop_forward(bb))
#define LSB_BB(bb) ((bb) & -(bb)) // a bitboard with only the LSB bit of bb set

// Useful bitboards/bitmasks

const bb_t RANK1_BB = 0x00000000000000ffULL;
const bb_t RANK2_BB = 0x000000000000ff00ULL;
const bb_t RANK3_BB = 0x0000000000ff0000ULL;
const bb_t RANK4_BB = 0x00000000ff000000ULL;
const bb_t RANK5_BB = 0x000000ff00000000ULL;
const bb_t RANK6_BB = 0x0000ff0000000000ULL;
const bb_t RANK7_BB = 0x00ff000000000000ULL;
const bb_t RANK8_BB = 0xff00000000000000ULL;

const bb_t FILEA_BB = 0x0101010101010101ULL;
const bb_t FILEB_BB = 0x0202020202020202ULL;
const bb_t FILEC_BB = 0x0404040404040404ULL;
const bb_t FILED_BB = 0x0808080808080808ULL;
const bb_t FILEE_BB = 0x1010101010101010ULL;
const bb_t FILEF_BB = 0x2020202020202020ULL;
const bb_t FILEG_BB = 0x4040404040404040ULL;
const bb_t FILEH_BB = 0x8080808080808080ULL;

extern bb_t fileBBMask[8];
extern bb_t rankBBMask[8];
// const bb_t NOT_AFILE = 0xfefefefefefefefeULL; // ~FILEA_BB
// const bb_t NOT_HFILE = 0x7f7f7f7f7f7f7f7fULL; // ~FILEH_BB
// const bb_t NOT_RANK7 = 0xff00ffffffffffffULL; // ~0x00ff000000000000
// const bb_t NOT_RANK2 = 0xffffffffffff00ffULL; // ~0x000000000000ff00
// const bb_t BORDER_SQ = 0xff818181818181ffULL; // squares on the border of the board
constexpr bb_t NOT_AFILE = ~FILEA_BB;
constexpr bb_t NOT_HFILE = ~FILEH_BB;
constexpr bb_t NOT_RANK7 = ~RANK7_BB;
constexpr bb_t NOT_RANK2 = ~RANK2_BB;
constexpr bb_t BORDER_SQ = FILEA_BB | RANK8_BB | FILEH_BB | RANK1_BB;


// Passing pawn masks
extern bb_t wPassedMask[64];
extern bb_t bPassedMask[64];

// Isolated pawn masks
extern bb_t isolatedMask[64];

// Helpers for shifting the bitboards
// https://www.chessprogramming.org/General_Setwise_Operations#ShiftingBitboards
// TODO: Can be optimized with SSE2
// (see: https://www.chessprogramming.org/SSE2#OneStepOnlySSE2)
inline bb_t  n_shift(bb_t bb) {return bb << 8;}
inline bb_t  s_shift(bb_t bb) {return bb >> 8;}
inline bb_t  e_shift(bb_t bb) {return (bb & NOT_HFILE) << 1;}
inline bb_t  w_shift(bb_t bb) {return (bb & NOT_AFILE) >> 1;}
inline bb_t ne_shift(bb_t bb) {return (bb & NOT_HFILE) << 9;}
inline bb_t se_shift(bb_t bb) {return (bb & NOT_HFILE) >> 7;}
inline bb_t sw_shift(bb_t bb) {return (bb & NOT_AFILE) >> 9;}
inline bb_t nw_shift(bb_t bb) {return (bb & NOT_AFILE) << 7;}


/**
 * bit_scan_forward
 * @author Matt Taylor (2003)
 * @param bb bitboard to scan
 * @precondition bb != 0
 * @return index (0..63) of least significant one bit
 */
inline square_t bit_scan_forward(bb_t bb);

/**
 * bit_scan_forward
 * @param bb bitboard to scan
 * @precondition bb != 0
 * @return index (0..63) of most significant one bit
 */
inline square_t bit_scan_reverse(bb_t bb);

/**
 * bit_drop_forward
 * @brief Same as bit_scan_forward but pops the least significant bit
 * @param bb bitboard to scan
 * @precondition bb != 0
 * @return index (0..63) of least significant one bit
 */
inline square_t bit_drop_forward(bb_t &bb);


/* If available, we use compiler intrinsics */

#ifdef __GNUC__ // gcc, clang

inline square_t bit_scan_forward(bb_t bb) {
    assert(bb);
    // counts trailing zeroes
    return __builtin_ctzll(bb);
}

inline square_t bit_scan_reverse(bb_t bb) {
    assert(bb);
                 // counts leading zeroes
    return (63 ^ __builtin_clzll(bb));
}

#else

// Taken from https://www.chessprogramming.org/BitScan
const int lsb_64_table[64] =
{
   63, 30,  3, 32, 59, 14, 11, 33,
   60, 24, 50,  9, 55, 19, 21, 34,
   61, 29,  2, 53, 51, 23, 41, 18,
   56, 28,  1, 43, 46, 27,  0, 35,
   62, 31, 58,  4,  5, 49, 54,  6,
   15, 52, 12, 40,  7, 42, 45, 16,
   25, 57, 48, 13, 10, 39,  8, 44,
   20, 47, 38, 22, 17, 37, 36, 26
};

inline square_t bit_scan_forward(bb_t bb) {
   bb ^= bb - 1;
   unsigned int folded = (int) bb ^ (bb >> 32);
   return lsb_64_table[folded * 0x78291ACF >> 26];
}

#endif

inline square_t bit_drop_forward(bb_t &bb) {
    square_t idx = bit_scan_forward(bb);
    CLRLSB(bb);
    return idx;
}


inline bb_t NOT_PROMOTING(int side) {
    return (side ? NOT_RANK7 : NOT_RANK2);
}

inline bb_t PROMOTING(int side) {
    return (side ? RANK7_BB : RANK2_BB);
}

// Returns a bitboard of a mask covering rank 'r' (for the player 'side')
inline bb_t RANK_TO_BB(int r, int side = WHITE) {
    return rankBBMask[side ? (r - 1) : 7 - r];
}

void printBB(const bb_t& bb);
void init_eval_masks();



#endif // BITBOARD_H_
