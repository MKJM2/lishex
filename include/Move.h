#ifndef MOVE_H_
#define MOVE_H_

#include <string>
#include "Square.h"
#include <cstdint>

/* Inspired by
 * https://www.chessprogramming.org/Encoding_Moves
 * Each move is represented as a 32 bit integer:
 *  4 bits for flags
 *  6 bits for the source square
 *  6 bits for the destination square
 * 16 bits for the score (move ordering)

   0b  0000000000000000 0000  000000  000000
       score            flag  from    to
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

typedef uint32_t move_t;

// Constructor
#define Move(from, to, flags, score) \
       ((((score) & 0xffff) << 16) | \
        (((flags) & 0xf)    << 12) | \
        (((from) & 0x3f)    <<  6) | \
        ((to) & 0x3f))

#define NULLMV ((move_t) 0U)

#define getTo(move) ((move) & 0x3f)

#define getFrom(move) (((move) >> 6) & 0x3f)

#define getFlags(move) (((move) >> 12) & 0xf)

#define getScore(move) (((move) >> 16) & 0xffff)

#define setScore(move, score) ((((move_t) score) & 0xffff) << 16 | ((move) & 65535))

//#define isCapture(move) (((move) >> 12) == Capture || ((move) >> 12) == EpCapture)
#define isCapture(move) (((move) >> 12) & 0b0100)

#define isPromotion(move) (((move) >> 12) & 0b1000)

/* Compares two moves ignoring their assigned scores */
//#define movecmp(m1, m2) (((m1) << 16) == ((m2) << 16))
#define movecmp(m1, m2) (((m1) & 65535) == ((m2) & 65535))

std::string toString(move_t m);
move_t fromString(std::string s);

#endif // MOVE_H_
