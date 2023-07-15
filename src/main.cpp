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
#include "search.h" // TODO: Debugging, remove later

int main(int argc, char* argv[]) {

    // Print engine info
    std::cout << NAME << " (c) " << AUTHOR << " 2023" << std::endl;
    std::cout << "Built on " << __DATE__ << " " << __TIME__ << std::endl;

    // Initialization
    init_keys();
    init_eval_masks();
    InitHashTable(HashTable, 64);
    init_leap_attacks();
    init_bishop_occupancies();
    init_rook_occupancies();
    init_magics<BISHOP>();
    init_magics<ROOK>();

    // Start UCI driver loop
    loop(argc, argv);

    return 0;
}
