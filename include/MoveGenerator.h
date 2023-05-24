#ifndef MOVEGENERATOR_H_
#define MOVEGENERATOR_H_

#include <vector>

#include "Board.h"
#include "Move.h"
#include "Piece.h"

extern std::vector<Move> generateLegalMoves(Board& board);
extern std::vector<Move> generateMoves(Board& board);
extern std::vector<Move> generateCaptures(Board& board);

#endif // MOVEGENERATOR_H_
