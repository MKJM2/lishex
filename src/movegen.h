#ifndef MOVEGEN_H_
#define MOVEGEN_H_

#include "types.h"
#include "bitboard.h"
#include "board.h"
#include "attack.h"

int generate_quiet(board_t *board, movelist_t *moves);
int generate_noisy(board_t *board, movelist_t *moves);
int generate_moves(board_t *board, movelist_t *moves);

bb_t is_attacked(board_t *board, square_t sq, int colour);

uint64_t perft(board_t *board, int depth, bool verbose = false);

#endif // MOVEGEN_H_
