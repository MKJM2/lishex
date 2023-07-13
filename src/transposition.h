#ifndef TRANSPOSITION_H_
#define TRANSPOSITION_H_

#include "types.h"
#include "board.h"

// Hash entry flags for the transposition table
// - BAD: Don't use the retrieved value
// - LOWER: Fail-low bound
// - UPPER: Fail-high bound
// - EXACT: Exact score
enum { BAD, LOWER, UPPER, EXACT = LOWER | UPPER };

enum { TTMISS = 0, TTHIT = 1 };

// 64+8+8+16+32=128 bits for better cache performance
// (aligned with 64-bit cache lines)
typedef struct alignas(64) {
    // The Zobrist hash key of the stored node
    uint64_t key;
    // Depth the position was searched to
    uint8_t depth;
    // Type of entry
    uint8_t flags;
    // Best move in the current node
    uint16_t move;
    // Stored value in this node (either exact or lower/upperbound)
    int32_t score;
} tt_entry;


class TT {
  public:
    // Constructor & Destructor
    TT(const int MB = 64);
    ~TT();

    // Clears the transposition table
    void clear();
    // Resets the statistics
    void reset_stats();
    // Probes the transposition table for a move and a score
    int probe(const board_t *board, move_t &move, int &score, int alpha,
              int beta, int depth);
    // Stores an entry in our transposition table
    void store(const board_t *board, move_t move, int score,
               const int flags, const int depth);
    // Returns the hashfull info in permilles
    inline int hashfull() {
        return writes * 1000 / size;
    }

  private:
    tt_entry *table;
    size_t size;
    // Statistics
    unsigned writes;
    unsigned overwrites;
    unsigned hit;
    unsigned cut;
};

// Global transposition table in transposition.cpp
extern TT tt;

#endif // TRANSPOSITION_H_
