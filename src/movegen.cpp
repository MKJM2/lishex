/* Move generation logic (separate for quiet and non-quiet moves) */
#include "movegen.h"
#include "attack.h"
#include "types.h"

// @TODO: Collapse the implementation for quiet and noisy
// move generation with templates to not do the same work twice
// (e.g. fetching attack bitboards)


namespace {

/**
 * @brief Generate non-captures for the given piece type
 * @tparam PIECE_T piece type to generate moves for
 * @param board current position to generate quiet moves for
 * @param moves movelist to append moves to
 */
template<piece_t PIECE_T>
void generate_quiet_moves_for(const board_t *board, movelist_t *moves) {

    bb_t pieces = board->bitboards[set_colour(PIECE_T, board->turn)];
    const bb_t occupied = all_pieces(board);

    while (pieces) {
        square_t from = POPLSB(pieces);

        bb_t attacked = 0ULL;
        if constexpr (is_sliding<PIECE_T>) {
            attacked = attacks<PIECE_T>(from, occupied);
        } else {
            attacked = attacks<PIECE_T>(from);
        }
        // Since we're generating quiet moves, we mask out all other pieces
        attacked &= ~occupied;

        while (attacked) {
            moves->push_back(Move(from, POPLSB(attacked), QUIET));
        }
    }
}

/**
 * @brief Generate captures for the given piece type
 * @tparam PIECE_T piece type to generate moves for
 * @param board current position to generate non-quiet moves for
 * @param moves movelist to append moves to
 */
template<piece_t PIECE_T>
void generate_noisy_moves_for(const board_t *board, movelist_t *moves) {

    bb_t pieces = board->bitboards[set_colour(PIECE_T, board->turn)];
    const bb_t opp_pieces = board->sides_pieces[board->turn ^ 1];
    const bb_t occupied = all_pieces(board);

    while (pieces) {
        square_t from = POPLSB(pieces);

        bb_t attacked = 0ULL;
        if constexpr (is_sliding<PIECE_T>) {
            attacked = attacks<PIECE_T>(from, occupied);
        } else {
            attacked = attacks<PIECE_T>(from);
        }
        // Since we're generating noisy moves, only consider captures
        attacked &= opp_pieces;

        while (attacked) {
            moves->push_back(Move(from, POPLSB(attacked), CAPTURE));
        }
    }
}

/**
 * @brief Generates promotion moves for the current board state
 * @oaran board current position to generate promotions for
 * @param moves movelist to append generated moves to
 */
void generate_promotions(const board_t *board, movelist_t *moves) {

    square_t to;

    const int& me = board->turn;

    // Direction of pawn movement
    int dir = (me) ? NORTH : SOUTH;

    // We need to flag capture promotions accordingly (for move ordering etc.)
    bb_t pawns_bb = board->bitboards[me ? P : p] & PROMOTING(me);

    /* Captures */
    bb_t opp_pieces = board->sides_pieces[me ^ 1];

    // East capture promotions
    bb_t targets = (me) ? ne_shift(pawns_bb) : se_shift(pawns_bb);
    targets &= opp_pieces;
    while (targets) {
        // Add all possible east capture promotions to the move list
        to = POPLSB(targets);
        for (int type = QUEENPROMO; type >= KNIGHTPROMO; --type) {
            moves->push_back(Move(to - dir - EAST, to, type | CAPTURE));
        }
    }

    // West capture promotions
    targets = (me) ? nw_shift(pawns_bb) : sw_shift(pawns_bb);
    targets &= opp_pieces;
    while (targets) {
        to = POPLSB(targets);
        for (int type = QUEENPROMO; type >= KNIGHTPROMO; --type) {
            moves->push_back(Move(to - dir - WEST, to, type | CAPTURE));
        }
    }

    /* Non-captures */
    bb_t empty_squares = ~all_pieces(board);

    targets = (me) ? n_shift(pawns_bb) : s_shift(pawns_bb);
    targets &= empty_squares;
    while (targets) {
        to = POPLSB(targets);
        for (int type = QUEENPROMO; type >= KNIGHTPROMO; --type) {
            moves->push_back(Move(to - dir, to, type));
        }
    }
}

/**
 * @brief Generates castling moves for the current board state
 * @param board current board state
 * @param moves movelist to append generated moves to
 */
void generate_castles(const board_t *board, movelist_t *moves) {

    // The castling rights are encoded with 4 bits:
    // enum { WK = 1, WQ = 2, BK = 4, BQ = 8 };

    // Masks to check for obstacles between the king and the rook
    static const bb_t WK_BB = 0x60ULL;
    static const bb_t WQ_BB = 0x0eULL;
    static const bb_t BK_BB = 0x6000000000000000ULL;
    static const bb_t BQ_BB = 0x0e00000000000000ULL;

    const int& me = board->turn;

    const bb_t occupied = all_pieces(board);

    // TODO: Collapse into a single implementation (templates?)
    if (me == WHITE) {
        // King side castle
        if ((board->castle_rights & WK) &&
            ((occupied & WK_BB) == 0) &&
             !is_attacked(board, E1, BLACK) &&
             !is_attacked(board, F1, BLACK)) {
            moves->push_back(Move(E1, G1, KINGCASTLE));
        }
        // Queen side castle
        if ((board->castle_rights & WQ) &&
            ((occupied & WQ_BB) == 0) &&
             !is_attacked(board, E1, BLACK) &&
             !is_attacked(board, D1, BLACK)) {
            moves->push_back(Move(E1, C1, QUEENCASTLE));
        }
    } else { /* BLACK's turn */
        // King side castle
        if ((board->castle_rights & BK) &&
            ((occupied & BK_BB) == 0) &&
             !is_attacked(board, E8, WHITE) &&
             !is_attacked(board, F8, WHITE)) {
            moves->push_back(Move(E8, G8, KINGCASTLE));
        }
        // Queen side castle
        if ((board->castle_rights & BQ) &&
            ((occupied & BQ_BB) == 0) &&
             !is_attacked(board, E8, WHITE) &&
             !is_attacked(board, D8, WHITE)) {
            moves->push_back(Move(E8, C8, QUEENCASTLE));
        }
    }
}

} // namespace

int generate_quiet(const board_t *board, movelist_t *moves) {

    square_t to;
    int move_count = moves->size();
    // We collapse the implementation for both black and white
    const int& me = board->turn;

    /* Pawn pushes & double pushes (we handle promotions in generate_noisy) */
    int dir = (me) ? NORTH : SOUTH;

    // We mask out the promoting pawns for the side to move
    bb_t pawns_bb = board->bitboards[me ? P : p] & NOT_PROMOTING(me);

    // Pawns can only move to empty squares
    bb_t empty_squares = ~all_pieces(board);

    bb_t pawn_pushes = (me) ? n_shift(pawns_bb) : s_shift(pawns_bb);
    pawn_pushes &= empty_squares;

    // For double pawn pushes we consider pawns on rank 2 (white) or 7 (black)
    // Since we pushed them by one square already, we check only ranks 3 and 6
    bb_t double_pawn_pushes = (me) ? n_shift(pawn_pushes & RANK_TO_BB(3))
                                   : s_shift(pawn_pushes & RANK_TO_BB(6));
    double_pawn_pushes &= empty_squares;

    while (pawn_pushes) {
        to = POPLSB(pawn_pushes);
        moves->push_back(Move(to - dir, to, QUIET));
    }

    while (double_pawn_pushes) {
        to = POPLSB(double_pawn_pushes);
        moves->push_back(Move(to - dir - dir, to, PAWNPUSH));
    }

    /* Non-sliding (leaping) Piece moves */
    generate_quiet_moves_for<KNIGHT>(board, moves);
    generate_quiet_moves_for<KING>(board, moves);

    /* Sliding Piece moves */
    generate_quiet_moves_for<ROOK>(board, moves);
    generate_quiet_moves_for<BISHOP>(board, moves);
    generate_quiet_moves_for<QUEEN>(board, moves);

    /* Castling */
    generate_castles(board, moves);

    return moves->size() - move_count;
}


int generate_noisy(const board_t *board, movelist_t *moves) {

    square_t to;
    int move_count = moves->size();
    const int& me = board->turn;
    int opp = me ^ 1;
    bb_t opp_pieces = board->sides_pieces[opp];

    // Directions of pawn movement
    int dir = (me) ? NORTH : SOUTH;

    // TODO: Use a while loop popping the lsb of a clone of pawns_bb like in
    // generate_promotions()
    bb_t pawns_bb = board->bitboards[me ? P : p] & NOT_PROMOTING(me);

    /* Pawn captures & en passant */
    bb_t pawn_captures_east = (me) ? ne_shift(pawns_bb) : se_shift(pawns_bb);
    pawn_captures_east &= opp_pieces;

    while (pawn_captures_east) {
        to = POPLSB(pawn_captures_east);
        moves->push_back(Move(to - dir - EAST, to, CAPTURE));
    }

    bb_t pawn_captures_west = (me) ? nw_shift(pawns_bb) : sw_shift(pawns_bb);
    pawn_captures_west &= opp_pieces;

    while (pawn_captures_west) {
        to = POPLSB(pawn_captures_west);
        moves->push_back(Move(to - dir - WEST, to, CAPTURE));
    }

    /* En passant captures */
    if (board->ep_square != NO_SQ) {
        bb_t attacked_sq = SQ_TO_BB(board->ep_square);
        bb_t attacked_by = opp ? ne_shift(attacked_sq) | nw_shift(attacked_sq) :
                                se_shift(attacked_sq) | sw_shift(attacked_sq);

        // If attacked by one of our pawns
        if (attacked_by &= pawns_bb) {
            while (attacked_by) {
                moves->push_back(Move(POPLSB(attacked_by), board->ep_square, EPCAPTURE));
            }
        }
    }

    /* Promotions */
    generate_promotions(board, moves);

    /* Captures by non-sliding pieces */
    generate_noisy_moves_for<KNIGHT>(board, moves);
    generate_noisy_moves_for<KING>(board, moves);

    /* Captures by sliding pieces */
    generate_noisy_moves_for<QUEEN>(board, moves);
    generate_noisy_moves_for<ROOK>(board, moves);
    generate_noisy_moves_for<BISHOP>(board, moves);

    return moves->size() - move_count;
}


int generate_moves(const board_t *board, movelist_t *moves) {
    moves->clear();
    return generate_quiet(board, moves) + generate_noisy(board, moves);
}


bb_t is_attacked(const board_t *board, const square_t sq, const int colour) {
    assert(check(board));

    bb_t attackers = 0ULL;

    // Check if attacked by pawns
    piece_t pce = set_colour(p, colour);
    bb_t curr = board->bitboards[pce];
    if (colour) {
        attackers |= ne_shift(curr);
        attackers |= nw_shift(curr);
    } else {
        attackers |= se_shift(curr);
        attackers |= sw_shift(curr);
    }
    if (attackers & SQ_TO_BB(sq))
        return attackers;

    pce = set_colour(KNIGHT, colour);
    if ((attackers = attacks<KNIGHT>(sq) & board->bitboards[pce]))
        return attackers;

    pce = set_colour(KING, colour);
    if ((attackers = attacks<KING>(sq) & board->bitboards[pce]))
        return attackers;

    // For sliding pieces, we need the occupancy board
    bb_t occupied = all_pieces(board);
    pce = set_colour(BISHOP, colour);
    if ((attackers = attacks<BISHOP>(sq, occupied) & board->bitboards[pce]))
        return attackers;

    pce = set_colour(ROOK, colour);
    if ((attackers = attacks<ROOK>(sq, occupied) & board->bitboards[pce]))
        return attackers;

    pce = set_colour(QUEEN, colour);
    if ((attackers = attacks<QUEEN>(sq, occupied) & board->bitboards[pce]))
        return attackers;

    return 0ULL;
}


uint64_t perft(board_t *board, int depth, bool verbose) {
    if (depth == 0) {
        return 1ULL;
    }
    int n_moves, i;
    uint64_t curr;
    uint64_t nodes = 0;

    movelist_t moves;
    n_moves = generate_moves(board, &moves);
    for (const move_t& move : moves) {
        if (!make_move(board, move))
            continue;
        curr = perft(board, depth - 1);
        if (verbose) {
            std::cout << move_to_str(move) << " " \
                      << curr << std::endl;
        }
        nodes += curr;
        undo_move(board);
    }
    return nodes;
}
