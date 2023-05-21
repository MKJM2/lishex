#include "Move.h"

/* Each move is represented as 16 bits:
 * 4 bits for flags
 * 6 bits for the destination square
 * 6 bits for the source square */
Move::Move (int from, int to, int flags) {
    move = ((flags & 0xf) << 12) | ((from & 0x3f) << 6) | (to & 0x3f);
}

Move::Move (int from, int to, move_t flags) {
    move = ((static_cast<int>(flags) & 0xf) << 12) | ((from & 0x3f) << 6) | (to & 0x3f);
}

Move::Move (int from, int to) {
    move = ((from & 0x3f) << 6) | (to & 0x3f);
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

move_t Move::getFlagAsEnum() const {
    unsigned short flag = getFlags();
    return static_cast<move_t>(flag);
}

bool Move::isCapture() const {
    return (move >> 12);
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

void Move::operator=(Move& other) {move = other.move;}
bool Move::operator==(Move a) const {return (move & 0xffff) == (a.move & 0xffff);}
bool Move::operator!=(Move a) const {return (move & 0xffff) != (a.move & 0xffff);}

unsigned short Move::asShort() const {return (unsigned short) move;}
