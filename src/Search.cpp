#include "Bitboard.h"
#include "Board.h"
#include "MoveGenerator.h"

#define MATE (INFINITE-MAX_DEPTH)

#ifndef NO_NMH // null move heuristic
#define DO_NULL (true)
#else
#define DO_NULL (false)
#endif

// 64 MB TT table default size
#define MB 16
static constexpr int HASH_SIZE = 0x100000 * MB;

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
inline int inputWaiting()
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

inline void readInput(searchinfo_t *info) {
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

inline static void checkUp(searchinfo_t *info) {
    // Check if time is up
    if (info->timeSet && getTime() > info->endTime) {
        info->stopped = true;
    }

    // Check if interrupted by GUI
    readInput(info);
}

// Initialize the transposition table
void initTT(hashtable_t *table) {
    table->no_entries = HASH_SIZE / sizeof(hashentry_t);
    table->no_entries -= 2; // for debugging
    if (table->pvtable != nullptr) {
        delete[] table->pvtable;
    }
    // allocate the space for the table
    table->pvtable = new hashentry_t[table->no_entries]();

    // Check if allocated
    if (table->pvtable == nullptr) {
        printf("Transposition table allocation failed\n");
        assert(false);
    } else {
        // Clear the TT
        clearTT(table);
        printf("Allocated TT of size %d with %d entries\n", HASH_SIZE, table->no_entries);
    }

}

// Detect whether the current board state has been seen before on the board stack
//     Can use the fiftyMoveRule counter to optimize this
//     since we don't need to search the *entire* history
inline static bool isRepetition(Board& b) {
    int n = b.boardHistory.size();
    //int i = n - 1 - b.fiftyMoveCounter;
    for (int i = 0; i < n - 1; ++i) {
        if (b.boardHistory[i].posKey == b.posKey) {
            return true;
        }
    }
    return false;
}


// void storePvMove(Board& b, const move_t move) {
//     // we use the posKey as a hash into our table!
//     int key = b.posKey % b.PVtable.no_entries;
//     b.PVtable.pvtable[key].move = move;
//     b.PVtable.pvtable[key].posKey = b.posKey;
// }
inline void storeHashEntry(Board &b, const move_t move, int score, const int flags,
                    const int depth) {
  // we use the posKey as a hash into our TT table
  assert(b.posKey == b.generatePosKey());
  int key = b.posKey % b.TT.no_entries;
  hashentry_t* entry = &b.TT.pvtable[key];

  assert(0 <= key && key < b.TT.no_entries);
  assert(depth >= 1);
  assert(depth < MAX_DEPTH);
  assert(flags >= HFEXACT && flags <= HFBETA);
  assert(b.ply >= 0);
  assert(b.ply < MAX_DEPTH);
  assert(score >= -INFINITE && score <= INFINITE);

  // Check if new write or overwrite (book keeping)
  if (entry->posKey == 0) {
    b.TT.new_writes++;
  } else {
    b.TT.overwrites++;
  }

  // Mate score logic for returning how many plies to mate
  if (score > MATE) score += b.ply;
  else if (score < -MATE) score -= b.ply;

  // Finally, store the entry
  entry->posKey = b.posKey;
  entry->move = move;
  entry->score = score;
  entry->depth = depth;
  entry->flags = flags;
}

inline move_t getPvMove(const Board &b) {
  int key = b.posKey % b.TT.no_entries;
  assert(key >= 0 && key < b.TT.no_entries);
  if (b.TT.pvtable[key].posKey == b.posKey) {
    return b.TT.pvtable[key].move;
  }
  return NULLMV;
}

// Probe TT for an entry for the current position
/* https://web.archive.org/web/20070809015843/www.seanet.com/%7Ebrucemo/topics/hashing.htm
 * TODO: If size of TT is a power of 2, we can quickly find the index (no mod op) with &
 */
inline bool getHashEntry(Board &b, move_t *move, int *score, const int alpha,
                         const int beta, const int depth) {
  // We use the posKey as a hash into our TT table
  int key = b.posKey % b.TT.no_entries;
  hashentry_t *entry = &b.TT.pvtable[key];

  assert(0 <= key && key < b.TT.no_entries);
  assert(depth >= 1);
  assert(alpha < beta);
  assert(b.ply >= 0);
  assert(b.ply < MAX_DEPTH);
  assert(alpha >= -INFINITE && alpha <= INFINITE);
  assert(beta >= -INFINITE && beta <= INFINITE);
  assert(b.posKey == b.generatePosKey());

  // If hit:
  if (entry->posKey == b.posKey) {
    *move = entry->move;
    // If the previous search was at least as deep as current
    if (entry->depth >= depth) {
      b.TT.hit++;

      assert(b.TT.pvtable[key].depth >= 1);
      assert(b.TT.pvtable[key].depth < MAX_DEPTH);
      assert(b.TT.pvtable[key].flags >= HFEXACT);
      assert(b.TT.pvtable[key].flags <= HFBETA);

      *score = entry->score;
      if (*score > MATE)
        *score -= b.ply;
      else if (*score < -MATE)
        *score += b.ply;

      switch (entry->flags) {
        assert(*score >= -INFINITE && *score <= INFINITE);
      case HFEXACT:
        return true;
        break;
      case HFALPHA:
        if (*score <= alpha) {
          *score = alpha;
        }
        return true;
        break;
      case HFBETA:
        if (*score >= beta) {
          *score = beta;
          return true;
        }
        break;
      default:
        // should not happen
        assert(false);
        break;
      }
      return true;
    }
  }
  // Otherwise, if TT not hit:
  return false;
}

bool moveExists(Board &b, move_t m) {
  movelist_t moves[1];
  generateMoves(b, moves);
  //for (const move_t& move : *moves) {
  for (size_t moveIdx = 0; moveIdx < moves->size(); ++moveIdx) {
    // Check if legal move
    if (!b.makeMove(moves->moveList[moveIdx])) {
      continue;
    }
    b.undoMove(moves->moveList[moveIdx]);
    // Check if move is the move m we're looking for
    /*
    Warning: moves from the generator might be scored
    differently than a move m that was e.g.
    chosen for the primary variation, hence
    a simple == comparison might fail

    ^ The reason being that we store the score within the move itself
    */
    if (movecmp(moves->moveList[moveIdx], m)) {
      return true;
    }
  }
  // m wasn't found, hence m isn't a valid move
  return false;
}

inline int getPV(Board& b, const int depth) {
    assert(depth < MAX_DEPTH && depth >= 1);
    //move_t move = checkPvTable(b);
    move_t move = getPvMove(b);
    int count = 0;

    //b.pv.clear();
    while (move != NULLMV && count < depth) {
        assert(count < MAX_DEPTH);
        if (moveExists(b, move)) {
            b.makeMove(move);
            //b.pv.emplace_back(move);
            b.pv[count++] = move; // overwrite instead of emplacing
            //currDepth++;
        } else {
            break;
        }
        move = getPvMove(b);
    }

    // Ply starts at 0 when the current position is searched
    while (b.ply > 0) {
        b.undoLast();
    }

    return count;
}

/* Evaluation */

// TODO: Move to a separate file

// Piece-square tables

const int pawnTable[64] = {
     0,   0,   0,   0,   0,   0,   0,   0,
    10,  10,   0, -10, -10,   0,  10,  10,
     5,   0,   0,   5,   5,   0,   0,   5,
     0,   0,  10,  20,  20,  10,   0,   0,
     5,   5,   5,  10,  10,   5,   5,   5,
    10,  10,  10,  20,  20,  10,  10,  10,
    20,  20,  20,  30,  30,  20,  20,  20,
     0,   0,   0,   0,   0,   0,   0,   0
};

const int knightTable[64] = {
     0, -10,   0,   0,   0,   0, -10,   0,
     0,   0,   0,   5,   5,   0,   0,   0,
     0,   0,  10,  10,  10,  10,   0,   0,
     0,   0,  10,  20,  20,  10,   5,   0,
     5,  10,  15,  20,  20,  15,  10,   5,
     5,  10,  10,  20,  20,  10,  10,   5,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0
};

const int bishopTable[64] = {
     0,   0, -10,   0,   0, -10,   0,   0,
     0,   0,   0,  10,  10,   0,   0,   0,
     0,   0,  10,  15,  15,  10,   0,   0,
     0,  10,  15,  20,  20,  15,  10,   0,
     0,  10,  15,  20,  20,  15,  10,   0,
     0,   0,  10,  15,  15,  10,   0,   0,
     0,   0,   0,  10,  10,   0,   0,   0,
     0,   0,   0,   0,   0,   0,   0,   0
};

const int rookTable[64] = {
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
     0,   0,   5,  10,  10,   5,   0,   0,
    25,  25,  25,  25,  25,  25,  25,  25,
     0,   0,   5,  10,  10,   5,   0,   0
};



const int kingEndgame[64] = {
   -50, -10,   0,   0,   0,   0, -10, -50,
   -10,   0,  10,  10,  10,  10,   0, -10,
     0,  10,  20,  20,  20,  20,  10,   0,
     0,  10,  20,  40,  40,  20,  10,   0,
     0,  10,  20,  40,  40,  20,  10,   0,
     0,  10,  20,  20,  20,  20,  10,   0,
   -10,   0,  10,  10,  10,  10,   0, -10,
   -50, -10,   0,   0,   0,   0, -10, -50
};

const int kingOpening[64] = {
     0,   5,   5, -10, -10,   0,  10,   5,
   -30, -30, -30, -30, -30, -30, -30, -30,
   -50, -50, -50, -50, -50, -50, -50, -50,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70,
   -70, -70, -70, -70, -70, -70, -70, -70
};

#define isEndgame(material) (material <= (1 * Piece::value[Piece::Rook] + \
                                          2 * Piece::value[Piece::Knight] + \
                                          2 * Piece::value[Piece::Pawn] + \
                                          1 * Piece::value[Piece::King]))


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
inline static void pickNextMove(size_t moveIdx, movelist_t* moves) {
    // swaps the move at moveIdx with the best move in moves
    size_t idx = moveIdx;
    int bestScore = 0;
    int bestIdx = moveIdx;
    int score;

    for (; idx < moves->size(); ++idx) {
        score = getScore(moves->moveList[idx]);
        if (score > bestScore) {
            bestScore = score;
            bestIdx = idx;
        }
    }
    assert(moveIdx >= 0 && moveIdx < moves->size());
    assert(bestIdx >= 0 && bestIdx < moves->size());
    assert(bestIdx >= moveIdx);

    // Swap the two moves
    move_t tmp;
    tmp = moves->moveList[moveIdx];
    moves->moveList[moveIdx] = moves->moveList[bestIdx];
    moves->moveList[bestIdx] = tmp;
}

// Evaluates the position from the side's POV
/*
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
                        delta = pawnTable[s];
                    } else {
                        delta = -pawnTable[MIRROR[s]];
                    }
                    break;
                }
                case Knight: {
                    if (IsColour(p, White)) {
                        delta = knightTable[s];
                    } else {
                        delta = -knightTable[MIRROR[s]];
                    }
                    break;
                }
                case Rook: {
                    if (IsColour(p, White)) {
                        delta = rookTable[s];
                    } else {
                        delta = -rookTable[MIRROR[s]];
                    }
                    break;
                }
                case Bishop: {
                    if (IsColour(p, White)) {
                        delta = bishopTable[s];
                    } else {
                        delta = -bishopTable[MIRROR[s]];
                    }
                    break;
                }
                case Queen: {
                    if (IsColour(p, White)) {
                        delta = (bishopTable[s] + rookTable[s]) / 2;
                    } else {
                        delta = -(bishopTable[MIRROR[s]] + rookTable[MIRROR[s]]) / 2;
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
*/


// sjeng 11.2 (adapted from Vice 1.1 by Bluefever Software)
//8/6R1/2k5/6P1/8/8/4nP2/6K1 w - - 1 41
inline bool MaterialDraw(const Board& b) {
    assert(b.check());
    using namespace Piece;
    if (!b.pceCount[wR] && !b.pceCount[bR] && !b.pceCount[wQ] && !b.pceCount[bQ]) {
	  if (!b.pceCount[bB] && !b.pceCount[wB]) {
	      if (b.pceCount[wN] < 3 && b.pceCount[bN] < 3) {  return 1; }
	  } else if (!b.pceCount[wN] && !b.pceCount[bN]) {
	     if (abs(b.pceCount[wB] - b.pceCount[bB]) < 2) { return 1; }
	  } else if ((b.pceCount[wN] < 3 && !b.pceCount[wB]) || (b.pceCount[wB] == 1 && !b.pceCount[wN])) {
	    if ((b.pceCount[bN] < 3 && !b.pceCount[bB]) || (b.pceCount[bB] == 1 && !b.pceCount[bN]))  { return 1; }
	  }
	} else if (!b.pceCount[wQ] && !b.pceCount[bQ]) {
        if (b.pceCount[wR] == 1 && b.pceCount[bR] == 1) {
            if ((b.pceCount[wN] + b.pceCount[wB]) < 2 && (b.pceCount[bN] + b.pceCount[bB]) < 2)	{ return 1; }
        } else if (b.pceCount[wR] == 1 && !b.pceCount[bR]) {
            if ((b.pceCount[wN] + b.pceCount[wB] == 0) && (((b.pceCount[bN] + b.pceCount[bB]) == 1) || ((b.pceCount[bN] + b.pceCount[bB]) == 2))) { return 1; }
        } else if (b.pceCount[bR] == 1 && !b.pceCount[wR]) {
            if ((b.pceCount[bN] + b.pceCount[bB] == 0) && (((b.pceCount[wN] + b.pceCount[wB]) == 1) || ((b.pceCount[wN] + b.pceCount[wB]) == 2))) { return 1; }
        }
    }
  return 0;
}

// */
inline static int evaluate(Board& b) {
    assert(b.check());
    using namespace Piece;
    //          White           Black
    int score = b.material[1] - b.material[0];
    //printf("%d: White: %d Black %d\n", score, b.material[1], b.material[0]);
    square_t sq;
    int i;

    // Check for material draw (assuming optimal play)
	if(!b.pceCount[wP] && !b.pceCount[bP] && MaterialDraw(b)) {
		return 0;
	}

    piece p = White | Pawn;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        score += pawnTable[sq];
        //printf("+%d: white pawn on %s\n", pawnTable[sq], toString(sq).c_str());
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
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        assert(IsOK(MIRROR(sq)));
        assert(MIRROR(sq) == Mirror64[sq]);
        assert(A1 <= MIRROR(sq) && MIRROR(sq) <= H8);
        score -= pawnTable[MIRROR(sq)];
        //printf("-%d: black pawn on %s\n", pawnTable[MIRROR[sq]], toString(sq).c_str());
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
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        score += knightTable[sq];
        //printf("+%d: white knight on %s\n", knightTable[sq], toString(sq).c_str());
    }

    p = Black | Knight;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        assert(IsOK(MIRROR(sq)));
        assert(MIRROR(sq) == Mirror64[sq]);
        assert(A1 <= MIRROR(sq) && MIRROR(sq) <= H8);
        score -= knightTable[MIRROR(sq)];
        //printf("-%d: black knight on %s\n", knightTable[MIRROR[sq]], toString(sq).c_str());
    }

    p = White | Bishop;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        score += bishopTable[sq];
        //printf("+%d: white bishop on %s\n", bishopTable[sq], toString(sq).c_str());
    }

    p = Black | Bishop;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        assert(IsOK(MIRROR(sq)))
        assert(MIRROR(sq) == Mirror64[sq]);
        assert(A1 <= MIRROR(sq) && MIRROR(sq) <= H8);
        score -= bishopTable[MIRROR(sq)];
        //printf("-%d: black bishop on %s\n", bishopTable[MIRROR[sq]], toString(sq).c_str());
    }

    p = White | Rook;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        assert(IsOK(MIRROR(sq)))
        assert(A1 <= MIRROR(sq) && MIRROR(sq) <= H8);
        score += rookTable[sq];
        //printf("+%d: white rook on %s\n", rookTable[sq], toString(sq).c_str());
        if (!(b.pawns[BOTH] & fileBBMask[SquareFile(sq)])) {
            score += rookOpenFile;
        } else if (!(b.pawns[1] & fileBBMask[SquareFile(sq)])) {
            score += rookSemiOpenFile;
        }
    }

    p = Black | Rook;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        assert(IsOK(MIRROR(sq)))
        assert(A1 <= MIRROR(sq) && MIRROR(sq) <= H8);
        score -= rookTable[MIRROR(sq)];
        //printf("-%d: black rook on %s\n", rookTable[MIRROR[sq]], toString(sq).c_str());
        if (!(b.pawns[BOTH] & fileBBMask[SquareFile(sq)])) {
            score -= rookOpenFile;
        } else if (!(b.pawns[0] & fileBBMask[SquareFile(sq)])) {
            score -= rookSemiOpenFile;
        }
    }

    p = White | Queen;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        //printf("+%d: white queen on %s\n", delta, toString(sq).c_str());
        if (!(b.pawns[BOTH] & fileBBMask[SquareFile(sq)])) {
            score += queenOpenFile;
        } else if (!(b.pawns[1] & fileBBMask[SquareFile(sq)])) {
            score += queenSemiOpenFile;
        }
    }

    p = Black | Queen;
    for (i = 0; i < b.pceCount[p]; ++i) {
        sq = b.pieceList[p][i];
        assert(IsOK(sq));
        assert(A1 <= sq && sq <= H8);
        //printf("-%d: black queen on %s\n", delta, toString(sq).c_str());
        if (!(b.pawns[BOTH] & fileBBMask[SquareFile(sq)])) {
            score -= queenOpenFile;
        } else if (!(b.pawns[0] & fileBBMask[SquareFile(sq)])) {
            score -= queenSemiOpenFile;
        }
    }

    p = White | King;
    sq = b.pieceList[p][0];
    assert(sq == b.kingSquare[1])
    assert(IsOK(sq));
    assert(A1 <= sq && sq <= H8);
    assert(IsOK(MIRROR(sq)))
    assert(A1 <= MIRROR(sq) && MIRROR(sq) <= H8);
    if (isEndgame(b.material[0])) {
        score += kingEndgame[sq];
    } else {
        score += kingOpening[sq];
    }

    p = Black | King;
    assert(b.pieceList[p][0] == b.kingSquare[0])
    sq = b.pieceList[p][0];
    assert(IsOK(sq));
    assert(A1 <= sq && sq <= H8);
    assert(IsOK(MIRROR(sq)))
    assert(A1 <= MIRROR(sq) && MIRROR(sq) <= H8);
    if (isEndgame(b.material[1])) {
        score -= kingEndgame[MIRROR(sq)];
    } else {
        score -= kingOpening[MIRROR(sq)];
    }

    // Bonus score for a bishop pair
    if (b.pceCount[wB] >= 2) {
        score += bishopPair;
    }
    if (b.pceCount[bB] >= 2) {
        score -= bishopPair;
    }

    return (b.turn == White) ? score : -score;
}

void clearTT(hashtable_t* table) {
    hashentry_t* el;
    for (el = table->pvtable; el < table->pvtable + table->no_entries; ++el) {
        el->posKey = 0ULL;
        el->move = NULLMV;
        el->depth = 0;
        el->score = 0;
        el->flags = 0;
    }
    table->new_writes = 0;
}


void clearForSearch(Board& b, searchinfo_t *info) {
    // TODO: Testing TT
    //clearTT(&b.TT);
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
    info->nullCut = 0;
	info->stopped = 0;
	info->nodes = 0;

    b.TT.cut = 0;
    b.TT.overwrites = 0;
    b.TT.hit = 0;
}

static int quiescenceSearch(Board& b, searchinfo_t *info, int alpha, int beta) {

    assert(b.check());
    assert(alpha < beta);

    if ((info->nodes & 4095) == 0) {
        checkUp(info);
    }

    info->nodes++;
    ////printf("  Node %lld (qsearch)\n", info->nodes);
    //if (info->nodes >= 460 && info->nodes <= 480) {
       //printf("  %d (qsearch a:%d b:%d)\n", (int)info->nodes, alpha, beta);
    //}


    // || b.fiftyMove >= 100
	if(isRepetition(b) || b.fiftyMoveCounter >= 100) {
		return 0;
	}

    int score = evaluate(b);

    if (b.ply > MAX_DEPTH - 1) {
        return score;
    }

    assert(score > -INFINITE && score < INFINITE);

	if(score >= beta) {
		return beta;
	}

	if(score > alpha) {
		alpha = score;
	}

    movelist_t captures[1];
    generateCaptures(b, captures);
    size_t moveIdx = 0;
    int legal = 0;
	score = -INFINITE;

	for (moveIdx = 0; moveIdx < captures->size(); ++moveIdx) {
		// TODO: DEBUG
		pickNextMove(moveIdx, captures);
        if (!b.makeMove(captures->moveList[moveIdx]))  {
            continue;
        }
        legal++;
        // update score
        // printf("  Calling qsearch from qsearch a:%d b:%d, m: %s\n", alpha, beta, toString(captures->moveList[moveIdx]).c_str());
        score = -quiescenceSearch(b, info, -beta, -alpha);
        // printf("  Qsearch returned score %d\n", score);
        b.undoMove(captures->moveList[moveIdx]);

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

    assert(b.check());
    assert(alpha < beta);
    assert(depth >= 0);

    if (depth <= 0) {
        // printf(" Calling qsearch from AB a:%d b:%d\n", alpha, beta);
        int score = quiescenceSearch(b, info, alpha, beta);
        // printf(" Qsearch returned score %d\n", score);
        return score;
    }

    if ((info->nodes & 4095) == 0) {
        checkUp(info);
    }

    info->nodes++;
    // printf("Node %lld, alpha %d, beta %d, depth %d, canDoNull %d\n", info->nodes, alpha, beta, depth, canDoNull);
    // fflush(stdout);

    // Check if position is a draw
    if ((isRepetition(b) || b.fiftyMoveCounter >= 100) && b.ply) {
        return 0;
    }

    if (b.ply > MAX_DEPTH - 1) {
        return evaluate(b);
    }

    // Check search extension
    bool inCheck = b.inCheck(b.turn);
    if (inCheck) {
        ++depth;
    }

    // Transposition table lookup (reuse results from previous searches)
    int score = -INFINITE;
    move_t pvMv = NULLMV;
#ifndef NO_TT
    // bool isPvNode = beta - alpha > 1; ???
    // if current node is not the root node and not a pv_node
    // try b.ply & isPVNode as additional conditions
    if (getHashEntry(b, &pvMv, &score, alpha, beta, depth)) {
        b.TT.cut++;
        return score;
    }
#endif

    // Null moves

    // Requirements:
    // - can do null move (we only want to do one, and not do them repeatedly)
    // - not in check
    // - we are at least one search in (ply > 0)
    // - we are not in a zugzwag (at least one big piece on board)
    // depth - 1 - R (for R = 3) is allowed
    //
    // Adaptive null move pruning: size of reduction depends on depth
    //int R = (depth > 6) ? 3 : 2;
    int R = 3;
	if (canDoNull && !inCheck && b.ply && (b.bigPce[b.turn == Piece::White] > 1) && depth >= R + 1) {
        b.makeNullMove();
        // we set canDoNull to false, since we don't want to do two null moves in a row
        score = -alphaBeta(b, info, -beta, -beta + 1, depth - 1 - R, false);
        b.undoNullMove();
        if (info->stopped) {
            return 0;
        }
        if (score >= beta && std::abs(score) < MATE) {
            info->nullCut++;
            return beta;
        }
    }

    // Generate pseudolegal moves
    movelist_t moves[1];
    generateMoves(b, moves);
    size_t moveIdx = 0;
    int legal = 0;
    int oldAlpha = alpha;
    move_t bestMv = NULLMV;
    int best_score = -INFINITE;
    score = -INFINITE;

    // Heuristic: start searching from pv moves
    // move_t pvMv = getPvMove(b); // handled by TT
    // Prioritizes the pv move first by setting a larger score for move ordering
    if (pvMv != NULLMV) {
        for (; moveIdx < moves->size(); ++moveIdx) {
            if (movecmp(moves->moveList[moveIdx], pvMv)) {
                moves->moveList[moveIdx] = setScore(moves->moveList[moveIdx], 60000);
                break;
            }
        }
    }

    for (moveIdx = 0; moveIdx < moves->size(); ++moveIdx) {
        // pick best scoring move (according to heuristics)
        pickNextMove(moveIdx, moves);
        if (!b.makeMove(moves->moveList[moveIdx])) continue;
        legal++;
        score = -alphaBeta(b, info, -beta, -alpha, depth - 1, DO_NULL);
        b.undoMove(moves->moveList[moveIdx]);

        if (info->stopped) {
            // stop the search
            return 0;
        }
        if (score > best_score) {
            best_score = score;
            bestMv = moves->moveList[moveIdx];

            if (score > alpha) {
                if (score >= beta) { // fail-high!
                    /* Beta cutoff */
                    if (legal == 1) {
                        info->fhf++;
                    }
                    info->fh++;

                    // Killer moves (cause a beta cutoff but aren't captures)
                    if (!isCapture(moves->moveList[moveIdx])) {
                        b.killersH[1][b.ply] = b.killersH[0][b.ply];
                        b.killersH[0][b.ply] = moves->moveList[moveIdx];
                    }

                    storeHashEntry(b, bestMv, beta, HFBETA, depth);
                    return beta;
                }
                alpha = score; // we beat our lower-bound

                // History heuristic
                if (!isCapture(bestMv)) {
                    b.historyH[b.board[getFrom(bestMv)]][getTo(bestMv)] += depth;
                }
            }
        }
    }


    // Detect mate / stalemate
    if (legal == 0) {
        if (inCheck) {
            return -INFINITE + b.ply;
        } else {
            return 0; // stalemate
        }
    }
    assert(alpha >= oldAlpha);

    if (alpha > oldAlpha) {
        // pv-node (within [alpha, beta] range)
        storeHashEntry(b, bestMv, best_score, HFEXACT, depth);
    } else {
        // fail-low (we weren't able to beat alpha)
        storeHashEntry(b, bestMv, alpha, HFALPHA, depth);
    }
    return alpha;
}

// Searches the position defined by Board b
void search(Board &b, searchinfo_t *info) {
  assert(b.check());
  move_t bestMv = NULLMV;
  int bestScore = -INFINITE;
  int currDepth = 0;
  int pvMoves = 0;
  int pvNum = 0;

  clearForSearch(b, info);

  // Iterative Deepening
  for (currDepth = 1; currDepth <= info->depth; ++currDepth) {
    bestScore = alphaBeta(b, info, -INFINITE, +INFINITE, currDepth, DO_NULL);

    if (info->stopped) {
      break;
    }
    pvMoves = getPV(b, currDepth);
    bestMv = b.pv[0];
    //printf("info score cp %d depth %d nodes %lld time %lu hashfull %d ",
    printf("info score cp %d depth %d nodes %lld time %lu ",
           bestScore, currDepth, info->nodes, getTime() - info->startTime,
           (int)(((double)b.TT.new_writes / b.TT.no_entries) * 1000));
    // TODO:
    //pvMoves = getPV(b, currDepth);
    printf("pv");
    for (pvNum = 0; pvNum < pvMoves; ++pvNum) {
      printf(" %s", toString(b.pv[pvNum]).c_str());
    }
    printf("\n");

    //printf("New writes: %d\nOverwrites: %d\nTotal space: %d\n",
          //b.TT.new_writes, b.TT.overwrites, b.TT.no_entries);
#ifdef DEBUG
     printf("Hits:%d Overwrite:%d NewWrite:%d Cut:%d\nOrdering %.2f NullCut:%d\n",b.TT.hit,b.TT.overwrites,b.TT.new_writes,b.TT.cut,
     (info->fhf/info->fh)*100,info->nullCut);
#endif

    // printf("Ordering:%.2f\n", (info->fhf/info->fh));
    fflush(stdout);
  }

  // best move seen so far (even if search stopped)
  printf("bestmove %s\n", toString(bestMv).c_str());

  assert(b.check());
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

    assert(b.check());
}
