#include "Board.h"

std::string startFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR";

// Constructor
Board::Board() {
  this->initKeys();
  this->readFEN(startFEN);
}

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

// Unicode chars used: ♘♗♖♕♔♞♝♜♛♚
std::unordered_map<int, std::string> pieceToUnicode = {
    {Piece::None,   " "},
    {Piece::Pawn,   u8"\u2659"},  // ♙
    {Piece::Knight, u8"\u2658"},  // ♘
    {Piece::Bishop, u8"\u2657"},  // ♗
    {Piece::Rook,   u8"\u2656"},  // ♖
    {Piece::Queen,  u8"\u2655"},  // ♕
    {Piece::King,   u8"\u2654"},  // ♔
    {Piece::White | Piece::Pawn,   u8"\u265F"},  // ♟
    {Piece::White | Piece::Knight, u8"\u265E"},  // ♞
    {Piece::White | Piece::Bishop, u8"\u265D"},  // ♝
    {Piece::White | Piece::Rook,   u8"\u265C"},  // ♜
    {Piece::White | Piece::Queen,  u8"\u265B"},  // ♛
    {Piece::White | Piece::King,   u8"\u265A"},  // ♚
    {Piece::Black | Piece::Pawn,   u8"\u2659"},  // ♙
    {Piece::Black | Piece::Knight, u8"\u2658"},  // ♘
    {Piece::Black | Piece::Bishop, u8"\u2657"},  // ♗
    {Piece::Black | Piece::Rook,   u8"\u2656"},  // ♖
    {Piece::Black | Piece::Queen,  u8"\u2655"},  // ♕
    {Piece::Black | Piece::King,   u8"\u2654"}   // ♔
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

void Board::print() {
    const std::string horizontalLine = "  +---+---+---+---+---+---+---+---+";
    const std::string emptyRow = "  |   |   |   |   |   |   |   |   |";
    const std::string rankSeparator = "  ---------------------------------";
    // TODO: Use " ╚═╔├ "?

    std::cout << horizontalLine << std::endl;
    for (int rank = ROWS - 1; rank >= 0; --rank) {
        std::cout << rank + 1 << " ";
        for (int file = 0; file < COLS; ++file) {
            piece p = board[rank * ROWS + file];
            std::string curr = pieceToUnicode[p];
            std::cout << "| " << curr << " ";
        }
        std::cout << "|" << std::endl;
        std::cout << horizontalLine << std::endl;
    }
    std::cout << "    a   b   c   d   e   f   g   h" << std::endl;
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
  int boardIdx = ROWS * COLS - 1;
  for (size_t i = 0; i < fenParts[0].length(); i++) {
    char c = fenParts[0][i];
    if (c == '/') {
        //boardIdx += 8;
        continue;
    } else if (isdigit(c)) {
        boardIdx -= (int)c - '0';
    } else {
        int pieceColor = std::isupper(c) ? Piece::White : Piece::Black;
        int pieceType = charToPiece[std::tolower(c)];
        board[boardIdx] = pieceColor | pieceType;
        boardIdx--;
    }
  }

  /* TODO: Extend this function to handle the remaining parts of the FEN */
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
}

void Board::makeMove(Move move) {

  // Hash in the current board state
  undo_t undo;
  undo.move = move;
  generatePosKey();
  undo.posKey = this->posKey;

  ushort to = move.getTo();
  ushort from = move.getFrom();

  undo.captured = board[to];
  board[to] = board[from];
  board[from] = 0;

  // Bookkeeping
  turn = OPPONENT(turn);
  ply++;

  boardHistory.push(undo);
}

// Buggy:
void Board::undoMove(Move move) {
  ushort to = move.getTo();
  ushort from = move.getFrom();
  board[from] = board[to];
  //board[to] = capturedLastPly; // Piece::None if nothing captured
  //capturedLastPly = Piece::None;
  turn = OPPONENT(turn);
  ply--;
}

void Board::undoLast() {
  if (boardHistory.size() < 1) return;
  undo_t last = boardHistory.top();
  boardHistory.pop();

  ushort to = last.move.getTo();
  ushort from = last.move.getFrom();
  board[from] = board[to];
  // ??
  board[to] = last.captured;
  turn = OPPONENT(turn);

  ply--;
}

inline u64 Board::rand64() {
  return (u64)std::rand() + \
         ((u64)std::rand() << 15) + \
         ((u64)std::rand() << 30) + \
         ((u64)std::rand() << 45) + \
         (((u64)std::rand() & 0xf) << 60);
}

void Board::initKeys(unsigned seed) {
  // Seed the RNG
  std::srand(seed);
  // For each piece type and square generate a random hashkey
  for (int p = 0; p < 24; p++) {
    for (square_t s = A1; s <= H8; s++) {
      this->pieceKeys[p][s] = this->rand64();
    }
  }

  // Generate hash key for White's side to play
  this->turnKey = this->rand64();

  //Generate hash key for castling
  for (int i = 0; i < 16; i++) {
    this->castleKeys[i] = this->rand64();
  }
}

void Board::generatePosKey() {
  using namespace Piece;
  u64 key = 0;

  // Hash in all the pieces on the board
  for (square_t s = A1; s <= H8; s++) {
    piece p = board[s];
    if (p != None) {
      key ^= pieceKeys[p][s];
    }
  }

  // Hash in the side playing
  key ^= (turn == White) ? turnKey : 0;

  // Hash in castle permissions
  // TODO

  // Hash in the en passante square (if set)
  // TODO

  // Store the position key for the Board
  this->posKey = key;

  //return key;
}
