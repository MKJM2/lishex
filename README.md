# 1F98A (codename Lishex)
A chess-engine built in C++

# ToDo's:
- Main file: This file will contain the driver code. Initializes the game state, runs the game loop,
possibly handles user input? 
- Board file: This file will contain the code for representing the chess board and the pieces on it. 
This is currently being done with a two-dimensional array, 
but I'm considering switching to a bitboard representation at some point.
- Move file: This file will contain the code for generating and validating
  moves. It will also contain logic for checking for checkmate, stalemate, and
  other end-game conditions.
- Evaluation file: This file will contain the code for evaluating the current
  game state and assigning a score to it. This will most likely be based on factors like
  material count, piece placement, pawn structure, and other game-specific
  heuristics. Potential improvement for the future: NNUE?
- Search file: This file will contain the code for searching for the best move given the current game state and evaluation function. It will use minimax in the beginning, but as the code evolves
I'm planning on switching to Monte Carlo Tree Search (MCTS).
- Utilities file: This file will contain any helper functions or classes that are used throughout the codebase


