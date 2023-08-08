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

/*
 *  /\ \       __/\  _`\ /\ \/\ \         /\ \ /\ \
 *  \ \ \     /\_\ \,\L\_\ \ \_\ \     __ \ `\`\/'/'
 *   \ \ \  __\/\ \/_\__ \\ \  _  \  /'__`\`\/ > <
 *    \ \ \L\ \\ \ \/\ \L\ \ \ \ \ \/\  __/   \/'/\`\
 *     \ \____/ \ \_\ `\____\ \_\ \_\ \____\  /\_\\ \_\
 *      \/___/   \/_/\/_____/\/_/\/_/\/____/  \/_/ \/_/
 *
 *
 *       A UCI-compliant chess engine written in C++
 */



#include <iostream>
#include "types.h"
#include "board.h"
#include "bitboard.h"
#include "uci.h"
#include "attack.h"
#include "search.h"
//#include "sgd.h"
#include "eval.h"

int main(int argc, char* argv[]) {

    // Print ASCII logo
    std::cout \
        << "                                                                    \n" \
        << "                      (%       ((((                                 \n" \
        << "                      (((((((  ((((((                               \n" \
        << "                      %(    ((((((#(((                              \n" \
        << "                       &((((((((((((((((                            \n" \
        << "                     ((((((((((((((((((((((                         \n" \
        << "                   (((((((((((//(((((( ((((((                       \n" \
        << "                 %((((((((/**********/(((((((                       \n" \
        << "                  ((((((//****       ****/(((((((((#                \n" \
        << "                 ((((((((*     #(((((((   *******/(                 \n" \
        << "                 ((((((((    ((((  %(((                             \n" \
        << "                 (((((((           #(((((                           \n" \
        << "                 ((((((( (         ((((((((((((                     \n" \
        << "                 ( ((((((           (((((((((((((((((               \n" \
        << "                    (((((((          (((((((((((((((((((            \n" \
        << "                     ((((((       (  %(((((((((((((((((((((         \n" \
        << "                        (((     %((  (((((((((((((((((((((((&       \n" \
        << "                          (     ((((((((((((((((((((((((((((((      \n" \
        << "                                 ((((((((((((((((((((((((((((((     \n" \
        << "              %((((((((((((((((%   (((((((((((((((((((((((((((((    \n" \
        << "           (((((((((((((((((((((((((((# ((((((((((( ((((((((((((    \n" \
        << "        ((((((((         ((((((((((((((((((((        ((((((((((((   \n" \
        << "      ((((((                 %(((((((((((((((((((((((((((((((((((   \n" \
        << "    %(((((((((                  ((((((((((((((((((((((((((((((((    \n" \
        << "   ((((    ((((((((((                (((((((( ((((((((((((((((((    \n" \
        << "                  (((((((                %((((((((((((( (((((((     \n" \
        << "                      ((((((&        (((((((((((     #(((((((       \n" \
        << "                          (((((((                 ((((((((          \n" \
        << "                               &(((((((((((((((((((((               \n" \
        << std::endl;

    // Print engine info
    std::cout << NAME << " " << VERSION << " (c) " << AUTHOR << " 2023" << std::endl;
    std::cout << "Built on " << __DATE__ << " " << __TIME__ << std::endl;

    // Initialization
    init_keys();
    init_eval_masks();
    init_leap_attacks();
    init_bishop_occupancies();
    init_rook_occupancies();
    init_magics<BISHOP>();
    init_magics<ROOK>();
    init_reductions();

    //tune();

    // Start UCI driver loop
    loop(argc, argv);

    return 0;
}
