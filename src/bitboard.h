#ifndef BITBOARD_H_
#define BITBOARD_H_

#include "types.h" // using bb_t = uint64_t

#include <cstdint>
#include <iostream>

#define SETBIT(bb, sq) ((bb) |=  (1ULL << (sq)))
#define CLRBIT(bb, sq) ((bb) &= ~(1ULL << (sq)))
#define GETBIT(bb, sq) ((bb) & (1ULL << (sq)))
#define CLRLSB(bb) ((bb) &= (bb - 1))
#define CNT(bb) (__builtin_popcountll(bb))
#define POP(bb) (bitScanForward(bb))

// Useful bitmasks
extern bb_t fileBBMask[8];
extern bb_t rankBBMask[8];
const bb_t NOT_AFILE = 0xfefefefefefefefe; // ~0x0101010101010101
const bb_t NOT_HFILE = 0x7f7f7f7f7f7f7f7f; // ~0x8080808080808080
const bb_t NOT_RANK7 = 0xff00ffffffffffff; // ~0x00ff000000000000
const bb_t NOT_RANK2 = 0xffffffffffff00ff; // ~0x000000000000ff00

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

extern int bit_scan_forward(bb_t bb);

inline bb_t NOT_PROMOTING(int side) {
    return (side ? NOT_RANK7 : NOT_RANK2);
}

void printBB(const bb_t& bb);
void init_eval_masks();



#endif // BITBOARD_H_
