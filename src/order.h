#ifndef ORDER_H_
#define ORDER_H_

#include "types.h"
#include "board.h"

/**
 @brief Scores and sortes the movelist for move ordering purposes
 @param board position for which the movelist was generated
 @param moves the movelist to score and sort
 @param pv_move principal variation move to order first, if any
 */
void score_and_sort(const board_t *board, movelist_t *moves, move_t pv_move);

// Scores the moves
void score_moves(const board_t *board, movelist_t *moves, move_t pv_move);
// Returns the next best move
move_t next_best(movelist_t *moves, int ply);

// Prints the movescores (useful for debugging)
void movescore(const board_t *board, movelist_t *moves, int n = 5);

#endif // ORDER_H_
