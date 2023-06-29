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
#define CNT(bb) (__builtin_popcountll(bb))
#define GETLSB(bb) (bit_scan_forward(bb))
#define POPLSB(bb) (bit_drop_forward(bb))

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
const bb_t NOT_AFILE = 0xfefefefefefefefe; // ~FILEA_BB
const bb_t NOT_HFILE = 0x7f7f7f7f7f7f7f7f; // ~FILEH_BB
const bb_t NOT_RANK7 = 0xff00ffffffffffff; // ~0x00ff000000000000
const bb_t NOT_RANK2 = 0xffffffffffff00ff; // ~0x000000000000ff00
const bb_t BORDER_SQ = 0xff818181818181ff; // squares on the border of the board


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

extern square_t bit_scan_forward(bb_t bb);
extern square_t bit_drop_forward(bb_t &bb);

inline bb_t NOT_PROMOTING(int side) {
    return (side ? NOT_RANK7 : NOT_RANK2);
}

// Returns a bitboard of a mask covering rank 'r' (for the player 'side')
inline bb_t RANK_TO_BB(int r, int side = WHITE) {
    return rankBBMask[side ? (r - 1) : 7 - r];
}

void printBB(const bb_t& bb);
void init_eval_masks();



#endif // BITBOARD_H_
