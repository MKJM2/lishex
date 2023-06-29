#include "board.h"

#include <cstring> //std::memset

#include "bitboard.h"
#include "attack.h"
#include "types.h"


/*******************/
/* Zobrist hashing */
/*******************/

uint64_t piece_keys[PIECE_NO][SQUARE_NO];
uint64_t turn_key = 0ULL;
uint64_t castle_keys[16]; // == WK | WQ | BK | BQ + 1 = 0b1111 + 1
uint64_t ep_keys[SQUARE_NO];

/*
 * Adapted from: https://en.wikipedia.org/wiki/Xorshift
 */

// We use the SplitMix64 generator to initialize xoshiro256+
static uint64_t x; /* The state can be seeded with any value. */

uint64_t splitmix_next() {
	uint64_t z = (x += 0x9e3779b97f4a7c15);
	z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9;
	z = (z ^ (z >> 27)) * 0x94d049bb133111eb;
	return z ^ (z >> 31);
}

static uint64_t rol64(uint64_t x, int k) {
    return (x << k) | (x >> (64 - k));
}

typedef struct xoshiro256ss_state {
    uint64_t s[4];
} xoshiro256ss_state;

static xoshiro256ss_state rng_state[1];

uint64_t xoshiro256ss(xoshiro256ss_state *state) {
    uint64_t *s = state->s;
    uint64_t const result = rol64(s[1] * 5, 7) * 9;
    uint64_t const t = s[1] << 17;

    s[2] ^= s[0];
    s[3] ^= s[1];
    s[1] ^= s[2];
    s[0] ^= s[3];

    s[2] ^= t;
    s[3] = rol64(s[3], 45);

    return result;
}

void init_keys(uint64_t rng_seed) {
    // Seed the RNG
    x = rng_seed;
    rng_state->s[0] = splitmix_next();
    rng_state->s[1] = splitmix_next();
    rng_state->s[2] = splitmix_next();
    rng_state->s[3] = splitmix_next();

    // For each piece type and square generate a random key
    for (piece_t p : pieces) {
        for (square_t sq = A1; sq <= H8; ++sq) {
            piece_keys[p][sq] = xoshiro256ss(rng_state);
        }
    }

    // Generate hash key for White's side to play
    turn_key = xoshiro256ss(rng_state);

    // Generate hash keys for castling rights
    for (int i = 0; i < 16; ++i) {
        castle_keys[i] = xoshiro256ss(rng_state);
    }

    // Generate hash keys for en passant squares
    // (though we only need 16, having 64 keys makes the code cleaner)
    for (square_t sq = A1; sq <= H8; ++sq) {
        ep_keys[sq] = xoshiro256ss(rng_state);
    }
}

/* Zeroes out the entire position */
void reset(board_t *board) {

    // Throws compiler warnings:
    // std::memset(board, 0, sizeof(board_t));

    // Clear board history
    memset(board->history, 0, MAX_MOVES * sizeof(undo_t));

    // Reset all bitboards
    for (piece_t pc : pieces) {
        board->bitboards[pc] = 0ULL;
    }
    board->pieces[BLACK] = board->pieces[WHITE] = 0ULL;

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
            SETBIT(board->pieces[piece_color(piece)], sq);
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
void print(board_t *board, bool verbose) {
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
            // Check if any bitboards contain a piece on sq
            //for (piece_t piece = P; piece <= k; ++piece) {
            for (piece_t pc : pieces) {
                if (GETBIT(board->bitboards[pc], sq)) {
                    piece_on_sq = pc;
                    break;
                }
            }
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
uint64_t generate_pos_key(board_t *board) {
    uint64_t key = 0ULL;

    // Hash in all the pieces on the board
    for (piece_t p : pieces) {
        for (square_t sq = A1; sq <= H8; ++sq) {
            if (GETBIT(board->bitboards[p], sq)) {
                key ^= piece_keys[p][sq];
            }
        }
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

    bb_t blockers = 0x8005000022400ULL;

    //printBB(gen_rook_attacks(D5, blockers));

    printBB(bishop_occupancies[B1]);
    std::cout << std::endl;
    printBB(bishop_occupancies[D4]);
    std::cout << std::endl;
    printBB(rook_occupancies[D4]);
    std::cout << std::endl;
    printBB(rook_occupancies[A1]);
    std::cout << std::endl;
    printBB(rook_occupancies[B2]);
}

/* Verifies that the position is valid (useful for debugging) */
#ifdef DEBUG
bool check(board_t *board) {

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
