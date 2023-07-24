#ifndef SEE_H_
#define SEE_H_

#include "types.h"
#include "board.h"
#include "bitboard.h"
#include "eval.h"
#include "attack.h"

int see(const board_t* board, const move_t m);

#endif // SEE_H_
