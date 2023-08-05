/*
 Lishex (codename 1F98A), a UCI chess engine built in C++
 Copyright (C) 2023 Michal Kurek

 Lishex is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Lishex is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef TRANSPOSITION_H_
#define TRANSPOSITION_H_

#include "types.h"
#include "board.h"

// Hash entry flags for the transposition table
// - BAD: Don't use the retrieved value
// - LOWER: Fail-high bound
// - UPPER: Fail-low bound
// - EXACT: Exact score
enum { BAD = 0, UPPER = 1, LOWER = 2, EXACT = LOWER | UPPER };

enum { TTMISS = 0, TTHIT = 1 };

// 64+8+8+16+32=128bits for better cache performance
// (nicely aligned with 64-byte cache lines (4 entries)
typedef struct alignas(16) tt_entry {
    // The Zobrist hash key of the stored node
    uint64_t key = 0ULL;
    // Depth the position was searched to
    uint8_t depth = 0;
    // Type of entry (flag) + age
    // We use the two lsb for the hash entry flag and the rest for age
    //uint8_t info = BAD;
    uint8_t flags = BAD;
    uint8_t age = 0;
    // Best move in the current node
    uint16_t move = NULLMV;
    // Stored value in this node (either exact or lower/upperbound)
    int16_t score = 0; // Score of a search to this->depth
    int16_t eval = 0;  // Static evaluation score
    // Helpers
    //uint8_t get_flag() const {
        //return info & 0b11;
    //}
    //uint8_t get_age() const {
        //return (info >> 2) & 0b111111;
    //}
} tt_entry;


class TT {
  public:
    // Constructor & Destructor
    TT(const int MB = 128);
    ~TT();
    // Resizes the transposition table
    void resize(const int new_size_MB);
    // Clears the transposition table
    void clear();
    // Resets the statistics
    void reset_stats();
    // Probes the transposition table for a move and a score
    tt_entry* probe(const board_t*, int& found, move_t&, int &score, int alpha, int beta, int depth);
    // Stores an entry in our transposition table
    void store(const board_t *board, move_t move, int score,
               const int flags, const int depth);
    // Returns the hashfull info in permilles
    inline int hashfull() const {
        return writes * 1000 / size;
    }
    // Ages the table by one generation
    // inline void age() {
        // this->gen++;
    // }

  private:
    tt_entry *table = nullptr;
    size_t size = 0;
    // unsigned gen = 0; // Current age of most recent search's entries
    /* Statistics */
    unsigned writes = 0;
    unsigned overwrites = 0;
    unsigned hit = 0;
    unsigned cut = 0;
};

// Global transposition table in transposition.cpp
extern TT tt;

#endif // TRANSPOSITION_H_
