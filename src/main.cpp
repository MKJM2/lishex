#include <iostream>

#include "attack.h"
#include "bitboard.h"
#include "uci.h"
#include "board.h"

int main(int argc, char* argv[]) {

    // Print engine info
    std::cout << NAME << " by " << AUTHOR << std::endl;
    std::cout << "Built on " << __TIMESTAMP__ << std::endl;

    // Initialize
    init_eval_masks();
    init_keys();
    init_pawn_attacks();
    init_leap_attacks();
    init_slider_attacks();

    // Start UCI driver loop
    loop(argc, argv);

    return 0;
}
