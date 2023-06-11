#ifndef BITBOARD_H_
#define BITBOARD_H_

#include <cstdint>
#include <iostream>
#include "Square.h"

#define SETBIT(bb, sq) ((bb) |=  (1UL << (sq)))
#define CLRBIT(bb, sq) ((bb) &= ~(1UL << (sq)))
#define CLRLSB(bb) ((bb) &= (bb - 1))
#define CNT(bb) (__builtin_popcountll(bb))
#define POP(bb) (bitScanForward(bb))

// bitboard type
typedef uint64_t bb_t;

// Useful bitmasks
extern bb_t fileBBMask[8];
extern bb_t rankBBMask[8];

// Passing pawn masks
extern bb_t wPassedMask[64];
extern bb_t bPassedMask[64];

// Isolated pawn masks
extern bb_t isolatedMask[64];

extern int bitScanForward(bb_t bb);

void printBB(const bb_t& bb);
void initEvalMasks();

#endif // BITBOARD_H_
