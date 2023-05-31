#include "Move.h"
#include "Square.h"
#include <iostream>

/* Each move is represented as 16 bits:
 * 4 bits for flags
 * 6 bits for the destination square
 * 6 bits for the source square
 0b  0000  000000  000000
     flag  from    to
*/


// Null move constructor
Move::Move () {};
Move::Move (square_t from, square_t to, int flags) {
    move = ((flags & 0xf) << 12) | ((from & 0x3f) << 6) | (to & 0x3f);
}

Move::Move (square_t from, square_t to) {
    move = ((from & 0x3f) << 6) | (to & 0x3f);
}

Move::Move(const Move& other) {
    move = other.move;
}

Move& Move::operator=(const Move& other) {
    move = other.move;
    return *this;
}

// We use "XmYn" for the move string:
// X is the starting row, m starting column, and analogously for Y and n
Move::Move (const std::string& s) {
    if (s.length() == 4) {
        int fromRank = s[1] - '1';
        int fromFile = s[0] - 'a';
        int toRank = s[3] - '1';
        int toFile = s[2] - 'a';

        if (fromRank >= 0 && fromRank <= 7 && fromFile >= 0 && fromFile <= 7 &&
            toRank >= 0 && toRank <= 7 && toFile >= 0 && toFile <= 7) {
            square_t from = fromRank * 8 + fromFile;
            square_t to = toRank * 8 + toFile;
            move = ((from & 0x3f) << 6) | (to & 0x3f);
        } else {
            // Invalid square coordinates, set move to zero
            move = 0;
            std::cerr << "Invalid move specified!\n";
        }
    } else {
        // Invalid move string length, set move to zero
        move = 0;
        std::cerr << "Invalid move specified!\n";
    }
}

unsigned short Move::getTo() const {
    return move & 0x3f;
}

unsigned short Move::getFrom() const {
    return (move >> 6) & 0x3f;
}

unsigned short Move::getFlags() const {
    return (move >> 12) & 0xf;
}

bool Move::isCapture() const {
    return (move >> 12) == (unsigned short) Capture ||
           (move >> 12) == (unsigned short) EpCapture;
}

void Move::setTo(unsigned int to) {
    // Zero out the last 6 bits
    move &= ~0x3f;
    // Set the last 6 bits to the last 6 bits of 'to'
    move |= to & 0x3f;
}

void Move::setFrom(unsigned int from) {
    // Zero out the next 6 bits
    move &= ~0xfc0;
    // Set those bits to the corresponding bits in from
    move |= from & 0xfc0;
}

void Move::setFlags(unsigned int flags) {
    // Zero out the first 4 bits
    move &= ~0xf000;
    // Set those bits to the corresponding bits in flags
    move |= (flags << 12) & 0xf000;
}

std::string Move::toString() {
    square_t from = getFrom();
    square_t to = getTo();

    std::string s;
    s.push_back('a' + (from & 0b111));          // from File
    s.push_back('1' + (char) SquareRank(from)); // from Rank
    s.push_back('a' + (to & 0b111));            // to File
    s.push_back('1' + (char) SquareRank(to));   // to Rank

    // Handle promotions
    int flags = getFlags();
    if (flags == KnightPromo) s.push_back('n');
    if (flags == BishopPromo) s.push_back('b');
    if (flags == RookPromo) s.push_back('r');
    if (flags == QueenPromo) s.push_back('q');

    return s;
}

void Move::operator=(Move& other) {move = other.move;}
bool Move::operator==(Move a) const {return (move & 0xffff) == (a.move & 0xffff);}
bool Move::operator!=(Move a) const {return (move & 0xffff) != (a.move & 0xffff);}

unsigned short Move::asShort() const {return (unsigned short) move;}
