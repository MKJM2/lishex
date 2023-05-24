#ifndef PIECE_H_
#define PIECE_H_

#define OPPONENT(color) (color == Piece::White) ? Piece::Black : Piece::White
namespace Piece {
    // inspired by Sebastian Lague's design
    static const int None = 0;
    static const int King = 1;
    static const int Pawn = 2;
    static const int Knight = 3;
    static const int Bishop = 5;
    static const int Rook = 6;
    static const int Queen = 7;

    static const int White = 8;
    static const int Black = 16;

    static const int typeMask = 0b00111;
    static const int blackMask = 0b10000;
    static const int whiteMask = 0b01000;
    static const int colorMask = whiteMask | blackMask;

    static bool IsColour (int piece, int colour) {
        return (piece & colorMask) == colour;
    }

    static int Colour (int piece) {
        return piece & colorMask;
    }

    static int PieceType (int piece) {
        return piece & typeMask;
    }

    static bool IsRookOrQueen (int piece) {
        return (piece & 0b110) == 0b110;
    }

    static bool IsBishopOrQueen (int piece) {
        return (piece & 0b101) == 0b101;
    }

    static bool IsSlidingPiece (int piece) {
        return (piece & 0b100) != 0;
    }
};
#endif // PIECE_H_
