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

/* Iterative deepening alpha-beta in negamax fashion */
#include "search.h"

#include <cmath>
#include <iomanip>
#include <algorithm>

#include "eval.h"
#include "threads.h"
#include "order.h"
#include "transposition.h"

// Global evaluation struct (for multithreaded, we'll want to have a separate one for
// each thread)
eval_t eval;


namespace {

// For maintaining the principal variation in the triangular array
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
    void clear() { last = moves; size = 0; memset(moves, 0, sizeof(moves)); }

    move_t operator[](int i) const { return moves[i]; }
    move_t& operator[](int i)      { return moves[i]; }

    // Print the principal variation line
    void print() const {
        for (size_t i = 0; i < size; ++i) {
            std::cout << move_to_str(moves[i]) << " ";
        }
    }

    private:
        move_t *last = moves;
} pv_line;

// Global PV table (quadratic approach)
// - indexed by [ply]
// - pv[ply] is the principal variation line for the search at depth 'ply'
pv_line pv_tb[MAX_DEPTH+1];

// Reduction plies for LMR (Dumb engine inspired)
int lmr_depth_reduction[MAX_DEPTH][MAX_MOVES];


// TODO: Use Unicode chars in source code? Compiler compatibility?
// int α = alpha;
// int β = beta;

/**
 @brief Alpha-Beta search in negamax fashion.
 @param alpha the lowerbound
 @param beta the upperbound
 @param board the board position to search
 @param info search info: time, depth to search, etc.
 @param do_null whether to perform a null move or not
 @param pv reference to a table storing the (depth - 1) principal variation
*/
int negamax(int α, int β, int depth, board_t *board, searchinfo_t *info, bool do_null) {
    assert(check(board));
    assert(α < β);
    assert(depth >= 0);

    // [PVS] Check if in pv node (credit: Pedro Castro)
    int pv_node = α + 1 < β;

    // PV for the current search ply
    pv_line &pv = pv_tb[board->ply];
    // PV for the next search ply
    pv_line &next_pv = pv_tb[board->ply + 1];

    // Set principal variation line size for the current search ply
    pv.size = board->ply;

    /* Recursion base case */
    if (depth <= 0) {
        return quiescence(α, β, board, info);
    }

    ++info->nodes;

    // If not at root of the search, check for repetitions
    if (board->ply && (is_repetition(board) || board->fifty_move >= 100)) {
        //return 0;
        // Randomized draw score
        return -2 + (info->nodes & 0x3);
    }

    // Are we too deep into the search tree?
    if (board->ply >= MAX_DEPTH - 1) {
        return evaluate(board, &eval);
    }

    int score = -oo;
    move_t ttmove = NULLMV;

    /* Transposition table probing */
    tt_entry entry[1];
    int tthit = tt.probe(board, entry, ttmove, score, α, β, depth);

    // Check if can get a cutoff
    if (!pv_node && tthit) {
       ++info->hashcut;
       return score;
    } else if (!pv_node && depth >= iir_depth_req) {
        // Internal iterative reduction, as discussed in
        // http://talkchess.com/forum3/viewtopic.php?f=7&t=74769&sid=64085e3396554f0fba414404445b3120
        --depth;
    }

    /* Get a static evaluation of the current position */
    score = evaluate(board, &eval);

    // Check search extension
    bool in_check = is_in_check(board, board->turn);
    if (in_check) {
        ++depth;
    }

    /* Reverse futility pruning && Null move pruning */

    /* Requirements:
     - can do null move (we only want to do one, and not do them repeatedly)
     - not in check
     - we are at least 2 plies into the search
     - we are not in a zugzwag (heuristic: at least one big piece on board)
     - current eval is already >= beta
     depth - 1 - R (for R = 3) is allowed
    */

    if (!pv_node && do_null && !in_check &&
        CNT(board->sides_pieces[board->turn] ^
                    board->bitboards[board->turn ? P : p]) > 1
    ) {

        /* Reverse futility pruning */
        static const int margins[] = {value_mg[NO_PIECE], value_mg[PAWN], 2*value_mg[PAWN], value_mg[BISHOP],
                                  value_mg[ROOK], value_mg[QUEEN]};
        if (depth <= 5 && std::abs(β) < +oo - MAX_DEPTH && score - margins[depth] >= β) {
            // Fail-hard
            return β;
        }

        const int R = 2 + depth / 4 + MIN(3, (score - β) / 200);

        /* Null move pruning */
        if (depth >= R + 1 && score >= β) {
            make_null(board);
            // do_null is now set to false, since we don't want to do two null moves
            // in a row
            score = -negamax(-β, -β + 1, depth - 1 - R, board, info, false);
            undo_null(board);

            if (search_stopped(info))
                return 0;

            if (score >= β && std::abs(score) < +oo - MAX_DEPTH) {
                ++info->nullcut;
                // fail-hard beta cutoff
                return β;
            }
        }
        /* // TODO: Null move reduction in endgames
        if (score >= beta) {
            if (std::abs(score) < +oo - MAX_DEPTH) {
                return score;
            }
            depth -= 4;
            if (depth <= 0) {
                return quiescence(alpha, beta, board, info);
            }
        }
        */

        /* Razoring */
        // Inspired by Dumb
        // https://github.com/abulmo/Dumb/blob/master/src/search.d
        int razor = α - 100 * depth + 30;
        if (score <= razor) {
            if (depth <= 2) {
                return quiescence(α, β, board, info);
            }
            else if (quiescence(razor, razor + 1, board, info) <= razor) {
                return α;
            }
        }
    }

    /* Move generation, ordering, and move loop */

    // Bruce Moreland's trick for storing entries in the TT
    // - unless we get a cut-off or improve our alpha, the score is an
    // upperbound of the actual score
    int type = UPPER;

    // Generate pseudolegal moves
    movelist_t moves;
    generate_moves(board, &moves);

    // If following the principal variation (from a previous search at a smaller
    // depth), order the PV move higher
    score_moves(board, &moves, ttmove);

    size_t moves_searched = 0;
    size_t quiet_moves_searched = 0;
    int bestscore = score = -oo;

    // Iterate over the pseudolegal moves in the current position
    // for (const auto& move : moves) {
    move_t move, bestmove = NULLMV;
    while ((move = next_best(&moves, board->ply)) != NULLMV) {

        /* Forward futility pruning */
        // the material gain a move can generate is the biggest if we promote to a piece
        // while capturing an enemy piece. In addition, quiet moves have an
        // estimated gain of zero, a fact which we utilize when performing reductions
        int est_gain = value_eg[get_promotion_type(move)] +
                       value_eg[board->pieces[get_to(move)]];
        if (depth < 8 &&
            !in_check &&
            move != ttmove &&
            moves_searched &&
            score + est_gain + (depth << 7) <= α) {
            break; // Fail-low and fail hard
        }

        // Pseudo-legal move generation
        if (!make_move(board, move))
            continue;

        // [PVS] Principal variation search
        // We assume that given good move ordering, if we found a PV move
        // we are in a PV node. Thus we want to prove that all the remaining
        // moves are bad. If we were wrong and managed to find a better move,
        // we need to do a research
        if (moves_searched == 0) {
            // We assume, given good move ordering, that the first move
            // is a PV move (leading to a PV node) so we perform a full search
            score = -negamax(-β, -α, depth - 1, board, info, USE_NULL);
        } else {
            /* [LMR] Late Move Reduction */
            // We check whether to consider a reduction or not. We do so if:
            // - enough moves searched already
            //    - we require that number to be larger if in a PV node
            // - sufficient depth to reduce
            // - the move is quiet (we don't want to reduce on captures/promotions)
            // - not in check
            // If all of the above are satisfied, we reduce the search depth
            // by an amount dependent on a) current depth and b) # of moves already
            // searched. In addition, we reduce 1 ply less if in a pv-node, and
            // 1 ply more if the move is a bad quiet move (according to history)
            if ( moves_searched >= lmr_fully_searched_req &&
                 depth >= lmr_depth_req  &&
                 !is_capture(move)   &&
                 !is_promotion(move) &&
                 !in_check
            ) {
                int R = lmr_depth_reduction[depth][moves_searched];

                // Reduce less if we are in a PV node
                R -= pv_node;

                // Reduce more on bad moves according to the history
                //R += (board->history_h[board->turn][board->pieces[get_from(move)]][get_to(move)] < 0);

                // Clamp the reduction so we don't drop into negative depths
                R = std::clamp(R, 0, depth - 1);
                score = -negamax(-α - 1, -α, depth - 1 - R, board, info,
                                 USE_NULL);
            } else {
                // Trick to ensure a full-depth search is done
                // credit to Tord Romstad:
                // https://web.archive.org/web/20071028123254/http://www.glaurungchess.com/lmr.html
                score = α + 1;
            }

            if (score > α) {
                // [PVS] We first search the remaining moves with a zero window
                score = -negamax(-α - 1, -α, depth - 1, board, info, USE_NULL);
                if (score > α && score < β) {
                    // If the score we got was outside of our window,
                    // we perform a full window re-search
                    score = -negamax(-β, -α, depth - 1, board, info, USE_NULL);
                }
            }
        }
        undo_move(board, move);

        if (search_stopped(info))
            return 0;

        ++moves_searched;
        if (est_gain == 0)
            ++quiet_moves_searched;

        assert(info->state == ENGINE_SEARCHING);

        if (score > bestscore) {
            bestscore = score;
            bestmove = move;
            // Check if PV or fail-high node
            if (score > α) {
                if (score >= β) { // Fail-high node
                    if (moves_searched == 1) {
                        info->fail_high_first++;
                    }
                    info->fail_high++;

                    // Killer moves (cause a beta cutoff but aren't captures)
                    if (!is_capture(move)) {
                        // Don't update killer moves if this would result in duplicating the move
                        if (board->killer1[board->ply] != move) {
                            board->killer2[board->ply] = board->killer1[board->ply];
                            board->killer1[board->ply] = move;
                        }

                        // Move causes a cutoff, hence update the search history tables
                        // (History heuristic)
                        board->history_h[board->turn][board->pieces[get_from(move)]][get_to(move)] += depth * depth;

                        // Penalize all the previous quiet moves that *didn't* cause a cut-off
                        for (scored_move_t* it = moves.begin(); *it != move; ++it) {
                            if (get_flags(move) != QUIET) continue; // REVIEW: Might be unnecessary
                            board->history_h[board->turn][board->pieces[get_from(*it)]][get_to(*it)] -= depth * depth;
                        }
                    }

                    /* The move caused a beta cutoff, hence we get a lowerbound score */
                    type = LOWER;
                    break;
                }

                /* Otherwise if no fail-high occured but we beat alpha, we are in a PV node */

                // Update the PV
                pv[board->ply] = bestmove;
                movcpy(&pv[board->ply + 1], &next_pv[board->ply + 1], next_pv.size);
                //for (size_t next = board->ply + 1; next < next_pv.size; ++next) {
                    //pv[next] = next_pv[next];
                //}
                pv.size = next_pv.size;

                // Update the search window lowerbound
                type = EXACT;
                α = score;
            }
        }
        /* The move failed low, we check if we can prune the tree here [Late Move Pruning] */
        //if (!pv_node &&
            //!in_check &&
            //depth >= 4 &&
            //quiet_moves_searched > 4 + depth * depth)
            //break;
    }

    // If no legal moves could be performed, then check if we're in check:
    // if not, it's a stalemate. Otherwise we've been mated!
    if (!moves_searched) {
                            // Mate score      // Stalemate
        return (in_check) ? -oo + board->ply : 0;
    }


    /* Store the best move (+ corresponding score & bound type)
     * in the transposition table.*/
    assert((type == LOWER && bestscore >= β) ||
           (type == UPPER && bestscore <= α) || (type == EXACT));

    // Fail-hard: we don't report scores outside of the search window
    if (type == UPPER) {
        bestscore = α;
    } else if (type == LOWER) {
        bestscore = β;
        tt.store(board, bestmove, bestscore, type, depth);
        return β;
    }

    tt.store(board, bestmove, bestscore, type, depth);

    assert(check(board));

    //return bestscore;
    return α;
}

inline void print_search_info(int s, int d, int sd, uint64_t n, uint64_t t,
                              const pv_line &pv, [[maybe_unused]] board_t *board) {

  // Print the info line
  std::cout << "info depth " << d << " seldepth " << sd \
            << " score ";

  // Print mate distance info if a player is being mated
  if (std::abs(s) >= +oo - MAX_DEPTH) {
     std::cout << "mate " \
          << (s > 0 ? +oo - s + 1 : -oo - s + 1) / 2;
  } else {
      std::cout << "cp " << s;
  }
  std::cout << " nodes " << n << " time " << t \
            << " hashfull " << tt.hashfull() << " pv ";

  pv.print();
  std::cout << std::endl;
}


void init_search(board_t *board, searchinfo_t *info) {

    // Scale tables used for the history heuristic
    for (piece_t p = NO_PIECE; p < PIECE_NO; ++p) {
        for (square_t sq = A1; sq <= H8; ++sq) {
            for (int colour : {BLACK, WHITE}) {
                board->history_h[colour][p][sq] /= 16;
            }
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

    // Increment the transposition table's age
    // tt.age();

    // Reset statistics for the transposition table
    tt.reset_stats();
}

/**
 @brief Given the score from a previous search, we try to estimate the bounds of the window
 for the next search. This should result in more beta-cutoffs. If we get a score
 outside of the window, then we need to perform a research with a wider window
 @param board the board position to search
 @param info search info: time, depth to search, etc.
 @param depth number of plies to search
 @param do_null whether to perform a null move or not
*/
int aspiration_window_search(board_t *board, searchinfo_t *info, int prev_score, int depth, bool do_null) {

    // Initialize the initial window
    int aw_delta = 35;
    int score = prev_score;

    int α = -oo, β = +oo;

    // If the search depth is low, we want to search with wider windows
    if (depth >= 3) {
        α = MAX(-oo, score - aw_delta);
        β = MIN(+oo, score + aw_delta);
    }

    // We keep retrying the search with larger and larger windows
    // (window widening code inspired by the Alexandria engine)
    for (;;) {
        score = negamax(α, β, depth, board, info, do_null);

        if (search_stopped(info)) break;

        /* Check if we fell outside of the window */
        if (score <= α) {
            // We failed low, hence decrease the alpha
            α = MAX(-oo, score - aw_delta);
        } else if (score >= β) {
            // We failed high, hence increase the beta
            β = MIN(+oo, score + aw_delta);
        } else {
            // We found a score within the window!
            break;
        }
        aw_delta <<= 1;
    }
    return score;
}


} // namespace

void init_reductions() {
    for (size_t ply = 0; ply < MAX_DEPTH; ++ply) {
        for (size_t move_idx = 0; move_idx < MAX_MOVES; ++move_idx) {
            lmr_depth_reduction[ply][move_idx] = 0.85*(sqrt(ply-1)+sqrt(move_idx-1)-1);
        }
    }
}


/**
 @brief Quiescence search - we only search 'quiet' (non-tactical)
 positions to get a reliable score from our static evaluation function
 @param alpha the lowerbound
 @param beta the upperbound
 @param board the board position to search
 @param info search info: time, depth to search, etc.
*/
int quiescence(int α, int β, board_t *board, searchinfo_t *info) {
    assert(check(board));
    assert(α < β);

    ++info->nodes;

    int pv_node = α + 1 < β;

    // Position encountered previously?
    // TODO: In Qsearch should we be only checking for material draws,
    // not 3fold repetitions ?
    //if (is_repetition(board) || board->fifty_move >= 100) {
        //return 0; // Draw score
    //}

    if (board->ply > info->seldepth)
        info->seldepth = board->ply - 1;

    /* Transposition table probing */
    int score = -oo;
    move_t ttmove = NULLMV;
    tt_entry entry[1];
    int tthit = tt.probe(board, entry, ttmove, score, α, β, 0);

    // Check if can get a cutoff (don't cutoff on PV nodes)
    if (!pv_node && tthit) {
       ++info->hashcut;
       return score;
    }

    /* Stand-pat score */
    score = evaluate(board, &eval);

    assert(-oo < score && score < +oo);

    // Are we too deep into the search tree?
    if (board->ply >= MAX_DEPTH - 1) {
        return score;
    }

    if (score >= β) { // fail-high
        return β;
    }

    if (score > α) { // PV-node
        α = score;
    }

    movelist_t noisy;
    generate_noisy(board, &noisy);

    // Move ordering           // PV move, if any
    score_moves(board, &noisy, ttmove);

    #ifdef DEBUG
    int moves_searched = 0;
    #endif

    // Iterate over the pseudolegal moves in the current position
    move_t move = NULLMV, bestmove = NULLMV;
    while ((move = next_best(&noisy, board->ply)) != NULLMV) {

        /* We perform a couple quick checks to see if the move can be
         * safely pruned */
        piece_t& captured = board->pieces[get_to(move)];

        if (!is_promotion(move)) {
            // Try Delta pruning (TODO: insufficient material issues in the endgame)
            if (score + value_mg[captured] + value_eg[PAWN] < α) {
                ++info->deltacut;
                continue;
            }
            // SEE pruning: we prune the move if the capture is clearly losing
            if (losing_capture(board, move, -value_eg[PAWN])) {
                ++info->seecut;
                continue;
            }
        }

        /* All pruning checks failed, hence the move is promising and we try making it */

        // Pseudo-legal move generation
        if (!make_move(board, move))
            continue;

        #ifdef DEBUG
        ++moves_searched;
        #endif
        score = -quiescence(-β, -α, board, info);

        undo_move(board, move);

        if (search_stopped(info)) {
            return 0;
        }

        if (score >= β) { // fail-high
            #ifdef DEBUG
            if (moves_searched == 1) {
                info->fail_high_first++;
            }
            info->fail_high++;
            #endif
            tt.store(board, move, β, LOWER, 0); // qs tt entries are easily overrideable
            return β;
        }

        if (score > α) { // PV-node
            bestmove = move;
            α = score;
        }
    }

    tt.store(board, bestmove, α, UPPER, 0); // qs tt entries are easily overrideable
    return α;
}

/* Search the tree starting from the root node (current board state) */
void search(board_t *board, searchinfo_t *info) {
    assert(check(board));

    move_t best_move = NULLMV;
    int best_score = 0;

    // Clear for search
    init_search(board, info);

    int curr_depth_nodes = 0;
    int curr_depth_time = 0;

    /*
    std::cout << "Starting search: ";
    std::cout << "time allocated: " << info->end - now();
    std::cout << " time start: " << info->start;
    std::cout << " time end: " << info->end << std::endl;
    */

    // Iterative deepening
    for (int depth = 1; depth <= info->depth; ++depth) {
        // For calculating the branching factor
        curr_depth_nodes = info->nodes;

        // For time management
        curr_depth_time = now();

        best_score = aspiration_window_search(board, info, best_score, depth, USE_NULL);

        curr_depth_nodes = info->nodes - curr_depth_nodes;
        curr_depth_time = now() - curr_depth_time;

        if (search_stopped(info)) {
            break;
        }

        assert(info->state == ENGINE_SEARCHING);

        best_move = pv_tb[0][0];

        print_search_info(best_score,
                          depth,
                          info->seldepth,
                          info->nodes,
                          now() - info->start,
                          pv_tb[0], board);

        LOG("info string depth " << depth \
            << std::setprecision(4) \
            << " branchf " << std::pow(curr_depth_nodes, 1.0/depth) \
            << std::setprecision(2) \
            << " ordering " << (static_cast<double>(info->fail_high_first) / info->fail_high) \
            << " nullcut " << info->nullcut \
            << " hashcut " << info->hashcut \
            << " deltacut " << info->deltacut \
            << " seecut " << info->seecut \
        );

        // We try to estimate if we have enough time to search the next depth,
        // and if not, we cut the search short to not waste the time
        // (REVIEW: This might be suboptimal since we could be filling the TT)
        // REVIEW: Need to tune the coefficient here
        //if (info->time_set && 3.5 * (now() - info->start) >= info->end - info->start) {
            //std::cout << "info string Engine won't have enough time to search the next depth!\n";
            //break;
        //}
    }

    std::cout << "bestmove " << move_to_str(best_move) << std::endl;

    assert(check(board));

    // After the search is stopped, the thread sets the status to stopped
    info->state = ENGINE_STOPPED;
}
