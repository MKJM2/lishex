#include "Bitboard.h"

// Useful bitmasks
bb_t fileBBMask[8];
bb_t rankBBMask[8];

// Passing pawn masks (for both sides and for each square)
bb_t wPassedMask[64];
bb_t bPassedMask[64];

// Isolated pawn mask
bb_t isolatedMask[64];

// Taken from https://www.chessprogramming.org/BitScan
const int lsb_64_table[64] =
{
   63, 30,  3, 32, 59, 14, 11, 33,
   60, 24, 50,  9, 55, 19, 21, 34,
   61, 29,  2, 53, 51, 23, 41, 18,
   56, 28,  1, 43, 46, 27,  0, 35,
   62, 31, 58,  4,  5, 49, 54,  6,
   15, 52, 12, 40,  7, 42, 45, 16,
   25, 57, 48, 13, 10, 39,  8, 44,
   20, 47, 38, 22, 17, 37, 36, 26
};

/**
 * bitScanForward
 * @author Matt Taylor (2003)
 * @param bb bitboard to scan
 * @precondition bb != 0
 * @return index (0..63) of least significant one bit
 */
int bitScanForward(bb_t bb) {
   unsigned int folded;
   bb ^= bb - 1;
   folded = (int) bb ^ (bb >> 32);
   return lsb_64_table[folded * 0x78291ACF >> 26];
}


void printBB(const bb_t& bb) {
    square_t sq;
    for (int rank = 7; rank >= 0; --rank) {
        for (int file = 0; file < 8; ++file) {
            sq = rank * 8 + file;
            std::cout << ((bb & (1ULL << sq)) ? "1 " : "0 ");
        }
        std::cout << std::endl;
    }
}

void initEvalMasks() {
    int rank, file;
    square_t sq, to;

    // Initializer helper bitboard masks
	for(sq = 0; sq < 8; ++sq) {
        fileBBMask[sq] = 0ULL;
		rankBBMask[sq] = 0ULL;
	}

	for(rank = 7; rank >= 0; --rank) {
        for (file = 0; file < 8; ++file) {
            sq = rank * 8 + file;
            fileBBMask[file] |= (1ULL << sq);
            rankBBMask[rank] |= (1ULL << sq);
        }
	}

    // Passing pawn masks initialization
    for (sq = 0; sq < 64; ++sq) {
        wPassedMask[sq] = 0ULL;
        bPassedMask[sq] = 0ULL;
        isolatedMask[sq] = 0ULL;
    }

    for (sq = 0; sq < 64; ++sq) {
        to = sq + 8;
        while(to < 64) {
            wPassedMask[sq] |= (1ULL << to);
            to += 8;
        }

        to = sq - 8;
        while(to >= 0) {
            bPassedMask[sq] |= (1ULL << to);
            to -= 8;
        }

        if (SquareFile(sq) > 0) {
            isolatedMask[sq] |= fileBBMask[SquareFile(sq) - 1];

            to = sq + 7;
            while (to < 64) {
                wPassedMask[sq] |= (1ULL << to);
                to += 8;
            }

            to = sq - 9;
            while (to >= 0) {
                bPassedMask[sq] |= (1ULL << to);
                to -= 8;
            }
        }

        if (SquareFile(sq) < 7) {
            isolatedMask[sq] |= fileBBMask[SquareFile(sq) + 1];

            to = sq + 9;
            while (to < 64) {
                wPassedMask[sq] |= (1ULL << to);
                to += 8;
            }

            to = sq - 7;
            while (to >= 0) {
                bPassedMask[sq] |= (1ULL << to);
                to -= 8;
            }

        }
    }

    /* Debug:
    // print the 16 bitboards
    for (int i = 0; i < 8; ++i) {
        std::cout << "File " << (char)('a' + i) << ": \n";
        printBB(fileBBMask[i]);
    }

    for (int i = 0; i < 8; ++i) {
        std::cout << "Rank " << (i + 1) << ": \n";
        printBB(rankBBMask[i]);
    }
    */
}
