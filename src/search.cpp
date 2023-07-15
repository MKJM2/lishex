/* Iterative deepening alpha-beta in negamax fashion */
#include "search.h"

#include <cmath>
#include <iomanip>

#include "eval.h"
#include "threads.h"
#include "order.h"
#include "transposition.h"

// Global evaluation struct
eval_t eval;


// ################## pvtable.c ############################

enum { HFNONE, HFALPHA, HFBETA, HFEXACT };

S_HASHTABLE HashTable[1];

void InitHashTable(S_HASHTABLE *table, const int MB);
void StoreHashEntry(board_t *pos, const int move, int score, const int flags, const int depth);
int ProbeHashEntry(board_t *pos, int *move, int *score, int alpha, int beta, int depth);
int ProbePvMove(const board_t *pos);
int GetPvLine(const int depth, board_t *pos);
void ClearHashTable(S_HASHTABLE *table);

int GetPvLine(const int depth, board_t *pos) {

	assert(depth < MAX_DEPTH && depth >= 1);

	int move = ProbePvMove(pos);
	int count = 0;

	while(move != NULLMV && count < depth) {

		assert(count < MAX_DEPTH);

		if( move_exists(pos, move) ) {
			make_move(pos, move);
			pos->pv[count++] = move;
		} else {
			break;
		}
		move = ProbePvMove(pos);
	}

	while(pos->ply > 0) {
		undo_move(pos);
	}

	return count;

}

void ClearHashTable(S_HASHTABLE *table) {

  S_HASHENTRY *tableEntry;

  for (tableEntry = table->pTable; tableEntry < table->pTable + table->numEntries; tableEntry++) {
    tableEntry->posKey = 0ULL;
    tableEntry->move = NULLMV;
    tableEntry->depth = 0;
    tableEntry->score = 0;
    tableEntry->flags = 0;
  }
  table->newWrite=0;
}

void InitHashTable(S_HASHTABLE *table, const int MB) {

	int HashSize = 0x100000 * MB;
    table->numEntries = HashSize / sizeof(S_HASHENTRY);
    table->numEntries -= 2;

	if(table->pTable!=NULL) {
		free(table->pTable);
	}

    table->pTable = (S_HASHENTRY *) malloc(table->numEntries * sizeof(S_HASHENTRY));
	if(table->pTable == NULL) {
		printf("Hash Allocation Failed, trying %dMB...\n",MB/2);
		InitHashTable(table,MB/2);
	} else {
		ClearHashTable(table);
		printf("HashTable init complete with %d entries\n",table->numEntries);
	}

}

int ProbeHashEntry(board_t *pos, int *move, int *score, int alpha, int beta, int depth) {

	int index = pos->key % HashTable->numEntries;

	assert(index >= 0 && index <= HashTable->numEntries - 1);
    assert(depth>=1&&depth<MAX_DEPTH);
    assert(alpha<beta);
    assert(alpha>=-oo&&alpha<=oo);
    assert(beta>=-oo&&beta<=oo);
    assert(pos->ply>=0&&pos->ply<MAX_DEPTH);

	if( HashTable->pTable[index].posKey == pos->key ) {
		*move = HashTable->pTable[index].move;
		if(HashTable->pTable[index].depth >= depth){
			HashTable->hit++;

			assert(HashTable->pTable[index].depth>=1&&HashTable->pTable[index].depth<MAX_DEPTH);
            assert(HashTable->pTable[index].flags>=HFALPHA&&HashTable->pTable[index].flags<=HFEXACT);

			*score = HashTable->pTable[index].score;
			if(*score > +oo - MAX_DEPTH) *score -= pos->ply;
            else if(*score < -oo + MAX_DEPTH) *score += pos->ply;

			switch(HashTable->pTable[index].flags) {

                case HFALPHA: if(*score<=alpha) {
                    *score=alpha;
                    return true;
                    }
                    break;
                case HFBETA: if(*score>=beta) {
                    *score=beta;
                    return true;
                    }
                    break;
                case HFEXACT:
                    return true;
                    break;
                default: assert(false); break;
            }
		}
	}

	return false;
}

void StoreHashEntry(board_t *pos, const int move, int score, const int flags, const int depth) {

	int index = pos->key % HashTable->numEntries;

	assert(index >= 0 && index <= HashTable->numEntries - 1);
	assert(depth>=1&&depth<MAX_DEPTH);
    assert(flags>=HFALPHA&&flags<=HFEXACT);
    assert(score>=-oo&&score<=+oo);
    assert(pos->ply>=0&&pos->ply<MAX_DEPTH);

	if( HashTable->pTable[index].posKey == 0) {
		HashTable->newWrite++;
	} else {
		HashTable->overWrite++;
	}

	if(score > +oo - MAX_DEPTH) score += pos->ply;
    else if(score < -oo + MAX_DEPTH) score -= pos->ply;

	HashTable->pTable[index].move = move;
    HashTable->pTable[index].posKey = pos->key;
	HashTable->pTable[index].flags = flags;
	HashTable->pTable[index].score = score;
	HashTable->pTable[index].depth = depth;
}

int ProbePvMove(const board_t *pos) {

	int index = pos->key % HashTable->numEntries;
	assert(index >= 0 && index <= HashTable->numEntries - 1);

	if( HashTable->pTable[index].posKey == pos->key ) {
		return HashTable->pTable[index].move;
	}

	return NULLMV;
}



// ################ search.c ###########################


static int IsRepetition(const board_t *pos) {

	int index = 0;

	for(index = pos->history_ply - pos->fifty_move; index < pos->history_ply-1; ++index) {
		assert(index >= 0 && index < MAX_MOVES);
		if(pos->key == pos->history[index].key) {
			return true;
		}
	}
	return false;
}

static void ClearForSearch(board_t *pos, searchinfo_t *info) {

	int index = 0;
	int index2 = 0;

	for(index = 0; index < PIECE_NO; ++index) {
		for(index2 = 0; index2 < SQUARE_NO; ++index2) {
			pos->history_h[index][index2] = 0;
		}
	}

    for(index2 = 0; index2 < MAX_DEPTH; ++index2) {
        pos->killer1[index2] = 0;
        pos->killer2[index2] = 0;
    }

	//pos->tt->overWrite=0;
	//pos->HashTable->hit=0;
	//pos->HashTable->cut=0;
	pos->ply = 0;

	info->stopped = 0;
	info->nodes = 0;
	info->fail_high = 0;
	info->fail_high_first = 0;
	info->nullcut = 0;
}

static int Quiescence(int alpha, int beta, board_t *pos, searchinfo_t *info) {

	assert(check(pos));
	assert(beta>alpha);
	//if(( info->nodes & 2047 ) == 0) {
		//CheckUp(info);
	//}

	info->nodes++;

	if(IsRepetition(pos) || pos->fifty_move >= 100) {
		return 0;
	}

	if(pos->ply > MAX_DEPTH - 1) {
		return evaluate(pos, &eval);
	}

	int Score = evaluate(pos, &eval);

	assert(Score>-oo && Score<+oo);

	if(Score >= beta) {
		return beta;
	}

	if(Score > alpha) {
		alpha = Score;
	}

	movelist_t list[1];
    generate_noisy(pos,list);

    // TODO:
    score_moves(pos, list, NULLMV);

    //int MoveNum = 0;
	int Legal = 0;
	Score = -oo;

	//for(MoveNum = 0; MoveNum < list->count; ++MoveNum) {
    //
	//  PickNextMove(MoveNum, list, pos->ply);
	move_t move = NULLMV;
	while ((move = next_best(list, pos->ply)) != NULLMV) {

        assert(move_ok(move));
        if ( !make_move(pos, move))  {
            continue;
        }

		Legal++;
		Score = -Quiescence( -beta, -alpha, pos, info);
        undo_move(pos);

		if(search_stopped(info)) {
			return 0;
		}

		if(Score > alpha) {
			if(Score >= beta) {
				if(Legal==1) {
					info->fail_high_first++;
				}
				info->fail_high++;
				return beta;
			}
			alpha = Score;
		}
    }

	return alpha;
}

static int AlphaBeta(int alpha, int beta, int depth, board_t *pos, searchinfo_t *info, int DoNull) {

	assert(check(pos));
	assert(beta>alpha);
	assert(depth>=0);

	if(depth <= 0) {
		return Quiescence(alpha, beta, pos, info);
		// return EvalPosition(pos);
	}

	//if(( info->nodes & 2047 ) == 0) {
		//CheckUp(info);
	//}

	info->nodes++;

	if((IsRepetition(pos) || pos->fifty_move >= 100) && pos->ply) {
		return 0;
	}

	if(pos->ply > MAX_DEPTH - 1) {
		return evaluate(pos, &eval);
	}

	//int InCheck = SqAttacked(pos->KingSq[pos->side],pos->side^1,pos);
	bb_t checkers = is_in_check(pos, pos->turn);

	if (checkers != 0ULL) {
		depth++;
	}

	int Score = -oo;
	int PvMove = NULLMV;

	if( ProbeHashEntry(pos, &PvMove, &Score, alpha, beta, depth) == true ) {
		HashTable->cut++;
		return Score;
	}

	if( DoNull && !checkers && pos->ply &&
        CNT(pos->sides_pieces[pos->turn] ^
            pos->bitboards[pos->turn ? P : p]) > 1
        && depth >= 4) {
		make_null(pos);
		Score = -AlphaBeta( -beta, -beta + 1, depth-4, pos, info, false);
		undo_null(pos);
		if (search_stopped(info)) {
			return 0;
		}

		if (Score >= beta && abs(Score) < +oo - MAX_DEPTH) {
			info->nullcut++;
			return beta;
		}
	}

	movelist_t list[1];
    generate_moves(pos,list);

	int Legal = 0;
	int OldAlpha = alpha;
	int BestMove = NULLMV;

	int BestScore = -oo;

	Score = -oo;

	//if( PvMove != NOMOVE) {
		//for(MoveNum = 0; MoveNum < list->count; ++MoveNum) {
			//if( list->moves[MoveNum].move == PvMove) {
				//list->moves[MoveNum].score = 2000000;
				////printf("Pv move found \n");
				//break;
			//}
		//}
	//}

    score_moves(pos, list, PvMove);

	// for(MoveNum = 0; MoveNum < list->count; ++MoveNum) {

		// PickNextMove(MoveNum, list, pos->ply);

    move_t move = NULLMV;
    while ((move = next_best(list, pos->ply)) != NULLMV) {

        assert(move_ok(move));
        if ( !make_move(pos,move))  {
            continue;
        }

		Legal++;
		Score = -AlphaBeta( -beta, -alpha, depth-1, pos, info, true);
		undo_move(pos);

		if(search_stopped(info)) {
			return 0;
		}
		if(Score > BestScore) {
			BestScore = Score;
			BestMove = move;
			if(Score > alpha) {
				if(Score >= beta) {
					if(Legal==1) {
						info->fail_high_first++;
					}
					info->fail_high++;

					if(!is_capture(move)) {
						pos->killer2[pos->ply] = pos->killer1[pos->ply];
						pos->killer1[pos->ply] = move;
					}

					StoreHashEntry(pos, BestMove, beta, HFBETA, depth);

					return beta;
				}
				alpha = Score;

				if(!is_capture(move)) {
					pos->history_h[pos->pieces[get_from(BestMove)]][get_to(BestMove)] += depth * depth;
				}
			}
		}
    }

	if(Legal == 0) {
		if(checkers) {
			return -oo + pos->ply;
		} else {
			return 0;
		}
	}

	assert(alpha>=OldAlpha);

	if(alpha != OldAlpha) {
		StoreHashEntry(pos, BestMove, BestScore, HFEXACT, depth);
	} else {
		StoreHashEntry(pos, BestMove, alpha, HFALPHA, depth);
	}

	return alpha;
}

void search(board_t *pos, searchinfo_t *info) {

	int bestMove = NULLMV;
	int bestScore = -oo;
	int currentDepth = 0;
	int pvMoves = 0;
	int pvNum = 0;

	ClearForSearch(pos,info);

	//if(EngineOptions->UseBook == TRUE) {
		//bestMove = GetBookMove(pos);
	//}

	//printf("Search depth:%d\n",info->depth);

	// iterative deepening
	if(bestMove == NULLMV) {

		int nodes_depth = 0;
		for( currentDepth = 1; currentDepth <= info->depth; ++currentDepth ) {
			nodes_depth = info->nodes;
								// alpha	 beta
			bestScore = AlphaBeta(-oo, +oo, currentDepth, pos, info, true);

			nodes_depth = info->nodes - nodes_depth;

			if(search_stopped(info)) {
				break;
			}

			pvMoves = GetPvLine(currentDepth, pos);
			bestMove = pos->pv[0];
            printf("info score cp %d depth %d nodes %ld time %lu ",
            bestScore,currentDepth,info->nodes,now()-info->start);

            pvMoves = GetPvLine(currentDepth, pos);
                printf("pv");
            for(pvNum = 0; pvNum < pvMoves; ++pvNum) {
                printf(" %s",move_to_str(pos->pv[pvNum]).c_str());
            }
            std::cout << std::endl;

            std::cout << "info string depth " << currentDepth \
                << std::setprecision(4) \
                << " branchf " << std::pow(nodes_depth, 1.0/currentDepth) \
                << std::setprecision(2) \
                << " ordering " << (static_cast<double>(info->fail_high_first) / info->fail_high) \
                << " nullcut " << info->nullcut \
                << " hashcut " << HashTable->cut \
                << " deltacut " << info->deltacut \
                << " seecut " << info->seecut \
                << std::endl;

		}
	}
    std::cout << "bestmove " << move_to_str(bestMove) << std::endl;

}
