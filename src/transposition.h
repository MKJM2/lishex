#ifndef TRANSPOSITION_H_
#define TRANSPOSITION_H_

#include "types.h"
#include "board.h"

// Hash entry flags for the transposition table
// - BAD: Don't use the retrieved value
// - LOWER: Fail-high bound
// - UPPER: Fail-low bound
// - EXACT: Exact score
enum { BAD = 0, LOWER = 1, UPPER = 2, EXACT = LOWER | UPPER };

enum { TTMISS = 0, TTHIT = 1 };

// 64+8+8+16+32=128bits for better cache performance
// (nicely aligned with 64-byte cache lines (4 entries)
typedef struct alignas(16) tt_entry {
    // The Zobrist hash key of the stored node
    uint64_t key = 0ULL;
    // Depth the position was searched to
    uint8_t depth = 0;
    // Type of entry
    uint8_t flags = BAD;
    // Best move in the current node
    uint16_t move = NULLMV;
    // Stored value in this node (either exact or lower/upperbound)
    int32_t score = 0;
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
    int probe(const board_t *board, tt_entry *entry, move_t *move, int *score, int alpha, int beta, int depth);
    // Stores an entry in our transposition table
    void store(const board_t *board, move_t move, int score,
               const int flags, const int depth);
    // Returns the pv move for the current board state, if any
    move_t probe_pv(const board_t *board);
    // VICE inspired: retrievews pv line from the transposition table
    int get_pv_line(board_t *board, const int depth);
    // Returns the hashfull info in permilles
    inline int hashfull() {
        return writes * 1000 / size;
    }

  private:
    tt_entry *table = nullptr;
    size_t size = 0;
    // Statistics
    unsigned writes = 0;
    unsigned overwrites = 0;
    unsigned hit = 0;
    unsigned cut = 0;
};

// Global transposition table in transposition.cpp
extern TT tt;

#endif // TRANSPOSITION_H_
