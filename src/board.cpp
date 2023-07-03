#include "board.h"

#include <cstring> //std::memset
#include <vector>

#include "bitboard.h"
#include "attack.h"
#include "types.h"
#include "movegen.h"
#include "rng.h"

#ifdef DEBUG
size_t boards = 0;
std::vector<board_t> ref_boards(64); // TODO: C-style array
#endif

/*******************/
/* Zobrist hashing */
/*******************/

uint64_t piece_keys[PIECE_NO][SQUARE_NO];
uint64_t turn_key = 0ULL;
uint64_t castle_keys[16]; // == WK | WQ | BK | BQ + 1 = 0b1111 + 1
uint64_t ep_keys[SQUARE_NO];

void init_keys() {
    seed_rng();
    // For each piece type and square generate a random key
    for (piece_t p : pieces) {
        for (square_t sq = A1; sq <= H8; ++sq) {
            piece_keys[p][sq] = rand_uint64();
        }
    }

    // Generate hash key for White's side to play
    turn_key = rand_uint64();

    // Generate hash keys for castling rights
    for (int i = 0; i < 16; ++i) {
        castle_keys[i] = rand_uint64();
    }

    // Generate hash keys for en passant squares
    // (though we only need 16, having 64 keys makes the code cleaner)
    for (square_t sq = A1; sq <= H8; ++sq) {
        ep_keys[sq] = rand_uint64();
    }
}

/* Zeroes out the entire position */
void reset(board_t *board) {

    // Throws compiler warnings:
    // std::memset(board, 0, sizeof(board_t));

    // Clear board history
    // memset(board->history, 0, MAX_MOVES * sizeof(undo_t));
    for (int his_ply = 0; his_ply < MAX_MOVES; ++his_ply) {
        board->history[his_ply] = {
            NULLMV, 0, NO_SQ, 0, 0ULL, NO_PIECE
        };
    }

    // Reset the 8x8 board
    memset(board->pieces, 0, sizeof(board->pieces));

    // Reset all bitboards
    for (piece_t pc = NO_PIECE; pc < PIECE_NO; ++pc) {
        board->bitboards[pc] = 0ULL;
    }
    board->sides_pieces[BLACK] = board->sides_pieces[WHITE] = 0ULL;

    // Reset the turn
    board->turn = BOTH;

    // Reset the en passant square
    board->ep_square = NO_SQ;

    // Reset the plies
    board->ply = 0;
    board->history_ply = 0;

    // Reset castling rights
    board->castle_rights = 0;

    // Reset 50rule counter
    board->fifty_move = 0;

    // Clear Zobrist board key
    board->key = 0ULL;

    // Reset king squares
    board->king_square[WHITE] = board->king_square[BLACK] = NO_SQ;
}

/* Initializes the board from given FEN string */
void setup(board_t *board, const std::string& fen) {
    // Split the input FEN into 6 parts
    // - position
    // - side to move
    // - castling rights
    // - en passant square
    // - halfmove clock
    // - fullmove clock
    // example: rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1
    std::string fen_parts[6];
    int idx = 0;
    size_t i = 0;
    for (; i < fen.size(); ++i) {
        if (fen[i] == ' ') {
            ++idx;
        } else {
            fen_parts[idx] += fen[i];
        }
    }

    // Make sure the board is reset
    reset(board);

    // Fill the bitboards with pieces from FEN
    int sq = A8;
    char c;
    for (i = 0; i < fen_parts[0].size(); ++i) {
        c = fen_parts[0][i];
        if (c == '/') {
            sq -= 2 * NORTH;
        } else if (isdigit(c)) {
            sq += (int)c - '0';
        } else {
            piece_t piece = char_to_piece[c];
            SETBIT(board->bitboards[piece], sq);
            SETBIT(board->sides_pieces[piece_color(piece)], sq);
            board->pieces[sq] = piece;
            ++sq;
        }
    }

    // Set the king squares
    assert(CNT(board->bitboards[K]) == CNT(board->bitboards[k]) == 1);
    board->king_square[WHITE] = GETLSB(board->bitboards[K]);
    board->king_square[BLACK] = GETLSB(board->bitboards[k]);

    // Set the side to move
    board->turn = (fen_parts[1] == "w") ? WHITE : BLACK;

    // Set the castling rights
    board->castle_rights = 0;
    if (fen_parts[2] != "-") {
        if (fen_parts[2].find('K') != std::string::npos) {
            board->castle_rights |= WK;
        }
        if (fen_parts[2].find('Q') != std::string::npos) {
            board->castle_rights |= WQ;
        }
        if (fen_parts[2].find('k') != std::string::npos) {
            board->castle_rights |= BK;
        }
        if (fen_parts[2].find('q') != std::string::npos) {
            board->castle_rights |= BQ;
        }
    }

    // Set the en passant square
    if (fen_parts[3] != "-") {
        int file = fen_parts[3][0] - 'a';
        int rank = fen_parts[3][1] - '1';
        board->ep_square = rank * 8 + file;
    } else {
        board->ep_square = NO_SQ;
    }

    // Set the halfmove clock since last capture/pawn push
    if (fen_parts[4].size()) {
        board->ply = stoi(fen_parts[4]);
    }

    // TODO: Set the fullmove clock (currently not being used!)

    // Generate the starting position key for this FEN
    board->key = generate_pos_key(board);
}

/* Prints the board to stdout */
void print(const board_t *board, bool verbose) {
    // TODO: We might want to use " ╚═╔├ "?
    static const std::string horizontal_line = "  +---+---+---+---+---+---+---+---+";

    std::cout << horizontal_line << std::endl;
    // Loop over all ranks
    for (int rank = RANK_8; rank >= RANK_1; --rank) {
        std::cout << rank + 1 << " ";
        // Loop over all files
        for (int file = A_FILE; file <= H_FILE; ++file) {
            // Current square to print
            square_t sq = rank * RANK_NO + file;

            piece_t piece_on_sq = NO_PIECE;
            /*
            // Check if any bitboards contain a piece on sq
            //for (piece_t piece = P; piece <= k; ++piece) {
            for (piece_t pc : pieces) {
                if (GETBIT(board->bitboards[pc], sq)) {
                    piece_on_sq = pc;
                    break;
                }
            }
            */
            piece_on_sq = board->pieces[sq];
            // Print the piece
            std::cout << "| " << piece_to_ascii[piece_on_sq] << " ";
        }
        // Print rank number to the right of current rank
        std::cout << "|" << std::endl;
        std::cout << horizontal_line << std::endl;
    }
    // Print files underneath the board
    std::cout << "    a   b   c   d   e   f   g   h" << std::endl;

    if (!verbose) return;
    // Print additional information, like castle permissions, side to move etc.
    std::cout << "Side to play: " \
              << ((board->turn) ? "White" : "Black") << std::endl;
    std::cout << "En Passant square: "
              << ((board->ep_square == NO_SQ) ? "null"
                                              : square_to_str(board->ep_square))
              << std::endl;
    std::cout << "Castle permissions: ";

    // TODO: Make into a separate function
    std::string s;
    if (board->castle_rights & WK) s.push_back('K');
    if (board->castle_rights & WQ) s.push_back('Q');
    if (board->castle_rights & BK) s.push_back('k');
    if (board->castle_rights & BQ) s.push_back('q');
    std::cout << s << std::endl;

    std::cout << "Zobrist hash key: " << std::hex \
              << board->key << std::dec << std::endl;

    std::cout << "King squares: White at " \
              << square_to_str(board->king_square[1]) << ", Black at " \
              << square_to_str(board->king_square[0]) << std::endl;

    /*
    std::cout << "Keys:" << std::endl;
    for (piece_t p : pieces) {
        for (square_t sq = A1; sq <= H8; ++sq) {
            std::cout << piece_keys[p][sq] << std::endl;
        }
    }
    std::cout << "Turn key:" << std::endl;
    std::cout << turn_key << std::endl;
    std::cout << "Castle keys:" << std::endl;
    for (int i = 0; i < 16; ++i) {
        std::cout << castle_keys[i] << std::endl;
    }
    std::cout << "Piece counts: " << std::endl;
    std::cout << "White pawns: ";
    std::cout << pceCount[Piece::White | Piece::Pawn] << std::endl;
    std::cout << "Black pawns: ";
    std::cout << pceCount[Piece::Black | Piece::Pawn] << std::endl;
    std::cout << "White Knights: ";
    std::cout << pceCount[Piece::White | Piece::Knight] << std::endl;
    std::cout << "Black Knights: ";
    std::cout << pceCount[Piece::Black | Piece::Knight] << std::endl;
    std::cout << "White Bishops: ";
    std::cout << pceCount[Piece::White | Piece::Bishop] << std::endl;
    std::cout << "Black Bishops: ";
    std::cout << pceCount[Piece::Black | Piece::Bishop] << std::endl;
    std::cout << "White Rooks: ";
    std::cout << pceCount[Piece::White | Piece::Rook] << std::endl;
    std::cout << "Black Rooks: ";
    std::cout << pceCount[Piece::Black | Piece::Rook] << std::endl;
    std::cout << "White Queens: ";
    std::cout << pceCount[Piece::White | Piece::Queen] << std::endl;
    std::cout << "Black Queens: ";
    std::cout << pceCount[Piece::Black | Piece::Queen] << std::endl;
    std::cout << "Fifty Move Counter: " << fiftyMoveCounter << "\n";
    */
}

/* Generates the position key from scratch for the current position */
uint64_t generate_pos_key(const board_t *board) {
    uint64_t key = 0ULL;

    // Hash in all the pieces on the board
    /*
    for (piece_t p : pieces) {
        for (square_t sq = A1; sq <= H8; ++sq) {
            if (GETBIT(board->bitboards[p], sq)) {
                key ^= piece_keys[p][sq];
            }
        }
    }
    */
    for (square_t sq = A1; sq <= H8; ++sq) {
        key ^= piece_keys[board->pieces[sq]][sq];
    }

    // Hash in the side playing
    if (board->turn == WHITE) {
        key ^= turn_key;
    }

    // Hash in castling rights
    key ^= castle_keys[board->castle_rights];

    // Hash in the en passant square (if set)
    if (board->ep_square != NO_SQ) {
        key ^= ep_keys[board->ep_square];
    }

    return key;
}

void test(board_t *board) {
    assert(check(board));

    // bb_t blockers = 0x8005000022400ULL;

    //printBB(gen_rook_attacks(D5, blockers));
    square_t sq;
    for (int rank = RANK_8; rank >= RANK_1; --rank) {
        for (int file = A_FILE; file <= H_FILE; ++file) {
            sq = rank * 8 + file;
            std::cout << (is_attacked(board, sq, WHITE) ? "X " : "0 ");
        }
        std::cout << std::endl;
    }

}

/* Helpers for manipulating pieces on the board */

// Adds a piece pce to board on square sq
inline static void add_piece(board_t *board, piece_t pce, square_t sq) {

    assert(check(board));

    // Add piece to the board
    // 8x8 board
    board->pieces[sq] = pce;
    // Bitboards
    board->bitboards[pce] |= SQ_TO_BB(sq);
    board->sides_pieces[piece_color(pce)] |= SQ_TO_BB(sq);

    // Hash the piece into the Zobrist key for the board
    board->key ^= piece_keys[pce][sq];
}

// Removes a piece pce from board on square sq
inline static void rm_piece(board_t *board, square_t sq) {

    assert(check(board));
    piece_t pce = board->pieces[sq];

    /* Clear piece off the board */
    // 8x8 board
    board->pieces[sq] = NO_PIECE;
    // Bitboards
    board->bitboards[pce] ^= SQ_TO_BB(sq);
    board->sides_pieces[piece_color(pce)] ^= SQ_TO_BB(sq);

    // Hash the piece out of the Zobrist key for the board
    board->key ^= piece_keys[pce][sq];
}

// Moves a piece pce from 'from' to 'to'
inline static void mv_piece(board_t *board, square_t from, square_t to) {

    /* Move the piece on the board */
    piece_t pce = board->pieces[from];
    // 8x8 board
    board->pieces[to] = pce;
    board->pieces[from] = NO_PIECE;
    // Bitboards
    board->bitboards[pce] ^= SQ_TO_BB(from);
    board->bitboards[pce] |= SQ_TO_BB(to);

    board->sides_pieces[piece_color(pce)] ^= SQ_TO_BB(from);
    board->sides_pieces[piece_color(pce)] |= SQ_TO_BB(to);

    /* Hash the piece out of the old square and into the new */
    board->key ^= piece_keys[pce][from];
    board->key ^= piece_keys[pce][to];
}

/**
 @brief Performs a move, mutating the current board position
 @param board current position
 @param move move to be performed
 @returns True if move was legal, False otherwise
*/
bool make_move(board_t *board, move_t move) {
    assert(check(board));

    // Extract move data
    square_t to = get_to(move);
    square_t from = get_from(move);
    int flags = get_flags(move);

    int me = board->turn;
    int opp = me ^ 1;

    // Store the pre-move state
    /* In C++20 we can do:
    undo_t undo = {
        .move = move,
        .castle_rights = board->castle_rights,
        .ep_square = board->ep_square,
        .fifty_move = board->fifty_move,
        .key = board->key
    };
    */
    undo_t undo = {
        move,
        board->castle_rights,
        board->ep_square,
        board->fifty_move,
        board->key,
        board->pieces[to] // captured piece, if any
    };

    #ifdef DEBUG
    // Store the board state (for debugging purposes)
    //ref_boards[boards++] = *board;
    ref_boards.push_back(*board);
    #endif

    /* Update board state */

    // Handle counters
    ++board->ply;
    ++board->fifty_move; // if a pawn push/captures performed, we'll reset this

    // If en passant performed, remove the captured pawn
    if (flags == EPCAPTURE) {
        // std::cout << "Holy hell!\n";
        square_t target_square = board->ep_square;
        target_square += opp ? NORTH : SOUTH;
        undo.captured = board->pieces[target_square];
        rm_piece(board, target_square);

        // Since a capture was performed, we reset the 50move counter
        board->fifty_move = 0;
    }

    // Save previous board state
    board->history[board->history_ply++] = undo;

    // If castling, move the rook to its new square
    if (flags == KINGCASTLE) {
        if (to == G1) {
            mv_piece(board, H1, F1);
        } else {
            mv_piece(board, H8, F8);
        }
    } else if (flags == QUEENCASTLE) {
        if (to == C1) {
            mv_piece(board, A1, D1);
        } else {
            mv_piece(board, A8, D8);
        }
    }

    /* Handle en passant */
    // Hash out old en passant square (if was set)
    if (board->ep_square != NO_SQ) {
        board->key ^= ep_keys[board->ep_square];
    }

    // Handle new en passant square (only if double pawn push)
    if (flags == PAWNPUSH) {
        board->ep_square = (to + from) >> 1;
        board->key ^= ep_keys[board->ep_square];
    } else {
        board->ep_square = NO_SQ;
    }

    /* Handle castle permissions */
    // Hash out old permissions
    board->key ^= castle_keys[board->castle_rights];

    // Set new permissions
    // (can be spoiled by e.g. moving the king)
    board->castle_rights &= castle_spoils[from];
    board->castle_rights &= castle_spoils[to];

    // Hash in new permissions
    board->key ^= castle_keys[board->castle_rights];

    // Clear any pieces & reset 50move counter if necessary
    if (board->pieces[to] != NO_PIECE) {
        rm_piece(board, to);
        board->fifty_move = 0;
    }

    // If pawn move, reset 50 move counter
    // TODO: No need to do this before in the EPCAPTURE branch?
    if (piece_type(board->pieces[from]) == PAWN) {
        board->fifty_move = 0;
    }

    // Finally, we move the piece
    mv_piece(board, from, to);

    // Handle promotions
    if (is_promotion(move)) {
        // Update the pawn to be the capture choice
        rm_piece(board, to);
        // clear the capture bit
        switch (flags & ~CAPTURE) {
            case QUEENPROMO:
                add_piece(board, set_colour(QUEEN, me), to); break;
            case ROOKPROMO:
                add_piece(board, set_colour(ROOK, me), to); break;
            case BISHOPPROMO:
                add_piece(board, set_colour(BISHOP, me), to); break;
            case KNIGHTPROMO:
                add_piece(board, set_colour(KNIGHT, me), to); break;
        }
    }

    // Update the king square if the king was moved
    if (piece_type(board->pieces[to]) == KING) {
        board->king_square[me] = to;
    }

    // Miscellaneous bookkeeping
    board->turn = opp;
    board->key ^= turn_key;

    assert(check(board));

    // Finally, undo the move if puts the player in check (pseudolegal move)
    if (is_attacked(board, board->king_square[me], opp)) {
        undo_move(board, move);
        return false;
    }

    return true;
}

void undo_move(board_t *board, move_t move) {
    assert(check(board));

    // Extract move data
    square_t to = get_to(move);
    square_t from = get_from(move);
    int flags = get_flags(move);

    undo_t last = board->history[--board->history_ply];

    // Flip sides
    int me = board->turn;
    int opp = me ^ 1;
    board->turn = opp;

    board->key ^= turn_key;

    // Undo the move
    mv_piece(board, to, from);

    // Hash out the en passant square if was currently set
    if (board->ep_square != NO_SQ) {
        board->key ^= ep_keys[board->ep_square];
    }

    // Restore the en passant square from pre-move state
    board->ep_square = last.ep_square;

    // Hash in old en passant square (if any)
    if (board->ep_square != NO_SQ) {
        board->key ^= ep_keys[board->ep_square];
    }

    // If last move was an en passant capture, restore the captured pawn
    if (flags == EPCAPTURE) {
        // std::cout << "New response just dropped\n";
        square_t target_square = board->ep_square;
        target_square += me ? NORTH : SOUTH; // TODO
        add_piece(board, last.captured, target_square);
    } else {
        if (last.captured != NO_PIECE) {
            add_piece(board, last.captured, to); // TODO
        }
    }

    // If castled, move the rook back
    if (flags == KINGCASTLE) {
        if (to == G1) {
            mv_piece(board, F1, H1);
        } else {
            mv_piece(board, F8, H8);
        }
    } else if (flags == QUEENCASTLE) {
        if (to == C1) {
            mv_piece(board, D1, A1);
        } else {
            mv_piece(board, D8, A8);
        }
    }

    /* Handle castling permissions */

    // Hash out current permissions
    board->key ^= castle_keys[board->castle_rights];

    // Restore old castle rights
    board->castle_rights = last.castle_rights;

    // Hash in old castle rights
    board->key ^= castle_keys[board->castle_rights];

    // Restore 50move counter
    board->fifty_move = last.fifty_move;

    // Restore king's square
    if (piece_type(board->pieces[from]) == KING) {
        board->king_square[opp] = from; // TODO Validate side?
    }

    // Undo promotions
    if (is_promotion(move)) {
        // Remove piece that was promoted to
        rm_piece(board, from);
        // Add the pawn back in
        add_piece(board, from, set_colour(PAWN, me));
    }

    // Update ply counter
    --board->ply;

    /* DEBUG only */
    assert(check(board));

    // Assert that the board matches the previous board
    // on the history stack
    assert(check_against_ref(board));
}

void undo_move(board_t *board) {
    if (board->history_ply < 1)
        return;
    undo_move(board, board->history[board->history_ply - 1].move);
}




#ifdef DEBUG

// Useful for testing move generation and hashing
// Called in undo_move if in DEBUG mode, to verify
// whether board state was correctly restored
bool check_against_ref(const board_t *b) {

    // Reference board to compare to
    board_t test = ref_boards.back();
    board_t *ref_b = &test;

    // std::cout << "Reference board:" << std::endl;
    // print(ref_b);

    // Bitboards match
    //assert(std::equal(b->bitboards, b->bitboards + PIECE_NO, ref_b->bitboards));
    for (int i = 0; i < PIECE_NO; ++i) {
        if (b->bitboards[i] != ref_b->bitboards[i]) {
            std::cout << "Mismatch at piece " << piece_to_ascii[i] << std::endl;
            printBB(b->bitboards[i]);
            std::cout << "vs" << std::endl;
            printBB(ref_b->bitboards[i]);
            assert(false);
        }
    }

    // 8x8 boards match
    //assert(std::equal(b->pieces, b->pieces + SQUARE_NO, ref_b->pieces));
    for (square_t sq = A1; sq <= H8; ++sq) {
        if (b->pieces[sq] != ref_b->pieces[sq]) {
            std::cout << "Mismatch at square " << square_to_str(sq) << std::endl;
            std::cout << "Got " << piece_to_ascii[b->pieces[sq]] \
                << " but expected " << piece_to_ascii[ref_b->pieces[sq]] \
                << std::endl;

            print(b);
            print(ref_b);
            assert(false);
        }
    }

    // Side's pieces bitboards match
    assert(b->sides_pieces[WHITE] == ref_b->sides_pieces[WHITE]);
    assert(b->sides_pieces[BLACK] == ref_b->sides_pieces[BLACK]);

    // Side to play matches
    assert(b->turn == ref_b->turn);

    // Counters match
    assert(b->ply == ref_b->ply);
    assert(b->history_ply == ref_b->history_ply);
    assert(b->fifty_move == ref_b->fifty_move);

    // Castle rights match
    assert(b->castle_rights == ref_b->castle_rights);

    // Squares match
    assert(b->ep_square == ref_b->ep_square);
    assert(b->king_square[WHITE] == ref_b->king_square[WHITE]);
    assert(b->king_square[BLACK] == ref_b->king_square[BLACK]);


    // Zobrist keys match
    if ((uint64_t)b->key != (uint64_t)ref_b->key) {
        std::cout << "Board key: " << b->key;
        std::cout << " (expected " << generate_pos_key(b) << ")" << std::endl;
        std::cout << "Refer key: " << ref_b->key;
        std::cout << " (expected " << generate_pos_key(ref_b) << ")" << std::endl;
        assert(false);
    }

    ref_boards.pop_back();

    return true;
}

/* Verifies that the position is valid (useful for debugging) */
bool check(const board_t *board) {

    assert(board->turn == WHITE || board->turn == BLACK);

    // Verify the board Zobrist key (critical for TT functionality)
    uint64_t expected = generate_pos_key(board);
    if (expected != board->key) {
      std::cout << std::hex << "Expected: " << expected \
                << "\nGot: " << board->key << std::dec << std::endl;
      // assert(false);
      return false;
    }

    assert(board->ep_square == NO_SQ ||
           (SQUARE_RANK(board->ep_square) == RANK_3 && board->turn == BLACK) ||
           (SQUARE_RANK(board->ep_square) == RANK_6 && board->turn == WHITE));

    assert((1ULL << board->king_square[WHITE]) == board->bitboards[K]);
    assert((1ULL << board->king_square[BLACK]) == board->bitboards[k]);

    assert(board->castle_rights >= 0 && board->castle_rights <= 15);

    return true;
}
#endif // DEBUG
