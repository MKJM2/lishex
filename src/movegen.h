/*
 Lishex (codename 1F98A), a UCI chess engine built in C++
 Copyright (C) 2023 Michal Kurek

 Lishex is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Lishex is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef MOVEGEN_H_
#define MOVEGEN_H_

#include "types.h"
#include "bitboard.h"
#include "board.h"
#include "attack.h"

/**
 * @brief Generates all quiet moves for the current position
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of quiet moves generated
 */
int generate_quiet(const board_t *board, movelist_t *moves);

/**
 * @brief Generates all non-quiet moves for the current position
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of noisy (non-quiet) moves generated
 */
int generate_noisy(const board_t *board, movelist_t *moves);

/**
 * @brief Generates all pseudolegal moves for the current position
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of moves (quiet & noisy) generated
 */
int generate_moves(const board_t *board, movelist_t *moves);


/**
 * @brief PERFormance Test (perft)
 *
 * Performs a PERFormance Test (for debugging purposes). There is no
 * bulk-counting, since we're using a pseudolegal move generator.
 *
 * @param board board struct representing the current position
 * @param depth depth to enumerate the board state tree to
 * @param verbose whether to print all moves and for each move, the perft
 * of the decremented depth (like 'divide', see
 * https://www.chessprogramming.org/Perft)
 * @return number of *leaf* nodes visited
 */
uint64_t perft(board_t *board, int depth, bool verbose = false);

// True if pseudolegal move exists in the current position, false otherwise
bool move_exists(const board_t *board, move_t move);

#endif // MOVEGEN_H_
