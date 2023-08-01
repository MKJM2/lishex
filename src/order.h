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

#ifndef ORDER_H_
#define ORDER_H_

#include "types.h"
#include "board.h"

/**
 @brief Scores the movelist for move ordering purposes
 @param board position for which the movelist was generated
 @param moves the movelist to score
 @param pv_move principal variation move to order first, if any
 @param killers killer moves that caused a cutoff, if any
 */
void score_moves(const board_t *board, movelist_t *moves, move_t pv_move, move_t *killers);

// Returns the next best move
move_t next_best(movelist_t *moves, int ply);

// Prints the movescores (useful for debugging)
void movescore(const board_t *board, movelist_t *moves, int n = 5);

#endif // ORDER_H_
