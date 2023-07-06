/* Iterative deepening alpha-beta in negamax fashion */
#include "search.h"

#include "eval.h"

constexpr int oo = 1'000'000; // INF

namespace {

move_t move = NULLMV;

int negamax(int alpha, int beta, int depth, board_t *board, searchinfo_t *info, bool do_null) {
    assert(check(board));

    if (depth <= 0) {
        return evaluate(board);
    }

    ++info->nodes;

    if (board->ply > MAX_MOVES - 1) {
        return evaluate(board);
    }

    int score = -oo;
    move_t pvmv = NULLMV;
    movelist_t moves;
    generate_moves(board, &moves);

    // TODO: Move ordering

    int legal = 0;

    for (const move_t* it = moves.begin(); it != moves.end(); ++it) {

        // Pseudo-legal move generation
        if (!make_move(board, *it)) //
            continue;

        ++legal;
        score = -negamax(-beta, -alpha, depth - 1, board, info, do_null);

        undo_move(board, *it);

        if (info->stopped)
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

    // TODO: Mate / stalemate detection
    if (legal == 0) {
        return -oo;
    }

    assert(check(board));

    return alpha;
}

} // namespace

void search(board_t *board, searchinfo_t *info) {
    assert(check(board));

    move_t best_move = NULLMV;
    int best_score = -oo;

    info->clear();
    info->start = now();

    // Iterative deepening
    for (int depth = 0; depth <= info->depth; ++depth) {
        best_score = negamax(-oo, +oo, depth, board, info, false);

        if (info->stopped) {
            break;
        }
        best_move = move;

        std::cout << "info score cp " << best_score;
        std::cout << " depth " << depth;
        std::cout << " nodes " << info->nodes;
        std::cout << " time " << now() - info->start;
        std::cout << " pv " << move_to_str(best_move) << std::endl;
    }

    std::cout << "bestmove " << move_to_str(best_move) << std::endl;

    assert(check(board));
}
