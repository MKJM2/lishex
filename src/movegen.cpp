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
    int dir_east = dir + EAST;
    int dir_west = dir + WEST;

    // We mask out the promoting pawns for the side to move
    bb_t pawns_bb = board->bitboards[me ? P : p] & NOT_PROMOTING(me);



    /* Non-sliding Piece moves */
    // TODO

    /* Sliding Piece moves */
    // TODO

    /* Castling */
    // TODO
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

}

/**
 * generate_moves
 * @brief Generates all moves for the current position
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of moves (quiet & noisy) generated
 */
int generate_moves(board_t *board, movelist_t *moves) {
    return generate_quiet(board, moves) + generate_noisy(board, moves);
}
