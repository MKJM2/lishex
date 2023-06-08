#include "Board.h"
#include "MoveGenerator.h"
#include "Piece.h"

#define hashPiece(p, sq) (b.posKey ^= b.pieceKeys[(p)][(sq)])
#define hashEnPassant(epSquare) (posKey ^= pieceKeys[Piece::None][epSquare])
#define hashCastle() (posKey ^= castleKeys[this->castlePerm])
#define hashTurn() (posKey ^= turnKey)

std::string startFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";

static std::mt19937_64 rng;

// Constructor
Board::Board() {
  this->reset();
  this->initKeys();
  this->readFEN(startFEN);
  this->posKey = generatePosKey();
  init_PVtable(&PVtable);
  // initPieceList(); // Called by readFEN()
  initMVVLVA();
  initEvalMasks();
}

Board::~Board() {
  if (this->PVtable.pvtable != nullptr) {
      delete[] PVtable.pvtable;
  }
}

void Board::reset() {
  // Clear history
  boardHistory.clear();

  // Clear all heuristic tables
  init_PVtable(&PVtable);
  pv.clear();

  int i, j;
  // Clear history heuristic table
  for (i = 0; i < 24; ++i) {
      for (j = 0; j < 64; ++j) {
          historyH[i][j] = 0;
      }
  }

  // Clear killer heuristic table
  for (i = 0; i < 64; ++i) {
      killersH[0][i] = killersH[1][i] = 0;
  }

  // Clear piece lists
  bigPce[0] = bigPce[1] = 0;
  majPce[0] = majPce[1] = 0;
  minPce[0] = minPce[1] = 0;

  // Reset pawn bitboards
  pawns[0] = pawns[1] = pawns[BOTH] = 0ULL;

  // Reset all piece counts
  for (piece p = 0; p <= (Piece::Black | Piece::Queen); p++) {
    pceCount[p] = 0;
  }
}

void Board::initPieceList() {
  using namespace Piece;
  piece p;
  square_t sq;
  bool colour;
  for (sq = A1; sq <= H8; ++sq) {
    p = this->board[sq];
    if (p != None) {
      colour = IsColour(p, Piece::White);
      // Update tables for eval
      if (IsBig(p))            bigPce[colour]++;
      if (IsKnightOrBishop(p)) minPce[colour]++;
      if (IsRookOrQueen(p))    majPce[colour]++;

      // Update material
      material[colour] += value[PieceType(p)];

      // Update pieceList and piece count to the curr square
      pieceList[p][pceCount[p]++] = sq;

      if (Piece::PieceType(p) == King) {
        kingSquare[colour] = sq;
      }

      if (PieceType(p) == Pawn) {
        SETBIT(pawns[BOTH], sq);
        SETBIT(pawns[colour], sq);
      }
    }
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
    /*
    std::cout << "Piece counts: " << std::endl;
    std::cout << "White pawns: ";
    std::cout << pceCount[Piece::White | Piece::Pawn] << std::endl;
    std::cout << "Black pawns: ";
    std::cout << pceCount[Piece::Black | Piece::Pawn] << std::endl;
    std::cout << "White Knights: ";
    std::cout << pceCount[Piece::White | Piece::Knight] << std::endl;
    std::cout << "Black Knights: ";
    std::cout << pceCount[Piece::Black | Piece::Knight] << std::endl;
    std::cout << "White Bishops: ";
    std::cout << pceCount[Piece::White | Piece::Bishop] << std::endl;
    std::cout << "Black Bishops: ";
    std::cout << pceCount[Piece::Black | Piece::Bishop] << std::endl;
    std::cout << "White Rooks: ";
    std::cout << pceCount[Piece::White | Piece::Rook] << std::endl;
    std::cout << "Black Rooks: ";
    std::cout << pceCount[Piece::Black | Piece::Rook] << std::endl;
    std::cout << "White Queens: ";
    std::cout << pceCount[Piece::White | Piece::Queen] << std::endl;
    std::cout << "Black Queens: ";
    std::cout << pceCount[Piece::Black | Piece::Queen] << std::endl;
    */
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

  // Update material values
  this->updateMaterial();

  // Initialize piece lists
  this->initPieceList();
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
    this->initPieceList();
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

/* Helpers for makeMove */
// Returns captured piece, if any
inline static void clearPiece(const square_t sq, Board& b) {
  piece p = b.board[sq];
  bool colour = Piece::IsColour(p, Piece::White);

  int pIdx = -1; // Index of piece in the piece list

  // Clear piece off the board
  b.board[sq] = Piece::None;

  // Update material for the corresponding side
  b.material[colour] -= Piece::value[Piece::PieceType(p)];

  // Update the Zobrist hash
  hashPiece(p, sq);

  // Update counts
  if (Piece::IsBig(p)) {
    b.bigPce[colour]--;
    if (Piece::IsRookOrQueen(p)) {
      b.majPce[colour]--;
    } else {
      b.minPce[colour]--;
    }
  } else { // is a pawn
    CLRBIT(b.pawns[colour], sq);
    CLRBIT(b.pawns[2], sq); // 2 is BOTH
  }

  // Finally, clear the piece off the piece list
  for (int i = 0; i < b.pceCount[p]; ++i) {
    if (b.pieceList[p][i] == sq) {
      pIdx = i;
    }
  }

  // Instead of clearning, we swap it with last element
  // and decrement the piece count
  b.pieceList[p][pIdx] = b.pieceList[p][--b.pceCount[p]];
}

inline static void addPiece(const square_t sq, const piece p, Board& b) {
  bool colour = Piece::IsColour(p, Piece::White);

  // Hash the piece into the Zobrist key
  hashPiece(p, sq);

  // Add piece to the board
  b.board[sq] = p;

  // Update counts
  if (Piece::IsBig(p)) {
    b.bigPce[colour]++;
    if (Piece::IsRookOrQueen(p)) {
      b.majPce[colour]++;
    } else {
      b.minPce[colour]++;
    }
  } else {
    SETBIT(b.pawns[colour], sq);
    SETBIT(b.pawns[BOTH], sq);
  }

  // Update material for colour
  b.material[colour] += Piece::value[Piece::PieceType(p)];

  // Finally, update the piece list
  b.pieceList[p][b.pceCount[p]++] = sq;
}

inline static void movePiece(const square_t from, const square_t to, Board& b) {
  piece p = b.board[from];
  bool colour = Piece::IsColour(p, Piece::White);

  // hash in the piece into the new position and out of the old
  hashPiece(p, from);
  b.board[from] = Piece::None;

  hashPiece(p, to);
  b.board[to] = p;

  // Update the pawn bitboard if necessary
  if (!Piece::IsBig(p)) {
    CLRBIT(b.pawns[colour], from);
    CLRBIT(b.pawns[BOTH], from);
    SETBIT(b.pawns[colour], to);
    SETBIT(b.pawns[BOTH], to);
  }

  // Move the piece in the piece list
  for (int i = 0; i < b.pceCount[p]; ++i) {
    if (b.pieceList[p][i] == from) {
      b.pieceList[p][i] = to;
      break;
    }
  }
}


// Returns True if move was legal, False otherwise
bool Board::makeMove(move_t move) {

  // Extract move data
  square_t to = getTo(move);
  square_t from = getFrom(move);
  int flags = getFlags(move);

  // Extract side
  bool colour = Piece::IsColour(turn, Piece::White);

  // Store the pre-move state
  undo_t undo;
  undo.move = move;
  undo.enPas = epSquare;
  undo.captured = board[to];
  undo.posKey = this->posKey;
  undo.castlePerm = castlePerm;

  /* Update state */

  // If en passant performed, remove captured pawn
  if (flags == EpCapture) {
    //std::cout << "Holy hell!\n";
    square_t targetSquare = epSquare + pawnDest[colour^1];
    piece capturedPawn = board[targetSquare];
    //board[targetSquare] = Piece::None;
    clearPiece(targetSquare, *this);
    undo.captured = capturedPawn;
  } else if (flags == KingCastle) {
    // Move the rook to its new square
    if (to == G1) {
      movePiece(H1, F1, *this);
      //board[F1] = board[H1];
      //board[H1] = Piece::None;
    } else {
      //board[F8] = board[H8];
      //board[H8] = Piece::None;
      movePiece(H8, F8, *this);
    }
  } else if (flags == QueenCastle) {
    if (to == C1) {
      //board[D1] = board[A1];
      //board[A1] = Piece::None;
      movePiece(A1, D1, *this);
    } else {
      //board[D8] = board[A8];
      //board[A8] = Piece::None;
      movePiece(A8, D8, *this);
    }
  }

  // Handle en passant square
  if (flags == DoublePawnPush) {
    epSquare = (to + from) >> 1;
    hashEnPassant(epSquare);
  } else {
    epSquare = NO_SQ;
  }

  // Handle castle permissions
  castlePerm &= castlePermDelta[from];
  castlePerm &= castlePermDelta[to];
  hashCastle();

  boardHistory.push_back(undo);

  // Handle fifty move rule
  fiftyMoveCounter++;

  // Perform the move
  if (board[to] != Piece::None) {
    clearPiece(to, *this);
    fiftyMoveCounter = 0;
  }

  //board[to] = board[from];
  //board[from] = Piece::None;
  movePiece(from, to, *this);

  // Handle promotions
  if (isPromotion(move)) {
    // Update the pawn to be the capture choice (QNBR)
    clearPiece(to, *this);
    // clear the capture bit
    switch (flags & ~Capture) {
      case KnightPromo:
        addPiece(to, Piece::Knight | turn, *this); break;
        //board[to] = Piece::Knight | turn; break;
      case BishopPromo:
        addPiece(to, Piece::Bishop | turn, *this); break;
        //board[to] = Piece::Bishop | turn; break;
      case RookPromo:
        addPiece(to, Piece::Rook | turn, *this); break;
        //board[to] = Piece::Rook | turn; break;
      default: /* + Queen case */
        addPiece(to, Piece::Queen | turn, *this); break;
        //board[to] = Piece::Queen | turn; break;
    }
  }

  // Update the king square iff the king was moved
  if (Piece::PieceType(board[to]) == Piece::King) {
    kingSquare[colour] = to;
  }

  // Bookkeeping
  if (turn == Piece::Black) fullMove++;
  int op = OPPONENT(turn);
  turn = op;
  ply++;
  fiftyMoveCounter++;
  //this->posKey = generatePosKey();
  hashTurn();

  // This should be more incremental (to be fast) but works for now
  //this->updateMaterial();

  // Finally, undo the move if puts the player in check (pseudolegal movegen)
  if (SquareAttacked(kingSquare[op == Piece::Black], op)) {
    undoMove(move);
    return false;
  }
  return true;
}

void Board::undoMove(move_t move) {
  square_t to = getTo(move);
  square_t from = getFrom(move);
  int flags = getFlags(move);

  if (boardHistory.size() == 0) return;
  undo_t last = boardHistory.back();
  boardHistory.pop_back();

  int op = OPPONENT(turn);
  turn = op;
  hashTurn();

  // undo the actual move
  //board[from] = board[to];
  movePiece(to, from, *this);

  // Hash out the en passant square if currently set
  if (epSquare != NO_SQ) hashEnPassant(epSquare);

  // Restore the en passant square from pre-move state
  epSquare = last.enPas;

  // If en passant performed, restore the captured pawn
  if (flags == EpCapture) {
    //std::cout << "New response just dropped\n";
    square_t targetSquare = epSquare + pawnDest[turn == Piece::Black];
    addPiece(targetSquare, last.captured, *this);
    //board[targetSquare] = last.captured;
    //board[to] = Piece::None; <- handled by movePiece already
  } else if (flags == KingCastle) {
    // Move the rook back to its original place pre-castling
    if (to == G1) {
      movePiece(F1, H1, *this);
      //board[H1] = board[F1];
      //board[F1] = Piece::None;
    } else {
      movePiece(F8, H8, *this);
      //board[H8] = board[F8];
      //board[F8] = Piece::None;
    }
    //board[to] = Piece::None;
  } else if (flags == QueenCastle) {
    if (to == C1) {
      //board[A1] = board[D1];
      //board[D1] = Piece::None;
      movePiece(D1, A1, *this);
    } else {
      //board[A8] = board[D8];
      //board[D8] = Piece::None;
      movePiece(D8, A8, *this);
    }
    //board[to] = Piece::None;
  } else {
    //board[to] = last.captured;
    //addPiece(board[to], last.captured, *this);
    if (last.captured != Piece::None) {
      addPiece(to, last.captured, *this);
    }
  }

  // restore castling permissions
  hashCastle(); // hash out post-move permissions
  castlePerm = last.castlePerm; // restore pre-move permissions

  // restore 50 move counter
  fiftyMoveCounter = last.fiftyMoveCounter;

  // restore king's square
  if (Piece::PieceType(board[from]) == Piece::King) {
    kingSquare[turn == Piece::White] = from;
  }

  // Undo promotions
  if (isPromotion(move)) {
    //board[from] = Piece::Pawn | turn;
    clearPiece(from, *this);
    addPiece(from, Piece::Pawn | turn, *this);
  }

  // Bookkeeping
  if (turn == Piece::Black) fullMove--;
  // TODO: Debug
  ply--;
  if (last.posKey != posKey) {
    printf("Assert failed while performing move %s\n", toString(move).c_str());
    std::cout << this->toFEN() << std::endl;
    printf("Desired   hash: %llu\n", last.posKey);
    printf("Generated hash: %llu\n", posKey);
    fflush(stdout);
    assert(last.posKey == posKey);
  }
  //this->posKey = generatePosKey();

  // This should be more incremental but works for now
  //this->updateMaterial();
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
      material[IsColour(p, White)] += value[PieceType(p)];
    }
    if (PieceType(p) == King) {
      kingSquare[IsColour(p, White)] = s;
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

// For debugging: Mirrors the board
void Board::mirror() {

  piece tmpBoard[ROWS * COLS];
  int tmpSide = OPPONENT(turn);
  uint tmpCastlePerm = 0;
  square_t tmpEnPas = NO_SQ;

  square_t sq;

  if (castlePerm & WKCastle) tmpCastlePerm |= BKCastle;
  if (castlePerm & WQCastle) tmpCastlePerm |= BQCastle;

  if (castlePerm & BKCastle) tmpCastlePerm |= WKCastle;
  if (castlePerm & BQCastle) tmpCastlePerm |= WQCastle;

  if (epSquare != NO_SQ) {
    tmpEnPas = Mirror64[epSquare];
  }

  for (sq = A1; sq <= H8; ++sq) {
    tmpBoard[sq] = board[Mirror64[sq]];
  }

  this->reset();

  for (sq = A1; sq <= H8; ++sq) {
    // flip color
    board[sq] = tmpBoard[sq];
    if (Piece::PieceType(board[sq]) != Piece::None) {
      board[sq] ^= Piece::colorMask;
    }
    /*
    if (Piece::IsColour(tmpBoard[sq], Piece::White)) {
      board[sq] = Piece::Black | Piece::PieceType(tmpBoard[sq]);
    } else {
      board[sq] = Piece::White | Piece::PieceType(tmpBoard[sq]);
    }
    */
  }

  turn = tmpSide;
  castlePerm = tmpCastlePerm;
  epSquare = tmpEnPas;
  posKey = this->generatePosKey();

  this->initPieceList();
}
