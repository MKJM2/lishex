/* Iterative deepening alpha-beta in negamax fashion */
#include "search.h"

#include <cmath>
#include <iomanip>

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
*/
typedef struct pv_line {
    move_t moves[MAX_DEPTH] = {};
    size_t size = 0;
    void push_back(const move_t m) {
        assert(size < MAX_DEPTH);
        *last++ = m;
    }
    void clear() { last = moves; size = 0; }

    move_t operator[](int i) const { return moves[i]; }
    move_t& operator[](int i) { return moves[i]; }

    // Print the principal variation line
    void print() const {
        for (size_t i = 0; i < size; ++i) {
            std::cout << move_to_str(moves[i]) << " ";
        }
        std::cout << std::endl;
    }

    private:
        move_t *last = moves;
} pv_line;

// Global PV table (quadratic approach)
// - indexed by [ply]
// - pv[ply] is the principal variation line for the search at depth 'ply'
pv_line pv_tb[MAX_DEPTH];

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

    /* Stand-pat score */
    int score = evaluate(board, &eval);

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

    // If following the principal variation (from a previous search at a smaller
    // depth), order the PV move higher

    // Move ordering                 // PV move, if any
    score_and_sort(board, &captures, NULLMV);

    int legal = 0;

    // Iterate over the pseudolegal moves in the current position
    for (const auto& move : captures) {

        /* We perform a couple quick checks to see if the move can be
         * safely discarded */

        // If the move captures the king (TODO: Debug this)
        piece_t& captured = board->pieces[get_to(move)];
        if (piece_type(captured) == KING) {
            return +oo - board->ply;
        }

        if (!is_promotion(move)) {
            // Try Delta pruning (TODO: insufficient material issues in the endgame)
            if (score + value_mg[captured] + 2 * value_mg[PAWN] < alpha) {
              continue;
            }

            if (losing_capture(board, move)) {
                continue;
            }
        }

        /* All checks failed, hence the move is promising and we try making it */

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

        if (score > alpha) { // PV-node
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
int negamax(int alpha, int beta, int depth, board_t *board, searchinfo_t *info, bool do_null) {
    assert(check(board));
    assert(alpha < beta);

    // Check if in pv node

    // PV for the current search ply
    pv_line &pv = pv_tb[board->ply];
    // PV for the next search ply
    pv_line &new_pv = pv_tb[board->ply + 1];

    // Set principal variation line size for the current search ply
    pv.size = board->ply;

    if (depth <= 0) {
        // TODO: pv->size = 0;
        return quiescence(alpha, beta, board, info);
    }

    ++info->nodes;

    // If not at root of the search, check for repetitions
    if (board->ply && (is_repetition(board) || board->fifty_move >= 100)) {
        return 0; // Draw score
    }

    // Has search been stopped?
    if (search_stopped(info)) {
        return 0;
    }

    // Are we too deep into the search tree?
    if (board->ply > MAX_DEPTH - 1) {
        return evaluate(board, &eval);
    }

    // Check search extension
    bool in_check = is_in_check(board, board->turn);
    if (in_check) {
        ++depth;
    }

    int score = -oo;

    /* Null move pruning
     Requirements:
     - can do null move (we only want to do one, and not do them repeatedly)
     - not in check
     - we are at least one search in (ply > 0)
     - we are not in a zugzwag (at least one big piece on board)
     - TODO: Not in a PV node
     depth - 1 - R (for R = 3) is allowed
    */

    // Are we in a PV node? (credit: Pedro Castro)
    int pv_node = beta - alpha > 1;

    // Adaptive null move pruning: size of reduction depends on depth
    int R = (depth > 6) ? 3 : 2;

    if (do_null && !in_check && // && board->ply > 2 && !pv_node && depth >= R + 1 &&
        CNT(board->sides_pieces[board->turn] ^ board->bitboards[P] ^
            board->bitboards[p]) >= 2 ) {

        make_null(board);
        // do_null is now set to false, since we don't want to do two null moves
        // in a row
        score = -negamax(-beta, -beta + 1, depth - 1 - R, board, info, false);
        undo_null(board);

        if (search_stopped(info)) return 0;

        if (score >= beta && std::abs(score) < +oo - MAX_DEPTH) return beta;
    }

    // Generate pseudolegal moves
    movelist_t moves;
    generate_moves(board, &moves);

    // If following the principal variation (from a previous search at a smaller
    // depth), order the PV move higher

    // pv move from the previous iter is the first move in the parent pv
    // Move ordering              // PV move, if any // TODO: test against 0
    score_and_sort(board, &moves, pv_tb[0][board->ply]);

    // movescore(board, &moves, pv_tb[0][board->ply], 3);

    int legal = 0;

    // Iterate over the pseudolegal moves in the current position
    for (const auto& move : moves) {

        // Pseudo-legal move generation
        if (!make_move(board, move)) //
            continue;

        ++legal;
        score = -negamax(-beta, -alpha, depth - 1, board, info, do_null);

        undo_move(board, move);

        if (search_stopped(info))
            return 0;

        assert(info->state == ENGINE_SEARCHING);

        if (score > alpha) { // PV or fail-high node

            // Move causes a cutoff, hence update the search history tables
            // (History heuristic)
            board->history_h[board->pieces[get_from(move)]][get_to(move)] += depth;

            if (score >= beta) { // Fail-high node
                if (legal == 1) {
                    info->fail_high_first++;
                }
                info->fail_high++;

                // Killer moves (cause a beta cutoff but aren't captures)
                if (!is_capture(move)) {
                    board->killer2[board->ply] = board->killer1[board->ply];
                    board->killer1[board->ply] = move;
                }
                return beta; // fail hard beta-cutoff (fail-high)
            }

            /* Otherwise, we are in a PV node */

            // Update the lowerbound
            alpha = score;

            // Store the move in the principal variation for the current ply
            pv[board->ply] = move;

            // Copy over the rest of the principal variation from the next ply
            //for (int j = board->ply + 1; j < new_pv.size; ++j) {
                //pv[j] = new_pv[j];
            //}
            movcpy(&pv[board->ply + 1], &new_pv[board->ply + 1], new_pv.size);
            pv.size = new_pv.size;
        }
        /*
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
          pv->size = new_pv.size + 1;
        }
        */
        /* Fail low: do nothing and simply search the next move */
    }

    // If no legal moves, then check if we're in check
    // If not, it's a stalemate
    if (!legal) {
                            // Mate            // Stalemate
        return (in_check) ? -oo + board->ply : 0;
    }

    assert(check(board));

    return alpha;
}

inline void print_search_info(int s, int d, uint64_t n, uint64_t t,
                              const pv_line &pv) {

  // Print the info line
  std::cout << "info score cp " << s << " depth " << d << " nodes "
            << n << " time " << t << " pv ";
  pv.print();
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

    // Clear the global pv table
    for (int i = 0; i < MAX_DEPTH; ++i) {
        pv_tb[i].clear();
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

    int curr_depth_nodes = 0;
    // Iterative deepening
    for (int depth = 1; depth <= info->depth; ++depth) {
        // For calculating the branching factor
        curr_depth_nodes = info->nodes;

        best_score = negamax(-oo, +oo, depth, board, info, USE_NULL);

        curr_depth_nodes = info->nodes - curr_depth_nodes;

        if (search_stopped(info)) {
            break;
        }

        assert(info->state == ENGINE_SEARCHING);

        best_move = pv_tb[0][0];

        print_search_info(best_score,
                          depth,
                          info->nodes,
                          now() - info->start,
                          pv_tb[0]);

        std::cout << "info string depth " << depth \
            << std::setprecision(4) \
            << " branch factor " << std::pow(curr_depth_nodes, 1.0/depth) \
            << std::setprecision(2) \
            << " ordering " << (static_cast<double>(info->fail_high_first) / info->fail_high) \
            << std::endl;
    }

    std::cout << "bestmove " << move_to_str(best_move) << std::endl;

    /*
    std::cout << "Ordering: "
              << (static_cast<double>(info->fail_high_first) / info->fail_high)
              << std::endl;
    */

    assert(check(board));
}
