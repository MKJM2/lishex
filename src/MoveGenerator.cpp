#include "MoveGenerator.h"

// prototypes
//std::vector<Move> generateLegalMoves(Board& board);
//std::vector<Move> generateMoves(Board& board);

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

std::vector<Move> generateMoves(Board& board) {

    std::vector<Move> moves;
    // add regular moves
    for (int from = 0; from < 64; ++from) {
        int piece = board.board[from]; // TODO, clean the code up
        if (piece != Piece::None && Piece::IsColour(piece, board.turn)) {
            switch (Piece::PieceType(piece)) {
                case Piece::Pawn: {
                    // Generate pawn moves
                    // Example code for generating pawn moves:
                    // Check if pawn can move forward one square
                    int to = from + 8;
                    if (board.board[to] == Piece::None) {
                        moves.emplace_back(from, to);
                    }
                    // Check if pawn can move forward two squares from the starting position
                    int startingRank = (board.turn == Piece::White) ? 1 : 6;
                    if (from / 8 == startingRank && board.board[to] == Piece::None && board.board[to + 8] == Piece::None) {
                        moves.emplace_back(from, to + 8, move_t::DoublePawnPush);
                    }
                    // Check if pawn can capture diagonally
                    int captureLeft = from + 7;
                    // board.isValidSquare(captureLeft) \equiv captureLeft < ROWS * COLS
                    if (captureLeft < ROWS * COLS && board.board[captureLeft] != Piece::None && Piece::IsColour(board.board[captureLeft], OPPONENT(board.turn))) {
                        moves.emplace_back(from, captureLeft, move_t::Capture);
                    }
                    int captureRight = from + 9;
                    if (captureRight < ROWS * COLS && board.board[captureRight] != Piece::None && Piece::IsColour(board.board[captureRight], OPPONENT(board.turn))) {
                        moves.emplace_back(from, captureRight, move_t::Capture);
                    }
                    break;
                }
                case Piece::Knight: {
                    // Generate knight moves
                    // List all possible destination squares and check if they are valid
                    int destinations[] = {from - 17, from - 15, from - 10, from - 6, from + 6, from + 10, from + 15, from + 17};
                    for (int to : destinations) {
                        if (to < ROWS * COLS && (board.board[to] == Piece::None || Piece::IsColour(board.board[to], OPPONENT(board.turn)))) {
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
    return {};
}
