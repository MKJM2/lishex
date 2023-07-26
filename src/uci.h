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

#ifndef UCI_H_
#define UCI_H_

#include <string>
#include "board.h"
#include "movegen.h"

// Option types
enum class OPT_TYPE : int { CHECK, SPIN, COMBO, BUTTON, STRING };

/* A struct representing an option type in UCI mode */
typedef struct option_t {
    std::string name;
    OPT_TYPE type;
    int min, def, max;
    int value;
} option_t;

// Global array storing UCI engine options
extern option_t options[];

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
