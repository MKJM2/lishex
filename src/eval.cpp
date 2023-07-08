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
//constexpr const int (*psqt_mg[])[64] = {
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

// Pass and isolated pawn
constexpr int isolated_pawn = -10;
// Indexed by rank, i.e. the closer to promoting, the higher the bonus
constexpr int passed_pawn[RANK_NO] = {0, 5, 10, 20, 35, 60, 100, 200};
// Bonus for having two bishops on board
constexpr int bishop_pair = 30;
// Bonuses for rooks/queens on open/semi-open files
constexpr int rook_open_file = 10;
constexpr int rook_semiopen_file = 5;
constexpr int queen_open_file = 5;
constexpr int queen_semiopen_file = 3;


} // namespace

// @TODO: Test on mirrored board

// Evaluates the position from the side's POV
int evaluate(const board_t *board, eval_t * eval) {
    assert(check(board));

    eval->middlegame = 0;
    eval->endgame = 0;
    eval->set_phase(board);
    int score = 0;

    square_t sq;

    /* Pawn structure */
    bb_t pawns = board->bitboards[P];
    bb_t b = pawns;
    // Pawn values
    eval->middlegame += CNT(pawns) * value_mg[P];
    eval->endgame    += CNT(pawns) * value_eg[P];
    // Passed & isolated pawns
    while (b) {
        // Get the square of a white pawn
        sq = POPLSB(b);

        // PSQTs
        eval->middlegame += pawn_table_mg[sq];
        eval->endgame    += pawn_table_eg[sq];

        // Isolated pawns
        if ((pawns & isolatedMask[sq]) == 0) {
            eval->middlegame += isolated_pawn;
            eval->endgame    += isolated_pawn;
        }

        // Pass pawns  /* black pawns */
        if ((board->bitboards[p] & wPassedMask[sq]) == 0) {
            eval->middlegame += passed_pawn[SQUARE_RANK(sq)];
            eval->endgame    += passed_pawn[SQUARE_RANK(sq)];
        }
    }

    // Pawn values
    b = pawns = board->bitboards[p];
    eval->middlegame -= CNT(pawns) * value_mg[p];
    eval->endgame    -= CNT(pawns) * value_eg[p];
    while (b) {
        // Get the square of a black pawn
        sq = POPLSB(b);

        // PSQTs
        eval->middlegame -= pawn_table_mg[mirror(sq)];
        eval->endgame    -= pawn_table_eg[mirror(sq)];

        // Isolated pawns
        if ((pawns & isolatedMask[sq]) == 0) {
            eval->middlegame -= isolated_pawn;
            eval->endgame    -= isolated_pawn;
        }
        // Pass pawns  /* white pawns */
        if ((board->bitboards[P] & bPassedMask[sq]) == 0) {
            eval->middlegame -= passed_pawn[SQUARE_RANK(mirror(sq))];
            eval->endgame    -= passed_pawn[SQUARE_RANK(mirror(sq))];
        }
    }

    /* Major pieces */

    // White

    // PSQTs + Material value
    b  = board->sides_pieces[WHITE];
    b ^= board->bitboards[P];
    b ^= board->bitboards[K];

    piece_t pce;
    while (b) {
        sq = POPLSB(b);
        pce = board->pieces[sq];
        eval->middlegame += value_mg[pce];
        eval->middlegame += psqt_mg[pce][sq];
        eval->endgame    += value_eg[pce];
        eval->endgame    += psqt_eg[pce][sq];
    }

    // Black

    // PSQTs + Material value
    b  = board->sides_pieces[BLACK];
    b ^= board->bitboards[p];
    b ^= board->bitboards[k];

    while (b) {
        sq = POPLSB(b);
        pce = board->pieces[sq];
        eval->middlegame -= value_mg[pce];
        eval->middlegame -= psqt_mg[pce][mirror(sq)];
        eval->endgame    -= value_eg[pce];
        eval->endgame    -= psqt_eg[pce][mirror(sq)];
    }

    /*
    // TODO:
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
    */

    score = eval->get_tapered_score();

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
    }

    assert(check(board));
}
