/* Static exchange evaluation code for move ordering */
#include "see.h"

#include <algorithm> // std::min, std::max

namespace {

/**
 @brief Generates a bitboard of uncovered xray attacks by moving
 a piece from square 'from' to square 'to'.

 Assumes the moved piece bit has been cleared in occ (refer to see());
 @param board current board state
 @param occ current occupancy bitboard, without the moved piece
 @param from the square the piece was moved from
 @param to the square the piece was moved to
*/
inline bb_t consider_xrays(const board_t *board, bb_t occ, square_t from, square_t to) {
    LOG("Checking xray attacks for " \
        << square_to_str(from) << square_to_str(to));

    // Type of xray attacks to check depends on the type of the moved piece
    piece_t PIECE_T = piece_type(board->pieces[from]);

    // Generate possible attackers uncovered by moving the piece
    // - if a rook was moved, only a rook or queen can be uncovered
    // - else, only a bishop or queen can be uncovered
    bb_t uncovered = 0ULL;
    switch (PIECE_T) {
    case ROOK:
      uncovered = attacks<ROOK>(from, occ);
      uncovered &= (queens(board) | rooks(board));
      break;
    case PAWN:
    case BISHOP:
      uncovered = attacks<BISHOP>(from, occ);
      uncovered &= (queens(board) | bishops(board));
      break;
    case QUEEN:
      uncovered = attacks<QUEEN>(from, occ);
      uncovered &= queens(board) | rooks(board) | bishops(board);
      break;
    default: // should never happen
       assert(false);
       uncovered = 0ULL;
    }
    uncovered &= occ;

    // For each uncovered piece, we generate xray attacks, treating
    // the from square as blocked (it is now unblocked)
    // If the generated attacks overlap with the 'to' square bitboard,
    // we have discovered a new valid xray attack for that square
    bb_t attackers = 0ULL;
    bb_t from_bb = SQ_TO_BB(from), to_bb = SQ_TO_BB(to);
    while (uncovered) {
        from = POPLSB(uncovered); // note: don't confuse with the original 'from' arg
        // If xray-attacks overlap with the target 'to' square:
        if (xray_attacks(PIECE_T, from, occ, from_bb) & to_bb) {
            attackers |= SQ_TO_BB(from);
        }
    }

    return attackers;
}

bb_t get_least_valuable_pce(const board_t *board, bb_t attadef, int colour,
                            piece_t &piece) {
    LOG("Getting least valuable pce for " \
        << (colour ? "White" : "Black") << ": ");
    int incr = colour ? 0 : 8;
    bb_t subset = 0ULL;
    for (piece = PAWN + incr; piece <= KING + incr; ++piece) {
        subset = attadef & board->bitboards[piece];
        if (subset) {
            //return subset & -subset; // single bit
            LOG(piece_to_ascii[piece] << " at " << square_to_str(GETLSB(subset)));
            return LSB_BB(subset);
        }
    }
    return 0ULL; // empty set
}

} // namespace


// Adapted from: https://www.chessprogramming.org/SEE_-_The_Swap_Algorithm
int see(const board_t *board, const move_t m) {

    LOG("see(): Checking move " << move_to_str(m));

    // Extract move data
    square_t from = get_from(m);
    square_t to = get_to(m);
    // Target piece
    piece_t tgt_pce = board->pieces[to];
    // Attacking piece
    piece_t att_pce = board->pieces[from];

    // swap-list         // depth
    int gain[MAX_DEPTH], d = 0;

    // Pieces which may uncover an xray attack: pawns | bishops | rooks | queen;
    bb_t may_xray = all_pieces(board)
        ^ (board->bitboards[n] | board->bitboards[N])
        ^ (board->bitboards[k] | board->bitboards[K]);

    bb_t from_bb = SQ_TO_BB(from);
    bb_t occ     = all_pieces(board);
    bb_t attadef = attacks_to(board, to);

    // Traverse through all attackers and defenders
    gain[d] = value_mg[tgt_pce];
    do {
        d++; // Next depth and side
        gain[d] = value_mg[att_pce] - gain[d-1]; // Speculative store, if defended
        LOG("gain[" << d << ']' << " = " << gain[d]);
        // if (std::max(-gain[d-1], gain[d]) < 0) break; // Pruning does not influence the result
        attadef ^= from_bb; // Reset bit in set to traverse
        occ     ^= from_bb; // Reset bit in temporary occupancy (for x-Rays)
        if (from_bb & may_xray)
            attadef |= consider_xrays(board, occ, GETLSB(from_bb), to);
        from_bb = get_least_valuable_pce(board, attadef, (d + board->turn) & 1, att_pce);
    } while (from_bb);

    while (--d)
        gain[d-1]= -std::max(-gain[d-1], gain[d]);

    return gain[0];
}

// TODO: see_trace for debugging
