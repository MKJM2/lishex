#include <iostream>

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

    // Start UCI driver loop
    loop(argc, argv);

    return 0;
}
