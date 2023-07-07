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
 * @brief Checks if a given square is attacked by the player (colour)
 * @param board board struct representing the current position
 * @param sq square to check attacks for
 * @param colour colour to check attacks for
 * @return Non-zero bitboard of relevant (first detected) attackers if attacked,
 * empty otherwise
 */
bb_t is_attacked(const board_t *board, const square_t sq, const int colour);

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

#endif // MOVEGEN_H_
