#ifndef ORDER_H_
#define ORDER_H_

#include "types.h"
#include "board.h"

void score_and_sort(const board_t *board, movelist_t *moves, move_t pv_move);

#endif // ORDER_H_
