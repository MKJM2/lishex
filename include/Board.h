#ifndef BOARD_H_
#define BOARD_H_

#include <iostream>
#include <string>
#include <sstream>
#include <cstring>
#include <unordered_map>
#include <chrono>
#include <stack>
#include <random>
#include <bitset>
#include <cassert>
#include <cstdint>
#include "Piece.h"
#include "Move.h"
#include "Square.h"
#include "Bitboard.h"

#define ROWS 8
#define COLS 8

using namespace std::chrono;
#define getTime() ( \
        (uint64_t) duration_cast<milliseconds>(system_clock::now() \
            .time_since_epoch())    \
            .count() \
        )

#define MAX_DEPTH (32)

typedef int piece;
typedef unsigned int uint;
typedef unsigned long long u64;

extern std::string startFEN;
extern std::unordered_map<piece, char> pieceToChar;
extern std::unordered_map<piece, std::string> pieceToUnicode;
extern std::unordered_map<char, piece> charToPiece;

class Board;

typedef struct {
        // Last move
        move_t move;
        // Castle permissions
        uint castlePerm;
        // EP square
        square_t enPas;
        // Zoobrist hash key
        u64 posKey;
        // Last piece captured (if any)
        piece captured;
        // Fifty move counter
        uint fiftyMoveCounter;
        // halfmove clock
        uint ply;
} undo_t;


typedef struct {
    // Move in the principal variation
    move_t move;
    // The zobrist hash key that led to the above move
    u64 posKey;
} pventry_t;

typedef struct {
    // Number of moves stored
    int no_entries;
    // Pointer to an element
    pventry_t *pvtable = nullptr;
} pvtable_t;

typedef struct {
    uint64_t startTime;
    uint64_t endTime;
    int depth;
    int depthSet;
    int movesToGo;
    long long nodes;

    bool timeSet;
    bool infinite;
    bool quit;
    bool stopped;

    float fh;  // Fail-high
    float fhf; // Fail-high first
} searchinfo_t;

void clearForSearch(Board& b, searchinfo_t *info);

// Searches the position defined by Board b
void search(Board& b, searchinfo_t *info);

// Initialize the pv table
extern void init_PVtable(pvtable_t *table);

// Initialize the values for the MVVLVA heuristic
extern void initMVVLVA();

extern move_t checkPvTable(const Board& b);

extern bool moveExists(Board& b, move_t m);

extern int getPV(Board& b, const int depth);

class Board {
    public:
        Board ();
        ~Board ();
        void reset();
        piece board[ROWS * COLS] = {};
        void printFEN();
        void printAttacked();
        void print(bool verbose = false);
        void readFEN(std::string fen);
        void readPosition(std::string fen);
        void readGo(std::string goStr, searchinfo_t *info);
        std::string toFEN() const;
        bool makeMove(move_t move);
        void undoMove(move_t move);
        void undoLast();
        void updateMaterial();
        enum { WKCastle = 1, WQCastle = 2, BKCastle = 4, BQCastle = 8};
        int turn = Piece::White;
        int material[2] = {0, 0};
        uint ply = 0;
        uint fullMove = 1;
        uint castlePerm = WKCastle | WQCastle | BKCastle | BQCastle;
        square_t epSquare = NO_SQ;
        square_t kingSquare[2] = {E8, E1};
        inline u64 rand64();
        u64 pieceKeys[24][64];
        u64 turnKey = 0; // we hash in a random number if it's White's move
        u64 castleKeys[16]; // TODO: 4bits depending on which side castle
        u64 posKey = 0;
        uint fiftyMoveCounter = 0;
        void initKeys(unsigned rng_seed = std::mt19937_64::default_seed);
        u64 generatePosKey();
        std::vector<undo_t> boardHistory;
        bool SquareAttacked(const square_t sq, const int color);
        bool inCheck(const int color);
        pvtable_t PVtable; // hash table implementation (might switch to triangular)
        std::vector<move_t> pv; // stores the principal variation extracted from PVtable
        // Table for the history heuristic
        // Indexed by piece-type and ply depth
        move_t historyH[24][64] = {};
        // Table for the killer (beta cutoffs non-capturing) heuristic
        // We store two killer moves, indexed by ply search depth
        move_t killersH[2][64] = {};
};

#endif // BOARD_H_
