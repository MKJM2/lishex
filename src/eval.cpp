/* Evaluation */
#include "eval.h"

/* Piece values */

/*
constexpr int value_mg[PIECE_NO] = {0, 100, 325, 330, 550, 1000, 50000,
                              0, 0, 100, 325, 330, 550, 1000, 50000};
constexpr int value_eg[PIECE_NO] = {0, 125, 300, 300, 600, 950, 50000,
                              0, 0, 125, 300, 300, 600, 950, 50000};
*/

/* PESTO's piece values */
constexpr int value_mg[PIECE_NO] = {0, 82, 337, 365, 477, 1025, 50000,
                              0, 0, 82, 337, 365, 477, 1025, 50000};
constexpr int value_eg[PIECE_NO] = {0, 94, 281, 297, 512, 936, 50000,
                              0, 0, 94, 281, 297, 512, 936, 50000};

namespace {

/* Piece-square tables */
/*
// We use midgame and endgame tables between which we interpolate
constexpr int pawn_table_mg[] = {
     0,   0,   0,   0,   0,   0,   0,   0,
    10,  10,   0, -10, -10,   0,  10,  10,
     5,   0,   0,   5,   5,   0,   0,   5,
     0,   0,  10,  20,  20,  10,   0,   0,
     5,   5,   5,  10,  10,   5,   5,   5,
    10,  10,  10,  20,  20,  10,  10,  10,
    20,  20,  20,  30,  30,  20,  20,  20,
     0,   0,   0,   0,   0,   0,   0,   0
};

constexpr int pawn_table_eg[] = {
     0,   0,   0,   0,   0,   0,   0,   0,
     8,   8,   5,   4,   4,   5,   8,   8,
    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
     2,   0,   0,  -1,  -1,  10,   0,   2,
    25,  10,   5,   5,   5,   5,  10,  25,
    55,  50,  50,  45,  45,  50,  50,  55,
   125, 120, 120, 110, 110, 120, 120, 125,
     0,   0,   0,   0,   0,   0,   0,   0
};

constexpr int knight_table_mg[] = {
    -5, -10,   0,   0,   0,   0, -10,  -5,
     0,   0,   0,   5,   5,   0,   0,   0,
     0,   0,  10,  10,  10,  10,   0,   0,
     0,   0,  10,  20,  20,  10,   5,   0,
     5,  10,  15,  20,  20,  15,  10,   5,
     5,  10,  10,  20,  20,  10,  10,   5,
     0,   0,   5,  10,  10,   5,   0,   0,
    -5,   0,   0,   0,   0,   0,   0,  -5
};

constexpr int knight_table_eg[] = {
     -35, -10,  -5,  -5,  -5,  -5, -10,  -35,
     -10,   0,   5,  10,  10,   5,   0,  -10,
     -10,  10,  10,  10,  10,  10,  10,  -10,
     -10,  10,  10,  20,  20,  10,  10,  -10,
     -10,  10,  15,  20,  20,  15,  10,  -10,
     -10,  10,  10,  20,  20,  10,  10,  -10,
     -10,   0,   5,  10,  10,   5,   0,  -10,
     -35, -10,  -5,  -5,  -5,  -5, -10,  -35,
};

constexpr int bishop_table_mg[] = {
     0,   0, -10,   0,   0, -10,   0,   0,
     0,   0,   0,  10,  10,   0,   0,   0,
     0,   0,  10,  15,  15,  10,   0,   0,
     0,  10,  15,  20,  20,  15,  10,   0,
     0,  10,  15,  20,  20,  15,  10,   0,
     0,   0,  10,  15,  15,  10,   0,   0,
     0,   0,   0,  10,  10,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0
};

constexpr int bishop_table_eg[] = {
   -20, -10, -10,   0,   0, -10, -10, -20,
     0,   0,   0,  10,  10,   0,   0,   0,
     0,   0,  10,  15,  15,  10,   0,   0,
     0,  10,  15,  20,  20,  15,  10,   0,
     0,  10,  15,  20,  20,  15,  10,   0,
     0,   0,  10,  15,  15,  10,   0,   0,
     0,   0,   0,  10,  10,   0,   0,   0,
   -20, -10, -10,   0,   0, -10, -10, -20,
};

constexpr int rook_table_mg[] = {
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
    25,  25,  25,  25,  25,  25,  25,  25,
     0,   0,   5,  10,  10,   5,   0,   0
};

constexpr int rook_table_eg[] = {
     0,   0,   1,   5,   5,   1,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
     5,   8,  10,  10,  10,  10,  15,  15,
    10,  10,  12,  14,  16,  20,  17,  20
}; // We encourage the rook to pursue last-rank mates

// @TODO: tune
constexpr int queen_table_mg[] = {
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
};

constexpr int queen_table_eg[] = {
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0,
};

constexpr int king_table_mg[] = {
     0,   5,   5, -10, -10,   0,  10,   5,
   -30, -30, -30, -30, -30, -30, -30, -30,
   -50, -50, -50, -50, -50, -50, -50, -50,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70
};

constexpr int king_table_eg[] = {
   -50, -10,   0,   0,   0,   0, -10, -50,
   -10,   0,  10,  10,  10,  10,   0, -10,
     0,  10,  20,  20,  20,  20,  10,   0,
     0,  10,  20,  40,  40,  20,  10,   0,
     0,  10,  20,  40,  40,  20,  10,   0,
     0,  10,  20,  20,  20,  20,  10,   0,
   -10,   0,  10,  10,  10,  10,   0, -10,
   -50, -10,   0,   0,   0,   0, -10, -50
};
*/

/* Flipped PESTO's PSQTs
 * see: https://www.chessprogramming.org/PeSTO%27s_Evaluation_Function
 * */

int pawn_table_mg[SQUARE_NO] = {
     0,   0,   0,   0,   0,   0,   0,   0,
   -35,  -1, -20, -23, -15,  24,  38, -22,
   -26,  -4,  -4, -10,   3,   3,  33, -12,
   -27,  -2,  -5,  12,  17,   6,  10, -25,
   -14,  13,   6,  21,  23,  12,  17, -23,
    -6,   7,  26,  31,  65,  56,  25, -20,
    98, 134,  61,  95,  68, 126,  34, -11,
     0,   0,   0,   0,   0,   0,   0,   0,
};

int pawn_table_eg[SQUARE_NO] = {
      0,   0,   0,   0,   0,   0,   0,   0,
      0,   0,   0,   0,   0,   0,   0,   0,
     13,   8,   8,  10,  13,   0,   2,  -7,
      4,   7,  -6,   1,   0,  -5,  -1,  -8,
     13,   9,  -3,  -7,  -7,  -8,   3,  -1,
     32,  24,  13,   5,  -2,   4,  17,  17,
     94, 100,  85,  67,  56,  53,  82,  84,
    178, 173, 158, 134, 147, 132, 165, 187,
};

int knight_table_mg[SQUARE_NO] = {
    -105, -21, -58, -33, -17,  -28, -19, -23, -29, -53, -12, -3,  -1,
    18,   -14, -19, -23, -9,   12,  10,  19,  17,  25,  -16, -13, 4,
    16,   13,  28,  19,  21,   -8,  -9,  17,  19,  53,  37,  69,  18,
    22,   -47, 60,  37,  65,   84,  129, 73,  44,  -73, -41, 72,  36,
    23,   62,  7,   -17, -167, -89, -34, -49, 61,  -97, -15, -107
};

int knight_table_eg[SQUARE_NO] = {
    -29, -51, -23, -15, -22, -18, -50, -64, -42, -20, -10, -5,  -2,
    -20, -23, -44, -23, -3,  -1,  15,  10,  -3,  -20, -22, -18, -6,
    16,  25,  16,  17,  4,   -18, -17, 3,   22,  22,  22,  11,  8,
    -18, -24, -20, 10,  9,   -1,  -9,  -19, -41, -25, -8,  -25, -2,
    -9,  -25, -24, -52, -58, -38, -13, -28, -31, -27, -63, -99
};

int bishop_table_mg[SQUARE_NO]{
    -33, -3, -14, -21, -13, -12, -39, -21, 4,   15, 16,  0,   7,   21,  33, 1,
    0,   15, 15,  15,  14,  27,  18,  10,  -6,  13, 13,  26,  34,  12,  10, 4,
    -4,  5,  19,  50,  37,  37,  7,   -2,  -16, 37, 43,  40,  35,  50,  37, -2,
    -26, 16, -18, -13, 30,  59,  18,  -47, -29, 4,  -82, -37, -25, -42, 7,  -8
};

int bishop_table_eg[SQUARE_NO]{
    -23, -9, -23, -5,  -9, -16, -5, -17, -14, -18, -7,  -1, 4,  -9, -15, -27,
    -12, -3, 8,   10,  13, 3,   -7, -15, -6,  3,   13,  19, 7,  10, -3,  -9,
    -3,  9,  12,  9,   14, 10,  3,  2,   2,   -8,  0,   -1, -2, 6,  0,   4,
    -8,  -4, 7,   -12, -3, -13, -4, -14, -14, -21, -11, -8, -7, -9, -17, -24
};

int rook_table_mg[SQUARE_NO]{
    -19, -13, 1,   17,  16, 7,  -37, -26, -44, -16, -20, -9, -1, 11, -6, -71,
    -45, -25, -16, -17, 3,  0,  -5,  -33, -36, -26, -12, -1, 9,  -7, 6,  -23,
    -24, -11, 7,   26,  24, 35, -8,  -20, -5,  19,  26,  36, 17, 45, 61, 16,
    27,  32,  58,  62,  80, 67, 26,  44,  32,  42,  32,  51, 63, 9,  31, 43
};

int rook_table_eg[SQUARE_NO]{
    -9, 2,  3,  -1, -5, -13, 4,  -20, -6, -6, 0,  2,  -9, -9, -11, -3,
    -4, 0,  -5, -1, -7, -12, -8, -16, 3,  5,  8,  4,  -5, -6, -8,  -11,
    4,  3,  13, 1,  2,  1,   -1, 2,   7,  7,  7,  5,  4,  -3, -5,  -3,
    11, 13, 13, 11, -3, 3,   8,  3,   13, 10, 18, 15, 12, 12, 8,   5
};

int queen_table_mg[SQUARE_NO]{
    -1,  -18, -9,  10,  -15, -25, -31, -50, -35, -8,  11, 2,   8,  15, -3, 1,
    -14, 2,   -11, -2,  -5,  2,   14,  5,   -9,  -26, -9, -10, -2, -4, 3,  -3,
    -27, -27, -16, -16, -1,  17,  -2,  1,   -13, -17, 7,  8,   29, 56, 47, 57,
    -24, -39, -5,  1,   -16, 57,  28,  54,  -28, 0,   29, 12,  59, 44, 43, 45
};

int queen_table_eg[SQUARE_NO]{
    -33, -28, -22, -43, -5,  -32, -20, -41, -22, -23, -30, -16, -16,
    -23, -36, -32, -16, -27, 15,  6,   9,   17,  10,  5,   -18, 28,
    19,  47,  31,  34,  39,  23,  3,   22,  24,  45,  57,  40,  57,
    36,  -20, 6,   9,   49,  47,  35,  19,  9,   -17, 20,  32,  41,
    58,  25,  30,  0,   -9,  22,  22,  27,  27,  19,  10,  20
};

int king_table_mg[SQUARE_NO] = {
    -15, 36,  12,  -54, 8,   -28, 24,  14,  1,   7,   -8,  -64, -43,
    -16, 9,   8,   -14, -14, -22, -46, -44, -30, -15, -27, -49, -1,
    -27, -39, -46, -44, -33, -51, -17, -20, -12, -27, -30, -25, -14,
    -36, -9,  24,  2,   -16, -20, 6,   22,  -22, 29,  -1,  -20, -7,
    -8,  -4,  -38, -29, -65, 23,  16,  -15, -56, -34, 2,   13
};

int king_table_eg[SQUARE_NO] = {
    -53, -34, -21, -11, -28, -14, -24, -43, -27, -11, 4,  13,  14,
    4,   -5,  -17, -19, -3,  11,  21,  23,  16,  7,   -9, -18, -4,
    21,  24,  27,  23,  9,   -11, -8,  22,  24,  27,  26, 33,  26,
    3,   10,  17,  23,  15,  20,  45,  44,  13,  -12, 17, 14,  17,
    17,  38,  23,  11,  -74, -35, -18, -18, -11, 15,  4,  -17
};

// Array of pointers to arrays
constexpr const int *psqt_mg[] = {
    nullptr, // NO_PIECE
    pawn_table_mg,
    knight_table_mg,
    bishop_table_mg,
    rook_table_mg,
    queen_table_mg,
    king_table_mg,
    nullptr,
    nullptr,
    pawn_table_mg,
    knight_table_mg,
    bishop_table_mg,
    rook_table_mg,
    queen_table_mg,
    king_table_mg,
};

constexpr const int *psqt_eg[] = {
    nullptr, // NO_PIECE
    pawn_table_eg,
    knight_table_eg,
    bishop_table_eg,
    rook_table_eg,
    queen_table_eg,
    king_table_eg,
    nullptr,
    nullptr,
    pawn_table_eg,
    knight_table_eg,
    bishop_table_eg,
    rook_table_eg,
    queen_table_eg,
    king_table_eg,
};

// Tempo score (a small bonus for the side to move)
const int tempo_bonus = 5;
// Pass and isolated pawn
constexpr int isolated_pawn = -13;
// Doubled pawn penalty
constexpr int doubled_pawn = -8;
// Indexed by rank, i.e. the closer to promoting, the higher the bonus
constexpr int passed_pawn[RANK_NO] = {0, 5, 10, 20, 35, 60, 100, 200};
// Bonus for having two bishops on board
constexpr int bishop_pair = 30;
// Bonuses for rooks/queens on open/semi-open files
constexpr int rook_open_file = 10;
constexpr int rook_semiopen_file = 5;
constexpr int queen_open_file = 5;
constexpr int queen_semiopen_file = 3;


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


// Evaluates the position from the side's POV
int evaluate(const board_t *board, eval_t * eval) {
    assert(check(board));

    eval->middlegame = 0;
    eval->endgame = 0;
    eval->set_phase(board);
    int score = 0;

    if (!pawns(board) && material_draw(board)) {
        return 0;
    }

    square_t sq;

    /* Pawn structure */

    bb_t black_pawns = board->bitboards[p];
    bb_t white_pawns = board->bitboards[P];
    bb_t pawns = black_pawns | white_pawns;
    bb_t bb = white_pawns;

    // (White pawns)
    // Pawn values
    eval->middlegame += CNT(bb) * value_mg[P];
    eval->endgame    += CNT(bb) * value_eg[P];
    // Passed & isolated pawns
    while (bb) {
        // Get the square of a white pawn
        sq = POPLSB(bb);

        // PSQTs
        eval->middlegame += pawn_table_mg[sq];
        eval->endgame    += pawn_table_eg[sq];

        // Isolated pawns penalty
        if ((white_pawns & isolatedMask[sq]) == 0) {
            eval->middlegame += isolated_pawn;
            eval->endgame    += isolated_pawn;
        }

        // Pass pawns bonus  /* black pawns */
        if ((black_pawns & wPassedMask[sq]) == 0) {
            eval->middlegame += passed_pawn[SQUARE_RANK(sq)];
            eval->endgame    += passed_pawn[SQUARE_RANK(sq)];
        }

        // Doubled pawn penalty
        // - if there's a pawn immediatley behind this one && the pawn isn't
        //   supported
        bb_t tmp = SQ_TO_BB(sq);
        if ((s_shift(tmp) & white_pawns) &&
            ((se_shift(tmp) | sw_shift(tmp)) & white_pawns) == 0ULL) {
            eval->middlegame += doubled_pawn;
            eval->endgame    += doubled_pawn;
        }
    }

    // (Black pawns)
    // Pawn values
    bb = black_pawns;
    eval->middlegame -= CNT(bb) * value_mg[p];
    eval->endgame    -= CNT(bb) * value_eg[p];
    while (bb) {
        // Get the square of a black pawn
        sq = POPLSB(bb);

        // PSQTs
        eval->middlegame -= pawn_table_mg[mirror(sq)];
        eval->endgame    -= pawn_table_eg[mirror(sq)];

        // Isolated pawns
        if ((black_pawns & isolatedMask[sq]) == 0) {
            eval->middlegame -= isolated_pawn;
            eval->endgame    -= isolated_pawn;
        }

        // Pass pawns  /* white pawns */
        if ((white_pawns & bPassedMask[sq]) == 0) {
            eval->middlegame -= passed_pawn[SQUARE_RANK(mirror(sq))];
            eval->endgame    -= passed_pawn[SQUARE_RANK(mirror(sq))];
        }

        // Doubled pawn penalty
        // - if there's a pawn immediatley behind this one && the pawn isn't
        //   supported
        bb_t tmp = SQ_TO_BB(sq);
        if ((n_shift(tmp) & black_pawns) &&
            ((ne_shift(tmp) | nw_shift(tmp)) & black_pawns) == 0ULL) {
            eval->middlegame -= doubled_pawn;
            eval->endgame    -= doubled_pawn;
        }
    }

    /* Major pieces */

    // White

    // PSQTs + Material value
    bb  = board->sides_pieces[WHITE];
    bb ^= white_pawns;
    bb ^= board->bitboards[K];

    piece_t pce;
    while (bb) {
        sq = POPLSB(bb);
        pce = board->pieces[sq];
        eval->middlegame += value_mg[pce];
        eval->middlegame += psqt_mg[pce][sq];
        eval->endgame    += value_eg[pce];
        eval->endgame    += psqt_eg[pce][sq];
        // In addition to piece values and psqts, we reward pieces on open files
        switch (piece_type(pce)) {
            case QUEEN:
                // Is on open file?
                if (not (pawns & fileBBMask[SQUARE_FILE(sq)])) {
                    eval->middlegame += queen_open_file;
                    eval->endgame += queen_open_file;
                // Is on semi-open file?
                } else if (not (black_pawns & fileBBMask[SQUARE_FILE(sq)])) {
                    eval->middlegame += queen_semiopen_file;
                    eval->endgame += queen_semiopen_file;
                }
                break;
            case ROOK:
                // Is on open file?
                if (not (pawns & fileBBMask[SQUARE_FILE(sq)])) {
                    eval->middlegame += rook_open_file;
                    eval->endgame += rook_open_file;
                // Is on semi-open file?
                } else if (not (black_pawns & fileBBMask[SQUARE_FILE(sq)])) {
                    eval->middlegame += rook_semiopen_file;
                    eval->endgame += rook_semiopen_file;
                }
                break;
            default:
                break;
        }
    }

    // Black

    // PSQTs + Material value
    bb  = board->sides_pieces[BLACK];
    bb ^= black_pawns;
    bb ^= board->bitboards[k];

    while (bb) {
        sq = POPLSB(bb);
        pce = board->pieces[sq];
        eval->middlegame -= value_mg[pce];
        eval->middlegame -= psqt_mg[pce][mirror(sq)];
        eval->endgame    -= value_eg[pce];
        eval->endgame    -= psqt_eg[pce][mirror(sq)];
        // In addition to piece values and psqts, we reward pieces on open files
        switch (piece_type(pce)) {
            case QUEEN:
                // Is on open file?
                if (not (pawns & fileBBMask[SQUARE_FILE(mirror(sq))])) {
                    eval->middlegame -= queen_open_file;
                    eval->endgame -= queen_open_file;
                // Is on semi-open file?
                } else if (not (white_pawns & fileBBMask[SQUARE_FILE(mirror(sq))])) {
                    eval->middlegame -= queen_semiopen_file;
                    eval->endgame -= queen_semiopen_file;
                }
                break;
            case ROOK:
                // Is on open file?
                if (not (pawns & fileBBMask[SQUARE_FILE(mirror(sq))])) {
                    eval->middlegame -= rook_open_file;
                    eval->endgame -= rook_open_file;
                // Is on semi-open file?
                } else if (not (white_pawns & fileBBMask[SQUARE_FILE(mirror(sq))])) {
                    eval->middlegame -= rook_semiopen_file;
                    eval->endgame -= rook_semiopen_file;
                }
                break;
            default:
                break;
        }
    }

    /* Bishop pair bonus */

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
            eval->middlegame += bishop_pair;
            eval->endgame    += bishop_pair;
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
            eval->middlegame -= bishop_pair;
            eval->endgame    -= bishop_pair;
        }
    }

    // Tempo score (small bonus for the side to move)
    score += (board->turn == WHITE) ? tempo_bonus : -tempo_bonus;

    /* Tapered evaluation */
    score = eval->get_tapered_score();

    // We return the score relative to the side playing
    return board->turn ? score : -score;
}

void mirror_test(board_t *board) {
    eval_t eval[1];
    print(board);
    int ev1 = evaluate(board, eval);
    eval->print();

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
    int ev2 = evaluate(board, eval);
    eval->print();
    if (ev1 != ev2) {
        std::cout << "Test failed!" << std::endl;
        assert(ev1 == ev2);
    }

    assert(check(board));
}

// Inspired by https://www.chessprogramming.org/CPW-Engine_quiescence
int losing_capture(const board_t *board, move_t m, int threshold) {
    const piece_t& capturing = board->pieces[get_from(m)];
    const piece_t& captured = board->pieces[get_to(m)];
    // Capturing with a pawn can't immediately lose material
    // (TODO: What if the capture uncovers a pin?)
    if (piece_type(capturing) == PAWN) return 0;

    // A lower valued piece capturing a higher valued piece is good
    // by definition
    if (value_mg[capturing] < value_mg[captured]) return 0;

    // From Crafty: If opponent has only one piece left, we search this kind of
    // move since it can be the move that allows a passed pawn to promote
    if (CNT(board->sides_pieces[board->turn ^ 1] & ~pawns(board)) <= 2) return 0;

    // Finally, check if Static Exchange Evaluation deems the capture as losing
    return see(board, m) < threshold;
}
