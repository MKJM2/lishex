#include "MoveGenerator.h"

// prototypes
//std::vector<Move> generateLegalMoves(Board& board);
//std::vector<Move> generateMoves(Board& board);

std::vector<Move> generateLegalMoves(Board& board) {
    /* TODO */
    // find attacks

    // if in check

    // else
    std::vector<Move> pseudoLegal = generateMoves(board);

    // TODO filter out illegal moves
    std::vector<Move> legal = pseudoLegal;

    // return legal moves
    return legal;
}

std::vector<Move> generateMoves(Board& board) {

    // add regular moves

    // add en passant

    // add castle
    return {};
}
