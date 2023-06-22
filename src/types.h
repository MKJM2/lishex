#ifndef TYPES_H_
#define TYPES_H_

#include <cstdint>
#include <algorithm>

#define NAME "Lishex"
#define AUTHOR "Michal Kurek"

#define SQUARE_FILE(sq) ((sq) & 7)
#define SQUARE_RANK(sq) ((sq) >> 3)
#define MAX_MOVES (2048)

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

enum : int {
    A_FILE = 0, B_FILE, C_FILE, D_FILE, E_FILE, F_FILE, G_FILE, H_FILE = 7
};

enum : int {
    RANK_1 = 0, RANK_2, RANK_3, RANK_4, RANK_5, RANK_6, RANK_7, RANK_8 = 7
};

enum : int {
    NORTH = 8,
    EAST  = 1,
    SOUTH = -NORTH,
    WEST  = -EAST
};

/**********/
/* Pieces */
/**********/

using piece_t = int;

// Types
enum : piece_t {
  NONE, PAWN, KNIGHT, BISHOP, ROOK, QUEEN, KING
};

enum : piece_t {
  NO_PIECE, P = PAWN, N, B, R, Q, K, p = PAWN + 8, n, b, r, q, k, PIECE_NB = 12
};

// Colors
enum { WHITE = 0, BLACK = 1, BOTH = 2 };

// For printing
constexpr inline char piece_to_ascii[] = " PNBRQKpnbrqk";
constexpr inline char piece_to_unicode[] = " ♙♘♗♖♕♔♟♞♝♜♛♚";
inline std::unordered_map<char, piece_t> char_to_piece = {
    {'0', NO_PIECE },
    {'r', r},
    {'n', n},
    {'b', b},
    {'q', q},
    {'k', k},
    {'p', p},
    {'R', r},
    {'N', n},
    {'B', B},
    {'Q', Q},
    {'K', k}
};

/*********/
/* Moves */
/*********/

using move_t = uint32_t;

// Undo move structure
typedef struct {
    // Move to be undone
    move_t move;
    // Castle permissions before the move
    int castle_rights;
    // En passant square before the move
    square_t ep_square;
    // Fifty move counter before the move
    int fifty_move;
    // Zobrist key of the position before the move
} undo_t;


/*****************/
/* Miscellaneous */
/*****************/

// Castling rights encoding (4 bits)
enum { WK = 1, WQ = 2, BK = 4, BQ = 8 };

typedef struct {
    int start;
    int end;
    bool quit = false;
} searchinfo_t;


/*************/
/* Bitboards */
/*************/

using bb_t = uint64_t;

#endif // TYPES_H_
