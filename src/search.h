#ifndef SEARCH_H_
#define SEARCH_H_

#include "types.h"
#include "board.h"
#include "bitboard.h"
#include "movegen.h"
#include "time.h"
#include "transposition.h"

/**
 @brief Searches the current board state for the best move
 @param board the board state to search
 @param info search info: time, depth to search, etc.
*/
void search(board_t *board, searchinfo_t *info);


typedef struct {
	uint64_t posKey;
	int move;
	int score;
	int depth;
	int flags;
} S_HASHENTRY;

typedef struct {
	tt_entry *pTable;
	int numEntries;
	int newWrite;
	int overWrite;
	int hit;
	int cut;
} S_HASHTABLE;

//typedef struct {
	//S_HASHENTRY *pTable;
	//int numEntries;
	//int newWrite;
	//int overWrite;
	//int hit;
	//int cut;
//} S_HASHTABLE;


void InitHashTable(S_HASHTABLE *table, const int MB);

extern S_HASHTABLE HashTable[1];

#endif // SEARCH_H_
