#include "MoveGenerator.h"

using namespace Piece;

/* MVV-LVA heuristic */

// score of a victim, by piece type
const int VictimScore[24] = {
      0, // None
    600, // King (never actually captured)
    100, // Pawn
    200, // Knight
      0, // -
    300, // Bishop
    400, // Rook
    500, // Queen
      0,
    600, // White King
    100, // White Pawn
    200, // White Knight
      0, // -
    300, // White Bishop
    400, // White Rook
    500, // White Queen
      0,
    600, // Black King
    100, // Black Pawn
    200, // Black Knight
      0, // -
    300, // Black Bishop
    400, // Black Rook
    500  // Black Queen
};

static const int loopSlideIdx[2] = {4, 0};
static const int loopNonSlideIdx[2] = {3, 0};

static const int loopSlidePiece[8] = {wB, wR, wQ, 0, bB, bR, bQ, 0};
static const int loopNonSlidePiece[6] = {wN, wK, 0, bN, bK, 0};

static int MVVLVA[24][24];

void initMVVLVA() {
  using namespace Piece;
  piece attacker;
  piece victim;
  for (attacker = wK; attacker <= bQ; ++attacker) {
    for (victim = wK; victim <= bQ; ++victim) {
        MVVLVA[victim][attacker] =
            VictimScore[victim] + 6 - (VictimScore[attacker] / 100);
    }
  }
}

/* Heuristic values
 *
 * Capture  +50000
 * Killer 1 +45000
 * Killer 2 +40000
 * History  +search depth
 */

inline static void addQuiet(const move_t m, movelist_t* moves, const Board& b) {
    assert(b.check());
    assert(IsOK(getFrom(m)));
    assert(IsOK(getTo(m)));
    if (movecmp(m, b.killersH[0][b.ply])) {
        moves->push_back(setScore(m, 45000));
    } else if (movecmp(m, b.killersH[1][b.ply])) {
        moves->push_back(setScore(m, 40000));
    } else {
        moves->push_back(setScore(m, b.historyH[b.board[getFrom(m)]][getTo(m)]));
    }
}

inline static void addCapture(const move_t m, movelist_t* moves, const Board& b) {
    assert(b.check());
    assert(IsOK(getFrom(m)));
    assert(IsOK(getTo(m)));
    moves->push_back(setScore(m, MVVLVA[b.board[getTo(m)]][b.board[getFrom(m)]] + 50000));
}

inline static void addEnPassant(const square_t from, const square_t to, movelist_t* moves) {
    assert(IsOK(from));
    assert(IsOK(to));
    assert(SquareRank(to) == 2 || SquareRank(to) == 5);
    // Here, MVVLVA[Pawn][Pawn] = 105, and since that's always the case for en passant
    // we simply hardcode it (+50000 for Capture, see above)
    moves->push_back(Move(from, to, EpCapture, 105 + 50000));
}

inline static void addPawnPush(const square_t from, const square_t to, movelist_t* moves, const Board& b) {
    assert(b.check());
    assert(IsOK(from));
    assert(IsOK(to));
    if (SquareRank(to, b.turn) == 7) {
        addQuiet(Move(from, to, QueenPromo, 0),  moves, b);
        addQuiet(Move(from, to, RookPromo, 0),   moves, b);
        addQuiet(Move(from, to, BishopPromo, 0), moves, b);
        addQuiet(Move(from, to, KnightPromo, 0), moves, b);
    } else {
        addQuiet(Move(from, to, Quiet, 0), moves, b);
    }
}

inline static void addPawnCapture(const square_t from, const square_t to, movelist_t* moves, const Board& b) {
    assert(b.check());
    assert(IsOK(from));
    assert(IsOK(to));
    int score = MVVLVA[b.board[to]][b.board[from]];
    if (SquareRank(to, b.turn) == 7) {
        moves->push_back(Move(from, to, QueenPromo  | Capture, score + 50000));
        moves->push_back(Move(from, to, RookPromo   | Capture, score + 50000));
        moves->push_back(Move(from, to, BishopPromo | Capture, score + 50000));
        moves->push_back(Move(from, to, KnightPromo | Capture, score + 50000));
    } else {
        moves->push_back(Move(from, to, Capture, score + 50000));
    }
}

void generateMoves(Board& b, movelist_t* moves) {
    assert(b.check());

    piece* board = b.board; // array of pieces
    int me = b.turn;
    int opp = OPPONENT(b.turn);
    square_t to, from;

    //std::vector<move_t> moves;
    // add pawn moves
    if (me == White) {
        // Handle pawn moves
        int dir;
        for (int pawnIdx = 0; pawnIdx < b.pceCount[wP]; ++pawnIdx) {
            from = b.pieceList[wP][pawnIdx];
            assert(IsOK(from));
            dir = pawnDest[me == White];
            assert(dir == N);
            to = from + dir;
            if (board[to] == None) {
                addPawnPush(from, to, moves, b);
                if (SquareRank(from, me) == 1 && board[to + dir] == None) {
                    addQuiet(Move(from, to + dir, DoublePawnPush, 0), moves, b);
                }
            }

            // Check if pawn can capture diagonally to west
            square_t captureL = from + dir - 1;
            if (IsOK(captureL) && dist[captureL][from] <= 2 && IsColour(board[captureL], Black)) {
                assert(IsOK(captureL));
                addPawnCapture(from, captureL, moves, b);
            }
            // Check if pawn can capture diagonally to the east
            square_t captureR = from + dir + 1;
            if (IsOK(captureR) && dist[captureR][from] <= 2 && IsColour(board[captureR], Black)) {
                assert(IsOK(captureR));
                addPawnCapture(from, captureR, moves, b);
            }
            // Check if can perform en passant
            // std::cout << "google en passant" << std::endl;
            if (b.epSquare != NO_SQ) {
                if (captureL == b.epSquare && dist[captureL][from] <= 2) {
                    assert(IsOK(captureL));
                    addEnPassant(from, captureL, moves);
                }
                if (captureR == b.epSquare && dist[captureR][from] <= 2) {
                    assert(IsOK(captureR));
                    addEnPassant(from, captureR, moves);
                }
            }
        } // pawns for-loop

        // Handle castling
        if (b.castlePerm & b.WKCastle) {
            if (board[F1] == None && board[G1] == None) {
                if (!b.SquareAttacked(E1, Black) && !b.SquareAttacked(F1, Black)) {
                    addQuiet(Move(E1, G1, KingCastle, 0), moves, b);
                }
            }
        }
        if (b.castlePerm & b.WQCastle) {
            if (board[D1] == None && board[C1] == None && board[B1] == None) {
                if (!b.SquareAttacked(E1, Black) && !b.SquareAttacked(D1, Black)) {
                    addQuiet(Move(E1, C1, QueenCastle, 0), moves, b);
                }
            }
        }

    } else { // turn == Black

        // Handle pawn moves
        int dir;
        for (int pawnIdx = 0; pawnIdx < b.pceCount[bP]; ++pawnIdx) {
            from = b.pieceList[bP][pawnIdx];
            assert(IsOK(from));
            dir = pawnDest[me == White]; // == pawnDest[0]
            assert(dir == S);
            to = from + dir;
            if (board[to] == None) {
                addPawnPush(from, to, moves, b);
                if (SquareRank(from, me) == 1 && board[to + dir] == None) {
                    addQuiet(Move(from, to + dir, DoublePawnPush, 0), moves, b);
                }
            }

            // Check if pawn can capture diagonally to west
            square_t captureL = from + dir + 1;
            if (IsOK(captureL) && dist[captureL][from] <= 2 && IsColour(board[captureL], White)) {
                assert(IsOK(captureL));
                addPawnCapture(from, captureL, moves, b);
            }
            // Check if pawn can capture diagonally to the east
            square_t captureR = from + dir - 1;
            if (IsOK(captureR) && dist[captureR][from] <= 2 && IsColour(board[captureR], White)) {
                assert(IsOK(captureR));
                addPawnCapture(from, captureR, moves, b);
            }
            // Check if can perform en passant
            // std::cout << "google en passant" << std::endl;
            if (b.epSquare != NO_SQ) {
                if (dist[captureL][from] <= 2 && captureL == b.epSquare) {
                    assert(IsOK(captureL));
                    addEnPassant(from, captureL, moves);
                }
                if (dist[captureR][from] <= 2 && captureR == b.epSquare) {
                    assert(IsOK(captureR));
                    addEnPassant(from, captureR, moves);
                }
            }
        } // pawns for-loop

        // Handle castling
        if (b.castlePerm & b.BKCastle) {
            if (board[F8] == None && board[G8] == None) {
                if (!b.SquareAttacked(E8, White) && !b.SquareAttacked(F8, White)) {
                    addQuiet(Move(E8, G8, KingCastle, 0), moves, b);
                }
            }
        }
        if (b.castlePerm & b.BQCastle) {
            if (board[D8] == None && board[C8] == None && board[B8] == None) {
                if (!b.SquareAttacked(E8, White) && !b.SquareAttacked(D8, White)) {
                    addQuiet(Move(E8, C8, QueenCastle, 0), moves, b);
                }
            }
        }

    } // endif

    /* Handle sliding pieces */
    int pieceIdx = loopSlideIdx[me == White];
    piece p = loopSlidePiece[pieceIdx++];
    while (p) {
        assert(p >= wK && p <= bQ);

        for (int i = 0; i < b.pceCount[p]; ++i) {
            from = b.pieceList[p][i];
            assert(IsOK(from));
            int dir;
            for (int j = 0; j < numDest[p]; ++j) {
                dir = pieceDest[p][j];
                to = from + dir;
                while (IsOK(to) && dist[to][to - dir] <= 2) {
                    if (board[to] != None) {
                        if (IsColour(board[to], opp)) {
                            addCapture(Move(from, to, 0, 0), moves, b);
                        }
                        break;
                    }
                    addQuiet(Move(from, to, 0, 0), moves, b);
                    to += dir;
                }
            }
        }
        p = loopSlidePiece[pieceIdx++];
    }

    /* Handle non-sliding pieces */
    pieceIdx = loopNonSlideIdx[me == White];
    p = loopNonSlidePiece[pieceIdx++];
    while (p) {
        assert(p >= wK && p <= bQ);
        for (int i = 0; i < b.pceCount[p]; ++i) {
            from = b.pieceList[p][i];
            assert(IsOK(from));
            int dir;
            for (int j = 0; j < numDest[p]; ++j) {
                dir = pieceDest[p][j];
                to = from + dir;
                if (dist[from][to] > 2 || !IsOK(to)) {
                    continue;
                }
                if (board[to] != None) {
                    if (IsColour(board[to], opp)) {
                        addCapture(Move(from, to, 0, 0), moves, b);
                    }
                    continue;
                }
                addQuiet(Move(from, to, 0, 0), moves, b);
            }
        }
        p = loopNonSlidePiece[pieceIdx++];
    } // end while

    assert(b.check());
}

/* For quiescence search */
void generateCaptures(Board& b, movelist_t* moves) {
    assert(b.check());

    piece* board = b.board; // array of pieces
    int me = b.turn;
    int opp = OPPONENT(b.turn);
    square_t to, from;

    //std::vector<move_t> moves;
    // add pawn moves
    if (me == White) {
        // Handle pawn moves
        int dir;
        for (int pawnIdx = 0; pawnIdx < b.pceCount[wP]; ++pawnIdx) {
            from = b.pieceList[wP][pawnIdx];
            assert(IsOK(from));
            dir = pawnDest[me == White];
            assert(dir == N);

            // Check if pawn can capture diagonally to west
            square_t captureL = from + dir - 1;
            if (IsOK(captureL) && dist[captureL][from] <= 2 && IsColour(board[captureL], Black)) {
                assert(IsOK(captureL));
                addPawnCapture(from, captureL, moves, b);
            }
            // Check if pawn can capture diagonally to the east
            square_t captureR = from + dir + 1;
            if (IsOK(captureR) && dist[captureR][from] <= 2 && IsColour(board[captureR], Black)) {
                assert(IsOK(captureR));
                addPawnCapture(from, captureR, moves, b);
            }
            if (dist[captureL][from] <= 2 && captureR == b.epSquare) {
                assert(IsOK(captureR));
                addEnPassant(from, captureR, moves);
            }
            // Check if can perform en passant
            // std::cout << "google en passant" << std::endl;
            if (dist[captureL][from] <= 2 && captureL == b.epSquare) {
                assert(IsOK(captureL));
                addEnPassant(from, captureL, moves);
            }

        } // pawns for-loop
    } else { // turn == Black

        // Handle pawn moves
        int dir;
        for (int pawnIdx = 0; pawnIdx < b.pceCount[bP]; ++pawnIdx) {
            from = b.pieceList[bP][pawnIdx];
            assert(IsOK(from));
            dir = pawnDest[me == White]; // == pawnDest[0]
            assert(dir == S);

            // Check if pawn can capture diagonally to west
            square_t captureL = from + dir + 1;
            if (IsOK(captureL) && dist[captureL][from] <= 2 && IsColour(board[captureL], White)) {
                assert(IsOK(captureL));
                addPawnCapture(from, captureL, moves, b);
            }
            // Check if pawn can capture diagonally to the east
            square_t captureR = from + dir - 1;
            if (IsOK(captureR) && dist[captureR][from] <= 2 && IsColour(board[captureR], White)) {
                assert(IsOK(captureR));
                addPawnCapture(from, captureR, moves, b);
            }
            // Check if can perform en passant
            // std::cout << "google en passant" << std::endl;
            if (IsOK(captureL) && dist[captureL][from] <= 2 && captureL == b.epSquare) {
                assert(IsOK(captureL));
                addEnPassant(from, captureL, moves);
            }

            if (IsOK(captureR) && dist[captureR][from] <= 2 && captureR == b.epSquare) {
                assert(IsOK(captureR));
                addEnPassant(from, captureR, moves);
            }
        } // pawns for-loop
    } // endif

    /* Handle sliding pieces */
    int pieceIdx = loopSlideIdx[me == White];
    piece p = loopSlidePiece[pieceIdx++];
    while (p) {
        assert(p >= wK && p <= bQ);

        for (int i = 0; i < b.pceCount[p]; ++i) {
            from = b.pieceList[p][i];
            assert(IsOK(from));
            for (int j = 0; j < numDest[p]; ++j) {
                int dir = pieceDest[p][j];
                to = from + dir;
                while (IsOK(to) && dist[to][to - dir] <= 2) {
                    if (board[to] != None) {
                        if (IsColour(board[to], opp)) {
                            addCapture(Move(from, to, 0, 0), moves, b);
                        }
                        break;
                    }
                    to += dir;
                }
            }
        } // endfor
        p = loopSlidePiece[pieceIdx++];
    } // endwhile

    /* Handle non-sliding pieces */
    pieceIdx = loopNonSlideIdx[me == White];
    p = loopNonSlidePiece[pieceIdx++];
    while (p) {
        assert(p >= wK && p <= bQ);
        for (int i = 0; i < b.pceCount[p]; ++i) {
            from = b.pieceList[p][i];
            assert(IsOK(from));
            int dir;
            for (int j = 0; j < numDest[p]; ++j) {
                dir = pieceDest[p][j];
                to = from + dir;
                if (IsOK(to) && dist[from][to] <= 2) {
                    if (board[to] != None) {
                        if (IsColour(board[to], opp)) {
                            addCapture(Move(from, to, 0, 0), moves, b);
                        }
                        continue;
                    }
                }
            }
        } // endfor
        p = loopNonSlidePiece[pieceIdx++];
    } // endwhile

    assert(b.check());
}

/*
std::vector<move_t> generateCaptures(Board& b) {
    assert(b.check());

    piece* board = b.board; // array of pieces
    int me = b.turn;
    int opp = OPPONENT(b.turn);

    std::vector<move_t> moves;
    // add capture moves
    for (square_t from = A1; from <= H8; ++from) {
        piece p = board[from]; // TODO, clean the code up
        if (p != None && IsColour(p, me)) {
            switch (PieceType(p)) {
                case Pawn: {
                    // Generate pawn captures
                    int dir = pawnDest[me == White];
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
                        }
                    }
                    break;
                }
            }
        }
    }
}
*/


unsigned long long perft(Board& b, int depth, bool verbose) {
    if (depth == 0) {
        return 1ULL;
    }
    int n_moves, i, curr;
    unsigned long long nodes = 0;

    movelist_t moves[1];
    generateMoves(b, moves);
    n_moves = moves->size();
    for (i = 0; i < n_moves; i++) {
        if (!b.makeMove(moves->moveList[i])) continue;
        curr = perft(b, depth - 1);
        if (verbose) {
            std::cout << toString(moves->moveList[i]) << " " \
                      << curr << std::endl;
        }
        nodes += curr;
        //b.undoMove(moves[i]);
        b.undoLast();
    }
    return nodes;
}
