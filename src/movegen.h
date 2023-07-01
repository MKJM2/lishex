#ifndef MOVEGEN_H_
#define MOVEGEN_H_

#include "types.h"
#include "bitboard.h"
#include "board.h"
#include "attack.h"

int generate_quiet(board_t *board, movelist_t *moves);
int generate_noisy(board_t *board, movelist_t *moves);
int generate_moves(board_t *board, movelist_t *moves);

int is_attacked(board_t *board, square_t sq);

#endif // MOVEGEN_H_
