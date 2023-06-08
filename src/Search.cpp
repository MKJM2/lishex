#include "Bitboard.h"
#include "Board.h"
#include "MoveGenerator.h"

#define MATE (69000);

// 10 MiB PV table size
static const int PV_SIZE = 0xA00000;

#ifdef WIN32
#include "windows.h"
#else
#include "sys/time.h"
#include "sys/select.h"
#include "unistd.h"
#include "string.h"
#endif

// http://home.arcor.de/dreamlike/chess/
// + VICE by Bluefever Software
int inputWaiting()
{
#ifndef WIN32
  fd_set readfds;
  struct timeval tv;
  FD_ZERO (&readfds);
  FD_SET (fileno(stdin), &readfds);
  tv.tv_sec=0; tv.tv_usec=0;
  select(16, &readfds, 0, 0, &tv);

  return (FD_ISSET(fileno(stdin), &readfds));
#else
   static int init = 0, pipe;
   static HANDLE inh;
   DWORD dw;

   if (!init) {
     init = 1;
     inh = GetStdHandle(STD_INPUT_HANDLE);
     pipe = !GetConsoleMode(inh, &dw);
     if (!pipe) {
        SetConsoleMode(inh, dw & ~(ENABLE_MOUSE_INPUT|ENABLE_WINDOW_INPUT));
        FlushConsoleInputBuffer(inh);
      }
    }
    if (pipe) {
      if (!PeekNamedPipe(inh, NULL, 0, NULL, &dw, NULL)) return 1;
      return dw;
    } else {
      GetNumberOfConsoleInputEvents(inh, &dw);
      return dw <= 1 ? 0 : dw;
	}
#endif
}

void readInput(searchinfo_t *info) {
  int             bytes;
  char            input[256] = "", *endc;
    if (inputWaiting()) {
        fflush(stdout);
        info->stopped = true;
        do {
            bytes=read(fileno(stdin),input,256);
        } while (bytes<0);
        endc = strchr(input,'\n');
        if (endc) *endc=0;

        if (strlen(input) > 0) {
            if (!strncmp(input, "quit", 4))    {
                info->quit = true;
            }
        }
        return;
    }
}

static void checkUp(searchinfo_t *info) {
    // Check if time is up
    if (info->timeSet && getTime() > info->endTime) {
        info->stopped = true;
    }

    // Check if interrupted by GUI
    readInput(info);
}

void init_PVtable(pvtable_t *table) {
    table->no_entries = PV_SIZE / sizeof(pventry_t);
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

void storePvMove(Board& b, const move_t move) {
    // we use the posKey as a hash into our table!
    int key = b.posKey % b.PVtable.no_entries;
    b.PVtable.pvtable[key].move = move;
    b.PVtable.pvtable[key].posKey = b.posKey;
}

move_t checkPvTable(const Board& b) {
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
        /*
        Warning: moves from the generator might be scored
        differently than a move m that was e.g.
        chosen for the primary variation, hence
        a simple == comparison might fail
        */
        if (movecmp(move, m)) {
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

// TODO: Move to a separate file

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


// Pass and isolated pawn
const int pawnIsolated = -10;
// Indexed by rank, i.e. the closer to promoting, the higher the bonus
const int pawnPassed[8] = {0, 5, 10, 20, 35, 60, 100, 200};
// Bonus for having two bishops on board
const int bishopPair = 30;
// Bonuses for rooks/queens on open/semi-open files
const int rookOpenFile = 10;
const int rookSemiOpenFile = 5;
const int queenOpenFile = 5;
const int queenSemiOpenFile = 3;


/* Pick the highest scoring move according to heuristics */
static void pickNextMove(size_t moveIdx, std::vector<move_t>& moves) {
    // swaps the move at moveIdx with the best move in moves
    size_t idx = moveIdx;
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
static int evaluate2(Board& b) {
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
// */
static int evaluate(Board& b) {
    using namespace Piece;
    //          White           Black
    int score = b.material[1] - b.material[0];
    //printf("%d: White: %d Black %d\n", score, b.material[1], b.material[0]);
    square_t sq;
    int i;

    piece p = White | Pawn;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        score += PawnTable[sq];
        //printf("+%d: white pawn on %s\n", PawnTable[sq], toString(sq).c_str());
        if ((b.pawns[1] & isolatedMask[sq]) == 0) {
            // Add in isolated pawn penalty
            score += pawnIsolated;
        }
        if ((wPassedMask[sq] & b.pawns[0]) == 0) {
            // Add in pass pawn bonus
            score += pawnPassed[SquareRank(sq)];
        }
    }

    p = Black | Pawn;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        score -= PawnTable[Mirror64[sq]];
        //printf("-%d: black pawn on %s\n", PawnTable[Mirror64[sq]], toString(sq).c_str());
        if ((b.pawns[0] & isolatedMask[sq]) == 0) {
            // Add in isolated pawn penalty
            score -= pawnIsolated;
        }
        if ((bPassedMask[sq] & b.pawns[1]) == 0) {
            // Add in pass pawn bonus
            score -= pawnPassed[SquareRank(sq, Black)];
        }
    }

    p = White | Knight;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        score += KnightTable[sq];
        //printf("+%d: white knight on %s\n", KnightTable[sq], toString(sq).c_str());
    }

    p = Black | Knight;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        score -= KnightTable[Mirror64[sq]];
        //printf("-%d: black knight on %s\n", KnightTable[Mirror64[sq]], toString(sq).c_str());
    }

    p = White | Bishop;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        score += BishopTable[sq];
        //printf("+%d: white bishop on %s\n", BishopTable[sq], toString(sq).c_str());
    }

    p = Black | Bishop;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        score -= BishopTable[Mirror64[sq]];
        //printf("-%d: black bishop on %s\n", BishopTable[Mirror64[sq]], toString(sq).c_str());
    }

    p = White | Rook;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        score += RookTable[sq];
        //printf("+%d: white rook on %s\n", RookTable[sq], toString(sq).c_str());
        if (!(b.pawns[BOTH] & fileBBMask[SquareFile(sq)])) {
            score += rookOpenFile;
        } else if (!(b.pawns[1] & fileBBMask[SquareFile(sq)])) {
            score += rookSemiOpenFile;
        }
    }

    p = Black | Rook;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        score -= RookTable[Mirror64[sq]];
        //printf("-%d: black rook on %s\n", RookTable[Mirror64[sq]], toString(sq).c_str());
        if (!(b.pawns[BOTH] & fileBBMask[SquareFile(sq)])) {
            score -= rookOpenFile;
        } else if (!(b.pawns[0] & fileBBMask[SquareFile(sq)])) {
            score -= rookSemiOpenFile;
        }
    }

    p = White | Queen;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        //int delta= (BishopTable[sq] + RookTable[sq]) >> 1;
        //score += delta;
        //printf("+%d: white queen on %s\n", delta, toString(sq).c_str());
        if (!(b.pawns[BOTH] & fileBBMask[SquareFile(sq)])) {
            score += queenOpenFile;
        } else if (!(b.pawns[1] & fileBBMask[SquareFile(sq)])) {
            score += queenSemiOpenFile;
        }
    }

    p = Black | Queen;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = Mirror64[b.pieceList[p][i]];
        //int delta = (BishopTable[sq] + RookTable[sq]) >> 1;
        //score -= delta;
        //printf("-%d: black queen on %s\n", delta, toString(sq).c_str());
        if (!(b.pawns[BOTH] & fileBBMask[SquareFile(sq)])) {
            score -= queenOpenFile;
        } else if (!(b.pawns[0] & fileBBMask[SquareFile(sq)])) {
            score -= queenSemiOpenFile;
        }
    }

    // Bonus score for a bishop pair
    if (b.pceCount[1] >= 2) {
        score += bishopPair;
    }
    if (b.pceCount[0] >= 2) {
        score -= bishopPair;
    }


    return (b.turn == White) ? score : -score;
}



void clearForSearch(Board& b, searchinfo_t *info) {
    int i, j;
    // Clear history heuristic table
    for (i = 0; i < 24; ++i) {
        for (j = 0; j < 64; ++j) {
            b.historyH[i][j] = 0;
        }
    }

    // Clear killer heuristic table
    for (i = 0; i < 64; ++i) {
        b.killersH[0][i] = b.killersH[1][i] = 0;
    }

    b.ply = 0;

    info->fh = 0;
    info->fhf = 0;
	info->stopped = 0;
	info->nodes = 0;
}

static int quiescenceSearch(Board& b, searchinfo_t *info, int alpha, int beta) {

    if ((info->nodes & 4095) == 0) {
        checkUp(info);
    }

    info->nodes++;

    // || b.fiftyMove >= 100
	if(isRepetition(b)) {
		return 0;
	}
    int score = evaluate(b);

	if(score >= beta) {
		return beta;
	}

	if(score > alpha) {
		alpha = score;
	}

    std::vector<move_t> captures = generateCaptures(b);
    size_t moveIdx;
    int legal = 0;
	score = INT32_MIN;

	for (moveIdx = 0; moveIdx < captures.size(); ++moveIdx) {
		pickNextMove(moveIdx, captures);
        if (!b.makeMove(captures[moveIdx]))  {
            continue;
        }
        legal++;
        // update score
        score = -quiescenceSearch(b, info, -beta, -alpha);
        b.undoMove(captures[moveIdx]);

        if (info->stopped) {
            // stop the search
            return 0;
        }

		if (score > alpha) {
			if (score >= beta) {
				if (legal == 1) {
					info->fhf++;
				}
				info->fh++;
				return beta;
			}
			alpha = score;
		}
    }
	return alpha;
}

static int alphaBeta(Board& b, searchinfo_t *info, int alpha, int beta, int depth, bool canDoNull) {


    if (depth <= 0) {
        return quiescenceSearch(b,info, alpha, beta);
    }

    if ((info->nodes & 2047) == 0) {
        checkUp(info);
    }

    info->nodes++;

    // Check if position is a draw
    // TODO: Handle the fifyMoveCounter here: || b.fiftyMoveCounter >= 100
    if (isRepetition(b) && b.ply) {
        return 0;
    }

    // Check search extension
    bool inCheck = b.inCheck(b.turn);
    if (inCheck) {
        ++depth;
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
        // pick best scoring move (according to heuristics)
        pickNextMove(moveIdx, moves);

        if (!b.makeMove(moves[moveIdx])) continue;
        legal++;
        score = -alphaBeta(b, info, -beta, -alpha, depth - 1, true);
        b.undoMove(moves[moveIdx]);

        if (info->stopped) {
            // stop the search
            return 0;
        }

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
                b.historyH[b.board[getFrom(bestMv)]][getTo(bestMv)] += depth * depth;
            }
        }
    }

    // Detect mate / stalemate
    if (!legal) {
        if (inCheck) {
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
    int bestScore = -INT32_MAX; // - Infinity
    int currDepth = 0;
    int pvMoves = 0;
    int pvNum = 0;
    clearForSearch(b, info);

    // Iterative Deepening
    for (currDepth = 1; currDepth <= info->depth; ++currDepth) {
        bestScore = alphaBeta(b, info, -INT32_MAX, INT32_MAX, currDepth, true);

        if (info->stopped) {
            break;
        }
        pvMoves = getPV(b, currDepth);
        bestMv = b.pv[0];
        printf("info score cp %d  depth %d nodes %lld time %lu ",
                bestScore, currDepth, info->nodes, getTime() - info->startTime);

        // TODO:
        //pvMoves = getPV(b, currDepth);
        printf("pv");
        for (pvNum = 0; pvNum < pvMoves; ++pvNum) {
            printf(" %s", toString(b.pv[pvNum]).c_str());
        }
        printf("\n");
        //printf("Ordering:%.2f\n", (info->fhf/info->fh));
        fflush(stdout);
    }

    // info score cp 13  depth 1 nodes 13 time 15 pv f1b5

    // best move seen so far (even if search stopped)
    printf("bestmove %s\n", toString(bestMv).c_str());


}

// Debug: Testing Mirror 64 and whether the eval is symmetric
void mirrorEvalTest(Board& b) {
    //b.reset();
    //b.readFEN("8/p6k/6p1/5p2/P4K2/8/5pB1/8 b - - 2 62");
    b.print();
    int ev1 = evaluate(b);
    printf("Eval: %d\n", ev1);
    b.mirror();
    b.print();
    int ev2 = evaluate(b);
    printf("Eval: %d\n", ev2);
    if (ev1 != ev2) {
        printf("Test failed!!!\n");
    }
}
