#include "Bitboard.h"

// Useful bitmasks
bb_t fileBBMask[8];
bb_t rankBBMask[8];

// Passing pawn masks (for both sides and for each square)
bb_t wPassedMask[64];
bb_t bPassedMask[64];

// Isolated pawn mask
bb_t isolatedMask[64];

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
        wPassedMask[sq] = 0;
        bPassedMask[sq] = 0;
        isolatedMask[sq] = 0;
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
