#ifndef TYPES_H_
#define TYPES_H_

#include <cstdint>
#include <algorithm>


/***********/
/* Squares */
/***********/

using square_t = int;

enum : square_t {
    NO_SQ = -1,
    A1, B1, C1, D1, E1, F1, G1, H1,
    A2, B2, C2, D2, E2, F2, G2, H2,
    A3, B3, C3, D3, E3, F3, G3, H3,
    A4, B4, C4, D4, E4, F4, G4, H4,
    A5, B5, C5, D5, E5, F5, G5, H5,
    A6, B6, C6, D6, E6, F6, G6, H6,
    A7, B7, C7, D7, E7, F7, G7, H7,
    A8, B8, C8, D8, E8, F8, G8, H8,
};

enum : int {
    A_FILE = 0, B_FILE, C_FILE, D_FILE, E_FILE, F_FILE, G_FILE, H_FILE = 7
};

enum : int {
    RANK_1 = 0, RANK_2, RANK_3, RANK_4, RANK_5, RANK_6, RANK_7, RANK_8 = 7
};

#define SQUARE_FILE(sq) ((sq) & 7)
#define SQUARE_RANK(sq) ((sq) >> 3)


/**********/
/* Pieces */
/**********/

using piece_t = int;

// Types
enum : piece_t {
  NONE, PAWN, KNIGHT, BISHOP, ROOK, QUEEN, KING
};

enum : piece_t {
  NO_PIECE, P = PAWN, N, B, R, Q, K, p = PAWN + 8, n, b, r, q, k, PIECE_NB = 12
};

// Colors
enum { WHITE, BLACK, BOTH };

// For printing
char pieceToAscii[] = " PNBRQKpnbrqk";
char pieceToUnicode[] = " ♙♘♗♖♕♔♟♞♝♜♛♚";


/*************/
/* Bitboards */
/*************/

using bb_t = uint64_t;

// Useful bitmasks for evaluation
extern bb_t fileBBMask[8];
extern bb_t rankBBMask[8];

// Passing pawn masks
extern bb_t wPassedMask[64];
extern bb_t bPassedMask[64];

// Isolated pawn masks
extern bb_t isolatedMask[64];

extern int bitScanForward(bb_t bb);

extern void printBB(const bb_t& bb);
extern void initEvalMasks();

#define SETBIT(bb, sq) ((bb) |=  (1ULL << (sq)))
#define CLRBIT(bb, sq) ((bb) &= ~(1ULL << (sq)))
#define CLRLSB(bb) ((bb) &= (bb - 1))
#define CNT(bb) (__builtin_popcountll(bb))
#define POP(bb) (bitScanForward(bb))


/************************/
/* Board representation */
/************************/

// We store a separate bitboard for each piece (type, color)
bb_t bitboards[PIECE_NB];



/*********/
/* Moves */
/*********/



/*****************/
/* Miscellaneous */
/*****************/

// Castling rights encoding (4 bits)
enum { WK = 1, WQ = 2, BK = 4, BQ = 8 };



#endif // TYPES_H_
