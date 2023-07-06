#ifndef SEARCH_H_
#define SEARCH_H_

#include "types.h"
#include "board.h"
#include "bitboard.h"
#include "movegen.h"
#include "time.h"

void search(board_t *board, searchinfo_t *info);

#endif // SEARCH_H_
