/* Evaluation */
#include "eval.h"

namespace {

/* Piece values */

constexpr int value_mg[PIECE_NO] = {0, 100, 325, 330, 550, 1000, 50000,
                              0, 0, 100, 325, 330, 550, 1000, 50000};
constexpr int value_eg[PIECE_NO] = {0, 125, 300, 300, 600, 950, 50000,
                              0, 0, 125, 300, 300, 600, 950, 50000};

/* Piece-square tables */

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
     0,   0,   5,   5,   5,   5,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
     0,   0,   5,   5,   5,   5,   0,   0,
    15,  15,  15,  15,  15,  15,  15,  15,
     0,   0,   5,  10,  10,   5,   0,   0
};

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
   -50, -10,   0,   0,   0,   0, -10, -50,
   -10,   0,  10,  10,  10,  10,   0, -10,
     0,  10,  20,  20,  20,  20,  10,   0,
     0,  10,  20,  40,  40,  20,  10,   0,
     0,  10,  20,  40,  40,  20,  10,   0,
     0,  10,  20,  20,  20,  20,  10,   0,
   -10,   0,  10,  10,  10,  10,   0, -10,
   -50, -10,   0,   0,   0,   0, -10, -50
};

constexpr int king_table_eg[] = {
     0,   5,   5, -10, -10,   0,  10,   5,
   -30, -30, -30, -30, -30, -30, -30, -30,
   -50, -50, -50, -50, -50, -50, -50, -50,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70
};

// Array of pointers to arrays
constexpr const int (*psqt_mg[])[64] = {
    nullptr, // NO_PIECE
    &pawn_table_mg,
    &knight_table_mg,
    &bishop_table_mg,
    &rook_table_mg,
    &queen_table_mg,
    &king_table_mg,
    nullptr,
    nullptr,
    &pawn_table_mg,
    &knight_table_mg,
    &bishop_table_mg,
    &rook_table_mg,
    &queen_table_mg,
    &king_table_mg,
};

constexpr const int (*psqt_eg[])[64] = {
    nullptr, // NO_PIECE
    &pawn_table_eg,
    &knight_table_eg,
    &bishop_table_eg,
    &rook_table_eg,
    &queen_table_eg,
    &king_table_eg,
    nullptr,
    nullptr,
    &pawn_table_eg,
    &knight_table_eg,
    &bishop_table_eg,
    &rook_table_eg,
    &queen_table_eg,
    &king_table_eg,
};


} // namespace

// Evaluates the position from the side's POV
int evaluate(const board_t *board, eval_t * eval) {
    assert(check(board));

    eval->middlegame = 0;
    eval->endgame = 0;
    eval->set_phase(board);
    int score = 0;

    square_t sq;
    bb_t b = 0ULL;
    for (const piece_t p : pieces) {
        b = board->bitboards[p];
        // Sign is +1 if White, -1 if Black, i.e. 2 * piece_color(p) == W - 1;
        while (b) {
            sq = POPLSB(b);
            if (piece_color(p) == WHITE) {
                // Piece values
                eval->middlegame += value_mg[p];
                eval->endgame += value_eg[p];
                // PSQTs
                // @TODO: Make the psqt access cleaner, perhaps templates?
                eval->middlegame += (*psqt_mg[p])[sq];
                eval->endgame += (*psqt_eg[p])[sq];
            } else {
                // Piece values
                eval->middlegame -= value_mg[p];
                eval->endgame -= value_eg[p];
                // Mirrored PSQTs
                eval->middlegame -= (*psqt_mg[p])[mirror(sq)];
                eval->endgame -= (*psqt_eg[p])[mirror(sq)];
            }
        }
    }

    score = eval->get_tapered_score();

    return board->turn ? score : -score;
}
