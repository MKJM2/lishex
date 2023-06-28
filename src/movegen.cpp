/* Move generation logic (separate for quiet and non-quiet moves) */
#include "movegen.h"

/**
 * generate_quiet
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of quiet moves generated
 */
int generate_quiet(board_t *board, movelist_t *moves) {

    // We collapse the implementation for both black and white
    int& me = board->turn;
    int opp = me ^ 1;

    /* Pawn pushes & double pushes (we handle promotions in generate_noisy) */
    int dir = (me) ? NORTH : SOUTH;

    // We mask out the promoting pawns for the side to move
    bb_t pawns_bb = board->bitboards[me ? P : p] & NOT_PROMOTING(me);

    // Pawns can only move to empty squares
    bb_t empty_squares = ~all_pieces(board);

    bb_t pawn_pushes = (me) ? n_shift(pawns_bb) : s_shift(pawns_bb);
    pawn_pushes &= empty_squares;

    // For double pawn pushes we consider pawns on rank 2 (white) or 7 (black)
    // Since we pushed them by one square already, we check only ranks 3 and 6
    bb_t double_pawn_pushes = (me) ? n_shift(pawn_pushes & RANK_TO_BB(3))
                                   : s_shift(pawn_pushes & RANK_TO_BB(6));

    while (pawn_pushes) {
        // TODO: Verify that POP clears the least significant bit
        square_t to = POP(pawn_pushes); CLRLSB(pawn_pushes);
        moves->push_back(Move(to - dir, to, QUIET));
    }

    while (double_pawn_pushes) {
        square_t to = POP(double_pawn_pushes); CLRLSB(double_pawn_pushes);
        moves->push_back(Move(to - dir - dir, to, QUIET));
    }

    /* Non-sliding Piece moves */
    // TODO

    /* Sliding Piece moves */
    // TODO

    /* Castling */
    // TODO

    return 0;
}

/**
 * generate_noisy
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of noisy (non-quiet) moves generated
 */
int generate_noisy(board_t *board, movelist_t *moves) {
    /* Pawn captures & en passant */

    /* Promotions */

    /* Captures by non-sliding pieces */

    /* Captures by sliding pieces */
    return 0;
}

/**
 * generate_moves
 * @brief Generates all moves for the current position
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of moves (quiet & noisy) generated
 */
int generate_moves(board_t *board, movelist_t *moves) {
    moves->clear();
    return generate_quiet(board, moves) + generate_noisy(board, moves);
}
