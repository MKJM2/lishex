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

/* Transposition table code */
#include "transposition.h"

#include <cstring> // std::memset

#include "search.h"
#include "movegen.h"
#include "uci.h"

#ifdef TRACE_TT_ENABLE
#define TRACE_TT(str) LOG(str)
#else
#define TRACE_TT(str)
#endif

// Default TT size in MB
constexpr int DEFAULTTTSIZEMB = 128;

// Global transposition table
TT tt(DEFAULTTTSIZEMB);

TT::TT(const int MB) : size{(0x100000 * MB / sizeof(tt_entry))} {
    this->resize(MB);
}

TT::~TT() {
    //if (table != nullptr) {
        //delete[] table;
    //}

    // delete is safe to use on nullptrs
    delete[] table;
}

void TT::resize(const int new_size_MB) {
    std::cout << "Resizing TT to " << new_size_MB << "MB\n";
    delete[] table;
    this->size = (0x100000 * new_size_MB) / sizeof(tt_entry);
    table = new tt_entry[size];
    if (table == nullptr) {
        std::cerr << "Transposition table allocation failed! Retrying with size "
            << new_size_MB / 2 << std::endl;
        this->resize(new_size_MB / 2);
    }
    this->clear();
    TRACE_TT("Transposition table successfully resized to " << new_size_MB << "MB!");
}

void TT::reset_stats() {
    overwrites = hit = cut = 0U;
}

void TT::clear() {
    // std::memset(table, 0, this->size * sizeof(tt_entry));
    // std::fill(table, table + size, tt_entry());
    tt_entry *entry;
    for (entry = table; entry < table + size; ++entry) {
        entry->key = 0ULL;
        entry->depth = 0;
        // entry->info = 0; // age = 0, flag = BAD = 0
        entry->flags = BAD;
        // entry->age = 0;
        entry->move = NULLMV;
        entry->score = 0;
    }
    this->writes = 0;
    // this->gen = 0;
    reset_stats();
}

int TT::probe(const board_t *board, tt_entry *entry, move_t &move, int &score, int alpha, int beta, int depth) {

    TRACE_TT("Probing " << board->key << " " << alpha << " " << beta << " " << depth);

    // TODO: Ensure size of TT is a power of 2 for efficient mod with &
    size_t idx = board->key % this->size;
    *entry = table[idx];

    assert(0 <= idx && idx <= this->size - 1);
    assert(0 <= depth && depth < MAX_DEPTH);
    assert(alpha < beta);
    assert(-oo <= alpha && alpha <= +oo);
    assert(-oo <= beta && beta <= +oo);
    assert(0 <= board->ply && board->ply < MAX_DEPTH);

    /* Check if the zobrist key matches */
    if (entry->key != board->key) {
        TRACE_TT("Key mismatch: " << entry->key << " vs " << board->key);
        return TTMISS;
    }

    /* We have a match! Check if search was deep enough */

    // The move stored might be useful for move ordering
    move = static_cast<move_t>(entry->move);

    // If the previous search wasn't as deep as current
    //if (depth > static_cast<int>(entry->depth)) {
    if (static_cast<int>(entry->depth) < depth) {
        TRACE_TT("Depth insufficient: " << (int)entry->depth << " vs " << depth);
        return TTMISS;
    }

    assert(0 <= entry->depth && entry->depth < MAX_DEPTH);

    // Otherwise, we've hit a valid entry!
    ++hit;

    // We overwrite the score
    score = static_cast<int>(entry->score);

    // Adjust for mate scores
    if (score > +oo - MAX_DEPTH)
        score -= board->ply;
    else if (score < -oo + MAX_DEPTH)
        score += board->ply;

    /**
     * If we have an EXACT entry, the score was within the [alpha, beta]
     * window and the move stored in the entry is a good move to try.
     * If we have a LOWER entry, it was stored after a fail-high (Beta) cutoff,
     * meaning the move stored in the entry caused a beta cutoff and
     * the score stored is a probable LOWERbound of the actual score. If the
     * score is greater than our current upperbound (beta) we clamp it.
     * Otherwise, if the entry is an UPPER entry, the entry score is only
     * an upperbound on the score of the position and all moves failed.
     *
     * Note that we only return a TTHIT if the score is a) EXACT, b) LOWERbound
     * but has to be greater than our current upperbound beta (since otherwise
     * the actual value of the score could still be within the
     * [score, beta] window) or c) UPPERbound, but the score is lower or equal
     * to our current lowerbound alpha
     * */

    /* The entry can be useful. Check it's type */
    ///switch (static_cast<int>(entry->get_flag())) { // the 2 lsb store the entry flag
    switch (static_cast<int>(entry->flags)) {
        case LOWER:
            if (score < beta) return TTMISS;
            score = beta; break;
        case UPPER:
            if (score > alpha) return TTMISS;
            score = alpha; break;
        case EXACT: break;
        case BAD: TRACE_TT("TODO: Not handled"); assert(false); break;
    }
    return TTHIT;
}

// Always-replace replacement scheme
void TT::store(const board_t *board, move_t move, int score,
               const int flags, const int depth) {
    // TODO: Same as in probe, make sure TT is a power of 2
    size_t idx = board->key % this->size;
    tt_entry *entry = &table[idx];

    TRACE_TT("Storing " << board->key << " " << idx << " " << move << " "
              << score << " " << flags << " " << depth);

    assert(0 <= idx && idx <= this->size - 1);
    assert(board->key == generate_pos_key(board));
    assert(depth >= 0);
    assert(BAD <= flags && flags <= EXACT);

    if (entry->key == 0ULL) {
        ++writes;
    } else {
        // TODO: We only store entries if they contain newer information /
        // better information (higher depth). Otherwise, we don't overwrite
        // TODO: if (entry->get_age() > this->gen || entry->depth > depth) return;
        ++overwrites;
    }

    // Mate score logic for returning how many plies from mate
    if (score > +oo - MAX_DEPTH) score += board->ply;
    else if (score < -oo + MAX_DEPTH) score -= board->ply;

    // If all moves failed high, we don't know which move is the best,
    // hence the stored move should be empty
    // assert(flags == UPPER ? move == NULLMV : move != NULLMV);

    /* Finally, store the entry in the transposition table */
    entry->key   = board->key;
    entry->depth = static_cast<uint8_t>(depth);
    entry->flags = static_cast<uint8_t>(flags);
    // entry->info = static_cast<uint8_t>(((this->gen << 2) & UINT8_MAX) | (flags & 0b11));
    // entry->age = this->gen;
    entry->move  = static_cast<uint16_t>(move & UINT16_MAX); // only store the 16 least-significant bits
    entry->score = static_cast<int32_t>(score);

    TRACE_TT("Stored " << entry->key << " " << idx << " " << entry->move << " "
              << entry->score << " " << (int)entry->flags << " " << (int)entry->depth);

    // Debug: assert the casts are correct
    assert(entry->key == board->key);
    assert(entry->depth == depth);
    //assert(entry->info >> 2 == this->gen);
    //assert((entry->info & 0b11) == flags);
    assert(entry->move == move);
    assert(entry->score == score);
}
