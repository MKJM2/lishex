#include "Board.h"

std::string startFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR";
std::unordered_map<piece, char> pieceToChar = {
    {Piece::None,  '0'},
    {Piece::Rook,  'r'},
    {Piece::Knight,'n'},
    {Piece::Bishop,'b'},
    {Piece::Queen, 'q'},
    {Piece::King,  'k'},
    {Piece::Pawn,  'p'}
};
std::unordered_map<char, piece> charToPiece = {
    {'0', Piece::None  },
    {'r', Piece::Rook  },
    {'n', Piece::Knight},
    {'b', Piece::Bishop},
    {'q', Piece::Queen },
    {'k', Piece::King  },
    {'p', Piece::Pawn  }
};


void Board::printFEN() {
  std::string row;
  for (int i = 0; i < ROWS; i++) {
    row.clear();
    for (int j = 0; j < COLS; j++) {
        piece p = board[i * ROWS + j];
        char curr = pieceToChar[Piece::PieceType(p)];
        if (Piece::IsColour(p, Piece::White)) {
            curr = std::toupper(curr);
        }
        std::cout << curr;
    }
    std::cout << "\n";
  }
}

void Board::readFEN(std::string fen) {

  // Split the input fen into 6 parts
  std::string fenParts[6];
  int idx = 0;
  for (size_t i = 0; i < fen.size(); i++) {
    if (fen[i] == ' ') {
      idx++;
    } else {
      fenParts[idx] += fen[i];
    }
  }

  // initialize the board with all zeroes
  std::memset(board, 0, ROWS * COLS * sizeof(piece));

  // fill board with pieces from FEN
  int boardIdx = 0;
  for (size_t i = 0; i < fenParts[0].length(); i++) {
    char c = fenParts[0][i];
    if (c == '/') {
        //boardIdx += 8;
        continue;
    } else if (isdigit(c)) {
        boardIdx += (int)c - '0';
    } else {
        int pieceColor = std::isupper(c) ? Piece::White : Piece::Black;
        int pieceType = charToPiece[std::tolower(c)];
        board[boardIdx] = pieceColor | pieceType;
        boardIdx++;
    }
  }

  /* TODO: Exten this function to handle the remaining parts of the FEN */
}

void Board::loadFEN(std::string fen) {
    int row = 7;
    int col = 0;
    for (char &c : fen) {
      if (c == '/') {
        --row;
        col = 0;
      } else {
        if (isdigit(c)) {
          // char to int
          col += (int)c - '0';
        } else {
          int pieceColor = std::isupper(c) ? Piece::White : Piece::Black;
          int pieceType = charToPiece[std::tolower(c)];
          board[row * ROWS + col] = pieceColor | pieceType;
          ++col;
        }
      }
    }
    return;
}
