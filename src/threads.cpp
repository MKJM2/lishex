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

/* @TODO: This file will hold thread pool code for LazySMP in the future */
#include "threads.h"

#include "eval.h" // eval_t

// Engine loop never writes to the state variable, only reads
void engine_loop(board_t *board, searchinfo_t *info) {
    LOG("Search thread started!");
    while (true) {
        switch (info->state) {
            case ENGINE_SEARCHING:
                LOG("Searching...");
                // Inside of search() every CHECKUP_INTERVAL nodes check engine status
                search(board, info);
                break;
            case ENGINE_PONDERING: /* @TODO: Implement pondering */
                LOG("Pondering not implemented...");
                continue;
            case ENGINE_STOPPED: /* @TODO: Might want to handle stop/quit separately */
                LOG("Stopping...");
                break;
            case ENGINE_QUIT: {
                LOG("Quitting...");
                break;
            }
        }
        break;
    }
    LOG("Search thread done!");
}
