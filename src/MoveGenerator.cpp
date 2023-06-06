#include "MoveGenerator.h"
#include "Square.h"

using namespace Piece;

/* MVV-LVA heuristic */

// score of a victim, by piece type
const int VictimScore[24] = {
      0, // None
      0, // King (never actually captured)
    100, // Pawn
    200, // Knight
      0, // -
    300, // Bishop
    400, // Rook
    500, // Queen
      0,
      0, // White King
    100, // White Pawn
    200, // White Knight
      0, // -
    300, // White Bishop
    400, // White Rook
    500, // White Queen
      0,
      0, // Black King
    100, // Black Pawn
    200, // Black Knight
      0, // -
    300, // Black Bishop
    400, // Black Rook
    500  // Black Queen
};

static int MVVLVA[24][24];

void initMVVLVA() {
  using namespace Piece;
  int attacker;
  int victim;
  for (attacker = None; attacker <= (Black | Queen); attacker++) {
    for (victim = None; victim <= (Black | Queen); victim++) {
        MVVLVA[victim][attacker] =
            VictimScore[victim] + 6 - (VictimScore[attacker] / 100);
    }
  }
}

inline static void addQuiet(const move_t m, std::vector<move_t>& moves) {
    moves.emplace_back(setScore(m, 0));
}

inline static void addCapture(const move_t m, std::vector<move_t>& moves, const Board& b) {
    moves.emplace_back(setScore(m, MVVLVA[b.board[getTo(m)]][b.board[getFrom(m)]]));
}

inline static void addEnPassant(const square_t from, const square_t to, std::vector<move_t>& moves) {
    // Here, MVVLVA[Pawn][Pawn] = 105, and since that's always the case for en passant
    // we simply hardcode it
    moves.emplace_back(Move(from, to, EpCapture, 105));
}

inline static void addPawnPush(const square_t from, const square_t to, std::vector<move_t>& moves, const Board& b) {
    if (SquareRank(to, b.turn) == 7) {
        addQuiet(Move(from, to, KnightPromo, 0), moves);
        addQuiet(Move(from, to, BishopPromo, 0), moves);
        addQuiet(Move(from, to, QueenPromo, 0),  moves);
        addQuiet(Move(from, to, RookPromo, 0),   moves);
    } else {
        addQuiet(Move(from, to, Quiet, 0), moves);
    }
}

inline static void addPawnCapture(const square_t from, const square_t to, std::vector<move_t>& moves, const Board& b) {
    int score = MVVLVA[b.board[to]][b.board[from]];
    if (SquareRank(to, b.turn) == 7) {
        moves.emplace_back(Move(from, to, KnightPromo | Capture, score));
        moves.emplace_back(Move(from, to, BishopPromo | Capture, score));
        moves.emplace_back(Move(from, to, QueenPromo  | Capture, score));
        moves.emplace_back(Move(from, to, RookPromo   | Capture, score));
    } else {
        moves.emplace_back(Move(from, to, Capture, score));
    }
}

std::vector<move_t> generateLegalMoves(Board& board) {
    /* TODO */
    // find attacks

    // if in check

    // else
    std::vector<move_t> pseudoLegal = generateMoves(board);

    // TODO filter out illegal moves
    std::vector<move_t> legal = pseudoLegal;

    // return legal moves
    return legal;
}

std::vector<move_t> generateMoves(Board& b) {

    piece* board = b.board; // array of pieces
    int me = b.turn;
    int opp = OPPONENT(b.turn);

    std::vector<move_t> moves;
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
                        addPawnPush(from, to, moves, b);
                    }
                    // Check if pawn can move forward two squares from the starting position
                    int startingRank = 1; // (me == White) ? 1 : 6; // zero-indexed
                    // Consider the opposite starting rank
                    if (SquareRank(from, me) == startingRank && board[to] == None && board[to + dir] == None) {
                        moves.emplace_back(Move(from, to + dir, DoublePawnPush, 0));
                    }
                    // Check if pawn can capture diagonally to the west
                    square_t captureL = from + dir - 1;
                    if (IsOK(captureL) && distance(captureL, from) <= 2 && board[captureL] != None && IsColour(board[captureL], opp)) {
                        addPawnCapture(from, captureL, moves, b);
                    }
                    // Check if pawn can capture diagonally to the east
                    square_t captureR = from + dir + 1;
                    if (IsOK(captureR) && distance(captureR, from) <= 2 && board[captureR] != None && IsColour(board[captureR], opp)) {
                        addPawnCapture(from, captureR, moves, b);
                    }
                    // Check if can perform en passant
                    // std::cout << "google en passant" << std::endl;
                    if (IsOK(captureL) && distance(captureL, from) <= 2 && captureL == b.epSquare) {
                        addEnPassant(from, captureL, moves);
                    }
                    if (IsOK(captureR) && distance(captureR, from) <= 2 && captureR == b.epSquare) {
                        addEnPassant(from, captureR, moves);
                    }
                    break;
                }
                case Knight: {
                    // Generate knight moves (non-capture)
                    // List all possible destination squares and check if they are valid
                    for (const square_t& dir : knightDest) {
                        square_t to = from + dir;
                        if (IsOK(to) && distance(to, from) == 2) {
                            if (board[to] == None) {
                                addQuiet(Move(from, to, 0, 0), moves);
                            }
                            if (IsColour(board[to], opp)) {
                                addCapture(Move(from, to, 0, 0), moves, b);
                            }
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
                                    addCapture(Move(from, to, 0, 0), moves, b);
                                }
                                break;
                            }
                            addQuiet(Move(from, to, 0, 0), moves);
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
                                    addCapture(Move(from, to, 0, 0), moves, b);
                                }
                                break;
                            }
                            addQuiet(Move(from, to, 0, 0), moves);
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
                                    addCapture(Move(from, to, 0, 0), moves, b);
                                }
                                break;
                            }
                            addQuiet(Move(from, to, 0, 0), moves);
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
                                        addCapture(Move(from, to, 0, 0), moves, b);
                                    }
                                    continue;
                            }
                            addQuiet(Move(from, to, 0, 0), moves);
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
                    addQuiet(Move(E1, G1, KingCastle, 0), moves);
                }
            }
        }
        if (b.castlePerm & b.WQCastle) {
            if (board[D1] == None && board[C1] == None && board[B1] == None) {
                if (!b.SquareAttacked(E1, Black) && !b.SquareAttacked(D1, Black)) {
                    addQuiet(Move(E1, C1, QueenCastle, 0), moves);
                }
            }
        }
    } else {
        if (b.castlePerm & b.BKCastle) {
            if (board[F8] == None && board[G8] == None) {
                if (!b.SquareAttacked(E8, White) && !b.SquareAttacked(F8, White)) {
                    addQuiet(Move(E8, G8, KingCastle, 0), moves);
                }
            }
        }
        if (b.castlePerm & b.BQCastle) {
            if (board[D8] == None && board[C8] == None && board[B8] == None) {
                if (!b.SquareAttacked(E8, White) && !b.SquareAttacked(D8, White)) {
                    addQuiet(Move(E8, C8, QueenCastle, 0), moves);
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

    std::vector<move_t> moves = generateMoves(b);
    n_moves = moves.size();
    for (i = 0; i < n_moves; i++) {
        if (!b.makeMove(moves[i])) continue;
        curr = perft(b, depth - 1);
        if (verbose) {
            std::cout << toString(moves[i]) << " " \
                      << curr << std::endl;
        }
        nodes += curr;
        //b.undoMove(moves[i]);
        b.undoLast();
    }
    return nodes;
}
