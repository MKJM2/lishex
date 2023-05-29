#ifndef BOARD_H_
#define BOARD_H_

#include <string>
#include <iostream>
#include <cstring>
#include <unordered_map>
#include <stack>
#include "Piece.h"
#include "Move.h"
#include "Square.h"

#define ROWS 8
#define COLS 8

typedef int piece;
typedef unsigned int uint;
typedef unsigned long long u64;

extern std::string startFEN;
extern std::unordered_map<piece, char> pieceToChar;
extern std::unordered_map<char, piece> charToPiece;

typedef struct {
        Move move;
        // Castle permissions + EP square
        u64 posKey;
        piece captured;
} undo_t;

class Board {
    public:
        Board ();
        piece board[ROWS * COLS] = {};
        void printFEN();
        void print();
        void readFEN(std::string fen);
        void loadFEN(std::string fen);
        void makeMove(Move move);
        void undoMove(Move move);
        void undoLast();
        int turn = Piece::White;
        uint ply = 0;
        inline u64 rand64();
        u64 pieceKeys[24][64];
        u64 turnKey; // we hash in a random number if it's White's move
        u64 castleKeys[16]; // TODO: 4bits depending on which side castle
        u64 posKey = 0;
        void initKeys(unsigned seed = 69);
        void generatePosKey();
        std::stack<undo_t> boardHistory;

};

#endif // BOARD_H_
