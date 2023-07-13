#include "transposition.h"

#include <cstring> // std::memset

#include "search.h"


TT::TT(const int MB) : size{(1 << 6) * MB / sizeof(tt_entry)} {

    table = new tt_entry[size];
    if (table == nullptr) {
        std::cout << "Transposition table allocation failed!\n";
        assert(false);
    }
    clear();
}

TT::~TT() {
    if (table != nullptr) {
        delete[] table;
    }
}

void TT::reset_stats() {
    writes = overwrites = hit = cut = 0U;
}

void TT::clear() {
    std::memset(table, 0, this->size * sizeof(tt_entry));
    reset_stats();
}

int TT::probe(const board_t *board, move_t *move, int *score,
              int alpha, int beta, int depth) {

    // TODO: Ensure size of TT is a power of 2 for efficient mod with &
    int idx = board->key % this->size;
    tt_entry *entry = &table[idx];

    assert(0 <= index && index <= this->size - 1);

    /* Check if the zobrist key matches */
    if (entry->key != board->key)
        return TTMISS;

    /* We have a match! Check if search was deep enough */

    // If the previous search was at least as deep as current
    if (depth > entry->depth)
        return TTMISS;

    // We hit a valid entry
    ++hit;

    /* The entry can be useful. Check it's type */
    *score = entry->score;

    // Adjust for mate scores
    if (*score > +oo - MAX_DEPTH)
        *score -= board->ply;
    else if (*score < -oo + MAX_DEPTH)
        *score += board->ply;

    /**
     * If we have an EXACT entry, the score was within the [alpha, beta]
     * window and the move stored in the entry is a good move to try.
     * If we have a LOWER entry, it was stored after a fail-high (Beta) cutoff,
     * meaning the move stored in the entry caused a beta cutoff and
     * the score stored is a probable LOWERbound of the actual score. If the
     * score is greater than our current upperbound (beta) we clamp it.
     * Otherwise, if the entry is an UPPER entry, the entry score is only
     * an upperbound on the score of the position and all moves failed.
     * */
    switch (entry->flags) {
        case EXACT: *move = entry->move; break;
        case LOWER:
            *move = entry->move;
            if (*score >= beta)
                *score = beta;
            break;
        case UPPER:
            *move = NULLMV;
            if (*score <= alpha)
                *score = alpha;
            break;
        case BAD:
            LOG("TODO: Not handled yet");
            assert(false);
    }
    return TTHIT;
}

void TT::store(const board_t *board, move_t move, int score,
               const int flags, const int depth) {

    // TODO: Same as in probe, make sure TT is a power of 2
    int idx = board->key % this->size;
    tt_entry *entry = &table[idx];

    assert(0 <= idx && idx <= this->size - 1);
    assert(board->key == generate_pos_key(board));

    if (entry->key == 0ULL)
        ++writes;
    else
        ++overwrites;

    // Mate score logic for returning how many plies from mate
    if (score > +oo - MAX_DEPTH) score += board->ply;
    else if (score <= -oo + MAX_DEPTH) score -= board->ply;

    // If all moves failed high, we don't know which move is the best,
    // hence we don't store it
    if (flags == UPPER) move = NULLMV;

    // Finally, store the entry in the transposition table
    entry->key   = board->key;
    entry->depth = depth;
    entry->flags = flags;
    entry->move  = move;
    entry->score = score;
}
