/* Move generation logic (separate for quiet and non-quiet moves) */
#include "movegen.h"

// TODO: Collapse the implementation for quiet and noisy
// move generation with templates to not do the same work twice
// (e.g. fetching attack bitboards)

/**
 * @brief Generate non-captures for the given piece type
 * @tparam PIECE_T piece type to generate moves for
 * @param board current position to generate quiet moves for
 * @param moves movelist to append moves to
*/
template<piece_t PIECE_T>
void generate_quiet_moves_for(board_t *board, movelist_t *moves) {

    bb_t pieces = board->bitboards[set_color(PIECE_T, board->turn)];
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
void generate_noisy_moves_for(board_t *board, movelist_t *moves) {

    bb_t pieces = board->bitboards[set_color(PIECE_T, board->turn)];
    const bb_t opp_pieces = board->pieces[board->turn ^ 1];
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

// TODO:
void generate_promotions(board_t *board, movelist_t *moves) {
    (void) board;
    (void) moves;
}

/**
 * generate_quiet
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of quiet moves generated
 */
int generate_quiet(board_t *board, movelist_t *moves) {

    square_t to;
    int move_count = moves->size();
    // We collapse the implementation for both black and white
    int& me = board->turn;
    int opp = me ^ 1;

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
    // TODO

    return moves->size() - move_count;
}

/**
 * generate_noisy
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of noisy (non-quiet) moves generated
 */
int generate_noisy(board_t *board, movelist_t *moves) {

    square_t to;
    int move_count = moves->size();
    int& me = board->turn;
    int opp = me ^ 1;
    bb_t opp_pieces = board->pieces[opp];

    // Directions of pawn movement
    int dir = (me) ? NORTH : SOUTH;

    bb_t pawns_bb = board->bitboards[me ? P : p];

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
        moves->push_back(Move(to - dir - EAST, to, CAPTURE));
    }

    /* En passant captures */
    // TODO

    /* Promotions */
    // TODO

    /* Captures by non-sliding pieces */
    generate_noisy_moves_for<KNIGHT>(board, moves);
    generate_noisy_moves_for<KING>(board, moves);

    /* Captures by sliding pieces */
    generate_noisy_moves_for<QUEEN>(board, moves);
    generate_noisy_moves_for<ROOK>(board, moves);
    generate_noisy_moves_for<BISHOP>(board, moves);

    return moves->size() - move_count;
}

/**
 * generate_moves
 * @brief Generates all moves for the current position
 * @param board board struct representing the current position
 * @param moves pointer to a move list
 * @return number of moves (quiet & noisy) generated
 */
int generate_moves(board_t *board, movelist_t *moves) {
    moves->clear();
    return generate_quiet(board, moves) + generate_noisy(board, moves);
}
