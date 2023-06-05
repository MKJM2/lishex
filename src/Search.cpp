#include "Board.h"
#include "MoveGenerator.h"

#define MATE INT32_MAX;

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

void storePvMove(const Board& b, const Move move) {

    // we use the posKey as a hash into our table!
    int key = b.posKey % b.PVtable.no_entries;
    b.PVtable.pvtable[key].move = move;
    b.PVtable.pvtable[key].posKey = b.posKey;
}

Move checkPvTable(Board& b) {
    int key = b.posKey % b.PVtable.no_entries;
    if (b.PVtable.pvtable[key].posKey == b.posKey) {
        return b.PVtable.pvtable[key].move;
    }
    return Move(0, 0); // Null (zero) move
}

bool moveExists(Board& b, Move m) {
    std::vector<Move> moves = generateMoves(b);
    for (Move& move : moves) {
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
    Move move = checkPvTable(b);
    int currDepth = 0;

    while (move != NULLMV && currDepth < depth) {
        if (moveExists(b, move)) {
            b.makeMove(move);
            b.pv.push_back(move);
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

// Evaluates the position from the side's POV
int evaluate(Board& b) {
    // TODO:
    return 0;
}

static void clearForSearch(searchinfo_t *info) {
    memset(info, 0, sizeof(searchinfo_t));
}

static int quiescenceSearch(Board& b, searchinfo_t, int alpha, int beta) {
    // TODO: Implement
    return 0;
}

static int alphaBeta(Board& b, searchinfo_t *info, int alpha, int beta, int depth, bool canDoNull) {

    info->nodes++;

    if (depth == 0) {
        return evaluate(b);
    }

    // Check if position is a draw
    if (isRepetition(b) || b.fiftyMoveCounter >= 100) {
        return 0;
    }

    // Generate pseudolegal moves
    std::vector<Move> moves = generateMoves(b);
    int moveNum = 0, legal = 0;
    int oldAlpha = alpha;
    Move bestMv = NULLMV;
    int score = -INT32_MAX;

    for (; moveNum < moves.size(); ++moveNum) {
        if (!b.makeMove(moves[moveNum])) continue;
        legal++;
        score = -alphaBeta(b, info, -beta, -alpha, depth - 1, true);
        b.undoMove(moves[moveNum]);

        if (score > alpha) {
            if (score >= beta) {
                return beta;
            }
            alpha = score;
            bestMv = moves[moveNum];
        }
    }

    // Detect mate / stalemate
    if (!legal) {
        if (b.SquareAttacked(b.kingSquare[b.turn == Piece::White], OPPONENT(b.turn))) {
            return -MATE + b.ply;
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
    Move bestMv = NULLMV;
    int bestScore = -INT32_MAX; // - Infinity
    int currDepth = 0;
    int pvMoves = 0;
    int pvNum = 0;
    clearForSearch(info);

    // Iterative Deepening
    for (currDepth = 0; currDepth < info->depth; ++currDepth) {
        bestScore = alphaBeta(b, info, -INT32_MAX, +INT32_MAX, currDepth, true);
        pvMoves = getPV(b, currDepth);
        bestMv = b.pv[0];
        printf("Depth:%d score:%d move:%s nodes:%lld ",
                currDepth, bestScore, bestMv.toString().c_str(), info->nodes);

        // TODO:
        //pvMoves = getPV(b, currDepth);
        printf("pv");
        for (pvNum = 0; pvNum < pvMoves; ++pvNum) {
            printf(" %s", b.pv[pvNum].toString().c_str());
        }
        printf("\n");
    }

}
