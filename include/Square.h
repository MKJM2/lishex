#ifndef SQUARE_H_
#define SQUARE_H_

#include <string>
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

// Invalid square / unset square
const square_t NO_SQ = -1;

// Rank of the square from the perspective of player p
inline int SquareRank(square_t s, int p = Piece::White) {
    return (s >> 3) ^ (p == Piece::White ? 0 : 0b111); // div by 8
}

inline int SquareFile(square_t s) {
  return s & 7;
}

// Chebyshev distance (https://en.wikipedia.org/wiki/Chebyshev_distance)
inline int distance(square_t a, square_t b) {
    int xa = a >> 3;
    int ya = a - (xa << 3);
    int xb = b >> 3;
    int yb = b - (xb << 3);
    // max(|x_a - x_b|, |y_a - y_b|)
    return std::max(std::abs(xa - xb), std::abs(ya - yb));
}

inline bool IsOK(square_t s) {
     // check for presense of highset 6 bits
     return (s >= -1) && (s & ~0x3F) == 0;
}

inline bool isPromote(square_t s) {
    int rank = SquareRank(s);
    return IsOK(s) && (rank == 0 || rank == 8);
}


inline std::string toString(square_t s) {
    std::string str;
    str.push_back('a' + (s & 0b111));          // file
    str.push_back('1' + (char) SquareRank(s)); // rank
    return str;
}

/*  Directions

   NW  |  N  |  NE
--------------------
   W   |  *  |   E
--------------------
   SW  |  S  |  SE
*/

// Directions:
// N  : North
// NE : Northeast
// E  : East
// SE : Southeast
// S  : South
// SW : Southwest
// W  : West
// NW : Northwest

#define N  (8)
#define NE (9)
#define E  (1)
#define SE (-7)
#define S  (-8)
#define SW (-9)
#define W  (-1)
#define NW (7)

// possible destinations for 0) Black 1) White pieces
const square_t pawnDest[8] = {S, N, 0, 0, 0, 0, 0, 0};
const square_t knightDest[8] = {SW + W, SW + S, SE + S, SE + E,
                                NE + E, NE + N, NW + N, NW + W};
const square_t rookDest[8] = {N, E, S, W, 0, 0, 0, 0};
const square_t bishopDest[8] = {NE, SE, SW, NW, 0, 0, 0, 0};
const square_t queenDest[8] = {N, NE, E, SE, S, SW, W, NW};
const square_t kingDest[8] = {N, NE, E, SE, S, SW, W, NW};

// Number of destinations for each piece type (for quick lookup)
const int numDest[24] = {
    0, // None
    8, // King (never actually captured)
    2, // Pawn
    8, // Knight
    0, // -
    4, // Bishop
    4, // Rook
    8, // Queen
    0,
    8, // White King
    2, // White Pawn
    8, // White Knight
    0, // -
    4, // White Bishop
    4, // White Rook
    8, // White Queen
    0,
    8, // Black King
    2, // Black Pawn
    8, // Black Knight
    0, // -
    4, // Black Bishop
    4, // Black Rook
    8, // Black Queen
};

inline const square_t pieceDest[24][8] = {
    {},                         // None
    {},                   // King (never actually captured)
    {},                   // Pawn
    {},                 // Knight
    {},                         // -
    {},                 // Bishop
    {},                   // Rook
    {},                  // Queen
    {},
    {N, NE, E, SE, S, SW, W, NW}, // White King
    {S, N, 0, 0, 0, 0, 0, 0},    // White Pawn
    {SW + W, SW + S, SE + S, SE + E, NE + E, NE + N, NW + N, NW + W}, // White Knight
    {},                         // -
    {NE, SE, SW, NW, 0, 0, 0, 0}, // White Bishop
    {N, E, S, W, 0, 0, 0, 0},     // White Rook
    {N, NE, E, SE, S, SW, W, NW}, // White Queen
    {},
    {N, NE, E, SE, S, SW, W, NW}, // Black King
    {S, N, 0, 0, 0, 0, 0, 0},     // Black Pawn
    {SW + W, SW + S, SE + S, SE + E, NE + E, NE + N, NW + N, NW + W}, // Black Knight
    {},                         // -
    {NE, SE, SW, NW, 0, 0, 0, 0}, // Black Bishop
    {N, E, S, W, 0, 0, 0, 0},     // Black Rook
    {N, NE, E, SE, S, SW, W, NW}  // Black Queen
};
// Castle permissions handling
// CastlePerm[from] determines how to change castle permissions
// for a given (from, to) move
// Here: 15 = 0b1111 = WKCastle | WQCastle | BKCastle | BQCastle
const int castlePermDelta[64] = {
    13, 15, 15, 15, 12, 15, 15, 14, 15, 15, 15, 15, 15, 15, 15, 15,
    15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
    15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
    15, 15, 15, 15, 15, 15, 15, 15, 7,  15, 15, 15, 3,  15, 15, 11};

#endif // SQUARE_H_
