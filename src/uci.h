#ifndef UCI_H_
#define UCI_H_

#include <string>
#include "board.h"
#include "movegen.h"

/**
 * @brief UCI driver loop
 *
 * Handles the communication between the engine and a UCI-compliant GUI/CLI
 *
 * @param argc number of arguments pointed to by argv
 * @param argv[] the array of arguments
 */
void loop(int argc, char* argv[]);

/* Helpers for reading out/printing out moves */

// Converts a square to the corresponding string
extern std::string square_to_str(square_t sq);

// Converts a string to a valid pseudolegal move
move_t str_to_move(board_t *board, const std::string& s);

#endif // UCI_H_
