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
    for (square_t from = A1; from <= H8; ++from) {
        piece p = board[from]; // TODO, clean the code up
        if (p != None && IsColour(p, me)) {
            switch (PieceType(p)) {
                case Pawn: {
                    // Generate pawn moves
                    int dir = pawnDest[me == White];
                    // Check if pawn can move forward one square
                    square_t to = from + dir;
                    if (board[to] == None) {
                        moves.emplace_back(from, to);
                    }
                    // Check if pawn can move forward two squares from the starting position
                    int startingRank = (me == White) ? 1 : 6; // zero-indexed
                    // Consider the opposite starting rank
                    if (SquareRank(from, me) == startingRank && board[to] == None && board[to + dir] == None) {
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
                    for (const square_t& dir : knightDest) {
                        square_t to = from + dir;
                        if (IsOK(to) && (board[to] == None || IsColour(board[to], opp))) {
                            moves.emplace_back(from, to); // move_t::Quiet || move_t::Capture?
                        }
                    }
                    break;
                }
                case Rook: {
                    for (const square_t& dir : rookDest) {
                        for (square_t to = from + dir; IsOK(to) && board[to] == None; to += dir) {
                            moves.emplace_back(from, to);
                        }
                    }
                    break;
                }
                case Bishop: {
                    for (const square_t& dir : bishopDest) {
                        for (square_t to = from + dir; IsOK(to) && board[to] == None; to += dir) {
                            moves.emplace_back(from, to);
                        }
                    }
                    break;
                }
                case Queen: {
                    for (const square_t& dir : queenDest) {
                        for (square_t to = from + dir; IsOK(to) && board[to] == None; to += dir) {
                            moves.emplace_back(from, to);
                        }
                    }
                    break;
                }
            }
        }
    }

    // add en passant

    // add castle
    return moves;
}


std::vector<Move> generateCaptures(Board& b) {
    // TODO: separate Quiet move logic from Capture logic
    return {};
}
