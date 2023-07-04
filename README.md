# Lishex (codename 1F98A)
A UCI chess-engine built in C++.
### Features 
- Universal Chess Interface (UCI) compatible.
- Hybrid board representation 
  - [Bitboard](https://www.chessprogramming.org/Bitboards) representation for move generation and evaluation
  - Square centric [8x8 board](https://www.chessprogramming.org/8x8_Board) for quick piece-lookup during move making
- Iterative deepening [Negamax framework](https://www.chessprogramming.org/Negamax)
  - [Alpha-Beta pruning](https://www.chessprogramming.org/Alpha-Beta)
  - Most Valuable Victim Least Valuable Attacker ([MVV-LVA](https://www.chessprogramming.org/MVV-LVA)) heuristic 
  - [Quiescence search](https://www.chessprogramming.org/Quiescence_Search)
  - [Killer move heuristic](https://www.chessprogramming.org/Killer_Heuristic)
  - [History heuristic](https://www.chessprogramming.org/History_Heuristic)
  - [Null-move pruning](https://www.chessprogramming.org/Null_Move_Pruning)
  - [Transposition tables](https://www.chessprogramming.org/Transposition_Table) to store results of previously performed searches (based on [Zobrist](https://www.chessprogramming.org/Zobrist_Hashing) hashes)
  - Check extension
- Tapered [Piece-square tables](https://www.chessprogramming.org/Piece-Square_Tables) for static position evaluation interpolated between different game stages

### How to 
Lishex does not come with its own grapical user interface (GUI).  Instead, it implements the [UCI](https://www.chessprogramming.org/UCI) protocol making it compatible with most popular chess GUIs such as:
- [Arena Chess GUI](http://www.playwitharena.de/) (free)
- [Chessbase](https://chessbase.com/) (paid)
- [Cutechess](https://cutechess.com/) (free)
- [BanksiaGUI](https://banksiagui.com/) (free)
- [Nibbler](https://github.com/fohristiwhirl/nibbler/releases) (free).

To compile the engine to an x86_64 Linux binary, simply run
``` sh
make
```
Then, to run the engine on the command-line run
```sh
make run 
```
or
```sh
./lishex
```
To compile in debug mode
```sh
make debug=yes
```

### TODOs
- [Principal variation search](https://www.chessprogramming.org/Principal_Variation_Search)
- [Futility pruning](https://www.chessprogramming.org/Futility_Pruning)
- [Mobility scores](https://www.chessprogramming.org/Mobility)
- [Late move reduction](https://www.chessprogramming.org/Late_Move_Reductions)
- More [search extensions](https://www.chessprogramming.org/Extensions): extending search depth in specific subtrees to combat the [horizon effect](https://www.chessprogramming.org/Horizon_Effect)
- [Parameter fine-tuning](https://www.chessprogramming.org/Automated_Tuning)
- [LazySMP](https://www.chessprogramming.org/Parallel_Search) for parallel searching on multiple threads
- Aspiration window
- Smarter time control logic
- Engine options

### Acknowledgments
I'd like to thank BlueFeverSoft (Vice), Tom Kerrigan (TCSP), Sebastian Lague, the Stockfish and GNU Chess developers, as well as the entire Chess Programming community for help and inspiration.
