#include <locale>
#include <string>
#include <iostream>
#include <unordered_map>
#include "Piece.h"

#define ROWS 8
#define COLS 8

typedef int piece;

std::string startFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR";
std::unordered_map<piece, char> pieceToChar = {
    {Piece::None, '\0'},
    {Piece::Rook   & Piece::Black, 'r'},
    {Piece::Knight & Piece::Black, 'n'},
    {Piece::Bishop & Piece::Black, 'b'},
    {Piece::Queen  & Piece::Black, 'q'},
    {Piece::King   & Piece::Black, 'k'},
    {Piece::Pawn   & Piece::Black, 'p'},
    {Piece::Rook   & Piece::White, 'R'},
    {Piece::Knight & Piece::White, 'N'},
    {Piece::Bishop & Piece::White, 'B'},
    {Piece::Queen  & Piece::White, 'Q'},
    {Piece::King   & Piece::White, 'K'},
    {Piece::Pawn   & Piece::White, 'P'}
};
std::unordered_map<char, piece> charToPiece = {
    {'\0', Piece::None},
    {'r', Piece::Rook   & Piece::Black},
    {'n', Piece::Knight & Piece::Black},
    {'b', Piece::Bishop & Piece::Black},
    {'q', Piece::Queen  & Piece::Black},
    {'k', Piece::King   & Piece::Black},
    {'p', Piece::Pawn   & Piece::Black},
    {'R', Piece::Rook   & Piece::White},
    {'N', Piece::Knight & Piece::White},
    {'B', Piece::Bishop & Piece::White},
    {'Q', Piece::Queen  & Piece::White},
    {'K', Piece::King   & Piece::White},
    {'P', Piece::Pawn   & Piece::White},
};

class Board {
    public:
        piece board[ROWS * COLS];
        void printFEN() {
            std::string row;
            for (int i = 0; i < 8; i++) {
                row.clear(); int spaces = 0;
                for (int j = 0; j < 8; j++) {
                    int curr = pieceToChar[board[i * ROWS + j]];
                    if (curr != '\0') {
                        if (spaces != 0) {
                            row += std::to_string(spaces);
                        }
                        spaces = 0;
                        row += curr;
                    } else {
                        spaces++;
                        if (j == 7) {
                            row += spaces;
                        }
                    }
                }
                std::cout << row << "/\n";
            }
        }
        void readFEN(std::string fen) {
            // Split the input fen into 8 parts
            std::string fenParts[6];
            int idx = 0;
            for (int i = 0; i < fen.length(); i++) {
                if (fen[i] == ' ') {
                    idx++;
                } else {
                    fenParts[idx] += fen[i];
                }
            }

            // fill board with pieces from FEN
            int boardIdx = 0;
            for (int i = 0; i < fenParts[0].length(); i++) {
                char c = fenParts[0][i];
                if (c == '/') {
                    boardIdx += 8;
                } else if (isdigit(c)) {
                    boardIdx += c - '0';
                } else {
                    board[boardIdx] = charToPiece[c];
                    boardIdx++;
                }
            }
        }
};
