#ifndef SEARCH_H_
#define SEARCH_H_

#include "types.h"
#include "board.h"
#include "bitboard.h"
#include "movegen.h"
#include "time.h"
#include "transposition.h"

/**
 @brief Searches the current board state for the best move
 @param board the board state to search
 @param info search info: time, depth to search, etc.
*/
void search(board_t *board, searchinfo_t *info);

// Constants / parameters
// [LMR]
constexpr int lmr_fully_searched_req = 4;
constexpr int lmr_limit = 3;

#endif // SEARCH_H_
