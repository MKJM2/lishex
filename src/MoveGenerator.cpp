#include "MoveGenerator.h"
#include "Square.h"

// prototypes
//std::vector<Move> generateLegalMoves(Board& board);
//std::vector<Move> generateMoves(Board& board);
using namespace Piece;

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

std::vector<Move> generateMoves(Board& b) {

    piece* board = b.board; // array of pieces
    int me = b.turn;
    int opp = OPPONENT(b.turn);

    std::vector<Move> moves;
    // add regular moves
    for (square_t from = 0; from < 64; ++from) {
        piece p = board[from]; // TODO, clean the code up
        if (p != None && IsColour(p, me)) {
            switch (PieceType(p)) {
                case Pawn: {
                    // Generate pawn moves
                    // possible destinations for a) White, b) Black pawns
                    square_t dest[2] = {-8, +8};
                    int dir = dest[(me == White) ? 1 : 0];
                    // Check if pawn can move forward one square
                    square_t to = from + dir;
                    if (board[to] == None) {
                        moves.emplace_back(from, to);
                    }
                    // Check if pawn can move forward two squares from the starting position
                    int startingRank = (me == White) ? 1 : 6;
                    // Consider the opposite starting rank
                    if (SquareRank(from) == startingRank && board[to] == None && board[to + dir] == None) {
                        moves.emplace_back(from, to + dir, move_t::DoublePawnPush);
                    }
                    // Check if pawn can capture diagonally to the left
                    square_t captureL = from + dir - 1;
                    if (IsOK(captureL) && board[captureL] != None && IsColour(board[captureL], opp)) {
                        moves.emplace_back(from, captureL, move_t::Capture);
                    }
                    // Check if pawn can capture diagonally to the right
                    square_t captureR = from + dir + 1;
                    if (IsOK(captureR) && board[captureR] != None && IsColour(board[captureR], opp)) {
                        moves.emplace_back(from, captureR, move_t::Capture);
                    }
                    break;
                }
                case Knight: {
                    // Generate knight moves (non-capture)
                    // List all possible destination squares and check if they are valid
                    square_t dest[] = {from - 17, from - 15, from - 10, from - 6, from + 6, from + 10, from + 15, from + 17};
                    for (square_t& to : dest) {
                        if (IsOK(to) && (board[to] == None || IsColour(board[to], opp))) {
                            moves.emplace_back(from, to); // move_t::Quiet || move_t::Capture?
                        }
                    }
                    break;
                }
                // TODO: Other pieces
            }
        }
    }

    // add en passant

    // add castle
    return moves;
}
