#ifndef MOVEGEN_H_
#define MOVEGEN_H_

#include "types.h"
#include "bitboard.h"
#include "board.h"
#include "attack.h"

int generate_quiet(const board_t *board, movelist_t *moves);
int generate_noisy(const board_t *board, movelist_t *moves);
int generate_moves(const board_t *board, movelist_t *moves);

bb_t is_attacked(const board_t *board, const square_t sq, const int colour);

uint64_t perft(board_t *board, int depth, bool verbose = false);

#endif // MOVEGEN_H_
