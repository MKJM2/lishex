#include "board.h"

#include <cstring> //std::memset
#include <sstream> //std::istringstream
#include <string>
#include <bitset>
#ifdef DEBUG
#include <vector>
#include <iomanip>
#include <fstream>
#endif

#include "bitboard.h"
#include "attack.h"
#include "uci.h"
#include "types.h"
#include "movegen.h"
#include "rng.h"
#include "threads.h"
#include "see.h"

#ifdef DEBUG
size_t boards = 0;
std::vector<board_t> ref_boards(64); // TODO: C-style array
#endif

/*******************/
/* Zobrist hashing */
/*******************/

uint64_t piece_keys[PIECE_NO][SQUARE_NO] = {};
uint64_t turn_key = 0ULL;
uint64_t castle_keys[16] = {}; // == WK | WQ | BK | BQ + 1 = 0b1111 + 1
uint64_t *ep_keys;

void init_keys() {
    seed_rng();
    // For each piece type and square generate a random key
    for (piece_t p = NO_PIECE; p < PIECE_NO; ++p) {
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

    // For en passant squares, we simply use the piece_keys
    // indexed by an empty piece type
    // (these keys are being generated but otherwise not used anyways)
    ep_keys = piece_keys[NO_PIECE];
}

/* Zeroes out the entire position */
void reset(board_t *board) {

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
}

// TODO: Parsing current board position to a FEN string

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
    assert(king_square_bb(board, WHITE) == board->bitboards[K]);
    assert(king_square_bb(board, BLACK) == board->bitboards[k]);

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

    // TODO: Set the halfmove clock since last capture/pawn push
    // Currently, we're using the ply as the search depth ply
    // if (fen_parts[4].size()) {
        // board->ply = stoi(fen_parts[4]);
    // }
    board->ply = 0;

    // TODO: Set the fullmove clock (currently not being used!)

    // Generate the starting position key for this FEN
    board->key = generate_pos_key(board);
}
/**
 @brief Returns a FEN representation of the current board
 @param board current position
 @return a FEN string representing current board state
*/
std::string to_fen(const board_t *board) {
    std::string fen;

    // Pieces
    for (int rank = RANK_8; rank >= RANK_1; --rank) {
        int empty_sqs = 0;
        for (int file = A_FILE; file <= H_FILE; ++file) {
            square_t sq = rank * RANK_NO + file;
            piece_t pce = board->pieces[sq];

            if (pce == NO_PIECE) {
                ++empty_sqs;
            } else {
                if (empty_sqs > 0) {
                    fen += std::to_string(empty_sqs);
                    empty_sqs = 0;
                }
                fen += piece_to_ascii[pce];
            }
        }

        if (empty_sqs > 0) {
            fen += std::to_string(empty_sqs);
        }

        if (rank > 0) {
            fen += '/';
        }
    }

    // Side to move
    fen += (board->turn) ? " w " : " b ";

    // Castling permissions
    fen += castling_rights_to_str(board->castle_rights);
    fen += ' ';

    // En passant square
    if (board->ep_square != NO_SQ) {
        fen += square_to_str(board->ep_square);
    } else {
        fen += '-';
    }

    // Halfmove clock
    fen += ' ';
    fen += std::to_string(board->ply);
    fen += ' ';

    // TODO: Fullmove clock

    return fen;
}

/**
 @brief Prints the board to stdout
 @param board board to print
 @param verbose whether to include additional information, like castling rights
        (default True)
*/
void print(const board_t *board, bool verbose) {
    // TODO: Overload the << operator for board printing

    // Print files on top of the board
    std::cout << "    a b c d e f g h" << std::endl;

    // Print the board
    std::cout << "  ╔═════════════════╗ " << std::endl;

    // Loop over all ranks
    for (int rank = RANK_8; rank >= RANK_1; --rank) {
        std::cout << rank + 1 << " ║ ";

        // Loop over all files
        for (int file = A_FILE; file <= H_FILE; ++file) {

            // Current square to print
            square_t sq = rank * RANK_NO + file;

            piece_t pce = board->pieces[sq];

            // Print the piece
            std::cout << piece_to_ascii[pce] << " ";
        }

        // Print rank number to the right of current rank
        std::cout << "║ " << rank + 1 << std::endl;
    }
    std::cout << "  ╚═════════════════╝ " << std::endl;

    // Print files underneath the board
    std::cout << "    a b c d e f g h" << std::endl << std::endl;

    if (!verbose)
        return;

    std::cout << "KEY: " << std::hex << std::showbase \
              << board->key << std::dec << std::endl;
    std::cout << "FEN: " << to_fen(board) << std::endl;
}

/* Generates the position key from scratch for the current position */
uint64_t generate_pos_key(const board_t *board) {
    uint64_t key = 0ULL;

    // Hash in all the pieces on the board
    for (piece_t p : pieces) {
        bb_t b = board->bitboards[p];
        while (b) {
            key ^= piece_keys[p][POPLSB(b)];
        }
    }
    /*
    for (square_t sq = A1; sq <= H8; ++sq) {
        key ^= piece_keys[board->pieces[sq]][sq];
    }
    */

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


bool is_repetition(const board_t *board) {
    // We'll search the history backwards starting from last possible
    // repetition, which is 2 halfmoves ago
    int i = 2;
    // Since captures & pawn pushes are irreversible,
    // we don't have to check the entire history for repetitions
    // but only fifty move counter moves back
    for (; i <= board->fifty_move; i += 2) {
        if (board->key == board->history[board->history_ply - i].key) {
            return true;
        }
    }
    return false;
}


void test_see(board_t *board) {
    setup(board, "1k1r4/1pp4p/p7/4p3/8/P5P1/1PP4P/2K1R3 w - -");
    print(board);
    mirror_test(board);
    std::cout << see(board, Move(E1, E5, CAPTURE)) << std::endl;
    mirror_test(board);

    setup(board, "1k1r3q/1ppn3p/p4b2/4p3/8/P2N2P1/1PP1R1BP/2K1Q3 w - -");
    print(board);
    mirror_test(board);
    std::cout << see(board, Move(D3, E5, CAPTURE)) << std::endl;
    mirror_test(board);

    setup(board, "K4R2/8/5q2/8/5P2/8/4n3/k7 b - - 0 1");
    mirror_test(board);
    print(board);
    mirror_test(board);

    std::cout << see(board, Move(E2, F4, CAPTURE)) << std::endl;
    std::cout << see(board, Move(F6, F4, CAPTURE)) << std::endl;
    std::cout << see(board, Move(F6, F8, CAPTURE)) << std::endl;
}


void test(board_t *board) {
    setup(board, "1k1r4/1pp4p/p7/4p3/8/P5P1/1PP4P/2K1R3 w - -");
    print(board);
    mirror_test(board);
    std::cout << see(board, Move(E1, E5, CAPTURE)) << std::endl;
    mirror_test(board);

    setup(board, "1k1r3q/1ppn3p/p4b2/4p3/8/P2N2P1/1PP1R1BP/2K1Q3 w - -");
    print(board);
    mirror_test(board);
    std::cout << see(board, Move(D3, E5, CAPTURE)) << std::endl;
    mirror_test(board);

    setup(board, "K4R2/8/5q2/8/5P2/8/4n3/k7 b - - 0 1");
    mirror_test(board);
    print(board);
    mirror_test(board);


    setup(board, "rnbqkbnr/2p2p2/p3p2p/1p1p2p1/P1P1P2P/P1P1P2P/8/RNBQKBNR w KQkq d6 0 2");
    mirror_test(board);
    print(board);
    mirror_test(board);
}


/* Helpers for manipulating pieces on the board */

// Adds a piece pce to board on square sq
inline static void add_piece(board_t *board, piece_t pce, square_t sq) {
    /* Place piece to the board */

    // 8x8 board
    board->pieces[sq] = pce;

    // Bitboards
    SETBIT(board->bitboards[pce], sq);
    SETBIT(board->sides_pieces[piece_color(pce)], sq);

    // Hash the piece into the Zobrist key for the board
    board->key ^= piece_keys[pce][sq];
}

// Removes a piece pce from board on square sq
inline static void rm_piece(board_t *board, square_t sq) {
    piece_t pce = board->pieces[sq];

    /* Clear piece off the board */

    // 8x8 board
    board->pieces[sq] = NO_PIECE;

    // Bitboards
    CLRBIT(board->bitboards[pce], sq);
    CLRBIT(board->sides_pieces[piece_color(pce)], sq);

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
    CLRBIT(board->bitboards[pce], from);
    SETBIT(board->bitboards[pce], to);

    CLRBIT(board->sides_pieces[piece_color(pce)], from);
    SETBIT(board->sides_pieces[piece_color(pce)], to);

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

    #ifdef DEBUG
    assert(check(board));
    // Store the board state (for debugging purposes)
    //ref_boards[boards++] = *board;
    ref_boards.push_back(*board);
    #endif
    int me = board->turn;
    int opp = me ^ 1;

    undo_t& prev_state = board->history[board->history_ply];
    prev_state = {
        .move = move,
        .castle_rights = board->castle_rights,
        .ep_square = board->ep_square,
        .fifty_move = board->fifty_move,
        .key = board->key,
        .captured = NO_PIECE
    };

    // Extract move data
    square_t from = get_from(move);
    square_t to = get_to(move);
    int flags = get_flags(move);
    piece_t piece = board->pieces[from];

    int is_castle = flags == KINGCASTLE || flags == QUEENCASTLE;

    board->fifty_move++;

    int dir = board->turn == WHITE ? NORTH : SOUTH;

    if (flags == EPCAPTURE) {
        rm_piece(board, to - dir);
        board->fifty_move = 0;
    }
    else if (flags & CAPTURE) {
        piece_t captured = board->pieces[to];
        rm_piece(board, to);
        prev_state.captured = captured;
        board->fifty_move = 0;
    }

    if (piece_type(piece) == PAWN) {
        board->fifty_move = 0;
    }

    ++board->history_ply;
    ++board->ply;

    rm_piece(board, from);

    if (is_promotion(move)) {
        piece_t promoted_piece = NO_PIECE;
        switch (flags & ~CAPTURE) {
            case KNIGHTPROMO: promoted_piece = set_colour(KNIGHT, board->turn); break;
            case BISHOPPROMO: promoted_piece = set_colour(BISHOP, board->turn); break;
            case ROOKPROMO:   promoted_piece = set_colour(ROOK,   board->turn); break;
            case QUEENPROMO:  promoted_piece = set_colour(QUEEN,  board->turn); break;
            default: LOG("Uhoh, wrong flag!"); break;
        }
        add_piece(board, promoted_piece, to);
    } else {
        add_piece(board, piece, to);
    }

    if (board->ep_square != NO_SQ) {
        board->key ^= ep_keys[board->ep_square];
    }

    board->ep_square = NO_SQ;

    if (flags == PAWNPUSH) {
        board->ep_square = to - dir;
        board->key ^= ep_keys[board->ep_square];
    }

    if (is_castle) {
        switch (to) {
            case G1: mv_piece(board, H1, F1); break;
            case C1: mv_piece(board, A1, D1); break;
            case G8: mv_piece(board, H8, F8); break;
            case C8: mv_piece(board, A8, D8); break;
        }
    }

    board->key ^= castle_keys[board->castle_rights];

    board->castle_rights &= castle_spoils[from];
    board->castle_rights &= castle_spoils[to];

    board->key ^= castle_keys[board->castle_rights];

    board->turn = opp;
    board->key ^= turn_key;

    assert(check(board));

    // Finally, undo the move if puts the player in check (pseudolegal move)
    //if (is_attacked(board, king_square(board, me), opp)) {
    if (is_in_check(board, me)) {
        undo_move(board, move);
        return false;
    }

    return true;
}

void undo_move(board_t *board, move_t move) {
    assert(check(board));

    undo_t &last = board->history[--board->history_ply];
    board->castle_rights = last.castle_rights;
    board->ep_square = last.ep_square;
    board->fifty_move = last.fifty_move;
    piece_t captured = last.captured;

    assert(move == last.move);

    // Extract move data
    square_t from = get_from(move);
    square_t to = get_to(move);
    int flags = get_flags(move);

    int is_castle = flags == KINGCASTLE || flags == QUEENCASTLE;

    if (is_promotion(move)) {
        rm_piece(board, to);
        add_piece(board, set_colour(PAWN, board->turn ^ 1), from);
    } else {
        mv_piece(board, to, from);
    }

    int dir = board->turn == WHITE ? NORTH : SOUTH;

    if (flags == EPCAPTURE) {
        add_piece(board, set_colour(PAWN, board->turn), to + dir);
    } else if (is_capture(move)) {
        add_piece(board, captured, to);
    }

    if (is_castle) {
        switch (to) {
            case G1: mv_piece(board, F1, H1); break;
            case C1: mv_piece(board, D1, A1); break;
            case G8: mv_piece(board, F8, H8); break;
            case C8: mv_piece(board, D8, A8); break;
            default: LOG("Uhoh, this shouldn't ever happen!"); break;
        }
    }

    board->turn ^= 1;
    board->key ^= turn_key;

    board->key = last.key;
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

/* Null move pruning */

/**
 @brief Performs a null move, mutating the current board position
 Essentialy, we give the opponent a free move
 @param board current position
*/
void make_null(board_t *board) {

    #ifdef DEBUG
    assert(check(board));
    // Store the board state (for debugging purposes)
    //ref_boards[boards++] = *board;
    ref_boards.push_back(*board);
    #endif

    // Store the pre-move state
    board->history[board->history_ply++] = {
        .move = NULLMV,
        .castle_rights = board->castle_rights,
        .ep_square = board->ep_square,
        .fifty_move = board->fifty_move,
        .key = board->key,
        .captured = NO_PIECE
    };

    /* Update board state */

    // Handle counters
    ++board->ply;

    /* Handle en passant */
    // Hash out old en passant square (if was set)
    if (board->ep_square != NO_SQ) {
        board->key ^= ep_keys[board->ep_square];
    }
    board->ep_square = NO_SQ;

    // Miscellaneous bookkeeping
    board->turn ^= 1;
    board->key ^= turn_key;

    assert(check(board));
}

void undo_null(board_t *board) {

#ifdef DEBUG
    assert(check(board));
#endif

    undo_t &last = board->history[--board->history_ply];

    board->turn ^= 1;
    board->key ^= turn_key;

    // Restore the en passant square from pre-move state
    board->ep_square = last.ep_square;

    // Hash in old en passant square (if any)
    if (board->ep_square != NO_SQ) {
        board->key ^= ep_keys[board->ep_square];
    }

    // Restore old castle rights
    board->castle_rights = last.castle_rights;

    // (TODO: unnecessary? same in make_null()) Restore 50move counter
    board->fifty_move = last.fifty_move;

    // Update ply counter
    --board->ply;

#ifdef DEBUG
    assert(check(board));
    assert(check_against_ref(board));
#endif
}




#ifdef DEBUG

// Prints a shortened board stack info for the last n positions in the format:
// [MOVE] : Key: [key]
//        : Castling rights: [castle_rights]
//        : En passant square: [ep_square]
//        : Fifty move counter: [fifty_move]
//        : Last captured piece: [captured]
void history_trace(const board_t *b, size_t n) {
    // Ensure that n does not exceed the number of positions in the history
    n = MIN(n, static_cast<size_t>(b->history_ply));

    for (size_t i = b->history_ply - n; i < b->history_ply; ++i) {
      const undo_t &undo = b->history[i];
      const move_t &move = undo.move;
      std::cout << std::hex << std::showbase;
      std::cout << "[" << move_to_str(move) << "] : Key: " << b->key << std::dec
                << std::endl;
      std::cout << std::setw(6) << ""
                << " : Castling rights: "
                << castling_rights_to_str(b->castle_rights) << std::endl;
      std::cout << std::setw(6) << ""
                << " : En passant square: "
                << (b->ep_square == NO_SQ ? "-"
                                              : square_to_str(b->ep_square))
                << std::endl;
      std::cout << std::setw(6) << ""
                << " : Fifty move counter: " << b->fifty_move << std::endl;
      std::cout << std::setw(6) << ""
                << " : Last captured piece: " << piece_to_ascii[undo.captured]
                << std::endl;
    }
}

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
    assert(king_square(b, WHITE) == king_square(ref_b, WHITE));
    assert(king_square(b, BLACK) == king_square(ref_b, BLACK));


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

    // There's only two players
    assert(board->turn == WHITE || board->turn == BLACK);

    // The kings never get 'actually' captured
    assert(board->bitboards[K] || board->bitboards[k]);

    // Verify the board Zobrist key (critical for TT functionality)
    uint64_t expected = generate_pos_key(board);
    if (expected != board->key) {
      std::cout << std::hex << "Expected: " << expected \
                << "\nGot: " << board->key << std::dec << std::endl;
      print(board);
      return false;
    }

    assert(board->ep_square == NO_SQ ||
           (SQUARE_RANK(board->ep_square) == RANK_3 && board->turn == BLACK) ||
           (SQUARE_RANK(board->ep_square) == RANK_6 && board->turn == WHITE));

    // history_trace(board, 5);
    assert((1ULL << king_square(board, WHITE)) == board->bitboards[K]);
    assert(board->castle_rights >= 0 && board->castle_rights <= 15);

    return true;
}

/**
 * Move generation testing with perft()
 * TODO: Automate verifying the results
*/
void perft_test(board_t *board, const std::string& epd_filename) {
  std::fstream epdfile;
  epdfile.open(epd_filename, std::ios::in);

  int time = 100000;
  if (epdfile.is_open()) {
    std::string fenline;
    while (getline(epdfile, fenline)) {
      std::cout << "Testing position " << fenline << std::endl;

      setup(board, fenline);
      for (int depth = 0; depth < 6; ++depth) {
          // std::cout << perft(board, depth) << std::endl;
          mirror_test(board);
      }
    }
    epdfile.close();
  } else {
    std::cout << "File couldn't be opened" << std::endl;
  }
  std::cout << "Perft test finished!\n" << std::endl;
}


void mirror_suite(board_t *board) {
    assert(check(board));

    setup(board, kiwipete_FEN);
    mirror_test(board);
    mirror_test(board);

    setup(board, test1_FEN);
    mirror_test(board);
    mirror_test(board);

    setup(board, test2_FEN);
    mirror_test(board);
    mirror_test(board);

    setup(board, test3_FEN);
    mirror_test(board);
    mirror_test(board);

    setup(board, test4_FEN);
    mirror_test(board);
    mirror_test(board);

    setup(board, test5_FEN);
    mirror_test(board);
    mirror_test(board);

    assert(check(board));
}


#endif // DEBUG
