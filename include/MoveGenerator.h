#ifndef MOVEGENERATOR_H_
#define MOVEGENERATOR_H_

#include <vector>
#include "Move.h"
#include "Piece.h"
#include "Board.h"
#include "Square.h"

//void generateLegalMoves(Board& board, movelist_t* moveList);
extern void generateMoves(Board& board, movelist_t* moveList);
extern void generateCaptures(Board& board, movelist_t* moveList);
extern unsigned long long perft(Board& b, int depth, bool verbose = false);


#endif // MOVEGENERATOR_H_
