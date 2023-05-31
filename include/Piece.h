#ifndef PIECE_H_
#define PIECE_H_

#define OPPONENT(color) (color == Piece::White) ? Piece::Black : Piece::White
namespace Piece {
    // inspired by Sebastian Lague's design
    static const int None = 0;   // 0b00000
    static const int King = 1;   // 0b00001
    static const int Pawn = 2;   // 0b00010
    static const int Knight = 3; // 0b00011
    static const int Bishop = 5; // 0b00101
    static const int Rook = 6;   // 0b00110
    static const int Queen = 7;  // 0b00111

    static const int White = 8;  // 0b01000
    static const int Black = 16; // 0b10000

    static const int typeMask = 0b00111;
    static const int blackMask = 0b10000;
    static const int whiteMask = 0b01000;
    static const int colorMask = whiteMask | blackMask;

    inline static bool IsColour (int piece, int colour) {
        return (piece & colorMask) == colour;
    }

    inline static int Colour (int piece) {
        return piece & colorMask;
    }

    inline static int PieceType (int piece) {
        return piece & typeMask;
    }

    inline static bool IsRookOrQueen (int piece) {
        return (piece & 0b110) == 0b110;
    }

    inline static bool IsBishopOrQueen (int piece) {
        return (piece & 0b101) == 0b101;
    }

    inline static bool IsSlidingPiece (int piece) {
        return (piece & 0b100) != 0;
    }
    /* -, K, P, N, -, B, R, Q */
    const int value[24] = {0, 50000, 100, 325, 0, 325, 550, 1000};
};
#endif // PIECE_H_
