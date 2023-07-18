#ifndef TYPES_H_
#define TYPES_H_

#include <string>
#include <cstdint>
#include <algorithm>
#include <unordered_map>
#include <atomic> // for search

#define NAME "Lishex"
#define AUTHOR "Michal Kurek"

#define SQUARE_FILE(sq) ((sq) & 7)
#define SQUARE_RANK(sq) ((sq) >> 3)
#define MAX_MOVES (1024)
#define MAX_DEPTH (128)

// Assertions for debug mode
// #define DEBUG

#ifndef DEBUG
#define assert(n)
#else
#define assert(n) \
if(!(n)) { \
printf("%s - Failed ",#n); \
printf("On %s ",__DATE__); \
printf("At %s ",__TIME__); \
printf("In File %s ",__FILE__); \
printf("At Line %d\n",__LINE__); \
exit(1);}
#endif

#ifdef DEBUG
#define LOG(msg) \
    std::cout << __FILE__ << "(" << __LINE__ << "): " << msg << std::endl
#else
#define LOG(msg)
#endif

/*  The PEXT instruction is part of the BMI2 instruction set introduced
 *  in Intel Haswell CPUs. With pext, we have no need for magic numbers */
#ifdef __BMI2__
#include <x86intrin.h>
constexpr bool bmi2 = true;
#else
constexpr bool bmi2 = false;
#endif

#define MIN(x, y) (((x) <= (y)) ? (x) : (y))
#define MAX(x, y) (((x) >= (y)) ? (x) : (y))

// Whether to use the null move heuristic
constexpr bool USE_NULL = true;


/***********/
/* Squares */
/***********/

using square_t = int;

enum : square_t {
    A1 =  0, B1, C1, D1, E1, F1, G1, H1,
    A2 =  8, B2, C2, D2, E2, F2, G2, H2,
    A3 = 16, B3, C3, D3, E3, F3, G3, H3,
    A4 = 24, B4, C4, D4, E4, F4, G4, H4,
    A5 = 32, B5, C5, D5, E5, F5, G5, H5,
    A6 = 40, B6, C6, D6, E6, F6, G6, H6,
    A7 = 48, B7, C7, D7, E7, F7, G7, H7,
    A8 = 56, B8, C8, D8, E8, F8, G8, H8,
    NO_SQ                                // NO_SQ >= 64
};
const int SQUARE_NO = 64;

enum : int {
    A_FILE = 0, B_FILE, C_FILE, D_FILE, E_FILE, F_FILE, G_FILE, H_FILE,
    FILE_NO = 8
};

enum : int {
    RANK_1 = 0, RANK_2, RANK_3, RANK_4, RANK_5, RANK_6, RANK_7, RANK_8,
    RANK_NO = 8
};

enum : int {
    NORTH = 8,
    EAST  = 1,
    SOUTH = -NORTH,
    WEST  = -EAST,
    NORTH_EAST = NORTH + EAST,
    SOUTH_EAST = SOUTH + EAST,
    SOUTH_WEST = -NORTH_EAST,
    NORTH_WEST = -SOUTH_EAST
};

inline square_t is_white(const square_t sq) {
    int f = SQUARE_FILE(sq), r = SQUARE_RANK(sq);
    return ((f & 1) != (r & 1));
    // == (f % 2 == 0 && r % 2 == 0) || (f % 2 != 0 && r % 2 != 0);
}

inline square_t mirror(const square_t sq) {
    return sq ^ 56;
}

inline std::string square_to_str(const square_t sq) {
    return std::string{(char)('a'+SQUARE_FILE(sq)),(char)('1'+SQUARE_RANK(sq))};
}

inline bool square_ok(const square_t sq) {
    return (A1 <= sq && sq <= H8);
}


/**********/
/* Pieces */
/**********/

using piece_t = int;

// Types
enum : piece_t {
  NONE = 0, PAWN, KNIGHT, BISHOP, ROOK, QUEEN, KING
};

enum : piece_t {
  NO_PIECE = 0, P = PAWN, N, B, R, Q, K, p = PAWN + 8, n, b, r, q, k, PIECE_NO
};

// Iterable piece array
constexpr piece_t pieces[] = { P, N, B, R, Q, K, p, n, b, r, q, k };

// Colors
enum { BLACK = 0, WHITE = 1, BOTH = 2 };

inline int piece_color(const piece_t p) {
    return (p & 0b1000) ? BLACK : WHITE;
}

inline int piece_type(const piece_t p) {
   return p & ~(0b1000);
}

// Determining whether a piece is sliding
constexpr bool is_sliding_arr[] = { 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0 };

template<piece_t PIECE_T>
constexpr bool is_sliding = is_sliding_arr[PIECE_T];

// Set or clear the colour bit depending on specified colour
inline int set_colour(const piece_t p, const int colour) {
    return colour ? (p & ~0b1000) : (p | 0b1000);
}

// For printing
constexpr char piece_to_ascii[] = ".PNBRQK  pnbrqk";
//constexpr wchar_t piece_to_unicode[] = L" ♙♘♗♖♕♔  ♟♞♝♜♛♚";
inline std::unordered_map<char, piece_t> char_to_piece = {
    {'0', NO_PIECE },
    {'P', P},
    {'R', R},
    {'N', N},
    {'B', B},
    {'Q', Q},
    {'K', K},
    {'p', p},
    {'n', n},
    {'r', r},
    {'b', b},
    {'q', q},
    {'k', k}
};

/*********/
/* Moves */
/*********/

using move_t = uint32_t;

/* Inspired by
 * https://www.chessprogramming.org/Encoding_Moves
 * Each move is represented using 16 bits:
 *  4 bits for flags
 *  6 bits for the source square
 *  6 bits for the destination square

   0b  0000000000000000 0000  000000  000000
                        flag  from    to

 * In this implementation we use only the last 16 bits, with
 * move scores stored separately in the move list. We
 * use the native 32-bit integer type to avoid x86 16-bit optimization
 * issues
*/

// Types of moves (flags)
// TODO: Possible bug:
// A capturing promotion to a bishop could be flagged as en passant
// (promotions to a bishop are rare)
enum {
    QUIET       = 0b0000,
    PAWNPUSH    = 0b0001,
    KINGCASTLE  = 0b0010,
    QUEENCASTLE = 0b0011,
    CAPTURE     = 0b0100,
    EPCAPTURE   = 0b0101,
    KNIGHTPROMO = 0b1000,
    BISHOPPROMO = 0b1001,
    ROOKPROMO   = 0b1010,
    QUEENPROMO  = 0b1011
};

// Constructor
inline move_t Move(square_t from, square_t to, int flags) {
    return (((flags & 0xf) << 12) | \
            ((from & 0x3f) << 6)  | \
             (to & 0x3f));
}

#define NULLMV ((move_t) 0U)

inline square_t get_to(const move_t move) {
    return (move & 0x3f);
}

inline square_t get_from(const move_t move) {
    return ((move >> 6) & 0x3f);
}

inline int get_flags(const move_t move) {
    return ((move >> 12) & 0xf);
}

inline int is_promotion(const move_t move) {
    return ((move >> 12) & 0b1000);
}

inline int is_capture(const move_t move) {
    return ((move >> 12) & 0b0100);
}

inline bool move_ok(const move_t move) {
    return square_ok(get_to(move)) && square_ok(get_from(move));
}


// Undo move structure
typedef struct undo_t {
    // Move to be undone
    move_t move = NULLMV;
    // Castle permissions before the move
    int castle_rights;
    // En passant square before the move
    square_t ep_square = NO_SQ;
    // Fifty move counter before the move
    int fifty_move;
    // Zobrist key of the position before the move
    uint64_t key;
    // Captured piece, if any
    piece_t captured = NO_PIECE;
} undo_t;

// Struct containing a move and its corresponding score for move ordering
typedef struct scored_move_t {
    int32_t score;
    move_t move;

    void operator=(move_t m) { move = m; }
    bool operator==(const move_t& m) { return move == m; }
    bool operator==(const scored_move_t& m) { return move == m.move; }
    // Conversion operator, returning the move as a move_t
    operator move_t() const { return move; }
} scored_move_t;

// Move list structure
typedef struct movelist_t {
    const scored_move_t* begin() const { return movelist; }
    const scored_move_t* end() const { return last; }
    size_t size() const { return static_cast<size_t>(last - movelist); }
    void push_back(const move_t& m) {
        assert(size() < MAX_MOVES);
        *last++ = m;
    }
    void clear() {
        used = 0;
        last = movelist;
    }
    scored_move_t movelist[MAX_MOVES];
    scored_move_t* last = movelist;
    size_t used = 0;
} movelist_t;

inline std::string move_to_str(const move_t m) {

    if (m == NULLMV) return "null";

    square_t from = get_from(m);
    square_t to = get_to(m);
    int flags = get_flags(m);

    std::string s = square_to_str(from) + square_to_str(to);

    // Handle promotions
    if (is_promotion(m)) {
        char c;
        switch (flags & ~CAPTURE) {
            case KNIGHTPROMO: c = 'n'; break;
            case ROOKPROMO:   c = 'r'; break;
            case BISHOPPROMO: c = 'b'; break;
            default:          c = 'q'; break;
        }
        s.push_back(c);
    }
    return s;
}

/*************/
/* Bitboards */
/*************/

// More in bitboard.h
using bb_t = uint64_t;

/*****************/
/* Miscellaneous */
/*****************/

constexpr int oo = 30'000; // INF

// Castling rights encoding (4 bits)
enum { WK = 0b0001, WQ = 0b0010, BK = 0b0100, BQ = 0b1000 };

// Castling rights can be spoiled when one of the pieces participating in it
// moves. castle_spoils[from] determines how to change castle permissions for a
// given (from, to) move
// Here: 15 = 0b1111 = KQkq
const int castle_spoils[SQUARE_NO] = {
    13, 15, 15, 15, 12, 15, 15, 14,
    15, 15, 15, 15, 15, 15, 15, 15,
    15, 15, 15, 15, 15, 15, 15, 15,
    15, 15, 15, 15, 15, 15, 15, 15,
    15, 15, 15, 15, 15, 15, 15, 15,
    15, 15, 15, 15, 15, 15, 15, 15,
    15, 15, 15, 15, 15, 15, 15, 15,
    7,  15, 15, 15, 3,  15, 15, 11
};

inline std::string castling_rights_to_str(const int castle_rights) {
    if (!castle_rights) {
        return "-";
    }
    std::string s;
    if (castle_rights & WK) s.push_back('K');
    if (castle_rights & WQ) s.push_back('Q');
    if (castle_rights & BK) s.push_back('k');
    if (castle_rights & BQ) s.push_back('q');
    return s;
}

typedef struct searchinfo_t {
    std::atomic_int state; // see src/threads.h
    int depth = MAX_DEPTH;
    int seldepth = 0;
    uint64_t time;
    uint64_t inc;
    uint64_t start;
    uint64_t end;
    uint64_t nodes = 0ULL;
    // For testing move ordering
    uint64_t fail_high_first = 0ULL;
    uint64_t fail_high = 0ULL;
    // For debugging
    uint64_t nullcut = 0;
    uint64_t hashcut = 0;
    uint64_t deltacut = 0;
    uint64_t seecut = 0;
    // For stopping the search
    bool quit = false;
    bool stopped = false;
    bool time_set = false;
    // Helper for clearing necessary struct info before searching
    inline void clear() {
        stopped = false;
        nodes = 0ULL;
        fail_high_first = 0ULL;
        fail_high = 0ULL;
        nullcut = 0ULL;
        hashcut = 0ULL;
        deltacut = 0ULL;
        seecut = 0ULL;
        seldepth = 0;
    }
} searchinfo_t;

// Useful test positions
const std::string start_FEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
const std::string kiwipete_FEN = "r3k2r/p1ppqpb1/bn2pnp1/3PN3/1p2P3/2N2Q1p/PPPBBPPP/R3K2R w KQkq - 0 1";
const std::string test1_FEN = "r3k2r/p1ppqpb1/Bn2pnp1/3PN3/1p2P3/P1N2Q2/1PPB1PpP/R3K2R b KQkq - 0 1";
const std::string test2_FEN = "8/2k5/8/8/8/8/5K2/2R6 w - - 0 1";
const std::string test3_FEN = "n1n5/PPPk4/8/8/8/8/4Kppp/5N1N b - - 0 1";
const std::string test4_FEN = "r3k2r/Pppp1ppp/1b3nbN/nP6/BBP1P3/q4N2/Pp1P2PP/R2Q1RK1 w kq - 0 1";
const std::string test5_FEN = "r4rk1/1pp1qppp/p1np1n2/2b1p1B1/2B1P1b1/P1NP1N2/1PP1QPPP/R4RK1 w - - 0 10";


#endif // TYPES_H_
