#include "MoveGenerator.h"

// prototypes
//std::vector<Move> generateLegalMoves(Board& board);
//std::vector<Move> generateMoves(Board& board);
using namespace Piece;

std::vector<Move> generateLegalMoves(Board& board) {
    /* TODO */
    // find attacks

    // if in check

    // else
    std::vector<Move> pseudoLegal = generateMoves(board);

    // TODO filter out illegal moves
    std::vector<Move> legal = pseudoLegal;

    // return legal moves
    return legal;
}

std::vector<Move> generateMoves(Board& b) {

    piece* board = b.board; // array of pieces
    int me = b.turn;
    int opp = OPPONENT(b.turn);

    std::vector<Move> moves;
    // add regular moves
    for (int from = 0; from < 64; ++from) {
        int piece = board[from]; // TODO, clean the code up
        if (piece != None && IsColour(piece, me)) {
            switch (PieceType(piece)) {
                case Pawn: {
                    // Generate pawn moves
                    // Example code for generating pawn moves:
                    // Check if pawn can move forward one square
                    int to = from + 8;
                    if (board[to] == None) {
                        moves.emplace_back(from, to);
                    }
                    // Check if pawn can move forward two squares from the starting position
                    int startingRank = (me == White) ? 1 : 6;
                    if (from / 8 == startingRank && board[to] == None && board[to + 8] == None) {
                        moves.emplace_back(from, to + 8, move_t::DoublePawnPush);
                    }
                    // Check if pawn can capture diagonally
                    int captureLeft = from + 7;
                    // board.isValidSquare(captureLeft) \equiv captureLeft < ROWS * COLS
                    if (captureLeft < ROWS * COLS && board[captureLeft] != None && IsColour(board[captureLeft], opp)) {
                        moves.emplace_back(from, captureLeft, move_t::Capture);
                    }
                    int captureRight = from + 9;
                    if (captureRight < ROWS * COLS && board[captureRight] != None && IsColour(board[captureRight], opp)) {
                        moves.emplace_back(from, captureRight, move_t::Capture);
                    }
                    break;
                }
                case Knight: {
                    // Generate knight moves
                    // List all possible destination squares and check if they are valid
                    int destinations[] = {from - 17, from - 15, from - 10, from - 6, from + 6, from + 10, from + 15, from + 17};
                    for (int to : destinations) {
                        if (to < ROWS * COLS && (board[to] == None || IsColour(board[to], opp))) {
                            moves.emplace_back(from, to, move_t::Quiet);
                        }
                    }
                    break;
                }
                // Implement logic for other piece types (Bishop, Rook, Queen, King) similarly
            }
        }
    }

    // add en passant

    // add castle
    return moves;
}
