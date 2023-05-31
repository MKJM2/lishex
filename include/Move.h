#ifndef MOVE_H_
#define MOVE_H_

#include <string>

/* Inspired by
** https://www.chessprogramming.org/Encoding_Moves

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

class Move {
public:
    Move (); // null move constructor
    Move (int from, int to);
    Move (int from, int to, int flags);
    Move (const std::string& s);
    Move(const Move& other); // Copy constructor
    Move& operator=(const Move& other); // Assignment operator

    unsigned short getTo() const;
    unsigned short getFrom() const;
    unsigned short getFlags() const;
    bool isCapture() const;

    void setTo(unsigned int to);
    void setFrom(unsigned int from);
    void setFlags(unsigned int flags);

    std::string toString();

    void operator=(Move& other);
    bool operator==(Move a) const;
    bool operator!=(Move a) const;

    unsigned short asShort() const;
protected:
    unsigned short move;
};

#endif // MOVE_H_
