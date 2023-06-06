#include "Move.h"
#include "Square.h"
#include <iostream>

/* Each move is represented as 16 bits:
 * 4 bits for flags
 * 6 bits for the source square
 * 6 bits for the destination square
 0b  0000  000000  000000
     flag  from    to
*/

std::string toString(move_t m) {
    square_t from = getFrom(m);
    square_t to = getTo(m);

    std::string s;
    s.push_back('a' + (from & 0b111));          // from File
    s.push_back('1' + (char) SquareRank(from)); // from Rank
    s.push_back('a' + (to & 0b111));            // to File
    s.push_back('1' + (char) SquareRank(to));   // to Rank

    // Handle promotions
    int flags = getFlags(m);
    if (isPromotion(m)) {
        // clear the capture bit
        switch (flags & ~Capture) {
            case KnightPromo:
                s.push_back('n'); break;
            case BishopPromo:
                s.push_back('b'); break;
            case RookPromo:
                s.push_back('r'); break;
            default: /* + Queen case */
                s.push_back('q'); break;
        }
    }
    return s;
}

move_t fromString(std::string s) {
    if (s.length() == 4) {
        int fromRank = s[1] - '1';
        int fromFile = s[0] - 'a';
        int toRank = s[3] - '1';
        int toFile = s[2] - 'a';

        if (fromRank >= 0 && fromRank <= 7 && fromFile >= 0 && fromFile <= 7 &&
            toRank >= 0 && toRank <= 7 && toFile >= 0 && toFile <= 7) {
            square_t from = fromRank * 8 + fromFile;
            square_t to = toRank * 8 + toFile;
            return Move(from, to, 0);
        } else {
            // Invalid square coordinates, set move to zero
            std::cerr << "Invalid move specified!\n";
            return NULLMV;
        }
    } else {
        // Invalid move string length, set move to zero
        std::cerr << "Invalid move specified!\n";
        return NULLMV;
    }


}
