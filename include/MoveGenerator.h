#ifndef MOVEGENERATOR_H_
#define MOVEGENERATOR_H_

#include <vector>

#include "Board.h"
#include "Move.h"
#include "Piece.h"

extern std::vector<move_t> generateLegalMoves(Board& board);
extern std::vector<move_t> generateMoves(Board& board);
extern u64 perft(Board& b, int depth, bool verbose = false);

#endif // MOVEGENERATOR_H_
