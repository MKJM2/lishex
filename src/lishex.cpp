#include <iostream>
#include "Board.h"
int main() {
    Board gameboard;
    gameboard.readFEN(startFEN);
    gameboard.printFEN();
    return 0;
}
