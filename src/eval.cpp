/*
 Lishex (codename 1F98A), a UCI chess engine built in C++
 Copyright (C) 2023 Michal Kurek

 Lishex is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Lishex is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/* Evaluation */
#include "eval.h"

/* Piece values */

/* PESTO's piece values */
score_t value[PIECETYPE_NO] = {
    {0, 0}, {82, 94},{337, 281}, {365, 297}, {477, 512}, {1025, 936}, {5000, 5000}
};

// REVIEW: 4th PMO Tuning iteration parameters
// Tempo score (a small bonus for the side to move)
score_t tempo = {6, 0};
// Pass and isolated pawn
score_t isolated_pawn = {-8, -8};
//// Doubled pawn penalty
score_t doubled_pawn = {-12, -12};
// REVIEW: Bonus for supported pawns
score_t pawn_supported = {3, 3};
// Bonus for pieces supported by pawns
score_t pawn_protected_bonus = {2, 2};
// Indexed by rank, i.e. the closer to promoting, the higher the bonus
score_t passed_pawn[RANK_NO] = {{0, 0}, {5, 5}, {10, 10}, {20,20}, {35,35}, {60,60}, {100,100}, {200,200}};

// REVIEW: Indexed by rank, bonus for good pawn structure
score_t pawn_bonuses[RANK_NO] = {{0, 0}, {0, 0}, {0, 0}, {5, 5}, {22,22}, {42,42}, {50,50}, {65, 65}};
// Bonus for having two bishops on board
score_t bishop_pair = {3, 53};
// Bonuses for rooks/queens on open/semi-open files
score_t rook_open_file = {11,11};
score_t rook_semiopen_file = {5,5};
score_t queen_open_file = {8,8};
score_t queen_semiopen_file = {2,2};
// Mobility weights depending on the piece type
score_t mobility_weights[PIECETYPE_NO] = {{0, 0}, {0, 0}, {2, 2}, {2, 2},
                                              {1, 1}, {1, 1}, {0, 0}};

/* King safety parameters */
score_t PAWN_SHIELD1_BONUS = {5, 0};
score_t PAWN_SHIELD2_BONUS = {4, 0};
score_t PAWN_STORM_PENALTY = {6, 0};

// Stronger pieces have a larger weight when attacking the enemy king
score_t KING_ATTACK_WEIGHT[PIECETYPE_NO] = {{0, 0}, {0, 0}, {1, 1}, {1, 1}, {2,2}, {4,4}, {0,0}};

// 49 is the max size of the king zone (refer to get_king_zone())
// We use the weighted number of attackers onto the king zone
// as an index into this array as a predictor
// of how dangerous the opponent's attack is
int KING_SAFETY_TABLE[50] = {
    0,   1,   2,   3,   5,   7,   9,   12,  15,  18,
    22,  26,  30,  35,  40,  45,  51,  57,  63,  70,
    77,  84,  92,  100, 108, 117, 126, 135, 145, 155,
    165, 176, 187, 198, 210, 222, 234, 247, 260, 273,
    287, 301, 315, 330, 345, 360, 376, 392, 408, 425
};

// REVIEW: These need to be tuned
score_t KING_PAWN_DIST_BONUS = {0, 9};
score_t SAFE_PAWN_ATTACK = {18, 18};
// Knight outpost bonuses
score_t KNIGHT_OUTPOS = {5, 2};

/* Piece-square tables */

/* Flipped PESTO's PSQTs
 * see: https://www.chessprogramming.org/PeSTO%27s_Evaluation_Function
 * */

// Tapered piece-square tables for middlegame and endgame
score_t pawn_psqt[SQUARE_NO] = {
    {0, 0},     {0, 0},   {0, 0},    {0, 0},    {0, 0},    {0, 0},    {0, 0},
    {0, 0},     {-35, 0}, {-1, 0},   {-20, 0},  {-23, 0},  {-15, 0},  {24, 0},
    {38, 0},    {-22, 0}, {-26, 13}, {-4, 8},   {-4, 8},   {-10, 10}, {3, 13},
    {3, 0},     {33, 2},  {-12, -7}, {-27, 4},  {-2, 7},   {-5, -6},  {12, 1},
    {17, 0},    {6, -5},  {10, -1},  {-25, -8}, {-14, 13}, {13, 9},   {6, -3},
    {21, -7},   {23, -7}, {12, -8},  {17, 3},   {-23, -1}, {-6, 32},  {7, 24},
    {26, 13},   {31, 5},  {65, -2},  {56, 4},   {25, 17},  {-20, 17}, {98, 94},
    {134, 100}, {61, 85}, {95, 67},  {68, 56},  {126, 53}, {34, 82},  {-11, 84},
    {0, 178},   {0, 173}, {0, 158},  {0, 134},  {0, 147},  {0, 132},  {0, 165},
    {0, 187}
};

score_t knight_psqt[SQUARE_NO] = {
    {-105, -29}, {-21, -51}, {-58, -23},  {-33, -15},  {-17, -22}, {-28, -18},
    {-19, -50},  {-23, -64}, {-29, -42},  {-53, -20},  {-12, -10}, {-3, -5},
    {-1, -2},    {18, -20},  {-14, -23},  {-19, -44},  {-23, -23}, {-9, -3},
    {12, -1},    {10, 15},   {19, 10},    {17, -3},    {25, -20},  {-16, -22},
    {-13, -18},  {4, -6},    {16, 16},    {13, 25},    {28, 16},   {19, 17},
    {21, 4},     {-8, -18},  {-9, -17},   {17, 3},     {19, 22},   {53, 22},
    {37, 22},    {69, 11},   {18, 8},     {22, -18},   {-47, -24}, {60, -20},
    {37, 10},    {65, 9},    {84, -1},    {129, -9},   {73, -19},  {44, -41},
    {-73, -25},  {-41, -8},  {72, -25},   {36, -2},    {23, -9},   {62, -25},
    {7, -24},    {-17, -52}, {-167, -58}, {-89, -38},  {-34, -13}, {-49, -28},
    {61, -31},   {-97, -27}, {-15, -63},  {-107, -99}
};

score_t bishop_psqt[SQUARE_NO] = {
    {-33, -23}, {-3, -9},   {-14, -23}, {-21, -5},  {-13, -9},  {-12, -16},
    {-39, -5},  {-21, -17}, {4, -14},   {15, -18},  {16, -7},   {0, -1},
    {7, 4},     {21, -9},   {33, -15},  {1, -27},   {0, -12},   {15, -3},
    {15, 8},    {15, 10},   {14, 13},   {27, 3},    {18, -7},   {10, -15},
    {-6, -6},   {13, 3},    {13, 13},   {26, 19},   {34, 7},    {12, 10},
    {10, -3},   {4, -9},    {-4, -3},   {5, 9},     {19, 12},   {50, 9},
    {37, 14},   {37, 10},   {7, 3},     {-2, 2},    {-16, 2},   {37, -8},
    {43, 0},    {40, -1},   {35, -2},   {50, 6},    {37, 0},    {-2, 4},
    {-26, -8},  {16, -4},   {-18, 7},   {-13, -12}, {30, -3},   {59, -13},
    {18, -4},   {-47, -14}, {-29, -14}, {4, -21},   {-82, -11}, {-37, -8},
    {-25, -7},  {-42, -9},  {7, -17},   {-8, -24}
};

score_t rook_psqt[SQUARE_NO] = {
    {-19, -9}, {-13, 2},   {1, 3},    {17, -1},  {16, -5},  {7, -13},
    {-37, 4},  {-26, -20}, {-44, -6}, {-16, -6}, {-20, 0},  {-9, 2},
    {-1, -9},  {11, -9},   {-6, -11}, {-71, -3}, {-45, -4}, {-25, 0},
    {-16, -5}, {-17, -1},  {3, -7},   {0, -12},  {-5, -8},  {-33, -16},
    {-36, 3},  {-26, 5},   {-12, 8},  {-1, 4},   {9, -5},   {-7, -6},
    {6, -8},   {-23, -11}, {-24, 4},  {-11, 3},  {7, 13},   {26, 1},
    {24, 2},   {35, 1},    {-8, -1},  {-20, 2},  {-5, 7},   {19, 7},
    {26, 7},   {36, 5},    {17, 4},   {45, -3},  {61, -5},  {16, -3},
    {27, 11},  {32, 13},   {58, 13},  {62, 11},  {80, -3},  {67, 3},
    {26, 8},   {44, 3},    {32, 13},  {42, 10},  {32, 18},  {51, 15},
    {63, 12},  {9, 12},    {31, 8},   {43, 5}
};

score_t queen_psqt[SQUARE_NO] = {
    {-1, -33},  {-18, -28}, {-9, -22},  {10, -43}, {-15, -5},  {-25, -32},
    {-31, -20}, {-50, -41}, {-35, -22}, {-8, -23}, {11, -30},  {2, -16},
    {8, -16},   {15, -23},  {-3, -36},  {1, -32},  {-14, -16}, {2, -27},
    {-11, 15},  {-2, 6},    {-5, 9},    {2, 17},   {14, 10},   {5, 5},
    {-9, -18},  {-26, 28},  {-9, 19},   {-10, 47}, {-2, 31},   {-4, 34},
    {3, 39},    {-3, 23},   {-27, 3},   {-27, 22}, {-16, 24},  {-16, 45},
    {-1, 57},   {17, 40},   {-2, 57},   {1, 36},   {-13, -20}, {-17, 6},
    {7, 9},     {8, 49},    {29, 47},   {56, 35},  {47, 19},   {57, 9},
    {-24, -17}, {-39, 20},  {-5, 32},   {1, 41},   {-16, 58},  {57, 25},
    {28, 30},   {54, 0},    {-28, -9},  {0, 22},   {29, 22},   {12, 27},
    {59, 27},   {44, 19},   {43, 10},   {45, 20},
};

score_t king_psqt[SQUARE_NO] = {
    {-15, -53}, {36, -34},  {12, -21},  {-54, -11}, {8, -28},   {-28, -14},
    {24, -24},  {14, -43},  {1, -27},   {7, -11},   {-8, 4},    {-64, 13},
    {-43, 14},  {-16, 4},   {9, -5},    {8, -17},   {-14, -19}, {-14, -3},
    {-22, 11},  {-46, 21},  {-44, 23},  {-30, 16},  {-15, 7},   {-27, -9},
    {-49, -18}, {-1, -4},   {-27, 21},  {-39, 24},  {-46, 27},  {-44, 23},
    {-33, 9},   {-51, -11}, {-17, -8},  {-20, 22},  {-12, 24},  {-27, 27},
    {-30, 26},  {-25, 33},  {-14, 26},  {-36, 3},   {-9, 10},   {24, 17},
    {2, 23},    {-16, 15},  {-20, 20},  {6, 45},    {22, 44},   {-22, 13},
    {29, -12},  {-1, 17},   {-20, 14},  {-7, 17},   {-8, 17},   {-4, 38},
    {-38, 23},  {-29, 11},  {-65, -74}, {23, -35},  {16, -18},  {-15, -18},
    {-56, -11}, {-34, 15},  {2, 4},     {13, -17}
};

// TOGA Log Manual inspired
score_t knight_outposts[SQUARE_NO] = {
     {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},
     {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},
     {0, 0}, {0, 0}, {3, 2}, {4, 3}, {4, 3}, {3, 2}, {0, 0}, {0, 0},
     {0, 0}, {2, 1}, {4, 2}, {8, 4}, {8, 4}, {4, 2}, {2, 1}, {0, 0},
     {0, 0}, {2, 1}, {4, 2}, {8, 4}, {8, 4}, {4, 2}, {2, 1}, {0, 0},
     {0, 0}, {0, 0}, {0, 1}, {0, 1}, {0, 1}, {0, 1}, {0, 0}, {0, 0},
     {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0},
     {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}
};

namespace {

  [[maybe_unused]] void evalprint(score_t s) {
    std::cout << s.mg << " " << s.eg << std::endl;
  }

  // Array of pointers to arrays
  constexpr const score_t *psqt[] = {
    nullptr, pawn_psqt, knight_psqt, bishop_psqt, rook_psqt, queen_psqt, king_psqt
  };

  /* Pawn structure helpers */

  // Friendly pawns on the same rank & adjacent files
  // for the pawn on square sq
  inline bool is_phalanx(const board_t *board, const square_t sq) {
    // To avoid color setting logic
    const piece_t &p = board->pieces[sq];
    bb_t tmp = SQ_TO_BB(sq);
    return (e_shift(tmp) | w_shift(tmp)) & board->bitboards[p];
}

// # of friendly pawns supporting the pawn on square sq
inline int is_supported(const board_t *board, const square_t sq) {
   const piece_t &pce = board->pieces[sq];
   bb_t tmp = SQ_TO_BB(sq);
   if (piece_color(pce) == WHITE) {
       return CNT((se_shift(tmp) | sw_shift(tmp)) & board->bitboards[pce]);
   } else {
       return CNT((ne_shift(tmp) | nw_shift(tmp)) & board->bitboards[pce]);
   }
}

// Whether the opponent has a sentry pawn blocking the passage
// of a pawn on square sq
inline bool is_opposed(const board_t *board, const square_t sq) {
    // TODO: Collapse implementation for white and black with flip_colour()
    const piece_t &pce = board->pieces[sq];
    if (piece_color(pce) == WHITE) {
       return (wPassedMask[sq] & fileBBMask[SQUARE_FILE(sq)]) &
              board->bitboards[p];
    } else {
        return (bPassedMask[sq] & fileBBMask[SQUARE_FILE(sq)]) &
              board->bitboards[P];
    }
}

// Whether the pawn on sq is connected to other friendly pawns, and if yes,
// a score. We award supported pawns more than phalanx pawns and
// discourage opposed pawns. We reward pawns pushed further more.
// Note that friendly pawns cannot be on RANK0 and cannot be
// supported by any other pawn on RANK1, hence the zeroes in the pawn_bonuses
// array
inline score_t pawn_struct_score(const board_t *board, const square_t sq) {
    const piece_t &p = board->pieces[sq];

    int supporting = is_supported(board, sq); // # of supporting pawns
    int phalanx = is_phalanx(board, sq);

    // If the pawn is disconnected from other friendly pawns on the board
    if (supporting + phalanx == 0)
        return 0;

    return pawn_supported * supporting +
            pawn_bonuses[SQUARE_RANK_FOR(piece_color(p), sq)] *
                (2 + phalanx - is_opposed(board, sq));
}

// We define the king danger zone as the squares to which the King
// can move within two moves
bb_t get_king_zone(const board_t *board, const int colour) {
    bb_t king_bb;
    king_bb = king_square_bb(board, colour);

    bb_t king_zone = king_bb;
    // Immediate neighbouring area:
    king_zone |= n_shift(king_bb);
    king_zone |= ne_shift(king_bb);
    king_zone |= e_shift(king_bb);
    king_zone |= se_shift(king_bb);
    king_zone |= s_shift(king_bb);
    king_zone |= sw_shift(king_bb);
    king_zone |= w_shift(king_bb);
    king_zone |= nw_shift(king_bb);

    // Area within 2 king moves:
    king_zone |= ne_shift(king_zone) | se_shift(king_zone) |
                 sw_shift(king_zone) | nw_shift(king_zone);
    return king_zone;
}

// King safety score for the 'colour' king during the middle game
// - pawn shield (king's file + 2 adjacent files)
// - pawn storm (opponent's pawn advances on the same 3 files)
// - piece attack score (number of attackers)
score_t king_safety_score(const board_t *board, const int colour, int attackers) {
    // TODO: Collapse implementation using templates

    /* Setup */
    score_t score = 0;
    // Bitboard masks for finding friendly shielding pawns
    bb_t pawns1 = 0ULL, pawns2 = 0ULL;
    // Bitboard mask for evaluating the enemy's pawn storm
    // bb_t storming_pawns = 0ULL;
    // King's friendly pawns bitboard
    bb_t king_pawns = pawns(board) & board->sides_pieces[colour];
    bb_t king_bb = king_square_bb(board, colour);

    /* Pawn shields: we score pawns immediately next to the king higher than
        pushed pawns */
    if (colour == WHITE) {
        pawns1 = ne_shift(king_bb) | n_shift(king_bb) | nw_shift(king_bb);
        pawns2 = n_shift(pawns1);

        //storming_pawns = board->bitboards[p] & wPassedMask[king_square(board, colour)];
    } else {
        pawns1 = se_shift(king_bb) | s_shift(king_bb) | sw_shift(king_bb);
        pawns2 = s_shift(pawns1);

        //storming_pawns = board->bitboards[P] & bPassedMask[king_square(board, colour)];
    }

    // Extract the shielding pawns from the current position
    pawns1 &= king_pawns;
    pawns2 &= king_pawns;

    // We score the pawns further away from the king less
    score += CNT(pawns1) * PAWN_SHIELD1_BONUS;
    score += CNT(pawns2) * PAWN_SHIELD2_BONUS;

    // King safety based on attackers
    attackers -= 2 * CNT(pawns1);
    attackers -= 1 * CNT(pawns2);
    score.mg -= KING_SAFETY_TABLE[MAX(0, MIN(attackers, 49))];

    // Enemy pawn storm: penalty for hostile pawns on king's files
    // - pawns closer to our king result in a higher penalty
    // - we only consider pawnes on ranks 4..7 (relati)
    // REVIEW: Seems to be losing elo?
    //while (storming_pawns) {
        //score -= ((3 * (SQUARE_RANK_FOR(colour, POPLSB(storming_pawns)) - 2) ) / 2) * PAWN_STORM_PENALTY;
    //}

    return score;
}


// Returns the minimum distance of 'colour' king to its pawns
[[maybe_unused]] int king_pawn_distance(const board_t *board, const int colour) {
    bb_t friendly_pawns = board->bitboards[set_colour(P, colour)];
    const square_t king_sq = king_square(board, colour);

    // The king can be at most 6 units away (Chebyshev distance)
    int min_distance = 6;
    while (friendly_pawns) {
        min_distance = MIN(min_distance, dist(king_sq, POPLSB(friendly_pawns)));
    }
    return min_distance;
}


// Originally from sjeng 11.2 (adapted from Vice 1.1)
int material_draw(const board_t *board) {
    assert(check(board));

    int qs = CNT(queens(board));
    int rs = CNT(rooks(board));
    int bs = CNT(bishops(board));
    int ns = CNT(knights(board));

    int white_rs = CNT(board->bitboards[R]);
    int black_rs = CNT(board->bitboards[r]);

    int white_bs = CNT(board->bitboards[B]);
    int black_bs = CNT(board->bitboards[b]);

    int white_ns = CNT(board->bitboards[N]);
    int black_ns = CNT(board->bitboards[n]);

    if (!rs && !qs) {
	  if (!bs) {
	      if (black_ns < 3 && white_ns < 3) {  return 1; }
	  } else if (!ns) {
	     if (abs(white_bs - black_bs) < 2) { return 1; }
	  } else if ((white_ns < 3 && !white_bs) || (white_bs == 1 && !white_ns)) {
	    if ((black_ns < 3 && !black_bs) || (black_bs == 1 && !black_ns)) { return 1; }
	  }
	} else if (!qs) {
        if (white_rs == 1 && black_rs == 1) {
            if ((white_ns + white_bs) < 2 && (black_ns + black_bs) < 2) { return 1; }
        } else if (white_rs == 1 && !black_rs) {
            if ((white_ns + white_bs == 0) && (((black_ns + black_bs) == 1) || ((black_ns + black_bs) == 2))) { return 1; }
        } else if (black_rs == 1 && !white_rs) {
            if ((black_ns + black_bs == 0) && (((white_ns + white_bs) == 1) || ((white_ns + white_bs) == 2))) { return 1; }
        }
    }
    return 0;
}

} // namespace

// TODO: Optimize
// Evaluates the position from the side's POV

int evaluate(const board_t *board) {
    assert(check(board));

    /* Setup */
    eval_t eval[1];                 // Evaluation data, useful for debugging etc
    score_t score = 0;              // Tapered score
    eval->set_phase(board);
    bb_t occupied = all_pieces(board);

    if (!pawns(board) && material_draw(board)) {
        return 0;
    }

    square_t sq;
    // During evaluation we incrementally build up the attack maps for both sides
    bb_t sides_attacks[BOTH] = {0ULL, 0ULL};

    /* Pawn structure */

    bb_t black_pawns = board->bitboards[p];
    bb_t white_pawns = board->bitboards[P];
    bb_t pawns = black_pawns | white_pawns;
    bb_t bb = white_pawns;

    /* Setup for pawn protected pieces */
    bb_t pawn_protected[BOTH] = {se_shift(black_pawns) | sw_shift(black_pawns),
                                 ne_shift(white_pawns) | nw_shift(white_pawns)};

    // (White pawns)
    // Pawn values
    score += CNT(bb) * value[PAWN];

    // Passed & isolated pawns
    while (bb) {
        // Get the square of a white pawn
        sq = POPLSB(bb);

        // PSQTs
        score += pawn_psqt[sq];

        // Isolated pawns penalty
        if ((white_pawns & isolatedMask[sq]) == 0) {
            score += isolated_pawn;
        }

        // Pass pawns bonus  /* black pawns */
        if ((black_pawns & wPassedMask[sq]) == 0) {
            score += passed_pawn[SQUARE_RANK(sq)];

            // In addition, in the endgame we encourage the king to protect the pawn
            score +=  KING_PAWN_DIST_BONUS*(6 - dist(sq, king_square(board, WHITE)));
            // ...we also give a bonus for how far away from the pawn the enemy king is
            score += -KING_PAWN_DIST_BONUS*(6 - dist(sq, king_square(board, BLACK)));
        }

        // Candidate pawns (defined the same was as in Toga)
        //-if is open
        //-if # of enemy pawns on same and neighboring files is <= than # of friendly pawns on the same files
        //-if # of attacking pawns is less or equal to the number of protecting pawns
        /*
        if ((fileBBMask[SQUARE_FILE(sq)] & black_pawns) == 0 &&
            CNT(wPassedMask[sq] & black_pawns) <= CNT(n_shift(bPassedMask[sq]) & white_pawns) &&
            CNT(pawn_protected[WHITE] & black_pawns) <= CNT(bPassedMask[sq] & rankBBMask[SQUARE_RANK(sq) - 1])) {
            eval->middlegame +=  5 + passed_pawn[SQUARE_RANK(sq)] / 10;
            eval->endgame    += 10 + passed_pawn[SQUARE_RANK(sq)] / 5;
        }
        */

        // Doubled pawn penalty
        // - if there's a pawn immediatley behind this one && the pawn isn't
        //   supported
        bb_t tmp = SQ_TO_BB(sq);
        if ((s_shift(tmp) & white_pawns) &&
            ((se_shift(tmp) | sw_shift(tmp)) & white_pawns) == 0ULL) {
            score += doubled_pawn;
        }

        // Whether the pawn is connected to friendly pawns
        // (supported || phalanx) + penalty for opposed pawns
        score_t connected_bonus = pawn_struct_score(board, sq);
        score += connected_bonus;
    }

    //evalprint(score);

    // (Black pawns)
    // Pawn values
    bb = black_pawns;
    score -= CNT(bb) * value[PAWN];
    while (bb) {
        // Get the square of a black pawn
        sq = POPLSB(bb);

        // PSQTs
        score -= pawn_psqt[mirror(sq)];

        // Isolated pawns
        if ((black_pawns & isolatedMask[sq]) == 0) {
            score -= isolated_pawn;
        }

        // Pass pawns  /* white pawns */
        if ((white_pawns & bPassedMask[sq]) == 0) {
            score -= passed_pawn[SQUARE_RANK(mirror(sq))];

            // In addition, in the endgame we encourage the king to protect the pawn
            score -=  KING_PAWN_DIST_BONUS*(6 - dist(sq, king_square(board, BLACK)));
            // ...we also give a bonus for how far away from the pawn the enemy king is
            score -= -KING_PAWN_DIST_BONUS*(6 - dist(sq, king_square(board, WHITE)));
        }

        // Candidate pawns (defined the same was as in Toga)
        //-if is open
        //-if # of enemy pawns on same and neighboring files is <= than # of friendly pawns on the same files
        //-if # of attacking pawns is less or equal to the number of protecting pawns
        /*
        if ((fileBBMask[SQUARE_FILE(sq)] & white_pawns) == 0 &&
            CNT(bPassedMask[sq] & white_pawns) <= CNT(s_shift(wPassedMask[sq]) & black_pawns) &&
            CNT(pawn_protected[BLACK] & white_pawns) <= CNT(wPassedMask[sq] & rankBBMask[SQUARE_RANK(sq) + 1])) {
            eval->middlegame -=  5 + passed_pawn[SQUARE_RANK_FOR(BLACK, sq)] / 10;
            eval->endgame    -= 10 + passed_pawn[SQUARE_RANK_FOR(BLACK, sq)] / 5;
        }
        */

        // Doubled pawn penalty
        // - if there's a pawn immediatley behind this one && the pawn isn't
        //   supported
        bb_t tmp = SQ_TO_BB(sq);
        if ((n_shift(tmp) & black_pawns) &&
            ((ne_shift(tmp) | nw_shift(tmp)) & black_pawns) == 0ULL) {
            score -= doubled_pawn;
        }

        // Whether the pawn is connected to friendly pawns
        // (supported || phalanx) + penalty for opposed pawns
        score_t connected_bonus = pawn_struct_score(board, sq);
        score -= connected_bonus;
    }

    //evalprint(score);

    /* Major pieces */

    // White

    /* Setup for king safety eval */
    // King zone of the king we're attacking
    bb_t king_zone = get_king_zone(board, BLACK);
    int king_attacks_score[BOTH] = {0, 0};

    bb  = board->sides_pieces[WHITE];
    bb ^= white_pawns;
    bb ^= board->bitboards[K];

    // We give a small bonus for each piece protected by a pawn
    score += CNT(bb & pawn_protected[WHITE]) * pawn_protected_bonus;

    // Include opponent's pawn attacks in their incrementally updated attack bitboard
    sides_attacks[BLACK] |= pawn_protected[BLACK];
    sides_attacks[WHITE] |= pawn_protected[WHITE];

    piece_t pce;
    bb_t attacks_bb;
    while (bb) {
        sq = POPLSB(bb);
        pce = board->pieces[sq];
        score += value[piece_type(pce)];
        score += psqt[piece_type(pce)][sq];
        // In addition to piece values and psqts, we reward pieces on open files
        switch (piece_type(pce)) {
            case QUEEN:
                // Is on open file?
                if (not (pawns & fileBBMask[SQUARE_FILE(sq)])) {
                    score += queen_open_file;
                // Is on semi-open file?
                } else if (not (black_pawns & fileBBMask[SQUARE_FILE(sq)])) {
                    score += queen_semiopen_file;
                }
                break;
            case ROOK:
                // Is on open file?
                if (not (pawns & fileBBMask[SQUARE_FILE(sq)])) {
                    score += rook_open_file;
                // Is on semi-open file?
                } else if (not (black_pawns & fileBBMask[SQUARE_FILE(sq)])) {
                    score += rook_semiopen_file;
                }
                break;
            default:
                break;
        }

        // Mobility and attacks on the enemy king
        attacks_bb = attacks(pce, sq, occupied);
        sides_attacks[WHITE] |= attacks_bb;

        king_attacks_score[BLACK] +=
            (KING_ATTACK_WEIGHT[piece_type(pce)] * CNT(king_zone & attacks_bb)).mg; // TODO: cleaner sol
        score += CNT(attacks_bb) * mobility_weights[piece_type(pce)];
    }

    //evalprint(score);

    // Black
    king_zone = get_king_zone(board, WHITE);

    // PSQTs + Material value
    bb  = board->sides_pieces[BLACK];
    bb ^= black_pawns;
    bb ^= board->bitboards[k];

    // We give a small bonus for each piece protected by a pawn
    score -= CNT(bb & pawn_protected[BLACK]) * pawn_protected_bonus;

    while (bb) {
        sq = POPLSB(bb);
        pce = board->pieces[sq];
        score -= value[piece_type(pce)];
        score -= psqt[piece_type(pce)][mirror(sq)];
        // In addition to piece values and psqts, we reward pieces on open files
        switch (piece_type(pce)) {
            case QUEEN:
                // Is on open file?
                if (not (pawns & fileBBMask[SQUARE_FILE(mirror(sq))])) {
                    score -= queen_open_file;
                // Is on semi-open file?
                } else if (not (white_pawns & fileBBMask[SQUARE_FILE(mirror(sq))])) {
                    score -= queen_semiopen_file;
                }
                break;
            case ROOK:
                // Is on open file?
                if (not (pawns & fileBBMask[SQUARE_FILE(mirror(sq))])) {
                    score -= rook_open_file;
                // Is on semi-open file?
                } else if (not (white_pawns & fileBBMask[SQUARE_FILE(mirror(sq))])) {
                    score -= rook_semiopen_file;
                }
                break;
            default:
                break;
        }

        // Mobility and attacks on the enemy king
        attacks_bb = attacks(pce, sq, occupied);
        sides_attacks[BLACK] |= attacks_bb;

        king_attacks_score[WHITE] +=
            (KING_ATTACK_WEIGHT[piece_type(pce)] * CNT(king_zone & attacks_bb)).mg; // TODO: cleaner sol

        score -= CNT(attacks_bb) * mobility_weights[piece_type(pce)];
    }

    //evalprint(score);

    /* Bishop pair bonus */
    // We make sure the bishops are of opposite colors

    // White
    bb = board->bitboards[B];
    int on_white = 0, on_black = 0;
    if (CNT(bb) >= 2) { // If two bishops on board
        while (bb) {
            if (is_white(POPLSB(bb))) {
                on_white += 1;
            } else {
                on_black += 1;
            }
        }
        if (on_white >= 1 && on_black >= 1) {
            score += bishop_pair;
        }
    }

    // Black
    bb = board->bitboards[b];
    on_white = on_black = 0;
    if (CNT(bb) >= 2) { // If two bishops on board
        while (bb) {
            if (is_white(POPLSB(bb))) {
                on_white += 1;
            } else {
                on_black += 1;
            }
        }
        if (on_white >= 1 && on_black >= 1) {
            score -= bishop_pair;
        }
    }


    // King safety
    score += king_safety_score(board, WHITE, king_attacks_score[WHITE]);
    score -= king_safety_score(board, BLACK, king_attacks_score[BLACK]);

    //evalprint(score);

    // We give a relatively large bonus for safe pawns threatening to capture an enemy piece
    bb_t safe_pawns[BOTH] = {sides_attacks[WHITE] & black_pawns, sides_attacks[BLACK] & white_pawns};
    //-- White
    score += SAFE_PAWN_ATTACK*CNT((ne_shift(safe_pawns[WHITE]) | nw_shift(safe_pawns[WHITE])) & (board->sides_pieces[BLACK] ^ black_pawns));
    //-- Black
    score -= SAFE_PAWN_ATTACK*CNT((se_shift(safe_pawns[BLACK]) | sw_shift(safe_pawns[BLACK])) & (board->sides_pieces[WHITE] ^ white_pawns));

    // Knight outposts:
    // - knight is protected by friendly pawn
    // - not attacked by enemy
    //-- White
    /* REVIEW: Seems to be loosing Elo */
    bb = board->bitboards[N] & ~sides_attacks[BLACK] & pawn_protected[WHITE];
    while (bb) {
        score += knight_outposts[POPLSB(bb)];
    }
    //-- Black
    bb = board->bitboards[n] & ~sides_attacks[WHITE] & pawn_protected[BLACK];
    while (bb) {
        score -= knight_outposts[mirror(POPLSB(bb))];
    }

    // Tempo score (small bonus for the side to move)
    score += board->turn ? tempo : -tempo;

    /* Tapered evaluation */
    eval->middlegame = score.mg;
    eval->endgame = score.eg;
    int tapered_eval = eval->get_tapered_score();

    // We return the score relative to the side playing
    return board->turn ? tapered_eval : -tapered_eval;
}

void mirror_test(board_t *board) {
    print(board);
    int ev1 = evaluate(board);

    // TODO: Mirror the board

    piece_t tmp_pieces[SQUARE_NO];
    int tmp_turn = board->turn ^ 1;
    int tmp_castle_rights = 0;
    square_t tmp_ep = NO_SQ;

    square_t sq;

    if (board->castle_rights & WK) tmp_castle_rights |= BK;
    if (board->castle_rights & WQ) tmp_castle_rights |= BQ;

    if (board->castle_rights & BK) tmp_castle_rights |= WK;
    if (board->castle_rights & BQ) tmp_castle_rights |= WQ;

    if (board->ep_square != NO_SQ) {
        tmp_ep = mirror(board->ep_square);
    }

    for (sq = A1; sq <= H8; ++sq) {
        tmp_pieces[sq] = board->pieces[mirror(sq)];
    }

    reset(board);

    for (sq = A1; sq <= H8; ++sq) {
        // flip color
        piece_t &pce = board->pieces[sq] = tmp_pieces[sq];
        if (piece_type(pce) != NONE) {
            pce ^= 0b1000; // flip the color bit
        }
        board->bitboards[pce] ^= SQ_TO_BB(sq);
    }

    for (piece_t p : pieces) {
        board->sides_pieces[piece_color(p)] |= board->bitboards[p];
    }

    board->turn = tmp_turn;
    board->castle_rights = tmp_castle_rights;
    board->ep_square = tmp_ep;
    board->key = generate_pos_key(board);

    assert(check(board));

    print(board);
    int ev2 = evaluate(board);
    if (ev1 != ev2) {
        std::cout << "Test failed!" << std::endl;
        assert(ev1 == ev2);
    }

    assert(check(board));
}

// Inspired by https://www.chessprogramming.org/CPW-Engine_quiescence
int losing_capture(const board_t *board, move_t m, int threshold) {
    const piece_t& capturing = piece_type(board->pieces[get_from(m)]);
    const piece_t& captured = piece_type(board->pieces[get_to(m)]);
    // Capturing with a pawn can't immediately lose material
    // (TODO: What if the capture uncovers a pin?)
    if (capturing == PAWN) return 0;

    // A lower valued piece capturing a higher valued piece is good
    // by definition
    if (value[capturing].mg < value[captured].mg) return 0;

    // From Crafty: If opponent has only one piece left, we search this kind of
    // move since it can be the move that allows a passed pawn to promote
    if (CNT(board->sides_pieces[board->turn ^ 1] & ~pawns(board)) <= 2) return 0;

    // Finally, check if Static Exchange Evaluation deems the capture as losing
    return see(board, m) < threshold;
}
