#ifndef MOVE_H_
#define MOVE_H_

#include <string>
#include "Square.h"

/* Inspired by
** https://www.chessprogramming.org/Encoding_Moves

 0b  0000  000000  000000
     flag  from    to
*/
/* Each move is represented as 16 bits:
 * 4 bits for flags
 * 6 bits for the source square
 * 6 bits for the destination square
 0b  0000  000000  000000
     flag  from    to
*/

// Types of moves (flags)
enum {
    Quiet          = 0b0000,
    DoublePawnPush = 0b0001,
    KingCastle     = 0b0010,
    QueenCastle    = 0b0011,
    Capture        = 0b0100,
    EpCapture      = 0b0101,
    KnightPromo    = 0b1000,
    BishopPromo    = 0b1001,
    RookPromo      = 0b1010,
    QueenPromo     = 0b1011
};

typedef unsigned short move_t;

// Scored move
typedef struct {
    move_t m;
    unsigned short score;
} move_scored;

// Constructor
#define Move(from, to, flags) ((((flags) & 0xf) << 12) | (((from) & 0x3f) << 6) | ((to) & 0x3f))

#define NULLMV ((move_t) 0)

#define getTo(move) ((move) & 0x3f)

#define getFrom(move) (((move) >> 6) & 0x3f)

#define getFlags(move) (((move) >> 12) & 0xf)

#define isCapture(move) (((move) >> 12) == (unsigned short) Capture || ((move) >> 12) == (unsigned short) EpCapture)

#define isPromotion(move) (((move) >> 12) & 0b1000)

std::string toString(move_t m);
move_t fromString(std::string s);

#endif // MOVE_H_
