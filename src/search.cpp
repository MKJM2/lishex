/* Iterative deepening alpha-beta in negamax fashion */
#include "search.h"

#include "eval.h"
#include "threads.h"

constexpr int oo = 1'000'000; // INF

namespace {

move_t move = NULLMV;

int quiescence(int alpha, int beta, board_t *board, searchinfo_t *info) {
    assert(check(board));
    assert(alpha < beta);

    ++info->nodes;

    int score = evaluate(board);

    // @TODO: Should we check up with the UCI?

    // Has search been stopped?
    if (search_stopped(info)) {
        return score;
    }

    // Are we too deep into the search tree?
    if (board->ply > MAX_MOVES - 1) {
        return score;
    }

    assert(-oo < score && score < +oo);

    if (score >= beta) { // fail-high
        return beta;
    }

    if (score > alpha) { // PV-node
        alpha = score;
    }

    movelist_t captures;
    generate_noisy(board, &captures);

    int legal = 0;
    score = -oo;

    // Iterate over the pseudolegal moves in the current position
    for (const move_t* it = captures.begin(); it != captures.end(); ++it) {

        // Pseudo-legal move generation
        if (!make_move(board, *it)) //
            continue;

        ++legal;
        score = -quiescence(-beta, -alpha, board, info);

        undo_move(board, *it);

        if (search_stopped(info)) {
            return 0;
        }

        if (score >= beta) { // fail-high
            return beta;
        }

        if (score > alpha) {
            alpha = score;
        }
    }
    return alpha;
}

/**
 @brief Alpha-Beta search in negamax fashion.
 @param alpha the lowerbound
 @param beta the upperbound
 @param board the board position to search
 @param info search info: time, depth to search, etc.
 @param do_null whether to perform a null move or not
*/
int negamax(int alpha, int beta, int depth, board_t *board, searchinfo_t *info, bool do_null) {
    assert(check(board));

    if (depth <= 0) {
        return quiescence(alpha, beta, board, info);
    }

    ++info->nodes;

    // Has search been stopped?
    if (search_stopped(info)) {
        return 0;
    }

    // Are we too deep into the search tree?
    if (board->ply > MAX_MOVES - 1) {
        return evaluate(board);
    }

    int score = -oo;
    move_t pvmv = NULLMV;
    movelist_t moves;
    generate_moves(board, &moves);

    // TODO: Move ordering

    int legal = 0;

    // Iterate over the pseudolegal moves in the current position
    for (const move_t* it = moves.begin(); it != moves.end(); ++it) {

        // Pseudo-legal move generation
        if (!make_move(board, *it)) //
            continue;

        ++legal;
        score = -negamax(-beta, -alpha, depth - 1, board, info, do_null);

        undo_move(board, *it);

        if (search_stopped(info))
            return 0;

        if (score >= beta)
            return beta; // fail hard beta-cutoff (fail-high)

        if (score > alpha) { // PV Node
            // TODO: Need a pv table to recover moves
            move = *it;
            alpha = score;
        }

        // TODO: Fail low
    }

    // If no legal moves, then check if we're in check
    // If not, it's a stalemate
    if (legal == 0) {
        return -oo;
    }

    assert(check(board));

    return alpha;
}

} // namespace

/* Search the tree starting from the root node (current board state) */
void search(board_t *board, searchinfo_t *info) {
    assert(check(board));

    move_t best_move = NULLMV;
    int best_score = -oo;

    info->clear();
    info->start = now();
    info->state = ENGINE_SEARCHING;

    // Iterative deepening
    for (int depth = 1; depth <= info->depth; ++depth) {
        best_score = negamax(-oo, +oo, depth, board, info, false);
        best_move = move;

        if (search_stopped(info)) {
            break;
        }

        std::cout << "info score cp " << best_score \
                  << " depth " << depth \
                  << " nodes " << info->nodes \
                  << " time " << now() - info->start \
                  << " pv " << move_to_str(best_move) << std::endl;
    }

    std::cout << "bestmove " << move_to_str(best_move) << std::endl;

    assert(check(board));
}
