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
                        if (SquareRank(to, me) == 7) {
                            moves.emplace_back(from, to, KnightPromo);
                            moves.emplace_back(from, to, BishopPromo);
                            moves.emplace_back(from, to, QueenPromo);
                            moves.emplace_back(from, to, RookPromo);
                        } else {
                            moves.emplace_back(from, to);
                        }
                    }
                    // Check if pawn can move forward two squares from the starting position
                    int startingRank = 1; // (me == White) ? 1 : 6; // zero-indexed
                    // Consider the opposite starting rank
                    if (SquareRank(from, me) == startingRank && board[to] == None && board[to + dir] == None) {
                        moves.emplace_back(from, to + dir, DoublePawnPush);
                    }
                    // Check if pawn can capture diagonally to the west
                    square_t captureL = from + dir - 1;
                    if (IsOK(captureL) && distance(captureL, from) <= 2 && board[captureL] != None && IsColour(board[captureL], opp)) {
                        if (SquareRank(captureL, me) == 7) {
                           moves.emplace_back(from, captureL, Capture | KnightPromo);
                           moves.emplace_back(from, captureL, Capture | BishopPromo);
                           moves.emplace_back(from, captureL, Capture | QueenPromo);
                           moves.emplace_back(from, captureL, Capture | RookPromo);
                        } else {
                            moves.emplace_back(from, captureL, Capture);
                        }
                    }
                    // Check if pawn can capture diagonally to the east
                    square_t captureR = from + dir + 1;
                    if (IsOK(captureR) && distance(captureR, from) <= 2 && board[captureR] != None && IsColour(board[captureR], opp)) {
                        if (SquareRank(captureR, me) == 7) {
                           moves.emplace_back(from, captureR, Capture | KnightPromo);
                           moves.emplace_back(from, captureR, Capture | BishopPromo);
                           moves.emplace_back(from, captureR, Capture | QueenPromo);
                           moves.emplace_back(from, captureR, Capture | RookPromo);
                        } else {
                            moves.emplace_back(from, captureR, Capture);
                        }
                    }
                    // Check if can perform en passant
                    // std::cout << "google en passant" << std::endl;
                    if (IsOK(captureL) && distance(captureL, from) <= 2 && captureL == b.epSquare) {
                        if (SquareRank(captureL, me) == 7) {
                           moves.emplace_back(from, captureL, EpCapture | KnightPromo);
                           moves.emplace_back(from, captureL, EpCapture | BishopPromo);
                           moves.emplace_back(from, captureL, EpCapture | QueenPromo);
                           moves.emplace_back(from, captureL, EpCapture | RookPromo);
                        } else {
                            moves.emplace_back(from, captureL, EpCapture);
                        }

                    }
                    if (IsOK(captureR) && distance(captureR, from) <= 2 && captureR == b.epSquare) {
                        if (SquareRank(captureR, me) == 7) {
                           moves.emplace_back(from, captureR, EpCapture | KnightPromo);
                           moves.emplace_back(from, captureR, EpCapture | BishopPromo);
                           moves.emplace_back(from, captureR, EpCapture | QueenPromo);
                           moves.emplace_back(from, captureR, EpCapture | RookPromo);
                        } else {
                            moves.emplace_back(from, captureR, EpCapture);
                        }

                    }
                    break;
                }
                case Knight: {
                    // Generate knight moves (non-capture)
                    // List all possible destination squares and check if they are valid
                    for (const square_t& dir : knightDest) {
                        square_t to = from + dir;
                        if (IsOK(to) && (board[to] == None || IsColour(board[to], opp))) {
                            // TODO: Find a cleaner way to do this (might have to change board rep)
                            // ensure knight moved 2 squares Manhattan distance away, i.e. didn;t wrap around the side
                            if (distance(to, from) != 2) continue;
                            moves.emplace_back(from, to); // Quiet || Capture?
                        }
                    }
                    break;
                }
                case Rook: {
                    for (const square_t& dir : rookDest) {
                        square_t to = from + dir;
                        while (IsOK(to) && distance(to, to - dir) <= 2) {
                            if (board[to] != None) {
                                if (IsColour(board[to], opp)) {
                                    moves.emplace_back(from, to, Capture);
                                }
                                break;
                            }
                            moves.emplace_back(from, to);
                            to += dir;
                        }
                    }
                    break;
                }
                case Bishop: {
                    for (const square_t& dir : bishopDest) {
                        square_t to = from + dir;
                        while (IsOK(to) && distance(to, to - dir) <= 2) {
                            if (board[to] != None) {
                                if (IsColour(board[to], opp)) {
                                    moves.emplace_back(from, to, Capture);
                                }
                                break;
                            }
                            moves.emplace_back(from, to);
                            to += dir;
                        }
                    }
                    break;
                }
                case Queen: {
                    for (const square_t& dir : queenDest) {
                        square_t to = from + dir;
                        while (IsOK(to) && distance(to, to - dir) <= 2) {
                            if (board[to] != None) {
                                if (IsColour(board[to], opp)) {
                                    moves.emplace_back(from, to, Capture);
                                }
                                break;
                            }
                            moves.emplace_back(from, to);
                            to += dir;
                        }
                    }
                    break;
                }
                case King: {
                    for (const square_t& dir : kingDest) {
                        square_t to = from + dir;
                        if (IsOK(to) && distance(to, from) < 2) {
                            if (board[to] != None) {
                                    if (IsColour(board[to], opp)) {
                                        moves.emplace_back(from, to, Capture);
                                    }
                                    continue;
                            }
                            moves.emplace_back(from, to);
                        }
                    }
                    break;
                }
            }
        }
    }

    // handle castling moves (TODO: Fix ugly nested ifs)
    if (b.turn == White) {
        if (b.castlePerm & b.WKCastle) {
            if (board[F1] == None && board[G1] == None) {
                if (!b.SquareAttacked(E1, Black) && !b.SquareAttacked(F1, Black)) {
                    moves.emplace_back(E1, G1, KingCastle);
                }
            }
        }
        if (b.castlePerm & b.WQCastle) {
            if (board[D1] == None && board[C1] == None && board[B1] == None) {
                if (!b.SquareAttacked(E1, Black) && !b.SquareAttacked(D1, Black)) {
                    moves.emplace_back(E1, C1, QueenCastle);
                }
            }
        }
    } else {
        if (b.castlePerm & b.BKCastle) {
            if (board[F8] == None && board[G8] == None) {
                if (!b.SquareAttacked(E8, White) && !b.SquareAttacked(F8, White)) {
                    moves.emplace_back(E8, G8, KingCastle);
                }
            }
        }
        if (b.castlePerm & b.BQCastle) {
            if (board[D8] == None && board[C8] == None && board[B8] == None) {
                if (!b.SquareAttacked(E8, White) && !b.SquareAttacked(D8, White)) {
                    moves.emplace_back(E8, C8, QueenCastle);
                }
            }
        }
    }
    return moves;
}

unsigned long long perft(Board& b, int depth, bool verbose) {
    if (depth == 0) {
        return 1ULL;
    }
    int n_moves, i, curr;
    unsigned long long nodes = 0;

    std::vector<Move> moves = generateMoves(b);
    n_moves = moves.size();
    for (i = 0; i < n_moves; i++) {
        if (!b.makeMove(moves[i])) continue;
        curr = perft(b, depth - 1);
        if (verbose) {
            std::cout << moves[i].toString() << " " \
                      << curr << std::endl;
        }
        nodes += curr;
        //b.undoMove(moves[i]);
        b.undoLast();
    }
    return nodes;
}
