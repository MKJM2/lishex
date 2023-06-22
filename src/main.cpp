#include <iostream>
#include "bitboard.h"
#include "uci.h"

int main(int argc, char* argv[]) {

    // Print engine info
    std::cout << NAME << " by " << AUTHOR << std::endl;
    std::cout << "Built on " << __TIMESTAMP__ << std::endl;

    // Initialize
    initEvalMasks();

    // Start UCI driver loop
    loop(argc, argv);

    return 0;
}
