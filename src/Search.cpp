#include "Board.h"
#include "MoveGenerator.h"

#define MATE (69000);

// 10 MiB PV table size
static const int PV_SIZE = 0xA00000;

static void checkUp() {
    // TODO: Check if time is up
    // or interrupted by GUI
}

void init_PVtable(pvtable_t *table) {
    table->no_entries = PV_SIZE / sizeof(pventry_t) - 1;
    if (table->pvtable != nullptr) {
        delete[] table->pvtable;
    }
    // allocate the space for the table
    table->pvtable = new pventry_t[table->no_entries]();
}

// Detect whether the current board state has been seen before on the board stack

// TODO: Can use the fiftyMoveRule counter to optimize this
// since we don't need to search the *entire* history
static bool isRepetition(Board& b) {
    std::vector<undo_t>& hist = b.boardHistory;
    int i = 0, n = hist.size();
    for (; i < n - 1; i++) {
        if (hist[i].posKey == b.posKey) {
            return true;
        }
    }
    return false;
}

void storePvMove(const Board& b, const move_t move) {
    // we use the posKey as a hash into our table!
    int key = b.posKey % b.PVtable.no_entries;
    b.PVtable.pvtable[key].move = move;
    b.PVtable.pvtable[key].posKey = b.posKey;
}

move_t checkPvTable(Board& b) {
    int key = b.posKey % b.PVtable.no_entries;
    if (b.PVtable.pvtable[key].posKey == b.posKey) {
        return b.PVtable.pvtable[key].move;
    }
    return NULLMV;
}

bool moveExists(Board& b, move_t m) {
    std::vector<move_t> moves = generateMoves(b);
    for (move_t& move : moves) {
        // Check if legal move
        if (!b.makeMove(move)) {
            continue;
        }
        b.undoMove(move);
        // Check if move is the move m we're looking for
        if (move == m) {
            return true;
        }
    }
    // m wasn't found, hence m isn't a valid move
    return false;
}

int getPV(Board& b, const int depth) {
    move_t move = checkPvTable(b);
    int currDepth = 0;

    b.pv.clear();
    while (move != NULLMV && currDepth < depth) {
        if (moveExists(b, move)) {
            b.makeMove(move);
            b.pv.emplace_back(move);
            currDepth++;
        } else {
            break;
        }
        move = checkPvTable(b);
    }

    // Ply starts at 0 when the current position is searched
    while (b.ply > 0) {
        b.undoLast();
    }

    return currDepth;
}

/* Evaluation */

// Piece-square tables

const int PawnTable[64] = {
     0,   0,   0,   0,   0,   0,   0,   0,
    10,  10,   0, -10, -10,   0,  10,  10,
     5,   0,   0,   5,   5,   0,   0,   5,
     0,   0,  10,  20,  20,  10,   0,   0,
     5,   5,   5,  10,  10,   5,   5,   5,
    10,  10,  10,  20,  20,  10,  10,  10,
    20,  20,  20,  30,  30,  20,  20,  20,
     0,   0,   0,   0,   0,   0,   0,   0
};

const int KnightTable[64] = {
     0, -10,   0,   0,   0,   0, -10,   0,
     0,   0,   0,   5,   5,   0,   0,   0,
     0,   0,  10,  10,  10,  10,   0,   0,
     0,   0,  10,  20,  20,  10,   5,   0,
     5,  10,  15,  20,  20,  15,  10,   5,
     5,  10,  10,  20,  20,  10,  10,   5,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0
};

const int BishopTable[64] = {
     0,   0, -10,   0,   0, -10,   0,   0,
     0,   0,   0,  10,  10,   0,   0,   0,
     0,   0,  10,  15,  15,  10,   0,   0,
     0,  10,  15,  20,  20,  15,  10,   0,
     0,  10,  15,  20,  20,  15,  10,   0,
     0,   0,  10,  15,  15,  10,   0,   0,
     0,   0,   0,  10,  10,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0
};

const int RookTable[64] = {
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
    25,  25,  25,  25,  25,  25,  25,  25,
     0,   0,   5,  10,  10,   5,   0,   0
};

// Table for mirroring the piece square table
const int Mirror64[64] = {
    63, 62, 61, 60, 59, 58, 57, 56,
    55, 54, 53, 52, 51, 50, 49, 48,
    47, 46, 45, 44, 43, 42, 41, 40,
    39, 38, 37, 36, 35, 34, 33, 32,
    31, 30, 29, 28, 27, 26, 25, 24,
    23, 22, 21, 20, 19, 18, 17, 16,
    15, 14, 13, 12, 11, 10, 9,  8,
    7,  6,  5,  4,  3,  2,  1,  0
};

/* Pick the highest scoring move according to heuristics */
static void pickNextMove(int moveIdx, std::vector<move_t>& moves) {
    // swaps the move at moveIdx with the best move in moves
    int idx = moveIdx;
    int bestScore = 0;
    int bestIdx = moveIdx;

    for (; idx < moves.size(); ++idx) {
        int score = getScore(moves[idx]);
        if (score > bestScore) {
            bestScore = score;
            bestIdx = idx;
        }
    }
    // Swap the two moves
    move_t tmp;
    tmp = moves[moveIdx];
    moves[moveIdx] = moves[bestIdx];
    moves[bestIdx] = tmp;
}

// Evaluates the position from the side's POV
int evaluate(Board& b) {
    using namespace Piece;
    //          White           Black
    int score = b.material[1] - b.material[0];
    int delta = 0;
    piece* board = b.board;
    for (square_t s = A1; s <= H8; ++s) {
        piece p = board[s];
        if (p != None) {

            switch (PieceType(p)) {
                case Pawn: {
                    if (IsColour(p, White)) {
                        delta = PawnTable[s];
                    } else {
                        delta = -PawnTable[Mirror64[s]];
                    }
                    break;
                }
                case Knight: {
                    if (IsColour(p, White)) {
                        delta = KnightTable[s];
                    } else {
                        delta = -KnightTable[Mirror64[s]];
                    }
                    break;
                }
                case Rook: {
                    if (IsColour(p, White)) {
                        delta = RookTable[s];
                    } else {
                        delta = -RookTable[Mirror64[s]];
                    }
                    break;
                }
                case Bishop: {
                    if (IsColour(p, White)) {
                        delta = BishopTable[s];
                    } else {
                        delta = -BishopTable[Mirror64[s]];
                    }
                    break;
                }
                // TODO: Tune this
                case Queen: {
                    if (IsColour(p, White)) {
                        delta = (BishopTable[s] + RookTable[s]) / 2;
                    } else {
                        delta = -(BishopTable[Mirror64[s]] + RookTable[Mirror64[s]]) / 2;
                    }
                    break;
                }
                default: {
                    break;
                }
            }
            score += delta;
        }
    }
    return (b.turn == Piece::White) ? score : -score;
}



void clearForSearch(Board& b, searchinfo_t *info) {
    b.ply = 0;

    int i = 0, j = 0;
    // Clear history heuristic table
    for (; i < 24; ++i) {
        for (; j < 64; ++j) {
            b.historyH[i][j] = 0;
        }
    }

    // Clear killer heuristic table
    i = 0;
    for (; i < 64; ++i) {
        b.killersH[0][i] = b.killersH[1][i] = 0;
    }

    info->fh = 0;
    info->fhf = 0;
	info->stopped = 0;
	info->nodes = 0;
}

static int quiescenceSearch(Board& b, searchinfo_t, int alpha, int beta) {
    // TODO: Implement
    return 0;
}

static int alphaBeta(Board& b, searchinfo_t *info, int alpha, int beta, int depth, bool canDoNull) {

    info->nodes++;

    if (depth <= 0) {
        int a = evaluate(b);
        return a;
    }

    // Check if position is a draw
    // TODO: Handle the fifyMoveCounter here: || b.fiftyMoveCounter >= 100
    if (isRepetition(b)) {
        return 0;
    }

    // Generate pseudolegal moves
    std::vector<move_t> moves = generateMoves(b);
    size_t moveIdx = 0;
    int legal = 0;
    int oldAlpha = alpha;
    move_t bestMv = NULLMV;
    int score = INT32_MIN;

    // Heuristic: start searching from pv moves
    move_t pvMv = checkPvTable(b);

    if (pvMv != NULLMV) {
        for (; moveIdx < moves.size(); ++moveIdx) {
            if (moves[moveIdx] == pvMv) {
                // search this move first
                moves[moveIdx] = setScore(moves[moveIdx], 60000);
                break;
            }
        }
    }

    for (moveIdx = 0; moveIdx < moves.size(); ++moveIdx) {
        // pick best scoring move (according to heuristic)
        pickNextMove(moveIdx, moves);

        if (!b.makeMove(moves[moveIdx])) continue;
        legal++;
        score = -alphaBeta(b, info, -beta, -alpha, depth - 1, true);
        b.undoMove(moves[moveIdx]);

        if (score > alpha) {
            if (score >= beta) {
                /* Beta cutoff */
                if (legal == 1) {
                    info->fhf++;
                }
                info->fh++;

                // Killer moves (cause a beta cutoff but aren't capture)
                if (!isCapture(moves[moveIdx])) {
                    b.killersH[1][b.ply] = b.killersH[0][b.ply];
                    b.killersH[0][b.ply] = moves[moveIdx];
                }
                return beta;
            }
            alpha = score;
            bestMv = moves[moveIdx];

            // History heuristic
            if (!isCapture(bestMv)) {
                b.historyH[b.board[getFrom(bestMv)]][getTo(bestMv)] += depth;
            }
        }
    }

    // Detect mate / stalemate
    if (!legal) {
        if (b.SquareAttacked(b.kingSquare[b.turn == Piece::White], OPPONENT(b.turn))) {
            return b.ply - MATE;
        } else {
            return 0; // stalemate
        }
    }

    if (alpha != oldAlpha) {
        storePvMove(b, bestMv);
    }

    return alpha;
}

// Searches the position defined by Board b
void search(Board& b, searchinfo_t *info) {
    move_t bestMv = NULLMV;
    int bestScore = INT32_MIN; // - Infinity
    int currDepth = 0;
    int pvMoves = 0;
    int pvNum = 0;
    clearForSearch(b, info);

    // Iterative Deepening
    for (currDepth = 1; currDepth <= info->depth; ++currDepth) {
        bestScore = alphaBeta(b, info, -INT32_MAX, +INT32_MAX, currDepth, true);
        pvMoves = getPV(b, currDepth);
        bestMv = b.pv[0];
        printf("Depth:%d score:%d move:%s nodes:%lld ",
                currDepth, bestScore, toString(bestMv).c_str(), info->nodes);

        // TODO:
        pvMoves = getPV(b, currDepth);
        printf("pv");
        for (pvNum = 0; pvNum < pvMoves; ++pvNum) {
            printf(" %s", toString(b.pv[pvNum]).c_str());
        }
        printf("\n");
        printf("Ordering:%.2f\n", (info->fhf/info->fh));
    }

}
