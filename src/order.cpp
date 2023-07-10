/**
 * Implementation of move ordering logic
*/
#include "order.h"

#include <cstring> // memmove

#include "eval.h"
#include "movegen.h"

namespace {

// Bonuses for moves
// PV > Capture > Killer 1 > Killer 2 > History
constexpr int PV_BONUS = 10'000'000;
constexpr int CAPTURE_BONUS = 1'000'000;
constexpr int KILLER1_BONUS = 900'000;
constexpr int KILLER2_BONUS = 800'000;

// Small bonuses for promoting & castling
constexpr int PROMO_BONUS = 100;
constexpr int CASTLE_BONUS = 10;

/* MVV-LVA heuristic setup */
constexpr int victim_score[PIECE_NO] = {
    0, 100, 200, 300, 400, 500, 600, 0, 0, 100, 200, 300, 400, 500, 600
};

// MVVLVA[victim][attacker] = score[victim] + 6 - score[attacker] / 100;
constexpr int MVV_LVA[PIECE_NO][PIECE_NO] = {
    {  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
    {106, 105, 104, 103, 102, 101, 100, 106, 106, 105, 104, 103, 102, 101, 100},
    {206, 205, 204, 203, 202, 201, 200, 206, 206, 205, 204, 203, 202, 201, 200},
    {306, 305, 304, 303, 302, 301, 300, 306, 306, 305, 304, 303, 302, 301, 300},
    {406, 405, 404, 403, 402, 401, 400, 406, 406, 405, 404, 403, 402, 401, 400},
    {506, 505, 504, 503, 502, 501, 500, 506, 506, 505, 504, 503, 502, 501, 500},
    {606, 605, 604, 603, 602, 601, 600, 606, 606, 605, 604, 603, 602, 601, 600},
    {  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
    {  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
    {106, 105, 104, 103, 102, 101, 100, 106, 106, 105, 104, 103, 102, 101, 100},
    {206, 205, 204, 203, 202, 201, 200, 206, 206, 205, 204, 203, 202, 201, 200},
    {306, 305, 304, 303, 302, 301, 300, 306, 306, 305, 304, 303, 302, 301, 300},
    {406, 405, 404, 403, 402, 401, 400, 406, 406, 405, 404, 403, 402, 401, 400},
    {506, 505, 504, 503, 502, 501, 500, 506, 506, 505, 504, 503, 502, 501, 500},
    {606, 605, 604, 603, 602, 601, 600, 606, 606, 605, 604, 603, 602, 601, 600},
};

void score(const board_t *board, movelist_t *moves, move_t pv_move) {
    // For each move, we assign it a score for move ordering
    // Higher scoring moves will be explored first
    int n = moves->size();
    square_t from, to;
    int flags = 0;
    for (int i = 0; i < n; ++i) {
        scored_move_t& move = moves->movelist[i];
        if (move == pv_move) {
            assert(move.move == pv_move);
            move.score = PV_BONUS;
            // Since we want to search the PV move first, we can swap it in
            scored_move_t tmp = moves->movelist[0];
            moves->movelist[0] = move;
            move = tmp;
            continue;
        }
        move.score = 0;

        from = get_from(move);
        to = get_to(move);
        flags = get_flags(move);
        if (flags & CAPTURE) {
            move.score += CAPTURE_BONUS;
            if (flags == EPCAPTURE)
                move.score += 105; // MVV_LVA[PAWN][PAWN]
            else
                move.score += MVV_LVA[board->pieces[to]][board->pieces[from]];
            continue;
        }

        /* Check if killer move */
        if (board->killer1[board->ply] == move) {
            move.score += KILLER1_BONUS;
        } else if (board->killer2[board->ply] == move) {
            move.score += KILLER2_BONUS;
        } else {
            move.score += board->history_h[board->pieces[from]][to];
        }

        /* Additional small bonuses */
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
    }
}

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

}

void score_and_sort(const board_t *board, movelist_t *moves, move_t pv_move) {
    score(board, moves, pv_move);
    movesort(moves->movelist, moves->size());
}

// Prints out the n (default = 5) best scoring moves
void movescore(const board_t *board, movelist_t *moves, move_t pv_move, int n) {

    generate_moves(board, moves);
    score_and_sort(board, moves, pv_move);
    int count = 0;
    for (const scored_move_t move : *moves) {
        if (count++ == n)
            break;
        std::cout << move_to_str(move) << ": " << move.score << std::endl;
    }
}
