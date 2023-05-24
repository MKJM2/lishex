#ifndef SQUARE_H_
#define SQUARE_H_

#include "Piece.h"

typedef int square_t;

const square_t A8 = 56, B8 = 57, C8 = 58, D8 = 59, E8 = 60, F8 = 61, G8 = 62, H8 = 63;
const square_t A7 = 48, B7 = 49, C7 = 50, D7 = 51, E7 = 52, F7 = 53, G7 = 54, H7 = 55;
const square_t A6 = 40, B6 = 41, C6 = 42, D6 = 43, E6 = 44, F6 = 45, G6 = 46, H6 = 47;
const square_t A5 = 32, B5 = 33, C5 = 34, D5 = 35, E5 = 36, F5 = 37, G5 = 38, H5 = 39;
const square_t A4 = 24, B4 = 25, C4 = 26, D4 = 27, E4 = 28, F4 = 29, G4 = 30, H4 = 31;
const square_t A3 = 16, B3 = 17, C3 = 18, D3 = 19, E3 = 20, F3 = 21, G3 = 22, H3 = 23;
const square_t A2 =  8, B2 =  9, C2 = 10, D2 = 11, E2 = 12, F2 = 13, G2 = 14, H2 = 15;
const square_t A1 =  0, B1 =  1, C1 =  2, D1 =  3, E1 =  4, F1 =  5, G1 =  6, H1 =  7;

// Rank of the square from the perspective of player p
inline int SquareRank(square_t s, int p = Piece::White) {
    return (s >> 3) ^ (p == Piece::White ? 0 : 0b111); // div by 8
}

inline bool IsOK(square_t s) {
     // check for presense of highset 6 bits
     return (s & ~0x3F) == 0;
}

inline bool isPromote(square_t s) {
    int rank = SquareRank(s);
    return IsOK(s) && (rank == 0 || rank == 8);
}

// possible destinations for a) White, b) Black pawns
const square_t pawnDest[2] = {-8, +8};
const square_t knightDest[8] = {-17, -15, -10, -6, +6, +10, +15, +17};
const square_t rookDest[4] = {-8, -1, +1, +8};
const square_t bishopDest[4] = {-7, -9, +7, +9};
const square_t queenDest[8] = {-9, -8, -7, -1, +1, +7, +8, +9};


#endif // SQUARE_H_
