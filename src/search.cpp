/* Iterative deepening alpha-beta in negamax fashion */
#include "search.h"

#include "eval.h"
#include "threads.h"
#include "order.h"

constexpr int oo = 1'000'000; // INF

namespace {

// For maintaining the principal variation in the triangular array (debug)
// Copies up to n moves from p_src to p_tgt, kind of like memcpy
// Adapted from https://www.chessprogramming.org/Triangular_PV-Table
void movcpy(move_t *p_tgt, move_t *p_src, int n) {
    while (n-- && (*p_tgt++ = *p_src++));
}



/* Principal Variation

Triangular table layout:

ply  maxLengthPV
    +--------------------------------------------+
0   |N                                           |
    +------------------------------------------+-+
1   |N-1                                       |
    +----------------------------------------+-+
2   |N-2                                     |
    +--------------------------------------+-+
3   |N-3                                   |
    +------------------------------------+-+
4   |N-4                                 |
...                        /
N-4 |4      |
    +-----+-+
N-3 |3    |
    +---+-+
N-2 |2  |
    +-+-+
N-1 |1|
    +-+

We reserve space for the PV on the stack
inside the recursive search routine and pass a reference
to child nodes
*/
typedef struct pv_t {
    move_t table[MAX_DEPTH] = {};
    int size = 0;
} pv_t;

// Global evaluator (for multithreaded, we'll want to have a separate one for
// each thread)
eval_t eval;

/**
 @brief Quiescence search
 @param alpha the lowerbound
 @param beta the upperbound
 @param board the board position to search
 @param info search info: time, depth to search, etc.
*/
int quiescence(int alpha, int beta, board_t *board, searchinfo_t *info) {
    assert(check(board));
    assert(alpha < beta);

    ++info->nodes;

    // Position encountered previously?
    if (is_repetition(board) || board->fifty_move >= 100) {
        return 0; // Draw score
    }

    int score = evaluate(board, &eval);

    // @TODO: Should we check up with the UCI?

    // Has search been stopped?
    if (search_stopped(info)) {
        return score;
    }

    // Are we too deep into the search tree?
    if (board->ply > MAX_DEPTH - 1) {
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
    score_and_sort(board, &captures, NULLMV);

    int legal = 0;
    score = -oo;

    // Iterate over the pseudolegal moves in the current position
    for (const auto& move : captures) {

        // Pseudo-legal move generation
        if (!make_move(board, move)) //
            continue;

        ++legal;
        score = -quiescence(-beta, -alpha, board, info);

        undo_move(board, move);

        if (search_stopped(info)) {
            return 0;
        }

        if (score >= beta) { // fail-high
            if (legal == 1) {
                info->fail_high_first++;
            }
            info->fail_high++;
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
 @param pv reference to a table storing the (depth - 1) principal variation
*/
int negamax(int alpha, int beta, int depth, board_t *board, searchinfo_t *info, bool do_null, pv_t *pv) {
    assert(check(board));
    assert(alpha < beta);

    if (depth <= 0) {
        pv->size = 0;
        return quiescence(alpha, beta, board, info);
    }

    ++info->nodes;

    // Has search been stopped?
    if (search_stopped(info)) {
        return 0;
    }

    // Are we too deep into the search tree?
    if (board->ply > MAX_DEPTH - 1) {
        return evaluate(board, &eval);
    }

    // If not at root of the search, check for repetitions
    if (board->ply && (is_repetition(board) || board->fifty_move >= 100)) {
        return 0; // Draw score
    }

    // Check search extension
    bool in_check = is_in_check(board, board->turn);
    if (in_check) {
        ++depth;
    }

    // PV for the current depth
    pv_t new_pv;

    int score = -oo;

    // Generate pseudolegal moves
    movelist_t moves;
    generate_moves(board, &moves);

    // If following the principal variation (from a previous search at a smaller
    // depth), order the PV move higher

    // Move ordering              // PV move, if any
    score_and_sort(board, &moves, pv->table[0]);

    int legal = 0;

    // Iterate over the pseudolegal moves in the current position
    for (const auto& move : moves) {

        // Pseudo-legal move generation
        if (!make_move(board, move)) //
            continue;

        ++legal;
        score = -negamax(-beta, -alpha, depth - 1, board, info, do_null, &new_pv);

        undo_move(board, move);

        if (search_stopped(info))
            return 0;

        if (score >= beta) {
            if (legal == 1) {
                info->fail_high_first++;
            }
            info->fail_high++;

            // Killer moves (cause a beta cutoff but aren=t captures)
            if (!is_capture(move)) {
                board->killer2[board->ply] = board->killer1[board->ply];
                board->killer1[board->ply] = move;
                // History heuristic (@TODO: Check for overflows)
                board->history_h[board->pieces[get_from(move)]][get_to(move)] += depth;
            }
            return beta; // fail hard beta-cutoff (fail-high)
        }

        if (score > alpha) { // PV Node
          // Update the lower-bound
          alpha = score;

          // Store the move in the principal variation for the current ply
          pv->table[0] = move;

          // Copy over the rest of the principal variation from the next ply
          movcpy(pv->table + 1, new_pv.table, new_pv.size);
          // equivalent to:
          // memcpy(pv->table + 1, new_pv.table, new_pv.size);
          /*
          @TODO: Allocate the triangular pv table once
          movcpy(pv_tb + pv_index[board->ply] + 1,
                 pv_tb + pv_index[board->ply + 1], MAX_DEPTH - board->ply - 1);
          */
          pv->size = new_pv.size + 1;
        }
        /* Fail low: do nothing and simply search the next move */
    }

    // If no legal moves, then check if we're in check
    // If not, it's a stalemate
    if (legal == 0) {
                            // Mate            // Stalemate
        return (in_check) ? -oo + board->ply : 0;
    }

    assert(check(board));

    return alpha;
}

inline void print_search_info(int s, int d, uint64_t n, uint64_t t,
                              const pv_t *pv) {

  // Print the info line
  std::cout << "info score cp " << s << " depth " << d << " nodes "
            << n << " time " << t << " pv ";

  // Print the principal variation for the current depth
  for (int i = 0; i < d; ++i) {
    std::cout << move_to_str(pv->table[i]) << " ";
  }
  std::cout << std::endl;
}


void init_search(board_t *board, searchinfo_t *info) {

    // Clear tables used for the history heuristic
    for (piece_t p = NO_PIECE; p < PIECE_NO; ++p) {
        for (square_t sq = A1; sq <= H8; ++sq) {
            board->history_h[p][sq] = 0;
        }
    }

    // Clear tables used for the killer move heuristic
    for (int i = 0; i < MAX_DEPTH; ++i) {
        board->killer1[i] = board->killer2[i] = NULLMV;
    }

    // Clear search info, like # nodes searched
    info->clear();
}


} // namespace


/* Search the tree starting from the root node (current board state) */
void search(board_t *board, searchinfo_t *info) {
    assert(check(board));

    move_t best_move = NULLMV;
    int best_score = -oo;

    // Clear for search
    init_search(board, info);

    // Table that will store the principal variation
    pv_t pv;

    // Iterative deepening
    for (int depth = 1; depth <= info->depth; ++depth) {
        best_score = negamax(-oo, +oo, depth, board, info, false, &pv);
        best_move = pv.table[0];

        if (search_stopped(info)) {
            break;
        }

        print_search_info(best_score,
                          depth,
                          info->nodes,
                          now() - info->start,
                          &pv);
    }

    std::cout << "bestmove " << move_to_str(best_move) << std::endl;

    std::cout << "Ordering: "
              << (static_cast<double>(info->fail_high_first) / info->fail_high)
              << std::endl;

    assert(check(board));
}
