/**
 * Implementation of move ordering logic
*/
#include "order.h"

#include <cstring> // memmove
#include <string>
#include <climits> // INT_MAX

#include "eval.h"
#include "movegen.h"


#ifdef TRACE_ORDER_ENABLE
#define TRACE_ORDER(str) LOG(str)
#else
#define TRACE_ORDER(str)
#endif

namespace {

// Bonuses for moves
// PV > Capture > Killer 1 > Killer 2 > History
constexpr int PV_BONUS = INT_MAX;
constexpr int GOOD_PROMO_BONUS = 20'000'000;
constexpr int CAPTURE_BONUS = 10'000'000;
constexpr int KILLER1_BONUS = 9'000'000;
constexpr int KILLER2_BONUS = 8'000'000;

// Penalty for 'bad' (very rare) promotions like knight/rook
constexpr int BAD_PROMO_PENALTY = -GOOD_PROMO_BONUS;

// Small bonuses for promoting & castling
constexpr int CASTLE_BONUS = 100;


/* MVV-LVA heuristic setup */
constexpr int victim_score[PIECE_NO] = {
    0, 100, 200, 300, 400, 500, 600, 0, 0, 100, 200, 300, 400, 500, 600
};

// MVVLVA[victim][attacker] = score[victim] + 6 - score[attacker] / 100;
constexpr int MVV_LVA[PIECE_NO][PIECE_NO] = {
    //      P    N    B    R    Q    K              p    n    b    r    q    k
    {  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
    {106, 105, 104, 103, 102, 101, 100, 106, 106, 105, 104, 103, 102, 101, 100}, // P
    {206, 205, 204, 203, 202, 201, 200, 206, 206, 205, 204, 203, 202, 201, 200}, // N
    {306, 305, 304, 303, 302, 301, 300, 306, 306, 305, 304, 303, 302, 301, 300}, // B
    {406, 405, 404, 403, 402, 401, 400, 406, 406, 405, 404, 403, 402, 401, 400}, // R
    {506, 505, 504, 503, 502, 501, 500, 506, 506, 505, 504, 503, 502, 501, 500}, // Q
    {606, 605, 604, 603, 602, 601, 600, 606, 606, 605, 604, 603, 602, 601, 600}, // K
    {  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
    {  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
    {106, 105, 104, 103, 102, 101, 100, 106, 106, 105, 104, 103, 102, 101, 100}, // p
    {206, 205, 204, 203, 202, 201, 200, 206, 206, 205, 204, 203, 202, 201, 200}, // n
    {306, 305, 304, 303, 302, 301, 300, 306, 306, 305, 304, 303, 302, 301, 300}, // b
    {406, 405, 404, 403, 402, 401, 400, 406, 406, 405, 404, 403, 402, 401, 400}, // r
    {506, 505, 504, 503, 502, 501, 500, 506, 506, 505, 504, 503, 502, 501, 500}, // q
    {606, 605, 604, 603, 602, 601, 600, 606, 606, 605, 604, 603, 602, 601, 600}, // k
};

// Function to sort first n moves of an array of moves using insertion sort
void movesort(scored_move_t moves[], int n) {
    int i, j;
    scored_move_t move;
    for (i = 1; i < n; i++) {
        move = moves[i];
        j = i - 1;

        // Move elements of arr[0..i-1],
        // that are greater than key,
        // to one position ahead of their
        // current position
        while (j >= 0 && moves[j].score < move.score) {
            moves[j + 1] = moves[j];
            --j;
        }
        moves[j + 1] = move;
    }
}

// Basic insertion sort implementation
inline void sort(movelist_t *moves) {
    // TODO: Insertion sort for move scores (https://stackoverflow.com/a/52818393)
    int swaps = 0;
    move_t tmp;
    for (int j = 1, n = moves->size(); j < n; ++j) {
        tmp = moves->movelist[j];
        swaps = 0;
        for (int i = j-1; (i >= 0) && moves->movelist[i] > tmp; --i) {
            ++swaps;
        }
        if (swaps) {
            std::memmove(moves->movelist+j+2, moves->movelist+j+1, swaps * sizeof(move_t));
            moves->movelist[j+1] = tmp;
        }
    }

}

} // namespace


void score_moves(const board_t *board, movelist_t *moves, move_t pv_move) {
    moves->used = 0;
    // For each move, we assign it a score for move ordering
    // Higher scoring moves will be explored first
    int n = moves->size();
    square_t from, to;
    int flags = 0;
    for (int i = 0; i < n; ++i) {
        scored_move_t& move = moves->movelist[i];
        if (move.move == pv_move) {
            assert(move.move == pv_move && pv_move != NULLMV);
            move.score = PV_BONUS;
            continue;
        }

        move.score = 0;
        from = get_from(move);
        to = get_to(move);
        flags = get_flags(move);

        // We search promotions before captures
        if (is_promotion(move)) {
            switch (flags & ~CAPTURE) {
                case QUEENPROMO:
                    move.score = GOOD_PROMO_BONUS + 1;  break;
                case KNIGHTPROMO:
                    move.score = GOOD_PROMO_BONUS;      break;
                case ROOKPROMO:
                    move.score = BAD_PROMO_PENALTY + 1; break;
                case BISHOPPROMO:
                    move.score = BAD_PROMO_PENALTY;     break;
                default:
                    break;
            }

        }
        if (is_capture(move)) {
            // TODO: Speed up SEE, since the following is slow
            // If the capture is losing, we leave its score as 0
            // if (losing_capture(board, move)) {
                // continue;
            // }
            move.score = CAPTURE_BONUS;
            if (flags == EPCAPTURE)
                move.score += MVV_LVA[PAWN][PAWN];
            else
                move.score += MVV_LVA[board->pieces[to]][board->pieces[from]];

            // Losing captures are searched at the very end
            if (losing_capture(board, move, -value_eg[PAWN])) {
                move.score -= 2 * CAPTURE_BONUS;
            }
            continue;
        }

        /* Check if killer move */
        if (board->killer1[board->ply] == move.move) {
            move.score = KILLER1_BONUS;
        } else if (board->killer2[board->ply] == move.move) {
            move.score = KILLER2_BONUS;
        } else {
            move.score = board->history_h[board->pieces[from]][to];
        }

        /* TODO: Additional small bonuses
        switch (flags & ~CAPTURE) { // clear CAPTURE bit
            case KINGCASTLE:
            case QUEENCASTLE:
                move.score += CASTLE_BONUS;
                break;
            case QUEENPROMO:
            case ROOKPROMO:
            case BISHOPPROMO:
            case KNIGHTPROMO:
                move.score += PROMO_BONUS;
                break;
            default:
                break;
        }
        */
    }
}

// Assumes moves were scored already, moves the best move to the movelist[moves->used] position
move_t next_best(movelist_t *moves, [[maybe_unused]] int ply) {

    if (moves->used >= moves->size()) {
        return NULLMV;
    }

    // Find next best move in our move list and place it at the current best move idx
    // (single-pass linear scan)
    size_t best_idx = moves->used;
    int32_t best_score = 0;
    for (size_t idx = moves->used; idx < moves->size(); ++idx) {
        scored_move_t& move = moves->movelist[idx];
        if (move.score > best_score) {
            best_score = move.score;
            best_idx = idx;
        }
    }

    // Swap the moves
    scored_move_t tmp = moves->movelist[moves->used];
    moves->movelist[moves->used] = moves->movelist[best_idx];
    moves->movelist[best_idx] = tmp;
 #ifdef DEBUG
    /*
         std::cout << std::string(2 * ply, ' ') \
         << "Selected move " << move_to_str(moves->movelist[moves->used]) \
         << " with score " << moves->movelist[moves->used].score \
         << std::endl;
    */
 #endif
                           // Move used, hence increase the counter
    return moves->movelist[moves->used++];
}

void score_and_sort(const board_t *board, movelist_t *moves, move_t pv_move) {
    score_moves(board, moves, pv_move);
    movesort(moves->movelist, moves->size());
}

// Prints out the n (default = 5) best scoring moves
void movescore(const board_t *board, movelist_t *moves, int n) {

    int count = 0;
    for (const scored_move_t move : *moves) {
        if (count++ == n)
            break;
        std::string indent(board->ply, ' ');
        std::cout << indent << move_to_str(move) << ": " << move.score << std::endl;
    }
}
