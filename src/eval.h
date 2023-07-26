#ifndef EVAL_H_
#define EVAL_H_

#include "types.h"
#include "board.h"
#include "see.h"

/**
 @brief This struct scores all relevant data for the evaluation of given board position
 */
typedef struct eval_t {
    // Game phase (0, 256)
    int phase = 0;
    // Middlegame score
    int middlegame = 0;
    // Endgame score
    int endgame = 0;
    // Tapered score
    int score = 0;

    /**
    @brief Calculates the current game phase and sets the corresponding field in eval

    Phase can range from 0 to 256 (no pieces except kings -> all pieces)
    The closer to the endgame we are, the more heavily endgame psqts
    are weighted. We use min(max(0, 1.5x - 64), 256) to scale between game phases

    @param board boards state to calculate the game phase for
    @param eval eval_t struct to store the game phase in
    */
    inline void set_phase(const board_t *board) {
        phase = CNT(board->bitboards[p] | board->bitboards[P]) << 1;
        phase += 6 * CNT(board->bitboards[k] | board->bitboards[K]);
        phase += 12 * CNT(board->bitboards[b] | board->bitboards[B]);
        phase += 18 * CNT(board->bitboards[r] | board->bitboards[R]);
        phase += 40 * CNT(board->bitboards[q] | board->bitboards[Q]);
        phase *= 3;
        phase -= 128;
        phase >>= 1;
        phase = MIN(MAX(0, phase), 256);
    }

    inline int get_tapered_score() {
        return score = (middlegame * phase + endgame * (256 - phase)) / 256;
    }

    inline void print() {
        std::cout << "Phase: " << phase \
                  << " Middlegame score: " << middlegame \
                  << " Endgame score: " << endgame \
                  << " Final score: " << score << std::endl;
    }
} eval_t;

/**
 @brief Static tapered evaluation of the current board state

 Uses: piece values, piece-square tables, passed pawns, isolated pawns,
 rook/queen on open/semi-open files, basic king safety, bishop pairs,

 @param board boards state to evaluate
 @param eval eval_t struct storing evaluation data, used for the 'eval' command
 among others
 */
int evaluate(const board_t *board, eval_t *eval);


/**
 * @brief Determines whether a capture is losing based on static
 * exchange evaluation and piece values
 * @param board current board state (for access to pieces involved)
 * @param m the capture to consider
 * @param threshold threshold for SEE
 * @returns non-zero integer if the capture is losing, zero otherwise
 * */
int losing_capture(const board_t *board, move_t m, int threshold);

void mirror_test(board_t *board);

extern const int value_mg[PIECE_NO];
extern const int value_eg[PIECE_NO];

// Tempo score (a small bonus for the side to move)
extern int tempo_bonus;
// Pass and isolated pawn
extern int isolated_pawn;
// Doubled pawn penalty
extern int doubled_pawn;
// Bonus for supported pawns
extern int pawn_supported;
// Indexed by rank, i.e. the closer to promoting, the higher the bonus
extern int passed_pawn[RANK_NO];
// Indexed by rank, bonus for good pawn structure
extern int pawn_bonuses[RANK_NO];
// Bonus for having two bishops on board
extern int bishop_pair_mg;
extern int bishop_pair_eg;
// Bonuses for rooks/queens on open/semi-open files
extern int rook_open_file;
extern int rook_semiopen_file;
extern int queen_open_file;
extern int queen_semiopen_file;


#endif // EVAL_H_
