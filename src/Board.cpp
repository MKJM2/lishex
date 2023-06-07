#include "Board.h"
#include "MoveGenerator.h"

std::string startFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";

static std::mt19937_64 rng;

// Constructor
Board::Board() {
  this->initKeys();
  this->readFEN(startFEN);
  this->posKey = generatePosKey();
  init_PVtable(&PVtable);
  initMVVLVA();
  initEvalMasks();
}

Board::~Board() {
  if (this->PVtable.pvtable != nullptr) {
      delete[] PVtable.pvtable;
  }
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
std::unordered_map<piece, std::string> pieceToUnicode = {
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

// prints squares attacked by the opponent
void Board::printAttacked() {
  int op = OPPONENT(turn);
  // Print the board out
  for (int rank = ROWS - 1; rank >= 0; --rank) {
      for (int file = 0; file < COLS; ++file) {
          piece p = board[rank * ROWS + file];
          std::string curr = (SquareAttacked(rank * ROWS + file, op)) ? "X" : pieceToUnicode[p];
          std::cout << curr;
      }
      std::cout << std::endl;
  }
}

void Board::print(bool verbose) {
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

    if (!verbose) return;
    // Print additional information, like castle permissions
    std::cout << "Side to play: " \
              << ((turn == Piece::White) ? "White" : "Black") << std::endl;
    std::cout << "En Passant square: " \
              << ((epSquare == NO_SQ) ? "null" : toString(epSquare)) << std::endl;
    std::cout << "Castle permissions: ";

    // TODO: Make into a separate function
    std::string s;
    if (castlePerm & WKCastle) s.push_back('K');
    if (castlePerm & WQCastle) s.push_back('Q');
    if (castlePerm & BKCastle) s.push_back('k');
    if (castlePerm & BQCastle) s.push_back('q');
    std::cout << s << std::endl;

    std::cout << "Zobrist hash key: " \
              << posKey << std::endl;

    std::cout << "King squares: White at " \
              << toString(kingSquare[1]) << ", Black at " \
              << toString(kingSquare[0]) << std::endl;
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
  int boardIdx = (ROWS - 1) * COLS;
  for (size_t i = 0; i < fenParts[0].length(); ++i) {
    char c = fenParts[0][i];
    if (c == '/') {
      boardIdx -= 2 * COLS;
      continue;
    } else if (isdigit(c)) {
      boardIdx += (int)c - '0';
    } else {
        int pieceColor = std::isupper(c) ? Piece::White : Piece::Black;
        int pieceType = charToPiece[std::tolower(c)];
        if (pieceType == Piece::King) {
          kingSquare[pieceColor == Piece::White] = boardIdx;
        }
        board[boardIdx] = pieceColor | pieceType;
        boardIdx++;
    }
  }

  // set the side to move
  turn = (fenParts[1] == "w") ? Piece::White : Piece::Black;

  // set the castling permissions
  castlePerm = 0;
  if (fenParts[2] != "-") {
    if (fenParts[2].find('K') != std::string::npos) {
      castlePerm |= WKCastle;
    }
    if (fenParts[2].find('Q') != std::string::npos) {
      castlePerm |= WQCastle;
    }
    if (fenParts[2].find('k') != std::string::npos) {
      castlePerm |= BKCastle;
    }
    if (fenParts[2].find('q') != std::string::npos) {
      castlePerm |= BQCastle;
    }
  }

  // set the en passant square
  if (fenParts[3] != "-") {
    int file = fenParts[3][0] - 'a';
    int rank = fenParts[3][1] - '1';
    epSquare = rank * 8 + file;
  } else {
    epSquare = NO_SQ;
  }

  // set the halfmove clock since last capture/pawn push (ply)
  ply = stoi(fenParts[4]);

  // set the fullmove clock
  fullMove = stoi(fenParts[5]);
}

void Board::readPosition(std::string pos) {
    size_t startPos = pos.find("startpos");
    size_t fenPos = pos.find("fen");
    size_t movesPos = pos.find("moves");

    if (startPos != std::string::npos) {
        readFEN(startFEN);
    } else if (fenPos != std::string::npos) {
        size_t fenStartPos = pos.find_first_not_of(" ", fenPos + 3);
        size_t fenEndPos = pos.find(" moves", fenStartPos);
        if (movesPos == std::string::npos) {
          fenEndPos = pos.size();
        }
        std::string fenString = pos.substr(fenStartPos, fenEndPos - fenStartPos);
        readFEN(fenString);
    } else {
        readFEN(startFEN);
    }

    if (movesPos != std::string::npos) {
        size_t movesStartPos = pos.find_first_not_of(" ", movesPos + 5);
        if (movesStartPos == std::string::npos) return;
        std::string movesString = pos.substr(movesStartPos);
        std::istringstream iss(movesString);
        std::string moveString;

        while (iss >> moveString) {
            move_t move = fromString(moveString);
            // Handle invalid moves
            std::vector<move_t> moves = generateMoves(*this);
            for (move_t& m : moves) {
                if (movecmp(m << 4, move << 4)) {
                    // make the move *with correct flags* as per movegen
                    makeMove(m);
                    break;
                }
            }
            this->ply = 0;
        }
    }
    this->updateMaterial();
}

void Board::readGo(std::string goStr, searchinfo_t *info) {
    int depth = -1, movestogo = 30, movetime = -1;
    int time = -1, inc = -1;
    // Initially, no time to move is set
    info->timeSet = false;

    std::istringstream iss(goStr);
    std::string command;

    while (iss >> command) {
        if (command == "searchmoves") {
            printf("Not supported\n");
        } else if (command == "ponder") {
            printf("Not supported\n");
        } else if (command == "wtime") {
            int wtime;
            iss >> wtime; // consume the token
            if (turn == Piece::White) {
              time = wtime;
            }
        } else if (command == "btime") {
            int btime;
            iss >> btime;
            if (turn == Piece::Black) {
              time = btime;
            }
        } else if (command == "winc") {
            int winc;
            iss >> winc;
            if (turn == Piece::White) {
              inc = winc;
            }
        } else if (command == "binc") {
            int binc;
            iss >> binc;
            if (turn == Piece::Black) {
              inc = binc;
            }
        } else if (command == "movestogo") {
            iss >> movestogo;
        } else if (command == "depth") {
            iss >> depth;
        } else if (command == "nodes") {
            printf("Not supported\n");
        } else if (command == "mate") {
            printf("Not supported\n");
        } else if (command == "movetime") {
            iss >> movetime;
        } else if (command == "infinite") {
          // search until 'stop' sent from gui
        }
    }

    if (movetime != -1) {
        time = movetime;
        movestogo = 1;
    }

    info->startTime = getTime();
    info->depth = depth;

    // Time management
    if (time != -1) {
        info->timeSet = true;
        time /= movestogo;
        // to be safe we don't run out of time
        time -= 50;
        info->endTime = info->startTime + time + inc;
    }

    if (depth == -1) {
        info->depth = MAX_DEPTH;
    }

    printf("time:%d start:%lu stop:%lu depth:%d timeset:%d\n",
            time,info->startTime,info->endTime,info->depth,info->timeSet);
    search(*this, info);
}

std::string Board::toFEN() const {
  std::string fen;

  // Board state
  for (int rank = ROWS - 1; rank >= 0; --rank) {
    int emptySquares = 0;
    for (int file = 0; file < COLS; ++file) {
      square_t square = rank * COLS + file;
      piece p = board[square];

      if (p == Piece::None) {
        ++emptySquares;
      } else {
        if (emptySquares > 0) {
          fen += std::to_string(emptySquares);
          emptySquares = 0;
        }

        bool isWhite = Piece::IsColour(p, Piece::White);
        int pieceType = Piece::PieceType(p);
        char c = pieceToChar[pieceType];

        if (isWhite) {
          c = std::toupper(c);
        }
        fen += c;
      }
    }

    if (emptySquares > 0) {
      fen += std::to_string(emptySquares);
    }

    if (rank > 0) {
      fen += '/';
    }
  }

  fen += ' ';

  // Side to move
  fen += (turn == Piece::White) ? 'w' : 'b';
  fen += ' ';

  // Castling permissions
  if (castlePerm == 0) {
    fen += '-';
  } else {
    if (castlePerm & WKCastle) {
      fen += 'K';
    }
    if (castlePerm & WQCastle) {
      fen += 'Q';
    }
    if (castlePerm & BKCastle) {
      fen += 'k';
    }
    if (castlePerm & BQCastle) {
      fen += 'q';
    }
  }
  fen += ' ';

  // En passant square
  if (epSquare != NO_SQ) {
    int rank = epSquare / COLS;
    int file = epSquare % COLS;
    fen += ('a' + file);
    fen += ('1' + rank);
  } else {
    fen += '-';
  }
  fen += ' ';

  // Halfmove clock
  fen += std::to_string(ply);
  fen += ' ';

  // Fullmove clock
  fen += std::to_string(fullMove);

  return fen;
}

// Returns True if move was legal, False otherwise
bool Board::makeMove(move_t move) {

  // Extract move data
  ushort to = getTo(move);
  ushort from = getFrom(move);
  int flags = getFlags(move);

  // Store the pre-move state
  undo_t undo;
  undo.move = move;
  undo.enPas = epSquare;
  undo.captured = board[to];
  undo.posKey = this->posKey;
  undo.castlePerm = castlePerm;
  undo.ply = ply;


  /* Update state */

  // If en passant performed, remove captured pawn
  if (flags == EpCapture) {
    //std::cout << "Holy hell!\n";
    square_t targetSquare = epSquare + pawnDest[turn == Piece::Black];
    piece capturedPawn = board[targetSquare];
    board[targetSquare] = Piece::None;
    undo.captured = capturedPawn;
  } else if (flags == KingCastle) {
    // Move the rook to its new square
    if (to == G1) {
      board[F1] = board[H1];
      board[H1] = Piece::None;
    } else {
      assert(to == G8);
      board[F8] = board[H8];
      board[H8] = Piece::None;
    }
  } else if (flags == QueenCastle) {
    if (to == C1) {
      board[D1] = board[A1];
      board[A1] = Piece::None;
    } else {
      assert(to == C8);
      board[D8] = board[A8];
      board[A8] = Piece::None;
    }
  }

  // Handle en passant square
  epSquare = (flags == DoublePawnPush) ? (to + from) / 2 : NO_SQ;

  // Handle castle permissions
  castlePerm &= castlePermDelta[from];
  castlePerm &= castlePermDelta[to];

  boardHistory.push_back(undo);

  // TODO: Handle fifty move rule

  // Perform the move
  board[to] = board[from];
  board[from] = Piece::None;

  // Handle promotions
  if (isPromotion(move)) {
    // clear the capture bit
    switch (flags & ~Capture) {
      case KnightPromo:
        board[to] = Piece::Knight | turn; break;
      case BishopPromo:
        board[to] = Piece::Bishop | turn; break;
      case RookPromo:
        board[to] = Piece::Rook | turn; break;
      default: /* + Queen case */
        board[to] = Piece::Queen | turn; break;
    }
  }

  // Update the king square iff the king was moved
  if (Piece::PieceType(board[to]) == Piece::King) {
    kingSquare[turn == Piece::White] = to;
  }

  // Bookkeeping
  if (turn == Piece::Black) fullMove++;
  int op = OPPONENT(turn);
  turn = op;
  ply++;
  fiftyMoveCounter++;
  this->posKey = generatePosKey();

  // This should be more incremental (to be fast) but works for now
  this->updateMaterial();

  // Finally, undo the move if puts the player in check (pseudolegal movegen)
  if (SquareAttacked(kingSquare[op == Piece::Black], op)) {
    undoMove(move);
    return false;
  }
  return true;
}

void Board::undoMove(move_t move) {
  ushort to = getTo(move);
  ushort from = getFrom(move);
  int flags = getFlags(move);


  if (boardHistory.size() < 1) return;
  undo_t last = boardHistory.back();
  boardHistory.pop_back();

  int op = OPPONENT(turn);
  turn = op;

  // undo the actual move
  board[from] = board[to];

  epSquare = last.enPas;
  // If en passant performed, remove captured pawn
  if (flags == EpCapture) {
    //std::cout << "New response just dropped"
    board[epSquare + pawnDest[turn == Piece::Black]] = last.captured;
    board[to] = Piece::None;
  } else if (flags == KingCastle) {
    // Move the rook back to its original place pre-castling
    if (to == G1) {
      board[H1] = board[F1];
      board[F1] = Piece::None;
    } else {
      assert(to == G8);
      board[H8] = board[F8];
      board[F8] = Piece::None;
    }
    board[to] = Piece::None;
  } else if (flags == QueenCastle) {
    if (to == C1) {
      board[A1] = board[D1];
      board[D1] = Piece::None;
    } else {
      assert(to == C8);
      board[A8] = board[D8];
      board[D8] = Piece::None;
    }
    board[to] = Piece::None;
  } else {
    board[to] = last.captured;
  }

  // restore castling permissions
  castlePerm = last.castlePerm;
  fiftyMoveCounter = last.fiftyMoveCounter;

  // restore king's square
  if (Piece::PieceType(board[from]) == Piece::King) {
    kingSquare[turn == Piece::White] = from;
  }

  // Undo promotions
  if (isPromotion(move)) {
    board[from] = Piece::Pawn | turn;
  }

  // Bookkeeping
  if (turn == Piece::Black) fullMove--;
  assert(last.ply == ply - 1);
  ply = last.ply;
  fiftyMoveCounter--;
  this->posKey = generatePosKey();

  // This should be more incremental but works for now
  this->updateMaterial();
}

void Board::undoLast() {
  if (boardHistory.size() < 1) return;
  undo_t last = boardHistory.back();
  this->undoMove(last.move);
}

inline u64 Board::rand64() {
  return rng();
  /*
  return (u64)std::rand() + \
         ((u64)std::rand() << 15) + \
         ((u64)std::rand() << 30) + \
         ((u64)std::rand() << 45) + \
         (((u64)std::rand() & 0xf) << 60);
  */
}

void Board::initKeys(unsigned rng_seed) {
  // Seed the RNG
  //std::srand(seed);
  rng.seed(rng_seed);
  // For each piece type and square generate a random hashkey
  for (int p = 0; p < 24; p++) {
    for (square_t s = A1; s <= H8; s++) {
      this->pieceKeys[p][s] = this->rand64();
    }
  }

  // Generate hash key for White's side to play
  this->turnKey = this->rand64();

  // Generate hash key for castling
  for (int i = 0; i < 16; i++) {
    this->castleKeys[i] = this->rand64();
  }
}

u64 Board::generatePosKey() {
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
  key ^= castlePerm;

  // Hash in the en passant square (if set)
  key ^= pieceKeys[Piece::None][epSquare];

  // Store the position key for the Board
  this->posKey = key;

  return key;
}

void Board::updateMaterial() {
  using namespace Piece;

  material[0] = material[1] = 0;

  for (square_t s = A1; s <= H8; s++) {
    piece p = board[s];
    if (p != None) {
      material[Colour(p) == White] += value[PieceType(p)];
    }
    if (PieceType(p) == King) {
      kingSquare[Colour(p) == White] = s;
    }
  }
}

// Returns true if square sq is attacked by color
bool Board::SquareAttacked(const square_t sq, const int color) {
  using namespace Piece;

  square_t from;

  // Check if sq attacked by a pawn
  piece p = White | Pawn;
  if (color == White) {
    from = sq - 7;
    if (distance(sq, from) <= 2 && board[from] == p) {
      return true;
    }
    from = sq - 9;
    if (distance(sq, from) <= 2 && board[from] == p) {
      return true;
    }
  } else { // color == Black
    p ^= White; p |= Black;
    from = sq + 7;
    if (distance(sq, from) <= 2 && board[from] == p) {
      return true;
    }
    from = sq + 9;
    if (distance(sq, from) <= 2 && board[from] == p) {
      return true;
    }
  }

  // Check if sq attacked by a knight
  for (const square_t& dir : knightDest) {
    from = sq + dir;
    if (!IsOK(from) || !(distance(sq, from) == 2)) continue;
    p = board[from];
    if (PieceType(p) == Knight && IsColour(p, color)) {
      return true;
    }
  }

  // Check if square attacked by a rook/queen (N, E, S, W)
  for (const square_t& dir : rookDest) {
    for (from = sq + dir; IsOK(from) && distance(from, from - dir) == 1; from += dir) {
      p = board[from];
      if (p != Piece::None) {
        if (IsRookOrQueen(p) && IsColour(p, color)) {
          return true;
        }
        break; // if not enemy, block
      }
    }
  }

  // Check if square attacked by a bishop/queen (NE, SE, SW, NW)
  for (const square_t& dir : bishopDest) {
    for (from = sq + dir; IsOK(from) && distance(from, from - dir) == 1; from += dir) {
      p = board[from];
      if (p != Piece::None) {
        if (IsBishopOrQueen(p) && IsColour(p, color)) {
          return true;
        }
        break;
      }
    }
  }

  // Check if square attacked by a King
  for (const square_t& dir : kingDest) {
      from = sq + dir;
      if (!IsOK(from) || !(distance(sq, from) <= 2)) continue;
      p = board[from];
      if (PieceType(p) == King && IsColour(p, color)) {
        return true;
      }
  }
  return false;
}

// Returns true if side color is in check
bool Board::inCheck(const int color) {
  // for (square_t s; ...)
  return SquareAttacked(kingSquare[color == Piece::White], OPPONENT(color));
}
