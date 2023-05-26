#ifndef BOARD_H_
#define BOARD_H_

#include <string>
#include <iostream>
#include <cstring>
#include <unordered_map>
#include "Piece.h"
#include "Move.h"

#define ROWS 8
#define COLS 8

typedef int piece;
typedef unsigned int uint;

extern std::string startFEN;
extern std::unordered_map<piece, char> pieceToChar;
extern std::unordered_map<char, piece> charToPiece;

class Board {
    public:
        piece board[ROWS * COLS] = {};
        void printFEN();
        void print();
        void readFEN(std::string fen);
        void loadFEN(std::string fen);
        void makeMove(Move move);
        void undoMove(Move move);
        int turn = Piece::White;
        uint ply = 0;
        piece capturedLastPly = Piece::None;
};

#endif // BOARD_H_
