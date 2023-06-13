#!/usr/bin/env bash

Arena 3.10beta

2023-06-13 15:44:55.577**Fast graphics mode ok
1,274**----------New game---2023-06-13 15:44:56,193 Tue -------------
1,573**Arena Start took: 1573 ms
2,573**Loading  1
9,879********======== Tournament 1 ========
9,943********
9,944********Pairing 1/1: LiSHeX  -  Tscp 1.81
10,117*1*--------------------------Starting engine 1 LiSHeX--------------------------
10,120*1*Configured Engine 1 Type:   UCI
10,120*1*enginedebug:CommandLine: >>nice -1 /home/mkjm/Projects/lishex/lishex <<
10,120*1*enginedebug:-- executing engine--
10,122*1*enginedebug:EngineReadThread create...
10,122*1*enginedebug:EngineReadThread created suspended
10,122*1*enginedebug:-- Thread now starting --
10,122*1*enginedebug:-- Tengine.Redirect finished --
10,145<--1:-- starting engine[slotnr].EngineProcess --
10,145<--1:-- engine[slotnr].EngineProcess.Running --
10,146-->1:uci
10,206<--1:Allocated TT of size 67108864
10,206<--1:id name LiSHeX
10,206<--1:id author Michal Kurek
10,206<--1:uciok
10,207-->1:isready
10,357<--1:readyok
10,742*2*------------------------Starting engine 2 Tscp 1.81-------------------------
10,743*2*Configured Engine 2 Type:   WB1
10,743*2*enginedebug:CommandLine: >>nice -1 /home/mkjm/Downloads/TSCP/tscp xboard<<
10,743*2*enginedebug:-- executing engine--
10,747*2*enginedebug:EngineReadThread create...
10,747*2*enginedebug:EngineReadThread created suspended
10,747*2*enginedebug:-- Thread now starting --
10,747*2*enginedebug:-- Tengine.Redirect finished --
10,747-->2:xboard
10,767<--2:-- starting engine[slotnr].EngineProcess --
10,904<--2:-- engine[slotnr].EngineProcess.Running --
10,906<--2:Tom Kerrigan's Simple Chess Program (TSCP)
10,906<--2:version 1.81, 2/5/03
10,906<--2:Copyright 1997 Tom Kerrigan
10,906<--2:"help" displays a list of commands.
10,906<--2:tscp>
11,529-->2:new
11,529-->2:random
11,529-->2:level 0 0:10 0.1
11,529-->2:post
11,529-->2:hard
11,529-->2:easy
11,529-->2:computer
11,549<--2:Error (unknown command): random
11,568<--2:Error (unknown command): level
11,589<--2:Error (unknown command): hard
11,609<--2:Error (unknown command): easy
11,611<--2:Error (unknown command): computer
11,710********Round 1 of 10: LiSHeX  -  Tscp 1.81
11,760**----------New game---2023-06-13 15:45:06,680 Tue -------------
11,760-->2:new
11,768-->2:post
11,844*1*Start calc, move no: 0
11,844-->1:ucinewgame
11,844-->1:isready
11,844<--1:readyok
11,851-->1:position startpos
11,859-->1:go wtime 10000 btime 10000 winc 100 binc 100
11,859<--1:info score cp 30 depth 1 nodes 21 time 0 pv d2d4
11,877<--1:info score cp 0 depth 2 nodes 89 time 0 pv d2d4 d7d5
11,877<--1:info score cp 25 depth 3 nodes 692 time 0 pv d2d4 d7d5 c1e3
11,877<--1:info score cp 0 depth 4 nodes 4331 time 3 pv d2d4 d7d5 c1e3 c8e6
11,877<--1:info score cp 25 depth 5 nodes 12288 time 11 pv e2e4 e7e5 d2d4 d7d5 c1e3
11,938<--1:info score cp 5 depth 6 nodes 91883 time 86 pv e2e4 e7e5 d2d4 b8c6 g1f3 f8d6
12,043<--1:info score cp 22 depth 7 nodes 224987 time 192 pv e2e4 d7d5 e4d5 d8d5 d2d4 e7e5 c1e3
12,235<--1:bestmove e2e4
12,235*1*Found move:e2-e4
12,391*2*Start calc, move no: 1
12,593-->2:new
12,593-->2:post
12,634-->2:time 1000
12,634-->2:otim 963
12,634-->2:e2e4
12,637<--2:move c7c5
12,637*2*Found move:c7-c5
12,794*1*Start calc, move no: 2
12,795-->1:position startpos moves e2e4 c7c5
12,795-->1:go wtime 9621 btime 10000 winc 100 binc 100
12,798<--1:info score cp 22 depth 1 nodes 1 time 0 pv f1d3
12,798<--1:info score cp 22 depth 2 nodes 2 time 0 pv f1d3 d7d5
12,798<--1:info score cp 22 depth 3 nodes 3 time 0 pv f1d3 d7d5 e4d5
12,798<--1:info score cp 22 depth 4 nodes 4 time 0 pv f1d3 d7d5 e4d5 d8d5
12,799<--1:info score cp 22 depth 5 nodes 5 time 0 pv f1d3 d7d5 e4d5 d8d5 g1f3
13,095<--1:info score cp 30 depth 6 nodes 332144 time 299 pv b1c3 e7e6 f1c4 g8f6 d2d4 d7d5
13,169<--1:bestmove b1c3
13,169*1*Found move:Nb1-c3
13,326*2*Start calc, move no: 3
13,568-->2:time 1000
13,568-->2:otim 926
13,568-->2:b1c3
13,569<--2:move b8c6
13,569*2*Found move:Nb8-c6
13,742*1*Start calc, move no: 4
13,742-->1:position startpos moves e2e4 c7c5 b1c3 b8c6
13,742-->1:go wtime 9252 btime 10000 winc 100 binc 100
13,746<--1:info score cp 30 depth 1 nodes 1 time 0 pv d1h5
13,746<--1:info score cp 30 depth 2 nodes 2 time 0 pv d1h5 e7e6
13,746<--1:info score cp 30 depth 3 nodes 3 time 0 pv d1h5 e7e6 h5c5
13,746<--1:info score cp 30 depth 4 nodes 4 time 0 pv d1h5 e7e6 h5c5 f8c5
13,799<--1:info score cp 35 depth 5 nodes 66693 time 56 pv g1f3 e7e5 f1d3 f8d6 e1g1
14,065<--1:info score cp 15 depth 6 nodes 316134 time 322 pv g1f3 e7e5 f1c4 f8d6 e1g1 g8f6
14,103<--1:bestmove g1f3
14,104*1*Found move:Ng1-f3
14,286*2*Start calc, move no: 5
14,527-->2:time 1000
14,527-->2:otim 890
14,527-->2:g1f3
14,529<--2:1 -37 0 32 e7e5
14,531<--2:2 -67 0 172 e7e5 d2d3
14,534<--2:3 -32 0 1605 e7e5 d2d3 g8f6
14,563<--2:4 -67 3 14349 e7e5 f1c4 g8f6 e1g1
14,695<--2:5 -37 16 87334 e7e5 f1c4 d7d6 e1g1 g8f6
14,860<--2:move e7e5
14,860*2*Found move:e7-e5
15,015*1*Start calc, move no: 6
15,016-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5
15,016-->1:go wtime 8895 btime 9672 winc 100 binc 100
15,020<--1:info score cp 35 depth 1 nodes 1 time 0 pv f1c4
15,020<--1:info score cp 35 depth 2 nodes 2 time 0 pv f1c4 d7d6
15,020<--1:info score cp 35 depth 3 nodes 3 time 0 pv f1c4 d7d6 d2d3
15,020<--1:info score cp 35 depth 4 nodes 4 time 0 pv f1c4 d7d6 d2d3 c8e6
15,020<--1:info score cp 35 depth 5 nodes 5 time 0 pv f1c4 d7d6 d2d3 c8e6 e1g1
15,223<--1:info score cp 15 depth 6 nodes 236511 time 207 pv f1c4 d7d6 d2d3 f8e7 e1g1 c8e6
15,365<--1:bestmove f1c4
15,365*1*Found move:Bf1-c4
15,516*2*Start calc, move no: 7
15,758-->2:time 968
15,758-->2:otim 856
15,758-->2:f1c4
15,762<--2:1 -27 0 65 g8f6
15,762<--2:2 -67 0 431 g8f6 e1g1
15,772<--2:3 -37 1 6191 d7d6 e1g1 g8f6
15,840<--2:4 -67 8 30751 d7d6 e1g1 g8f6 d2d3
16,081<--2:move f8d6
16,081*2*Found move:Bf8-d6
16,232*1*Start calc, move no: 8
16,232-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6
16,232-->1:go wtime 8551 btime 9354 winc 100 binc 100
16,237<--1:info score cp 35 depth 1 nodes 1 time 0 pv c3b5
16,237<--1:info score cp 35 depth 2 nodes 2 time 0 pv c3b5 d6e7
16,237<--1:info score cp 35 depth 3 nodes 3 time 0 pv c3b5 d6e7 e1g1
16,237<--1:info score cp 35 depth 4 nodes 4 time 0 pv c3b5 d6e7 e1g1 g8f6
16,237<--1:info score cp 35 depth 5 nodes 5 time 0 pv c3b5 d6e7 e1g1 g8f6 d2d3
16,546<--1:info score cp 25 depth 6 nodes 385840 time 313 pv e1g1 g8f6 d2d3 e8g8 c1e3 f8e8
16,570<--1:bestmove e1g1
16,570*1*Found move:O-O
16,747*2*Start calc, move no: 9
16,988-->2:time 936
16,988-->2:otim 822
16,988-->2:e1g1
16,992<--2:1 -42 0 51 g8f6
16,992<--2:2 -72 0 620 g8f6 d2d3
17,000<--2:3 -44 1 4897 g8f6 f3g5 e8g8 g5f7 f8f7 c4f7 g8f7
17,069<--2:4 -57 8 39569 g8f6 d2d3 e8g8 c1e3
17,301<--2:move g8f6
17,301*2*Found move:Ng8-f6
17,451*1*Start calc, move no: 10
17,452-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6
17,452-->1:go wtime 8218 btime 9046 winc 100 binc 100
17,457<--1:info score cp 25 depth 1 nodes 1 time 0 pv d2d3
17,457<--1:info score cp 25 depth 2 nodes 2 time 0 pv d2d3 e8g8
17,457<--1:info score cp 25 depth 3 nodes 3 time 0 pv d2d3 e8g8 c3b5
17,457<--1:info score cp 25 depth 4 nodes 4 time 0 pv d2d3 e8g8 c3b5 d6e7
17,479<--1:info score cp 30 depth 5 nodes 31536 time 27 pv d2d3 b7b6 c3d5 f6d5 e4d5
17,707<--1:info score cp 30 depth 6 nodes 326205 time 254 pv f3g5 e8g8 d2d3 c6d4 g5f7 f8f7
17,778<--1:bestmove f3g5
17,778*1*Found move:Nf3-g5
17,965*2*Start calc, move no: 11
18,207-->2:time 905
18,207-->2:otim 790
18,207-->2:f3g5
18,208<--2:1 -44 0 245 h8f8 g5f7 f8f7 c4f7 e8f7
18,210<--2:2 -44 0 642 e8g8 g5f7 f8f7 c4f7 g8f7
18,218<--2:3 -44 1 2886 e8g8 g5f7 f8f7 c4f7 g8f7
18,257<--2:4 -52 5 13101 e8g8 d2d3 d8e8 c1e3
18,385<--2:5 -74 17 77719 e8g8 g5f7 f8f7 c4f7 g8f7 d2d3
18,509<--2:move e8g8
18,509*2*Found move:O-O
18,663*1*Start calc, move no: 12
18,665-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8
18,665-->1:go wtime 7897 btime 8749 winc 100 binc 100
18,668<--1:info score cp 40 depth 1 nodes 1 time 0 pv c3b5
18,668<--1:info score cp 40 depth 2 nodes 2 time 0 pv c3b5 d6c7
18,668<--1:info score cp 40 depth 3 nodes 3 time 0 pv c3b5 d6c7 b5c7
18,668<--1:info score cp 40 depth 4 nodes 4 time 0 pv c3b5 d6c7 b5c7 d8c7
18,669<--1:info score cp 40 depth 5 nodes 5 time 0 pv c3b5 d6c7 b5c7 d8c7 d2d3
18,774<--1:info score cp 25 depth 6 nodes 135719 time 109 pv c3b5 d6c7 b5c7 d8c7 d2d3 d7d6
18,981<--1:bestmove c3b5
18,981*1*Found move:Nc3-b5
19,139*2*Start calc, move no: 13
19,380-->2:time 875
19,380-->2:otim 759
19,380-->2:c3b5
19,380<--2:1 -39 0 387 d8e7 g5f7 f8f7 c4f7 g8f7
19,384<--2:2 -39 0 861 d8e7 g5f7 f8f7 c4f7 g8f7
19,394<--2:3 -39 1 5187 d8e7 g5f7 f8f7 c4f7 g8f7
19,428<--2:4 -44 4 23274 d6c7 g5f7 f8f7 c4f7 g8f7
19,579<--2:5 -69 19 106494 d8e7 g5f7 f8f7 c4f7 g8f7 d2d3
19,671<--2:move d8e7
19,671*2*Found move:Qd8-e7
19,823*1*Start calc, move no: 14
19,824-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7
19,824-->1:go wtime 7586 btime 8463 winc 100 binc 100
19,829<--1:info score cp 45 depth 1 nodes 1 time 0 pv b5d6
19,829<--1:info score cp 45 depth 2 nodes 2 time 0 pv b5d6 e7d6
19,829<--1:info score cp 45 depth 3 nodes 3 time 0 pv b5d6 e7d6 d2d3
19,829<--1:info score cp 45 depth 4 nodes 4 time 0 pv b5d6 e7d6 d2d3 f6e4
19,829<--1:info score cp 45 depth 5 nodes 5 time 0 pv b5d6 e7d6 d2d3 f6e4 d3e4
19,979<--1:info score cp 40 depth 6 nodes 156038 time 153 pv b5d6 e7d6 d2d3 c6a5 g5f7 f8f7
20,085<--1:info score cp 50 depth 7 nodes 303043 time 261 pv b5d6 e7d6 d2d3 c6a5 c4f7 f8f7 c1d2
20,131<--1:bestmove b5d6
20,131*1*Found move:Nb5xd6
20,282*2*Start calc, move no: 15
20,522-->2:time 847
20,522-->2:otim 729
20,522-->2:b5d6
20,527<--2:1 -38 0 44 e7d6 g5f7 f8f7 c4f7 g8f7
20,527<--2:2 -38 0 235 e7d6 g5f7 f8f7 c4f7 g8f7
20,531<--2:3 -38 0 2561 e7d6 g5f7 f8f7 c4f7 g8f7
20,545<--2:4 -52 2 9111 e7d6 d2d3 d6e7 c1e3
20,623<--2:5 -68 10 51518 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3
20,806<--2:move e7d6
20,806*2*Found move:Qe7xd6
20,957*1*Start calc, move no: 16
20,957-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6
20,957-->1:go wtime 7284 btime 8184 winc 100 binc 100
20,963<--1:info score cp 50 depth 1 nodes 1 time 0 pv d2d3
20,963<--1:info score cp 50 depth 2 nodes 2 time 0 pv d2d3 c6a5
20,963<--1:info score cp 50 depth 3 nodes 3 time 0 pv d2d3 c6a5 c4f7
20,964<--1:info score cp 50 depth 4 nodes 4 time 0 pv d2d3 c6a5 c4f7 f8f7
20,964<--1:info score cp 50 depth 5 nodes 5 time 0 pv d2d3 c6a5 c4f7 f8f7 g5f7
21,050<--1:info score cp 50 depth 6 nodes 110822 time 92 pv g5f7 f8f7 c4f7 g8f7 d2d3 c6d4
21,254<--1:bestmove g5f7
21,254*1*Found move:Ng5xf7
21,407*2*Start calc, move no: 17
21,649-->2:time 819
21,649-->2:otim 700
21,649-->2:g5f7
21,654<--2:1 -38 0 38 f8f7 c4f7 g8f7
21,654<--2:2 -38 0 146 f8f7 c4f7 g8f7
21,654<--2:3 -68 0 1121 f8f7 c4f7 g8f7 d2d3
21,676<--2:4 -27 2 6189 f8f7 c4f7 g8f7 d2d3 f7g8
21,753<--2:5 -52 10 37035 f8f7 c4f7 g8f7 d2d3 f7g8 c1e3
21,925<--2:move f8f7
21,925*2*Found move:Rf8xf7
22,076*1*Start calc, move no: 18
22,076-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7
22,076-->1:go wtime 6992 btime 7913 winc 100 binc 100
22,080<--1:info score cp 10 depth 1 nodes 1 time 0 pv c4f7
22,080<--1:info score cp 10 depth 2 nodes 2 time 0 pv c4f7 g8f7
22,080<--1:info score cp 10 depth 3 nodes 3 time 0 pv c4f7 g8f7 d2d3
22,080<--1:info score cp 10 depth 4 nodes 4 time 0 pv c4f7 g8f7 d2d3 f7g8
22,080<--1:info score cp 10 depth 5 nodes 5 time 0 pv c4f7 g8f7 d2d3 f7g8 c1e3
22,142<--1:info score cp 15 depth 6 nodes 72966 time 65 pv c4f7 g8f7 d2d3 f7g8 c1e3 c6d4
22,361<--1:bestmove c4f7
22,361*1*Found move:Bc4xf7
22,518*2*Start calc, move no: 19
22,759-->2:time 792
22,759-->2:otim 772
22,759-->2:c4f7
22,763<--2:1 -68 0 62 g8f7 d2d3
22,763<--2:2 -27 0 345 g8f7 d2d3 f7g8
22,763<--2:3 -52 0 2085 g8f7 d2d3 f7g8 c1e3
22,794<--2:4 -51 3 19550 g8f7 d2d3 f7g8 c1e3 c6d4 e3d4 d6d4
22,942<--2:5 -51 18 104424 g8f7 d2d3 f7g8 c1e3 c6d4 e3d4 d6d4
23,024<--2:move g8f7
23,024*2*Found move:Kg8xf7
23,202*1*Start calc, move no: 20
23,202-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7
23,202-->1:go wtime 7712 btime 8653 winc 100 binc 100
23,207<--1:info score cp 15 depth 1 nodes 1 time 0 pv d2d3
23,207<--1:info score cp 15 depth 2 nodes 2 time 0 pv d2d3 f7g8
23,207<--1:info score cp 15 depth 3 nodes 3 time 0 pv d2d3 f7g8 c1g5
23,207<--1:info score cp 15 depth 4 nodes 4 time 0 pv d2d3 f7g8 c1g5 h7h6
23,207<--1:info score cp 15 depth 5 nodes 5 time 0 pv d2d3 f7g8 c1g5 h7h6 g5e3
23,207<--1:info score cp 15 depth 6 nodes 6 time 0 pv d2d3 f7g8 c1g5 h7h6 g5e3 c6d4
23,512<--1:bestmove d2d3
23,512*1*Found move:d2-d3
23,666*2*Start calc, move no: 21
23,906-->2:time 866
23,906-->2:otim 741
23,906-->2:d2d3
23,910<--2:1 -27 0 42 f7g8
23,911<--2:2 -52 0 615 f7g8 c1e3
23,915<--2:3 -51 0 3376 f7g8 c1e3 c6d4 e3d4 d6d4
23,939<--2:4 -51 3 16178 f7g8 c1e3 c6d4 e3d4 d6d4
24,141<--2:5 -51 23 146336 f7g8 c1g5 d6e7 g5f6 e7f6
24,195<--2:move f7g8
24,195*2*Found move:Kf7-g8
24,347*1*Start calc, move no: 22
24,348-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8
24,348-->1:go wtime 7407 btime 8369 winc 100 binc 100
24,353<--1:info score cp 20 depth 1 nodes 1 time 0 pv c1g5
24,353<--1:info score cp 20 depth 2 nodes 2 time 0 pv c1g5 a8b8
24,353<--1:info score cp 20 depth 3 nodes 3 time 0 pv c1g5 a8b8 c2c4
24,354<--1:info score cp 20 depth 4 nodes 4 time 0 pv c1g5 a8b8 c2c4 c6d4
24,354<--1:info score cp 20 depth 5 nodes 5 time 0 pv c1g5 a8b8 c2c4 c6d4 f2f4
24,473<--1:info score cp 15 depth 6 nodes 143398 time 124 pv c1g5 h7h6 g5e3 d6e7 c2c4 d7d6
24,648<--1:bestmove c1g5
24,648*1*Found move:Bc1-g5
24,798*2*Start calc, move no: 23
25,040-->2:time 837
25,040-->2:otim 712
25,040-->2:c1g5
25,041<--2:1 -46 0 79 c6d4 g5f6 d6f6
25,044<--2:2 -47 0 266 c6d4 g5e3
25,053<--2:3 -51 1 5037 d6e7 g5f6 e7f6
25,068<--2:4 -54 2 12862 d6e7 g5f6 e7f6 c2c3
25,222<--2:5 -41 18 99519 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6
25,320<--2:move d6e7
25,320*2*Found move:Qd6-e7
25,472*1*Start calc, move no: 24
25,473-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7
25,473-->1:go wtime 7112 btime 8094 winc 100 binc 100
25,477<--1:info score cp 17 depth 1 nodes 1 time 0 pv f2f4
25,477<--1:info score cp 17 depth 2 nodes 2 time 0 pv f2f4 d7d6
25,477<--1:info score cp 17 depth 3 nodes 3 time 0 pv f2f4 d7d6 g5f6
25,477<--1:info score cp 17 depth 4 nodes 4 time 0 pv f2f4 d7d6 g5f6 g7f6
25,477<--1:info score cp 17 depth 5 nodes 5 time 0 pv f2f4 d7d6 g5f6 g7f6 f4e5
25,521<--1:info score cp 25 depth 6 nodes 60674 time 48 pv f2f4 d7d6 f4e5 d6e5 g5f6 g7f6
25,584<--1:info score cp 35 depth 7 nodes 137973 time 111 pv f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 c2c4
25,764<--1:bestmove f2f4
25,764*1*Found move:f2-f4
25,916*2*Start calc, move no: 25
26,157-->2:time 810
26,157-->2:otim 683
26,157-->2:f2f4
26,160<--2:1 -41 0 170 d7d6 f4e5 d6e5 g5f6 g7f6
26,162<--2:2 -41 0 429 d7d6 f4e5 d6e5 g5f6 g7f6
26,164<--2:3 -41 0 1973 d7d6 f4e5 d6e5 g5f6 g7f6
26,183<--2:4 -41 2 8584 d7d6 f4e5 d6e5 g5f6 g7f6
26,261<--2:5 -41 10 60801 d7d6 f4e5 d6e5 g5f6 g7f6
26,429<--2:move d7d6
26,429*2*Found move:d7-d6
26,597*1*Start calc, move no: 26
26,597-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6
26,597-->1:go wtime 6826 btime 7827 winc 100 binc 100
26,603<--1:info score cp 25 depth 1 nodes 1 time 0 pv f4e5
26,604<--1:info score cp 25 depth 2 nodes 2 time 0 pv f4e5 e7e5
26,604<--1:info score cp 25 depth 3 nodes 3 time 0 pv f4e5 e7e5 g5f6
26,604<--1:info score cp 25 depth 4 nodes 4 time 0 pv f4e5 e7e5 g5f6 g7f6
26,604<--1:info score cp 25 depth 5 nodes 5 time 0 pv f4e5 e7e5 g5f6 g7f6 d1f3
26,604<--1:info score cp 25 depth 6 nodes 6 time 0 pv f4e5 e7e5 g5f6 g7f6 d1f3 e5b2
26,809<--1:info score cp 25 depth 7 nodes 256928 time 210 pv f4e5 e7e5 g5f6 g7f6 d1f3 e5b2 f3f6
26,886<--1:bestmove f4e5
26,886*1*Found move:f4xe5
27,044*2*Start calc, move no: 27
27,286-->2:time 783
27,286-->2:otim 655
27,286-->2:f4e5
27,296<--2:1 -41 0 69 d6e5 g5f6 g7f6
27,296<--2:2 -41 0 335 d6e5 g5f6 g7f6
27,299<--2:3 -41 0 2658 d6e5 g5f6 g7f6
27,338<--2:4 -44 4 11972 d6e5 g5f6 g7f6 c2c3
27,450<--2:5 -51 15 84621 d6e5 g5f6 g7f6 d1f3 c6b4 f3f6 e7f6 f1f6 b4c2
27,554<--2:move d6e5
27,554*2*Found move:d6xe5
27,708*1*Start calc, move no: 28
27,708-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5
27,708-->1:go wtime 6542 btime 7564 winc 100 binc 100
27,713<--1:info score cp 25 depth 1 nodes 1 time 0 pv g5f6
27,713<--1:info score cp 25 depth 2 nodes 2 time 0 pv g5f6 g7f6
27,713<--1:info score cp 25 depth 3 nodes 3 time 0 pv g5f6 g7f6 d1f3
27,713<--1:info score cp 25 depth 4 nodes 4 time 0 pv g5f6 g7f6 d1f3 c6d4
27,714<--1:info score cp 25 depth 5 nodes 5 time 0 pv g5f6 g7f6 d1f3 c6d4 f3f6
27,747<--1:info score cp 45 depth 6 nodes 47298 time 38 pv g5f6 g7f6 d1f3 c6d4 f3f6 e7f6
27,824<--1:info score cp 45 depth 7 nodes 137869 time 115 pv g5f6 g7f6 d1f3 c6d4 f3f6 e7f6 f1f6
27,909<--1:info score cp 45 depth 8 nodes 256848 time 199 pv g5f6 g7f6 d1f3 c6d4 f3f6 e7f6 f1f6 d4c2
27,980<--1:bestmove g5f6
27,980*1*Found move:Bg5xf6
28,158*2*Start calc, move no: 29
28,399-->2:time 757
28,399-->2:otim 628
28,399-->2:g5f6
28,401<--2:1 -41 0 38 g7f6
28,401<--2:2 -44 0 187 g7f6 c2c3
28,404<--2:3 -51 0 1388 g7f6 d1f3 c6b4 f3f6 e7f6 f1f6 b4c2
28,413<--2:4 -51 1 5481 g7f6 d1f3 c6b4 f3f6 e7f6 f1f6 b4c2
28,460<--2:5 -51 6 35772 g7f6 d1f3 c6b4 f3f6 e7f6 f1f6 b4c2
28,651<--2:move g7f6
28,651*2*Found move:g7xf6
28,804*1*Start calc, move no: 30
28,806-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6
28,806-->1:go wtime 6275 btime 7317 winc 100 binc 100
28,810<--1:info score cp 45 depth 1 nodes 1 time 0 pv d1f3
28,810<--1:info score cp 45 depth 2 nodes 2 time 0 pv d1f3 c6d4
28,810<--1:info score cp 45 depth 3 nodes 3 time 0 pv d1f3 c6d4 f3f6
28,810<--1:info score cp 45 depth 4 nodes 4 time 0 pv d1f3 c6d4 f3f6 e7f6
28,812<--1:info score cp 45 depth 5 nodes 5 time 0 pv d1f3 c6d4 f3f6 e7f6 f1f6
28,812<--1:info score cp 45 depth 6 nodes 6 time 0 pv d1f3 c6d4 f3f6 e7f6 f1f6 d4c6
28,948<--1:info score cp 45 depth 7 nodes 177367 time 141 pv d1f3 c6d4 f3f6 e7f6 f1f6 d4c6 c2c4
29,067<--1:bestmove d1f3
29,067*1*Found move:Qd1-f3
29,223*2*Start calc, move no: 31
29,464-->2:time 732
29,464-->2:otim 602
29,464-->2:d1f3
29,465<--2:1 -51 0 139 c6b4 f3f6 e7f6 f1f6 b4c2
29,467<--2:2 -51 0 340 c6b4 f3f6 e7f6 f1f6 b4c2
29,471<--2:3 -51 0 2165 c6b4 f3f6 e7f6 f1f6 b4c2
29,488<--2:4 -51 2 11210 c6b4 f3f6 e7f6 f1f6 b4c2
29,646<--2:5 -51 18 110655 c6d4 f3f6 e7f6 f1f6 d4c2
29,708<--2:move c6d4
29,708*2*Found move:Nc6-d4
29,860*1*Start calc, move no: 32
29,860-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4
29,860-->1:go wtime 6019 btime 7078 winc 100 binc 100
29,864<--1:info score cp 45 depth 1 nodes 1 time 0 pv f3f6
29,865<--1:info score cp 45 depth 2 nodes 2 time 0 pv f3f6 e7f6
29,865<--1:info score cp 45 depth 3 nodes 3 time 0 pv f3f6 e7f6 f1f6
29,865<--1:info score cp 45 depth 4 nodes 4 time 0 pv f3f6 e7f6 f1f6 g8g7
29,865<--1:info score cp 45 depth 5 nodes 5 time 0 pv f3f6 e7f6 f1f6 g8g7 f6f2
29,960<--1:info score cp 45 depth 6 nodes 131766 time 98 pv f3g3 g8f8 f1f2 a8b8 a1f1 f8e8
30,112<--1:bestmove f3g3
30,112*1*Found move:Qf3-g3
30,263*2*Start calc, move no: 33
30,504-->2:time 708
30,504-->2:otim 578
30,504-->2:f3g3
30,508<--2:1 -36 0 237 e7g7 g3f2
30,508<--2:2 -26 0 776 e7g7 g3f2 c8h3
30,518<--2:3 -27 1 5958 e7g7 g3g7 g8g7 c2c3 d4c6
30,560<--2:4 -32 5 28450 e7g7 g3g7 g8g7 c2c3 d4c2 a1b1
30,740<--2:move e7g7
30,740*2*Found move:Qe7-g7
30,895*1*Start calc, move no: 34
30,895-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7
30,896-->1:go wtime 5772 btime 6847 winc 100 binc 100
30,899<--1:info score cp 40 depth 1 nodes 1 time 0 pv g3g7
30,899<--1:info score cp 40 depth 2 nodes 2 time 0 pv g3g7 g8g7
30,899<--1:info score cp 40 depth 3 nodes 3 time 0 pv g3g7 g8g7 f1f2
30,899<--1:info score cp 40 depth 4 nodes 4 time 0 pv g3g7 g8g7 f1f2 c8g4
30,899<--1:info score cp 40 depth 5 nodes 5 time 0 pv g3g7 g8g7 f1f2 c8g4 a1f1
30,899<--1:info score cp 40 depth 6 nodes 6 time 0 pv g3g7 g8g7 f1f2 c8g4 a1f1 g7g8
30,962<--1:info score cp 45 depth 7 nodes 86949 time 67 pv g3g7 g8g7 c2c3 d4e2 g1h1 c8g4 f1f2
31,140<--1:bestmove g3g7
31,140*1*Found move:Qg3xg7
31,294*2*Start calc, move no: 35
31,535-->2:time 685
31,535-->2:otim 554
31,535-->2:g3g7
31,537<--2:1 -22 0 41 g8g7 c2c3
31,539<--2:2 -27 0 243 g8g7 c2c3 d4c6
31,540<--2:3 -32 0 1157 g8g7 c2c3 d4c2 a1b1
31,550<--2:4 -22 1 5917 g8g7 c2c3 d4c6 g1f2 c8e6
31,584<--2:5 -22 4 30874 g8g7 c2c3 d4e2 g1f2 e2f4 a1d1 c8e6
31,762<--2:6 -17 22 150656 g8g7 c2c3 d4e2 g1f2 e2f4 a1d1 c8e6 c3c4
31,766<--2:move g8g7
31,766*2*Found move:Kg8xg7
31,919*1*Start calc, move no: 36
31,919-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7
31,919-->1:go wtime 5533 btime 6621 winc 100 binc 100
31,923<--1:info score cp 40 depth 1 nodes 1 time 0 pv f1f2
31,923<--1:info score cp 40 depth 2 nodes 2 time 0 pv f1f2 c8g4
31,924<--1:info score cp 40 depth 3 nodes 3 time 0 pv f1f2 c8g4 c2c3
31,924<--1:info score cp 40 depth 4 nodes 4 time 0 pv f1f2 c8g4 c2c3 d4e2
31,924<--1:info score cp 40 depth 5 nodes 5 time 0 pv f1f2 c8g4 c2c3 d4e2 g1f1
31,924<--1:info score cp 40 depth 6 nodes 6 time 0 pv f1f2 c8g4 c2c3 d4e2 g1f1 e2f4
31,924<--1:info score cp 40 depth 7 nodes 7 time 0 pv f1f2 c8g4 c2c3 d4e2 g1f1 e2f4 d3d4
32,177<--1:bestmove f1f2
32,177*1*Found move:Rf1-f2
32,331*2*Start calc, move no: 37
32,572-->2:time 663
32,572-->2:otim 528
32,572-->2:f1f2
32,577<--2:1 6 0 35 c8e6
32,577<--2:2 -4 0 263 c8e6 g1f1
32,577<--2:3 -2 0 2361 c8e6 c2c3 d4c6
32,594<--2:4 -12 2 12931 c8e6 c2c3 d4c6 g1f1
32,682<--2:5 -12 10 74501 c8e6 c2c3 d4c6 a1f1 a8f8
32,795<--2:move c8e6
32,796*2*Found move:Bc8-e6
32,952*1*Start calc, move no: 38
32,953-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6
32,953-->1:go wtime 5280 btime 6403 winc 100 binc 100
32,957<--1:info score cp 40 depth 1 nodes 1 time 0 pv c2c3
32,957<--1:info score cp 40 depth 2 nodes 2 time 0 pv c2c3 d4c6
32,957<--1:info score cp 40 depth 3 nodes 3 time 0 pv c2c3 d4c6 a1f1
32,957<--1:info score cp 40 depth 4 nodes 4 time 0 pv c2c3 d4c6 a1f1 g7g8
32,957<--1:info score cp 40 depth 5 nodes 5 time 0 pv c2c3 d4c6 a1f1 g7g8
32,959<--1:info score cp 40 depth 6 nodes 6 time 0 pv c2c3 d4c6 a1f1 g7g8
33,182<--1:bestmove c2c3
33,182*1*Found move:c2-c3
33,334*2*Start calc, move no: 39
33,576-->2:time 641
33,576-->2:otim 606
33,576-->2:c2c3
33,579<--2:1 -2 0 167 d4c6
33,579<--2:2 -12 0 481 d4c6 a1f1
33,579<--2:3 -12 0 2156 d4c6 a1f1 a8f8
33,595<--2:4 -22 1 11406 d4c6 g1f1 g7f7 f1e2
33,683<--2:5 -12 10 66263 d4c6 g1f1 g7f7 f1e2 f7e7
33,790<--2:move d4c6
33,790*2*Found move:Nd4-c6
33,944*1*Start calc, move no: 40
33,944-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6
33,944-->1:go wtime 6056 btime 7194 winc 100 binc 100
33,949<--1:info score cp 35 depth 1 nodes 1 time 0 pv a1f1
33,949<--1:info score cp 35 depth 2 nodes 2 time 0 pv a1f1 e6a2
33,949<--1:info score cp 35 depth 3 nodes 3 time 0 pv a1f1 e6a2 f2f6
33,949<--1:info score cp 35 depth 4 nodes 4 time 0 pv a1f1 e6a2 f2f6 c6d4
33,950<--1:info score cp 35 depth 5 nodes 5 time 0 pv a1f1 e6a2 f2f6 c6d4 c3d4
34,044<--1:info score cp 25 depth 6 nodes 123710 time 100 pv b2b3 a8d8 a1f1 d8d3 f2f6 d3d6
34,184<--1:info score cp 30 depth 7 nodes 299984 time 239 pv a1f1 e6a2 f2f6 a8d8 f6f3 g7g8 c3c4
34,197<--1:bestmove a1f1
34,197*1*Found move:Ra1-f1
34,354*2*Start calc, move no: 41
34,595-->2:time 720
34,595-->2:otim 581
34,595-->2:a1f1
34,597<--2:1 -12 0 81 a8f8
34,599<--2:2 -7 0 255 a8f8 c3c4
34,599<--2:3 3 0 1603 a8f8 c3c4 g7g6
34,610<--2:4 1 1 7046 a8f8 a2a3 g7g6 b2b4
34,673<--2:5 4 7 50402 a8f8 a2a3 g7g6 b2b4 c5c4
34,836<--2:move a8f8
34,836*2*Found move:Ra8-f8
34,991*1*Start calc, move no: 42
34,991-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8
34,991-->1:go wtime 5808 btime 6958 winc 100 binc 100
34,997<--1:info score cp 30 depth 1 nodes 1 time 0 pv a2a3
34,997<--1:info score cp 30 depth 2 nodes 2 time 0 pv a2a3 f8d8
34,997<--1:info score cp 30 depth 3 nodes 3 time 0 pv a2a3 f8d8 f2f3
34,997<--1:info score cp 30 depth 4 nodes 4 time 0 pv a2a3 f8d8 f2f3 d8d3
34,997<--1:info score cp 30 depth 5 nodes 5 time 0 pv a2a3 f8d8 f2f3 d8d3 f3d3
35,076<--1:info score cp 35 depth 6 nodes 110506 time 84 pv b2b3 e6g4 a2a3 f8f7 c3c4 c6d4
35,235<--1:bestmove b2b3
35,235*1*Found move:b2-b3
35,387*2*Start calc, move no: 43
35,629-->2:time 696
35,629-->2:otim 557
35,629-->2:b2b3
35,631<--2:1 4 0 75 g7g6
35,636<--2:2 4 0 339 g7g6 f2f3
35,637<--2:3 12 0 2398 g7g6 h2h4 h7h5
35,659<--2:4 -1 3 14617 g7g6 f2f3 e6g4 f3f2
35,771<--2:5 9 14 99000 g7g6 f2f3 e6g4 f3f2 g6g5
35,860<--2:move g7g6
35,860*2*Found move:Kg7-g6
36,014*1*Start calc, move no: 44
36,014-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6
36,014-->1:go wtime 5569 btime 6732 winc 100 binc 100
36,020<--1:info score cp 25 depth 1 nodes 1 time 0 pv c3c4
36,020<--1:info score cp 25 depth 2 nodes 2 time 0 pv c3c4 e6c4
36,020<--1:info score cp 25 depth 3 nodes 3 time 0 pv c3c4 e6c4 b3c4
36,025<--1:info score cp 35 depth 4 nodes 8217 time 9 pv g2g3 g6g7 f2f6 f8f6
36,043<--1:info score cp 35 depth 5 nodes 28440 time 26 pv g2g3 g6g7 g1h1 e6g4 f2f6
36,202<--1:info score cp 45 depth 6 nodes 224407 time 186 pv f2f3 f6f5 f3g3 g6f6 c3c4 f8f7
36,253<--1:bestmove f2f3
36,253*1*Found move:Rf2-f3
36,405*2*Start calc, move no: 45
36,646-->2:time 674
36,646-->2:otim 534
36,646-->2:f2f3
36,649<--2:1 14 0 70 g6g5
36,650<--2:2 -1 0 442 e6g4 f3f2
36,654<--2:3 9 0 3318 e6g4 f3f2 g6g5
36,680<--2:4 -1 3 17233 e6g4 f3g3 g6g5 g1f2
36,851<--2:5 -1 20 130153 e6g4 f3g3 g6h5 g1f2 f8d8
36,871<--2:move e6g4
36,871*2*Found move:Be6-g4
37,025*1*Start calc, move no: 46
37,025-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4
37,025-->1:go wtime 5335 btime 6512 winc 100 binc 100
37,030<--1:info score cp 40 depth 1 nodes 1 time 0 pv f3g3
37,030<--1:info score cp 40 depth 2 nodes 2 time 0 pv f3g3 g6g7
37,030<--1:info score cp 40 depth 3 nodes 3 time 0 pv f3g3 g6g7 g3g4
37,030<--1:info score cp 40 depth 4 nodes 4 time 0 pv f3g3 g6g7 g3g4 g7f7
37,030<--1:info score cp 40 depth 5 nodes 5 time 0 pv f3g3 g6g7 g3g4 g7f7 c3c4
37,068<--1:info score cp 70 depth 6 nodes 48916 time 42 pv f3g3 g6h5 f1f2 f8f7 c3c4 f6f5
37,099<--1:info score cp 90 depth 7 nodes 83896 time 73 pv f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g3g7
37,208<--1:info score cp 90 depth 8 nodes 209625 time 181 pv f3g3 g6h5 h2h3 g4c8 g3g7 h5h6 g7c7 h6g6
37,256<--1:bestmove f3g3
37,256*1*Found move:Rf3-g3
37,418*2*Start calc, move no: 47
37,659-->2:time 652
37,659-->2:otim 511
37,659-->2:f3g3
37,661<--2:1 19 0 59 g6g5
37,663<--2:2 -1 0 310 g6g5 g1f2
37,665<--2:3 -1 0 1706 g6h5 g1f2 f8d8
37,675<--2:4 -20 1 6794 g6h5 g1f2 f6f5 f2e3
37,735<--2:5 -11 7 40693 g6h5 g1f2 f8d8 f2e3 h5g5
37,882<--2:move g6h5
37,882*2*Found move:Kg6-h5
38,033*1*Start calc, move no: 48
38,033-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5
38,033-->1:go wtime 5109 btime 6294 winc 100 binc 100
38,040<--1:info score cp 90 depth 1 nodes 1 time 0 pv h2h3
38,040<--1:info score cp 90 depth 2 nodes 2 time 0 pv h2h3 g4c8
38,040<--1:info score cp 90 depth 3 nodes 3 time 0 pv h2h3 g4c8 g3g7
38,040<--1:info score cp 90 depth 4 nodes 4 time 0 pv h2h3 g4c8 g3g7 h5h6
38,041<--1:info score cp 90 depth 5 nodes 5 time 0 pv h2h3 g4c8 g3g7 h5h6 g7c7
38,041<--1:info score cp 90 depth 6 nodes 6 time 0 pv h2h3 g4c8 g3g7 h5h6 g7c7 h6g6
38,118<--1:info score cp 100 depth 7 nodes 77833 time 84 pv h2h3 g4c8 g3g7 h5h6 g7c7 h6g6 c3c4
38,257<--1:bestmove h2h3
38,257*1*Found move:h2-h3
38,413*2*Start calc, move no: 49
38,656-->2:time 630
38,656-->2:otim 489
38,656-->2:h2h3
38,664<--2:1 21 0 73 g4e6
38,664<--2:2 16 0 295 g4e2 f1f2
38,664<--2:3 -4 0 1976 g4e2 f1f5 h5h4 g3g7
38,681<--2:4 -9 2 10274 g4e2 f1f5 h5h4 g3g7 e2d3 g7h7
38,815<--2:5 -19 15 61408 g4e2 f1e1 h5h4 g3g7 e2d3 g7b7
38,871<--2:move g4e2
38,871*2*Found move:Bg4-e2
39,024*1*Start calc, move no: 50
39,024-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2
39,024-->1:go wtime 4890 btime 6084 winc 100 binc 100
39,029<--1:info score cp 90 depth 1 nodes 1 time 0 pv f1e1
39,029<--1:info score cp 90 depth 2 nodes 2 time 0 pv f1e1 h5h4
39,029<--1:info score cp 90 depth 3 nodes 3 time 0 pv f1e1 h5h4 g3g7
39,029<--1:info score cp 90 depth 4 nodes 4 time 0 pv f1e1 h5h4 g3g7 e2d3
39,029<--1:info score cp 90 depth 5 nodes 5 time 0 pv f1e1 h5h4 g3g7 e2d3 g7b7
39,029<--1:info score cp 90 depth 6 nodes 6 time 0 pv f1e1 h5h4 g3g7 e2d3 g7b7 d3e4
39,094<--1:info score cp 190 depth 7 nodes 80972 time 68 pv f1e1 h5h4 g3g7 e2d3 g7h7 h4g5 h7b7
39,202<--1:info score cp 190 depth 8 nodes 212814 time 176 pv f1e1 h5h4 g1h2 e2h5 g3g4 h5g4 h2h1 g4h3
39,241<--1:bestmove f1e1
39,241*1*Found move:Rf1-e1
39,394*2*Start calc, move no: 51
39,635-->2:time 609
39,635-->2:otim 468
39,635-->2:f1e1
39,638<--2:1 26 0 74 h5h4
39,638<--2:2 6 0 185 h5h4 g3g7
39,639<--2:3 -19 0 1122 h5h4 g3g7 e2d3 g7b7
39,641<--2:4 -24 0 3823 h5h4 g1f2 e2h5 g3g7
39,663<--2:5 -129 2 22644 h5h4 g3g7 e2d3 g7h7 h4g5 h7b7
39,755<--2:6 -114 12 86262 h5h4 g3g7 e2d3 g7h7 h4g5 h7b7 f8d8
39,839<--2:move h5h4
39,839*2*Found move:Kh5-h4
40,014*1*Start calc, move no: 52
40,014-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4
40,014-->1:go wtime 4678 btime 5885 winc 100 binc 100
40,020<--1:info score cp 190 depth 1 nodes 1 time 0 pv g1h2
40,020<--1:info score cp 190 depth 2 nodes 2 time 0 pv g1h2 e2h5
40,020<--1:info score cp 190 depth 3 nodes 3 time 0 pv g1h2 e2h5 g3g4
40,020<--1:info score cp 190 depth 4 nodes 4 time 0 pv g1h2 e2h5 g3g4 h5g4
40,020<--1:info score cp 190 depth 5 nodes 5 time 0 pv g1h2 e2h5 g3g4 h5g4 h2h1
40,020<--1:info score cp 190 depth 6 nodes 6 time 0 pv g1h2 e2h5 g3g4 h5g4 h2h1 g4h3
40,027<--1:info score cp 190 depth 7 nodes 7261 time 12 pv g1h2 e2h5 g3g4 h5g4 h2h1 g4h3 g2h3
40,225<--1:bestmove g1h2
40,225*1*Found move:Kg1-h2
40,378*2*Start calc, move no: 53
40,619-->2:time 589
40,619-->2:otim 448
40,619-->2:g1h2
40,623<--2:1 16 0 76 e2h5
40,623<--2:2 -4 0 184 e2h5 g3g7
40,623<--2:3 -4 0 1058 e2h5 g3g7 f8f7
40,629<--2:4 -14 1 4441 e2h5 g3g7 f8f7 g2g3
40,668<--2:5 -125 4 30601 e2h5 g3g7 h5f7 g7h7 h4g5 h3h4
40,816<--2:move e2h5
40,816*2*Found move:Be2-h5
40,967*1*Start calc, move no: 54
40,967-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5
40,967-->1:go wtime 4472 btime 5693 winc 100 binc 100
40,973<--1:info score cp 180 depth 1 nodes 1 time 0 pv g3g7
40,973<--1:info score cp 180 depth 2 nodes 2 time 0 pv g3g7 h5g6
40,973<--1:info score cp 180 depth 3 nodes 3 time 0 pv g3g7 h5g6 g7b7
40,974<--1:info score cp 180 depth 4 nodes 4 time 0 pv g3g7 h5g6 g7b7 f8d8
40,974<--1:info score cp 180 depth 5 nodes 5 time 0 pv g3g7 h5g6 g7b7 f8d8 b7c7
40,974<--1:info score cp 180 depth 6 nodes 6 time 0 pv g3g7 h5g6 g7b7 f8d8 b7c7 d8d6
41,029<--1:info score cp 210 depth 7 nodes 67131 time 61 pv g3g7 h5g6 g7b7 f8d8 b7c7 c6b8 h2g1
41,120<--1:info score cp 210 depth 8 nodes 187138 time 151 pv g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5
41,170<--1:bestmove g3g7
41,170*1*Found move:Rg3-g7
41,330*2*Start calc, move no: 55
41,571-->2:time 570
41,571-->2:otim 428
41,571-->2:g3g7
41,577<--2:1 -4 0 79 f8f7
41,577<--2:2 -14 0 193 f8f7 g2g3
41,577<--2:3 -125 0 2363 h5f7 g7h7 h4g5 h3h4
41,586<--2:4 -128 1 7629 h5f7 g7h7 h4g5 h2g3 b7b5
41,690<--2:5 -124 11 75042 h5g6 g7b7 f8d8 g2g3 h4g5 b7c7
41,760<--2:move h5g6
41,760*2*Found move:Bh5-g6
41,925*1*Start calc, move no: 56
41,925-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6
41,925-->1:go wtime 4274 btime 5509 winc 100 binc 100
41,929<--1:info score cp 210 depth 1 nodes 1 time 0 pv g7b7
41,929<--1:info score cp 210 depth 2 nodes 2 time 0 pv g7b7 f8d8
41,929<--1:info score cp 210 depth 3 nodes 3 time 0 pv g7b7 f8d8 b7c7
41,929<--1:info score cp 210 depth 4 nodes 4 time 0 pv g7b7 f8d8 b7c7 d8d6
41,931<--1:info score cp 210 depth 5 nodes 5 time 0 pv g7b7 f8d8 b7c7 d8d6 h2g1
41,931<--1:info score cp 210 depth 6 nodes 6 time 0 pv g7b7 f8d8 b7c7 d8d6 h2g1 f6f5
42,036<--1:info score cp 220 depth 7 nodes 131942 time 110 pv g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4
42,121<--1:bestmove g7b7
42,121*1*Found move:Rg7xb7
42,273*2*Start calc, move no: 57
42,514-->2:time 551
42,514-->2:otim 409
42,514-->2:g7b7
42,517<--2:1 -124 0 46 f8g8
42,518<--2:2 -133 0 388 f6f5 a2a4
42,531<--2:3 -124 1 4830 f8d8 g2g3 h4g5 b7c7
42,552<--2:4 -134 3 14229 f8d8 b7c7 d8d6 a2a4
42,626<--2:5 -134 11 67514 f8d8 b7c7 d8d6 g2g3 h4g5 a2a4
42,698<--2:move f8d8
42,698*2*Found move:Rf8-d8
42,858*1*Start calc, move no: 58
42,859-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8
42,859-->1:go wtime 4083 btime 5330 winc 100 binc 100
42,863<--1:info score cp 210 depth 1 nodes 1 time 0 pv b7c7
42,864<--1:info score cp 210 depth 2 nodes 2 time 0 pv b7c7 d8d6
42,864<--1:info score cp 210 depth 3 nodes 3 time 0 pv b7c7 d8d6 h2g1
42,864<--1:info score cp 210 depth 4 nodes 4 time 0 pv b7c7 d8d6 h2g1 h4h5
42,864<--1:info score cp 210 depth 5 nodes 5 time 0 pv b7c7 d8d6 h2g1 h4h5 c3c4
42,864<--1:info score cp 210 depth 6 nodes 6 time 0 pv b7c7 d8d6 h2g1 h4h5 c3c4 h5h6
42,980<--1:info score cp 210 depth 7 nodes 151966 time 120 pv b7c7 d8d6 h2g1 h4h5 c3c4 h5h6 e1f1
43,049<--1:bestmove b7c7
43,049*1*Found move:Rb7-c7
43,203*2*Start calc, move no: 59
43,444-->2:time 533
43,444-->2:otim 490
43,444-->2:b7c7
43,450<--2:1 -124 0 100 d8d6
43,450<--2:2 -134 0 330 d8d6 a2a4
43,450<--2:3 -134 0 1844 d8d6 g2g3 h4g5 a2a4
43,459<--2:4 -134 1 8105 d8d6 a2a4 h4g5 g2g3
43,523<--2:5 -141 7 52475 d8d6 g2g3 h4g5 a2a4 f6f5 e4f5 g5f5
43,623<--2:move d8d6
43,623*2*Found move:Rd8-d6
43,775*1*Start calc, move no: 60
43,775-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6
43,775-->1:go wtime 4898 btime 6156 winc 100 binc 100
43,780<--1:info score cp 210 depth 1 nodes 1 time 0 pv h2g1
43,780<--1:info score cp 210 depth 2 nodes 2 time 0 pv h2g1 d6d3
43,780<--1:info score cp 210 depth 3 nodes 3 time 0 pv h2g1 d6d3 c7c6
43,780<--1:info score cp 210 depth 4 nodes 4 time 0 pv h2g1 d6d3 c7c6 h4h5
43,781<--1:info score cp 210 depth 5 nodes 5 time 0 pv h2g1 d6d3 c7c6 h4h5 c6c5
43,848<--1:info score cp 210 depth 6 nodes 86220 time 71 pv h2g1 d6d3 c7c6 h4h5 c6c5 g6e4
43,993<--1:bestmove h2g1
43,994*1*Found move:Kh2-g1
44,153*2*Start calc, move no: 61
44,393-->2:time 616
44,393-->2:otim 469
44,393-->2:h2g1
44,401<--2:1 -114 0 84 h4g5
44,401<--2:2 -134 0 559 h4g5 g1f2
44,401<--2:3 -124 0 2878 h4g5 g1f2 g5f4
44,415<--2:4 -134 1 12692 h4g5 g1f2 g5f4 a2a4
44,521<--2:5 -124 12 89721 f6f5 g1f2 f5e4 d3e4 d6d2
44,600<--2:move f6f5
44,600*2*Found move:f6-f5
44,754*1*Start calc, move no: 62
44,755-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5
44,755-->1:go wtime 4685 btime 5954 winc 100 binc 100
44,760<--1:info score cp 220 depth 1 nodes 1 time 0 pv e1f1
44,760<--1:info score cp 220 depth 2 nodes 2 time 0 pv e1f1 f5e4
44,760<--1:info score cp 220 depth 3 nodes 3 time 0 pv e1f1 f5e4 a2a3
44,761<--1:info score cp 220 depth 4 nodes 4 time 0 pv e1f1 f5e4 a2a3 e4d3
44,761<--1:info score cp 220 depth 5 nodes 5 time 0 pv e1f1 f5e4 a2a3 e4d3 c7c6
44,905<--1:info score cp 205 depth 6 nodes 199983 time 149 pv c3c4 f5e4 c7b7 e4d3 e1e5 c6e5
44,965<--1:bestmove c3c4
44,965*1*Found move:c3-c4
45,120*2*Start calc, move no: 63
45,361-->2:time 596
45,361-->2:otim 448
45,361-->2:c3c4
45,363<--2:1 -113 0 218 f5f4
45,365<--2:2 -118 0 737 h4g5 g1f2
45,367<--2:3 -117 0 2549 f5e4 d3e4 h4g5
45,387<--2:4 -131 2 13395 h4g5 g1f2 g5f4 e4f5 g6f5
45,439<--2:5 -117 7 50824 h4g5 g1f2 f5e4 d3e4 d6d2
45,558<--2:move h4g5
45,560*2*Found move:Kh4-g5
45,711*1*Start calc, move no: 64
45,711-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5
45,711-->1:go wtime 4480 btime 5762 winc 100 binc 100
45,717<--1:info score cp 210 depth 1 nodes 1 time 0 pv e4f5
45,717<--1:info score cp 210 depth 2 nodes 2 time 0 pv e4f5 g6f5
45,717<--1:info score cp 210 depth 3 nodes 3 time 0 pv e4f5 g6f5 c7g7
45,729<--1:info score cp 205 depth 4 nodes 15652 time 15 pv e1f1 f5f4 f1f3 g5f6
45,770<--1:info score cp 195 depth 5 nodes 71048 time 56 pv e1a1 g5h6 a1e1 h6g5 e1a1
45,915<--1:bestmove e1a1
45,915*1*Found move:Re1-a1
46,068*2*Start calc, move no: 65
46,310-->2:time 577
46,310-->2:otim 429
46,310-->2:e1a1
46,312<--2:1 -34 0 49 f5e4
46,314<--2:2 41 0 447 f5e4 d3e4 g6e4
46,315<--2:3 41 0 1737 f5e4 d3e4 g6e4
46,327<--2:4 22 1 8102 f5e4 d3e4 g5f4 b3b4 c6b4
46,369<--2:5 41 5 38888 f5e4 d3e4 g6e4 c7g7 g5f6 g7c7
46,502<--2:move f5e4
46,502*2*Found move:f5xe4
46,660*1*Start calc, move no: 66
46,660-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4
46,660-->1:go wtime 4281 btime 5575 winc 100 binc 100
46,663<--1:info score cp 75 depth 1 nodes 1 time 0 pv d3e4
46,667<--1:info score cp 75 depth 2 nodes 2 time 0 pv d3e4 g6e4
46,667<--1:info score cp 75 depth 3 nodes 3 time 0 pv d3e4 g6e4 a1e1
46,667<--1:info score cp 75 depth 4 nodes 4 time 0 pv d3e4 g6e4 a1e1 g5f4
46,680<--1:info score cp 85 depth 5 nodes 16624 time 18 pv d3e4 g6e4 a1e1 g5f4 c7f7
46,726<--1:info score cp 70 depth 6 nodes 70746 time 64 pv d3e4 g6e4 a1e1 e4f5 c7f7 g5g6
46,834<--1:info score cp 75 depth 7 nodes 205237 time 172 pv d3e4 g6e4 a1e1 e4f5 g2g4 f5d7 e1f1
46,856<--1:bestmove d3e4
46,856*1*Found move:d3xe4
47,014*2*Start calc, move no: 67
47,255-->2:time 558
47,255-->2:otim 409
47,255-->2:d3e4
47,257<--2:1 41 0 36 g6e4
47,259<--2:2 22 0 453 g5f4 b3b4 c6b4
47,262<--2:3 41 0 2367 g6e4 g1f2 d6d2
47,284<--2:4 18 2 12939 g5f4 g1f2 a7a5 a1f1 g6e4
47,381<--2:5 23 12 78100 g6e4 g1f2 h7h5 c7g7 g5f6 g7c7
47,441<--2:move g6e4
47,441*2*Found move:Bg6xe4
47,599*1*Start calc, move no: 68
47,602-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4
47,602-->1:go wtime 4090 btime 5394 winc 100 binc 100
47,606<--1:info score cp 75 depth 1 nodes 1 time 0 pv a1e1
47,606<--1:info score cp 75 depth 2 nodes 2 time 0 pv a1e1 e4f5
47,606<--1:info score cp 75 depth 3 nodes 3 time 0 pv a1e1 e4f5 c7h7
47,606<--1:info score cp 75 depth 4 nodes 4 time 0 pv a1e1 e4f5 c7h7 f5h7
47,606<--1:info score cp 75 depth 5 nodes 5 time 0 pv a1e1 e4f5 c7h7 f5h7 e1f1
47,642<--1:info score cp 75 depth 6 nodes 23264 time 40 pv a1e1 e4f5 c7h7 f5h7 e1f1 h7f5
47,790<--1:bestmove a1e1
47,790*1*Found move:Ra1-e1
47,951*2*Start calc, move no: 69
48,193-->2:time 540
48,193-->2:otim 391
48,193-->2:a1e1
48,194<--2:1 41 0 122 g5f4
48,195<--2:2 21 0 364 g5f4 g1f2
48,201<--2:3 25 0 3354 e4g6 g1f2 e5e4
48,216<--2:4 5 2 13190 e4g6 g1f2 e5e4 f2e3
48,338<--2:5 5 14 99698 e4f5 c7b7 d6d2 b7b5 d2a2 b5c5
48,373<--2:move e4f5
48,373*2*Found move:Be4-f5
48,536*1*Start calc, move no: 70
48,537-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5
48,537-->1:go wtime 3907 btime 5219 winc 100 binc 100
48,539<--1:info score cp 75 depth 1 nodes 1 time 0 pv c7h7
48,539<--1:info score cp 75 depth 2 nodes 2 time 0 pv c7h7 f5h7
48,539<--1:info score cp 75 depth 3 nodes 3 time 0 pv c7h7 f5h7 e1f1
48,539<--1:info score cp 75 depth 4 nodes 4 time 0 pv c7h7 f5h7 e1f1 h7f5
48,541<--1:info score cp 75 depth 5 nodes 5 time 0 pv c7h7 f5h7 e1f1 h7f5 f1f5
48,680<--1:info score cp 75 depth 6 nodes 186594 time 142 pv c7h7 f5h7 e1f1 h7f5 f1f5 g5f5
48,720<--1:bestmove c7h7
48,720*1*Found move:Rc7xh7
48,875*2*Start calc, move no: 71
49,116-->2:time 522
49,116-->2:otim 373
49,116-->2:c7h7
49,118<--2:1 391 0 37 f5h7
49,122<--2:2 347 0 187 f5h7 g2g4
49,126<--2:3 371 0 1380 f5h7 g2g4 e5e4
49,159<--2:4 358 4 6420 f5h7 g2g4 d6d2 a2a3
49,209<--2:5 380 9 40153 f5h7 g1f2 d6d2 e1e2 d2e2 f2e2 e5e4
49,291<--2:move f5h7
49,291*2*Found move:Bf5xh7
49,446*1*Start calc, move no: 72
49,447-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7
49,447-->1:go wtime 3729 btime 5049 winc 100 binc 100
49,450<--1:info score cp 75 depth 1 nodes 1 time 0 pv e1d1
49,450<--1:info score cp 75 depth 2 nodes 2 time 0 pv e1d1 d6d1
49,450<--1:info score cp 75 depth 3 nodes 3 time 0 pv e1d1 d6d1 g1f2
49,450<--1:info score cp 75 depth 4 nodes 4 time 0 pv e1d1 d6d1 g1f2
49,450<--1:info score cp 75 depth 5 nodes 5 time 0 pv e1d1 d6d1 g1f2
49,579<--1:info score cp -475 depth 6 nodes 172220 time 131 pv e1c1 d6d2 a2a3 h7d3 g2g4 d3e4
49,624<--1:bestmove e1c1
49,624*1*Found move:Re1-c1
49,779*2*Start calc, move no: 73
50,020-->2:time 505
50,020-->2:otim 356
50,020-->2:e1c1
50,027<--2:1 425 0 35 e5e4
50,027<--2:2 412 0 384 d6d2 a2a3
50,027<--2:3 436 0 1950 d6d2 a2a3 e5e4
50,053<--2:4 406 3 21130 d6d2 c1a1 c6b4 a1e1
50,188<--2:move d6d2
50,188*2*Found move:Rd6-d2
50,349*1*Start calc, move no: 74
50,349-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2
50,349-->1:go wtime 3557 btime 4886 winc 100 binc 100
50,353<--1:info score cp -475 depth 1 nodes 1 time 0 pv c1e1
50,354<--1:info score cp -475 depth 2 nodes 2 time 0 pv c1e1 d2a2
50,354<--1:info score cp -475 depth 3 nodes 3 time 0 pv c1e1 d2a2 e1e5
50,354<--1:info score cp -475 depth 4 nodes 4 time 0 pv c1e1 d2a2 e1e5 c6e5
50,354<--1:info score cp -475 depth 5 nodes 5 time 0 pv c1e1 d2a2 e1e5 c6e5 g2g4
50,405<--1:info score cp -565 depth 6 nodes 69120 time 55 pv c1f1 d2a2 g2g4 c6a5 f1f7 a5c4
50,478<--1:info score cp -580 depth 7 nodes 155867 time 128 pv c1f1 d2a2 g2g3 h7e4 h3h4 g5g4 f1f2
50,519<--1:bestmove c1f1
50,519*1*Found move:Rc1-f1
50,672*2*Start calc, move no: 75
50,913-->2:time 489
50,913-->2:otim 340
50,913-->2:c1f1
50,918<--2:1 491 0 35 d2a2
50,919<--2:2 447 0 366 d2a2 g2g4
50,919<--2:3 471 0 1966 d2a2 g2g4 e5e4
50,931<--2:4 457 1 9467 d2a2 g2g4 h7g6 f1f2
50,984<--2:5 468 7 52757 d2a2 g2g3 h7e4 h3h4 g5g4 f1f2
51,075<--2:move d2a2
51,075*2*Found move:Rd2xa2
51,230*1*Start calc, move no: 76
51,232-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2
51,232-->1:go wtime 3392 btime 4729 winc 100 binc 100
51,237<--1:info score cp -580 depth 1 nodes 1 time 0 pv g2g3
51,237<--1:info score cp -580 depth 2 nodes 2 time 0 pv g2g3 h7c2
51,237<--1:info score cp -580 depth 3 nodes 3 time 0 pv g2g3 h7c2 f1f3
51,237<--1:info score cp -580 depth 4 nodes 4 time 0 pv g2g3 h7c2 f1f3 a2a3
51,237<--1:info score cp -580 depth 5 nodes 5 time 0 pv g2g3 h7c2 f1f3 a2a3 f3f7
51,308<--1:info score cp -600 depth 6 nodes 90996 time 76 pv f1f8 c6d4 g2g4 h7g6 f8b8 g6e4
51,396<--1:bestmove f1f8
51,396*1*Found move:Rf1-f8
51,554*2*Start calc, move no: 77
51,794-->2:time 473
51,794-->2:otim 324
51,794-->2:f1f8
51,797<--2:1 515 0 35 e5e4
51,800<--2:2 501 0 338 h7c2 f8f3
51,802<--2:3 506 0 2529 h7c2 f8g8 g5h4 g8c8
51,828<--2:4 515 3 18591 a2b2 f8h8 h7e4 h3h4
51,954<--2:move a2b2
51,954*2*Found move:Ra2-b2
52,108*1*Start calc, move no: 78
52,109-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2 f1f8 a2b2
52,109-->1:go wtime 3233 btime 4574 winc 100 binc 100
52,113<--1:info score cp -625 depth 1 nodes 1 time 0 pv f8f7
52,114<--1:info score cp -625 depth 2 nodes 2 time 0 pv f8f7 b2g2
52,114<--1:info score cp -625 depth 3 nodes 3 time 0 pv f8f7 b2g2 g1g2
52,114<--1:info score cp -625 depth 4 nodes 4 time 1 pv f8f7 b2g2 g1g2 g5h4
52,115<--1:info score cp -625 depth 5 nodes 5 time 1 pv f8f7 b2g2 g1g2 g5h4 f7h7
52,235<--1:info score cp -650 depth 6 nodes 150370 time 126 pv g1h1 h7e4 f8g8 g5f6 g8g3 b2b1
52,268<--1:bestmove g1h1
52,268*1*Found move:Kg1-h1
52,423*2*Start calc, move no: 79
52,665-->2:time 458
52,665-->2:otim 408
52,665-->2:g1h1
52,666<--2:1 630 0 30 b2b3
52,669<--2:2 620 0 350 b2b1 h1h2 b1b3
52,674<--2:3 630 0 2465 b2b3 f8f7 h7e4
52,711<--2:4 640 4 12306 b2b3 f8f7 h7d3 f7g7
52,817<--2:move b2b3
52,817*2*Found move:Rb2xb3
52,976*1*Start calc, move no: 80
52,976-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2 f1f8 a2b2 g1h1 b2b3
52,976-->1:go wtime 4079 btime 5427 winc 100 binc 100
52,979<--1:info score cp -270 depth 1 nodes 1 time 0 pv f8h8
52,979<--1:info score cp -270 depth 2 nodes 2 time 0 pv f8h8 b3b1
52,979<--1:info score cp -270 depth 3 nodes 3 time 0 pv f8h8 b3b1 h1h2
52,979<--1:info score cp -270 depth 4 nodes 4 time 0 pv f8h8 b3b1 h1h2 h7e4
52,994<--1:info score cp -710 depth 5 nodes 22552 time 17 pv f8c8 b3b6 h1g1 c6d8 c8d8
53,072<--1:info score cp -730 depth 6 nodes 114541 time 94 pv f8c8 h7e4 c8h8 b3b1 h1h2 g5f6
53,149<--1:info score cp -730 depth 7 nodes 199209 time 172 pv f8h8 b3b1 h1h2 h7d3 h8g8 g5f5 g8c8
53,164<--1:bestmove f8h8
53,164*1*Found move:Rf8-h8
53,322*2*Start calc, move no: 81
53,563-->2:time 543
53,563-->2:otim 390
53,563-->2:f8h8
53,565<--2:1 665 0 47 h7e4
53,567<--2:2 655 0 262 b3b1 h1h2 h7e4
53,569<--2:3 645 0 2342 g5h6 h8c8 h7e4
53,588<--2:4 654 2 15033 h7e4 h1h2 b3b2 h3h4
53,677<--2:5 664 11 83974 h7e4 h1h2 b3b2 h8g8 g5f5 h3h4
53,746<--2:move h7e4
53,746*2*Found move:Bh7-e4
53,900*1*Start calc, move no: 82
53,900-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2 f1f8 a2b2 g1h1 b2b3 f8h8 h7e4
53,900-->1:go wtime 3896 btime 5249 winc 100 binc 100
53,903<--1:info score cp -730 depth 1 nodes 1 time 0 pv h3h4
53,904<--1:info score cp -730 depth 2 nodes 2 time 0 pv h3h4 g5f4
53,904<--1:info score cp -730 depth 3 nodes 3 time 0 pv h3h4 g5f4 h8e8
53,904<--1:info score cp -730 depth 4 nodes 4 time 0 pv h3h4 g5f4 h8e8 b3b2
53,904<--1:info score cp -730 depth 5 nodes 5 time 0 pv h3h4 g5f4 h8e8 b3b2
53,963<--1:info score cp -730 depth 6 nodes 77583 time 63 pv h3h4 g5f4 h8f8 f4g3 f8g8 g3h4
54,082<--1:bestmove h3h4
54,082*1*Found move:h3-h4
54,252*2*Start calc, move no: 83
54,494-->2:time 525
54,494-->2:otim 372
54,494-->2:h3h4
54,495<--2:1 633 0 62 g5f5 h4h5
54,496<--2:2 675 0 555 g5f4 h4h5 a7a5
54,505<--2:3 765 1 4087 g5g4 h1h2 b3b2 h4h5 b2g2
54,527<--2:4 765 3 16477 g5g4 h1h2 b3b2 h4h5 b2g2
54,663<--2:5 778 16 122550 g5g4 h1g1 a7a5 g1f2 b3b2 f2e3 e4g2
54,669<--2:move g5g4
54,669*2*Found move:Kg5-g4
54,822*1*Start calc, move no: 84
54,822-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2 f1f8 a2b2 g1h1 b2b3 f8h8 h7e4 h3h4 g5g4
54,822-->1:go wtime 3719 btime 5079 winc 100 binc 100
54,827<--1:info score cp -805 depth 1 nodes 1 time 0 pv h4h5
54,827<--1:info score cp -805 depth 2 nodes 2 time 0 pv h4h5 b3b1
54,827<--1:info score cp -805 depth 3 nodes 3 time 0 pv h4h5 b3b1 h1h2
54,827<--1:info score cp -805 depth 4 nodes 4 time 0 pv h4h5 b3b1 h1h2 b1b2
54,827<--1:info score cp -805 depth 5 nodes 5 time 0 pv h4h5 b3b1 h1h2 b1b2 h5h6
54,827<--1:info score cp -805 depth 6 nodes 6 time 0 pv h4h5 b3b1 h1h2 b1b2 h5h6 b2g2
54,913<--1:info score cp -825 depth 7 nodes 123434 time 89 pv h1g1 b3b1 g1h2 c6a5 h8b8 b1b8 h2g1
54,997<--1:bestmove h1g1
54,997*1*Found move:Kh1-g1
55,167*2*Start calc, move no: 85
55,408-->2:time 508
55,408-->2:otim 355
55,408-->2:h1g1
55,408<--2:1 676 0 41 a7a5
55,410<--2:2 765 0 509 b3g3 h4h5 g3g2
55,413<--2:3 765 0 2442 b3g3 h4h5 g3g2
55,430<--2:4 778 2 12268 a7a5 g1f2 b3b2 f2e3 e4g2
55,505<--2:5 794 9 72988 b3b2 h8g8 g4h4 g8h8 h4g5 h8g8 g5f5 g2g4
55,577<--2:move b3b2
55,577*2*Found move:Rb3-b2
55,738*1*Start calc, move no: 86
55,738-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2 f1f8 a2b2 g1h1 b2b3 f8h8 h7e4 h3h4 g5g4 h1g1 b3b2
55,738-->1:go wtime 3549 btime 4915 winc 100 binc 100
55,741<--1:info score cp -735 depth 1 nodes 1 time 1 pv h8g8
55,741<--1:info score cp -735 depth 2 nodes 2 time 1 pv h8g8 g4h4
55,741<--1:info score cp -735 depth 3 nodes 3 time 1 pv h8g8 g4h4 g8h8
55,741<--1:info score cp -830 depth 4 nodes 2443 time 2 pv g2g3 b2a2 h8g8 g4h5
55,754<--1:info score cp -815 depth 5 nodes 12666 time 15 pv h8g8 g4h4 g2g3 h4h5 g3g4
55,791<--1:info score cp -835 depth 6 nodes 55448 time 52 pv g1f1 e4g2 f1g1 g2h3 h4h5 b2b1
55,855<--1:info score cp -855 depth 7 nodes 135330 time 118 pv g1f1 e4g2 f1g1 g2e4 h8e8 b2b1 g1f2
55,910<--1:bestmove g1f1
55,910*1*Found move:Kg1-f1
56,063*2*Start calc, move no: 87
56,305-->2:time 492
56,305-->2:otim 339
56,305-->2:g1f1
56,310<--2:1 776 0 34 b2g2
56,310<--2:2 798 0 312 e4g2 f1e1 a7a5
56,310<--2:3 797 0 3163 e4g2 f1g1 a7a5 h4h5
56,333<--2:4 807 2 22539 e4g2 f1g1 g2e4 h4h5 a7a5
56,472<--2:move e4d3
56,472*2*Found move:Be4-d3
56,622*1*Start calc, move no: 88
56,623-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2 f1f8 a2b2 g1h1 b2b3 f8h8 h7e4 h3h4 g5g4 h1g1 b3b2 g1f1 e4d3
56,623-->1:go wtime 3382 btime 4753 winc 100 binc 100
56,627<--1:info score cp -855 depth 1 nodes 1 time 0 pv f1g1
56,627<--1:info score cp -855 depth 2 nodes 2 time 0 pv f1g1 d3c4
56,627<--1:info score cp -855 depth 3 nodes 3 time 0 pv f1g1 d3c4
56,627<--1:info score cp -855 depth 4 nodes 4 time 0 pv f1g1 d3c4
56,627<--1:info score cp -855 depth 5 nodes 5 time 0 pv f1g1 d3c4
56,671<--1:info score cp -920 depth 6 nodes 58004 time 48 pv f1g1 d3c4 h8h7 c4d5 h7d7 d5e4
56,788<--1:bestmove f1g1
56,788*1*Found move:Kf1-g1
56,949*2*Start calc, move no: 89
57,189-->2:time 476
57,189-->2:otim 323
57,189-->2:f1g1
57,197<--2:1 795 0 35 d3c4
57,197<--2:2 774 0 447 d3c4 h4h5
57,197<--2:3 790 0 2444 d3c4 h8c8 c4d5
57,206<--2:4 890 1 11202 d3c4 h4h5 c4d5 h5h6 b2g2
57,275<--2:5 890 8 70671 d3c4 h4h5 c4d5 h5h6 b2g2
57,350<--2:move d3c4
57,350*2*Found move:Bd3xc4
57,512*1*Start calc, move no: 90
57,514-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2 f1f8 a2b2 g1h1 b2b3 f8h8 h7e4 h3h4 g5g4 h1g1 b3b2 g1f1 e4d3 f1g1 d3c4
57,514-->1:go wtime 3222 btime 4597 winc 100 binc 100
57,516<--1:info score cp -920 depth 1 nodes 1 time 0 pv h8h7
57,516<--1:info score cp -920 depth 2 nodes 2 time 0 pv h8h7 c4d5
57,516<--1:info score cp -920 depth 3 nodes 3 time 0 pv h8h7 c4d5 h4h5
57,516<--1:info score cp -920 depth 4 nodes 4 time 0 pv h8h7 c4d5 h4h5 d5e4
57,516<--1:info score cp -920 depth 5 nodes 5 time 0 pv h8h7 c4d5 h4h5 d5e4 h7f7
57,516<--1:info score cp -920 depth 6 nodes 6 time 0 pv h8h7 c4d5 h4h5 d5e4 h7f7 g4h5
57,585<--1:info score cp -920 depth 7 nodes 90642 time 71 pv h8h7 c4d5 h4h5 b2g2 g1f1 d5c4 f1e1
57,673<--1:bestmove h8h7
57,673*1*Found move:Rh8-h7
57,843*2*Start calc, move no: 91
58,084-->2:time 460
58,084-->2:otim 307
58,084-->2:h8h7
58,085<--2:1 817 0 63 a7a5
58,085<--2:2 891 0 518 c4d5 h4h5 b2g2
58,090<--2:3 891 0 3100 c4d5 h4h5 b2g2
58,122<--2:4 912 3 21385 a7a5 h4h5 c4d5 h5h6 b2g2
58,237<--2:move a7a5
58,237*2*Found move:a7-a5
58,414*1*Start calc, move no: 92
58,414-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2 f1f8 a2b2 g1h1 b2b3 f8h8 h7e4 h3h4 g5g4 h1g1 b3b2 g1f1 e4d3 f1g1 d3c4 h8h7 a7a5
58,414-->1:go wtime 3068 btime 4449 winc 100 binc 100
58,416<--1:info score cp -920 depth 1 nodes 1 time 0 pv g1h1
58,418<--1:info score cp -920 depth 2 nodes 2 time 1 pv g1h1 b2g2
58,420<--1:info score cp -920 depth 3 nodes 3 time 1 pv g1h1 b2g2 h1g2
58,426<--1:info score cp -910 depth 4 nodes 8122 time 11 pv h4h5 c4d5 h7d7 b2g2
58,441<--1:info score cp -915 depth 5 nodes 25702 time 27 pv h4h5 c4d5 h7d7 b2g2 g1h1
58,481<--1:info score cp -915 depth 6 nodes 74691 time 67 pv h7d7 g4h4 d7b7 b2b7 g2g3 h4g3
58,567<--1:bestmove h7d7
58,567*1*Found move:Rh7-d7
58,729*2*Start calc, move no: 93
58,971-->2:time 445
58,971-->2:otim 292
58,971-->2:h7d7
58,972<--2:1 966 0 40 g4h4
58,972<--2:2 966 0 275 g4h4 d7h7
58,972<--2:3 976 0 1992 g4h4 d7c7 c4d5
58,988<--2:4 965 1 12305 g4h4 d7g7 b2b1 g1f2 e5e4
59,067<--2:5 961 9 78204 g4h4 d7g7 e5e4 g2g3 h4h5 g3g4
59,119<--2:move g4h4
59,120*2*Found move:Kg4xh4
59,276*1*Start calc, move no: 94
59,277-->1:position startpos moves e2e4 c7c5 b1c3 b8c6 g1f3 e7e5 f1c4 f8d6 e1g1 g8f6 f3g5 e8g8 c3b5 d8e7 b5d6 e7d6 g5f7 f8f7 c4f7 g8f7 d2d3 f7g8 c1g5 d6e7 f2f4 d7d6 f4e5 d6e5 g5f6 g7f6 d1f3 c6d4 f3g3 e7g7 g3g7 g8g7 f1f2 c8e6 c2c3 d4c6 a1f1 a8f8 b2b3 g7g6 f2f3 e6g4 f3g3 g6h5 h2h3 g4e2 f1e1 h5h4 g1h2 e2h5 g3g7 h5g6 g7b7 f8d8 b7c7 d8d6 h2g1 f6f5 c3c4 h4g5 e1a1 f5e4 d3e4 g6e4 a1e1 e4f5 c7h7 f5h7 e1c1 d6d2 c1f1 d2a2 f1f8 a2b2 g1h1 b2b3 f8h8 h7e4 h3h4 g5g4 h1g1 b3b2 g1f1 e4d3 f1g1 d3c4 h8h7 a7a5 h7d7 g4h4
59,277-->1:go wtime 2920 btime 4306 winc 100 binc 100
59,283<--1:info score cp -915 depth 1 nodes 1 time 0 pv d7b7
59,283<--1:info score cp -915 depth 2 nodes 2 time 0 pv d7b7 b2b7
59,283<--1:info score cp -915 depth 3 nodes 3 time 0 pv d7b7 b2b7 g2g3
59,284<--1:info score cp -915 depth 4 nodes 4 time 0 pv d7b7 b2b7 g2g3 h4g3
59,284<--1:info score cp -915 depth 5 nodes 5 time 0 pv d7b7 b2b7 g2g3 h4g3 g1h1
59,310<--1:info score cp -945 depth 6 nodes 35376 time 34 pv d7b7 b2b7 g2g3 h4g3 g1h1 c4d5
59,425<--1:bestmove d7b7
59,425*1*Found move:Rd7-b7
59,590*2*Start calc, move no: 95
59,830-->2:time 431
59,830-->2:otim 278
59,830-->2:d7b7
59,833<--2:1 1481 0 36 b2b7
59,834<--2:2 1461 0 204 b2b7 g1f2
59,836<--2:3 1485 0 1350 b2b7 g1f2 e5e4
59,845<--2:4 1492 1 5617 b2b7 g1f2 b7b2 f2f3 a5a4
59,871<--2:5 1525 3 27142 b2b7 g1h2 b7b2 h2g1 e5e4
59,973<--2:move b2b7
59,973*2*Found move:Rb2xb7
60,130********Game end: 0-1 {Arena Adjudication}
60,132********Last game won by Tscp 1.81 with Black in 48 moves
60,133********LiSHeX  -  Tscp 1.81:
60,134********   1 B 2    1.0:0.0        0.0:1.0       15:45:55   -15.25    48 6.444 :4.800  0-1-0
60,145********Saving file /home/mkjm/Tournaments/Testing.pgn
60,167-->2:?
60,169<--2:Error (unknown command): ?
60,187-->2:result 0-1
60,192<--2:Error (unknown command): result
61,313********Round 2 of 10: Tscp 1.81  -  LiSHeX
61,361**----------New game---2023-06-13 15:45:56,281 Tue -------------
61,361-->2:new
61,365-->2:post
61,399*2*Start calc, move no: 0
61,400-->2:time 1000
61,400-->2:otim 1000
61,400-->2:white
61,400-->2:go
61,400<--2:move d2d4
61,400*2*Found move:d2-d4
61,551*1*Start calc, move no: 1
61,551-->1:ucinewgame
61,551-->1:isready
61,551<--1:readyok
61,558-->1:position startpos moves d2d4
61,558-->1:go wtime 10000 btime 10000 winc 100 binc 100
61,560<--1:info score cp -22 depth 1 nodes 1 time 0 pv d7d5
61,561<--1:info score cp -22 depth 2 nodes 2 time 0 pv d7d5
61,562<--1:info score cp -22 depth 3 nodes 3 time 0 pv d7d5
61,562<--1:info score cp -22 depth 4 nodes 4 time 0 pv d7d5
61,562<--1:info score cp -22 depth 5 nodes 5 time 0 pv d7d5
61,562<--1:info score cp -22 depth 6 nodes 6 time 0 pv d7d5
61,933<--1:info score cp -2 depth 7 nodes 456871 time 375 pv d7d5 e2e4 c8e6 f1b5 c7c6 e4d5 e6d5
61,942<--1:bestmove d7d5
61,942*1*Found move:d7-d5
62,093*2*Start calc, move no: 2
62,334-->2:time 1000
62,334-->2:otim 963
62,334-->2:d7d5
62,335<--2:move g1f3
62,335*2*Found move:Ng1-f3
62,487*1*Start calc, move no: 3
62,487-->1:position startpos moves d2d4 d7d5 g1f3
62,487-->1:go wtime 10000 btime 9621 winc 100 binc 100
62,493<--1:info score cp -2 depth 1 nodes 1 time 0 pv c8f5
62,494<--1:info score cp -2 depth 2 nodes 2 time 0 pv c8f5 e2e3
62,494<--1:info score cp -2 depth 3 nodes 3 time 0 pv c8f5 e2e3 g8f6
62,494<--1:info score cp -2 depth 4 nodes 4 time 0 pv c8f5 e2e3 g8f6 f1d3
62,494<--1:info score cp -2 depth 5 nodes 5 time 0 pv c8f5 e2e3 g8f6 f1d3 f5d3
62,655<--1:info score cp -15 depth 6 nodes 182823 time 167 pv c8f5 e2e3 e7e6 c1d2 f8d6 f1d3
62,860<--1:bestmove c8f5
62,860*1*Found move:Bc8-f5
63,035*2*Start calc, move no: 4
63,277-->2:time 1000
63,277-->2:otim 926
63,277-->2:c8f5
63,279<--2:1 45 0 47 b1c3
63,282<--2:2 10 0 233 b1c3 b8c6
63,286<--2:3 40 0 2176 b1c3 b8c6 e2e3
63,323<--2:4 10 4 20952 e2e3 b8d7 b1c3 g8f6
63,517<--2:5 30 23 128640 e2e3 g8f6 b1c3 b8c6 f1d3
63,610<--2:move e2e3
63,610*2*Found move:e2-e3
63,762*1*Start calc, move no: 5
63,762-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3
63,762-->1:go wtime 9672 btime 9253 winc 100 binc 100
63,769<--1:info score cp -5 depth 1 nodes 1 time 0 pv b8d7
63,769<--1:info score cp -5 depth 2 nodes 2 time 0 pv b8d7 b1c3
63,769<--1:info score cp -5 depth 3 nodes 3 time 0 pv b8d7 b1c3 g8f6
63,769<--1:info score cp -5 depth 4 nodes 4 time 0 pv b8d7 b1c3 g8f6 f1d3
63,769<--1:info score cp -5 depth 5 nodes 5 time 1 pv b8d7 b1c3 g8f6 f1d3 e7e6
64,020<--1:info score cp -15 depth 6 nodes 289951 time 257 pv e7e6 c1d2 b8c6 f1d3 c6b4 d3f5
64,124<--1:bestmove e7e6
64,124*1*Found move:e7-e6
64,278*2*Start calc, move no: 6
64,518-->2:time 968
64,518-->2:otim 890
64,518-->2:e7e6
64,522<--2:1 45 0 53 b1c3
64,522<--2:2 32 0 385 f1b5 c7c6 b5d3
64,525<--2:3 35 0 2605 b1c3 b8c6 f1d3
64,569<--2:4 27 5 23742 f1b5 c7c6 b5d3 f8b4 c1d2 f5d3 d2b4
64,842<--2:move b1c3
64,842*2*Found move:Nb1-c3
65,000*1*Start calc, move no: 7
65,000-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3
65,000-->1:go wtime 9353 btime 8896 winc 100 binc 100
65,005<--1:info score cp 0 depth 1 nodes 1 time 0 pv b8c6
65,005<--1:info score cp 0 depth 2 nodes 2 time 0 pv b8c6 f1d3
65,005<--1:info score cp 0 depth 3 nodes 3 time 0 pv b8c6 f1d3 f5d3
65,025<--1:info score cp -15 depth 4 nodes 22973 time 24 pv b8c6 f1e2 c6b4 e2b5
65,060<--1:info score cp -5 depth 5 nodes 64188 time 59 pv b8c6 c1d2 f8d6 c3d5 e6d5
65,349<--1:bestmove b8c6
65,349*1*Found move:Nb8-c6
65,501*2*Start calc, move no: 8
65,745-->2:time 936
65,745-->2:otim 856
65,745-->2:b8c6
65,749<--2:1 35 0 100 f1d3
65,749<--2:2 0 0 905 f1d3 g8f6
65,759<--2:3 40 1 6198 f1b5 g8e7 e1g1
65,815<--2:4 37 6 28753 f1b5 g8e7 e1g1 f7f6
66,058<--2:move f1b5
66,058*2*Found move:Bf1-b5
66,212*1*Start calc, move no: 9
66,214-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5
66,214-->1:go wtime 9045 btime 8552 winc 100 binc 100
66,216<--1:info score cp -10 depth 1 nodes 1 time 0 pv g8f6
66,217<--1:info score cp -10 depth 2 nodes 2 time 0 pv g8f6 e1g1
66,217<--1:info score cp -10 depth 3 nodes 3 time 0 pv g8f6 e1g1 f5c2
66,217<--1:info score cp -10 depth 4 nodes 4 time 0 pv g8f6 e1g1 f5c2 d1c2
66,227<--1:info score cp -5 depth 5 nodes 9248 time 12 pv f8d6 b5c6 b7c6 e1g1 g8f6
66,439<--1:info score cp -5 depth 6 nodes 251229 time 226 pv f8d6 e1g1 g8e7 f3h4 e8g8 h4f5
66,551<--1:bestmove f8d6
66,551*1*Found move:Bf8-d6
66,703*2*Start calc, move no: 10
66,944-->2:time 905
66,944-->2:otim 822
66,944-->2:f8d6
66,945<--2:1 53 0 44 b5c6 b7c6
66,949<--2:2 89 0 988 b5c6 b7c6 e1g1
66,957<--2:3 54 1 5294 b5c6 b7c6 e1g1 g8f6
67,048<--2:4 74 10 48240 b5c6 b7c6 e1g1 g8f6 c1d2
67,246<--2:move b5c6
67,246*2*Found move:Bb5xc6
67,395*1*Start calc, move no: 11
67,395-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6
67,395-->1:go wtime 8748 btime 8220 winc 100 binc 100
67,403<--1:info score cp -5 depth 1 nodes 1 time 0 pv b7c6
67,404<--1:info score cp -5 depth 2 nodes 2 time 0 pv b7c6 f3e5
67,404<--1:info score cp -5 depth 3 nodes 3 time 0 pv b7c6 f3e5 c6c5
67,404<--1:info score cp -5 depth 4 nodes 4 time 0 pv b7c6 f3e5 c6c5 e1g1
67,404<--1:info score cp -5 depth 5 nodes 5 time 0 pv b7c6 f3e5 c6c5 e1g1 d6e5
67,715<--1:info score cp 10 depth 6 nodes 386217 time 317 pv b7c6 f3e5 g8e7 g2g4 f5g6 e5g6
67,724<--1:bestmove b7c6
67,724*1*Found move:b7xc6
67,878*2*Start calc, move no: 12
68,118-->2:time 875
68,118-->2:otim 790
68,118-->2:b7c6
68,119<--2:1 89 0 83 e1g1
68,123<--2:2 54 0 509 e1g1 g8f6
68,134<--2:3 74 1 4010 e1g1 g8f6 c1d2
68,212<--2:4 43 9 32963 e1g1 g8e7 c1d2 e8g8
68,412<--2:move e1g1
68,412*2*Found move:O-O
68,564*1*Start calc, move no: 13
68,565-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1
68,565-->1:go wtime 8459 btime 7896 winc 100 binc 100
68,570<--1:info score cp 10 depth 1 nodes 1 time 0 pv g8f6
68,570<--1:info score cp 10 depth 2 nodes 2 time 0 pv g8f6 f3e5
68,570<--1:info score cp 10 depth 3 nodes 3 time 0 pv g8f6 f3e5 c6c5
68,570<--1:info score cp 10 depth 4 nodes 4 time 0 pv g8f6 f3e5 c6c5 c3b5
68,570<--1:info score cp 10 depth 5 nodes 5 time 0 pv g8f6 f3e5 c6c5 c3b5 d6e5
68,851<--1:info score cp 10 depth 6 nodes 354629 time 286 pv g8f6 f3e5 c6c5 c3b5 c5d4 e3d4
68,880<--1:bestmove g8f6
68,880*1*Found move:Ng8-f6
69,034*2*Start calc, move no: 14
69,275-->2:time 846
69,275-->2:otim 759
69,275-->2:g8f6
69,275<--2:1 74 0 76 c1d2
69,278<--2:2 44 0 687 f3e5 d6e5 d4e5
69,289<--2:3 44 1 5426 f3e5 d6e5 d4e5
69,334<--2:4 39 5 27523 f3e5 d6e5 d4e5 f6e4
69,557<--2:move f3e5
69,557*2*Found move:Nf3-e5
69,735*1*Start calc, move no: 15
69,736-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5
69,736-->1:go wtime 8182 btime 7586 winc 100 binc 100
69,741<--1:info score cp 10 depth 1 nodes 1 time 0 pv c6c5
69,741<--1:info score cp 10 depth 2 nodes 2 time 0 pv c6c5 c3b5
69,741<--1:info score cp 10 depth 3 nodes 3 time 0 pv c6c5 c3b5 d6e5
69,741<--1:info score cp 10 depth 4 nodes 4 time 0 pv c6c5 c3b5 d6e5 d4e5
69,748<--1:info score cp 7 depth 5 nodes 13038 time 8 pv c6c5 c3b5 d6e5 d4e5 f6e4
70,005<--1:info score cp -2 depth 6 nodes 307538 time 265 pv c6c5 c3b5 d8b8 b5d6 c7d6 e5c6
70,044<--1:bestmove c6c5
70,044*1*Found move:c6-c5
70,198*2*Start calc, move no: 16
70,440-->2:time 819
70,440-->2:otim 729
70,440-->2:c6c5
70,440<--2:1 53 0 212 c1d2 d6e5 d4e5
70,443<--2:2 43 0 1210 e5c6 d8c8
70,464<--2:3 37 2 6004 e5d3 f6g4 h2h3 f5d3 d1d3
70,533<--2:4 33 9 27173 e5c6 d8d7 c6e5 d6e5 d4e5
70,715<--2:move c3b5
70,715*2*Found move:Nc3-b5
70,872*1*Start calc, move no: 17
70,873-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5
70,873-->1:go wtime 7912 btime 7283 winc 100 binc 100
70,877<--1:info score cp -2 depth 1 nodes 1 time 0 pv d8b8
70,877<--1:info score cp -2 depth 2 nodes 2 time 0 pv d8b8 c2c4
70,877<--1:info score cp -2 depth 3 nodes 3 time 0 pv d8b8 c2c4 e8g8
70,877<--1:info score cp -2 depth 4 nodes 4 time 0 pv d8b8 c2c4 e8g8 b5d6
70,896<--1:info score cp 13 depth 5 nodes 21408 time 23 pv a7a6 b5d6 c7d6 e5d3 d8b8
71,049<--1:info score cp 13 depth 6 nodes 228984 time 176 pv d8b8 c2c4 e8g8 b5d6 c7d6 e5c6
71,188<--1:bestmove d8b8
71,188*1*Found move:Qd8-b8
71,345*2*Start calc, move no: 18
71,585-->2:time 792
71,585-->2:otim 698
71,585-->2:d8b8
71,588<--2:1 46 0 109 b5d6 c7d6
71,589<--2:2 41 0 620 b5d6 c7d6 e5c6
71,592<--2:3 41 0 2493 b5d6 c7d6 e5c6 b8b5
71,636<--2:4 25 5 27993 a2a4 d6e5 d4e5 f6e4
71,783<--2:5 25 19 118411 a2a4 d6e5 d4e5 f6g4 f2f4
71,851<--2:move a2a4
71,851*2*Found move:a2-a4
72,008*1*Start calc, move no: 19
72,010-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4
72,010-->1:go wtime 8651 btime 6973 winc 100 binc 100
72,013<--1:info score cp 13 depth 1 nodes 1 time 0 pv e8g8
72,013<--1:info score cp 13 depth 2 nodes 2 time 0 pv e8g8 b5d6
72,013<--1:info score cp 13 depth 3 nodes 3 time 0 pv e8g8 b5d6 c7d6
72,013<--1:info score cp 13 depth 4 nodes 4 time 0 pv e8g8 b5d6 c7d6 d4c5
72,083<--1:info score cp 25 depth 5 nodes 94705 time 73 pv d6e5 d4e5 f6g4 f2f4 e8g8
72,295<--1:bestmove d6e5
72,295*1*Found move:Bd6xe5
72,450*2*Start calc, move no: 20
72,692-->2:time 866
72,692-->2:otim 770
72,692-->2:d6e5
72,694<--2:1 30 0 40 d4e5
72,696<--2:2 25 0 1360 d4e5 f6e4
72,705<--2:3 25 1 4965 d4e5 f6d7 f2f4
72,782<--2:4 1 9 47030 d4e5 f6g4 e3e4 d5e4
72,982<--2:move d4e5
72,982*2*Found move:d4xe5
73,143*1*Start calc, move no: 21
73,144-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5
73,144-->1:go wtime 8366 btime 7693 winc 100 binc 100
73,147<--1:info score cp 5 depth 1 nodes 1 time 0 pv f6g4
73,148<--1:info score cp 5 depth 2 nodes 2 time 0 pv f6g4 f2f4
73,148<--1:info score cp 5 depth 3 nodes 3 time 0 pv f6g4 f2f4 e8g8
73,148<--1:info score cp 5 depth 4 nodes 4 time 0 pv f6g4 f2f4 e8g8 c1d2
73,187<--1:info score cp 15 depth 5 nodes 50228 time 42 pv f6d7 f1e1 a7a6 b5c3 d7e5
73,364<--1:info score cp 15 depth 6 nodes 281374 time 220 pv f6g4 f2f4 a7a6 b5c3 e8g8 f1e1
73,453<--1:bestmove f6g4
73,453*1*Found move:Nf6-g4
73,602*2*Start calc, move no: 22
73,843-->2:time 837
73,843-->2:otim 739
73,843-->2:f6g4
73,844<--2:1 25 0 480 f2f4
73,847<--2:2 1 0 1512 e3e4 d5e4
73,853<--2:3 26 0 4856 e3e4 d5e4 c1f4
73,903<--2:4 17 6 34596 c2c4 b8d8 c4d5 e6d5
74,122<--2:move f2f4
74,122*2*Found move:f2-f4
74,272*1*Start calc, move no: 23
74,272-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4
74,272-->1:go wtime 8092 btime 7389 winc 100 binc 100
74,277<--1:info score cp 15 depth 1 nodes 1 time 0 pv a7a6
74,277<--1:info score cp 15 depth 2 nodes 2 time 0 pv a7a6 b5c3
74,277<--1:info score cp 15 depth 3 nodes 3 time 0 pv a7a6 b5c3 e8g8
74,277<--1:info score cp 15 depth 4 nodes 4 time 0 pv a7a6 b5c3 e8g8 h2h3
74,277<--1:info score cp 15 depth 5 nodes 5 time 0 pv a7a6 b5c3 e8g8 h2h3 g4h6
74,453<--1:info score cp 18 depth 6 nodes 239664 time 179 pv e8g8 h2h3 g4h6 d1e2 a7a6 b5c3
74,571<--1:bestmove e8g8
74,571*1*Found move:O-O
74,720*2*Start calc, move no: 24
74,961-->2:time 810
74,961-->2:otim 710
74,961-->2:e8g8
74,964<--2:1 13 0 161 c1d2
74,967<--2:2 10 0 1983 c1d2 c7c6
74,993<--2:3 8 3 11956 h2h3 g4h6 c1d2
75,047<--2:4 3 8 43180 h2h3 g4h6 c1d2 f5e4
75,235<--2:move b5c3
75,235*2*Found move:Nb5-c3
75,387*1*Start calc, move no: 25
75,388-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3
75,388-->1:go wtime 7823 btime 7095 winc 100 binc 100
75,392<--1:info score cp 30 depth 1 nodes 1 time 0 pv f7f6
75,393<--1:info score cp 30 depth 2 nodes 2 time 0 pv f7f6 h2h3
75,393<--1:info score cp 20 depth 3 nodes 4349 time 3 pv f7f6 h2h3 g4h6
75,414<--1:info score cp 20 depth 4 nodes 30052 time 24 pv b8b7 h2h3 g4h6 g2g4
75,455<--1:info score cp 20 depth 5 nodes 90968 time 67 pv b8b7 h2h3 g4h6 g2g4 h6g4
75,659<--1:info score cp 20 depth 6 nodes 358695 time 269 pv c7c6 h2h3 f7f6 h3g4 f6e5 g4f5
75,676<--1:bestmove c7c6
75,676*1*Found move:c7-c6
75,832*2*Start calc, move no: 26
76,073-->2:time 783
76,073-->2:otim 682
76,073-->2:c7c6
76,074<--2:1 -4 0 270 a4a5
76,078<--2:2 -7 0 2284 a4a5 c5c4
76,109<--2:3 5 3 16737 d1e2 b8b4 f1d1
76,228<--2:4 2 15 80055 f1f3 c5c4 f3g3 g4h6
76,334<--2:move f1f3
76,334*2*Found move:Rf1-f3
76,486*1*Start calc, move no: 27
76,486-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3
76,486-->1:go wtime 7567 btime 6812 winc 100 binc 100
76,490<--1:info score cp 30 depth 1 nodes 235 time 0 pv f8e8
76,490<--1:info score cp 30 depth 2 nodes 1712 time 1 pv f7f6 h2h3
76,496<--1:info score cp 25 depth 3 nodes 7587 time 10 pv f8e8 a4a5 f7f6
76,513<--1:info score cp 117 depth 4 nodes 25599 time 27 pv g4e5 f4e5 f5g4 e3e4
76,526<--1:info score cp 117 depth 5 nodes 42468 time 41 pv g4e5 f4e5 f5g4 e3e4 g4f3
76,606<--1:info score cp 117 depth 6 nodes 145904 time 119 pv g4e5 f4e5 f5g4 e3e4 g4f3 d1f3
76,764<--1:bestmove g4e5
76,764*1*Found move:Ng4xe5
76,918*2*Start calc, move no: 28
77,159-->2:time 757
77,159-->2:otim 654
77,159-->2:g4e5
77,160<--2:1 86 0 57 f4e5 b8e5
77,161<--2:2 86 0 328 f4e5 b8e5
77,176<--2:3 -98 1 5471 f4e5 f5g4 e3e4 g4f3 d1f3 b8e5
77,204<--2:4 -98 4 18518 f4e5 f5g4 e3e4 g4f3 d1f3 b8e5
77,379<--2:5 -109 22 113781 f4e5 f5g4 e3e4 d5d4 c3a2 g4f3 d1f3 b8e5
77,411<--2:move f4e5
77,411*2*Found move:f4xe5
77,564*1*Start calc, move no: 29
77,564-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5
77,564-->1:go wtime 7320 btime 6539 winc 100 binc 100
77,570<--1:info score cp -83 depth 1 nodes 1 time 0 pv f5g4
77,570<--1:info score cp -83 depth 2 nodes 2 time 0 pv f5g4 d1d2
77,571<--1:info score cp -83 depth 3 nodes 3 time 0 pv f5g4 d1d2 b8e5
77,571<--1:info score cp -83 depth 4 nodes 4 time 0 pv f5g4 d1d2 b8e5 f3f2
77,571<--1:info score cp -83 depth 5 nodes 5 time 0 pv f5g4 d1d2 b8e5 f3f2 a8e8
77,639<--1:info score cp 107 depth 6 nodes 102354 time 74 pv f5g4 a4a5 g4f3 d1f3 b8e5 c1d2
77,834<--1:bestmove f5g4
77,834*1*Found move:Bf5-g4
77,985*2*Start calc, move no: 30
78,227-->2:time 732
78,227-->2:otim 628
78,227-->2:f5g4
78,229<--2:1 -98 0 680 e3e4 g4f3 d1f3 b8e5
78,231<--2:2 -98 0 1361 e3e4 g4f3 d1f3 b8e5
78,237<--2:3 -109 1 3973 e3e4 d5d4 c3a2 g4f3 d1f3 b8e5
78,252<--2:4 -109 2 10572 e3e4 d5d4 c3a2 g4f3 d1f3 b8e5
78,453<--2:5 -96 22 117389 d1f1 g4f3 f1f3 b8e5 c1d2
78,470<--2:move d1f1
78,470*2*Found move:Qd1-f1
78,629*1*Start calc, move no: 31
78,630-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1
78,630-->1:go wtime 7082 btime 6274 winc 100 binc 100
78,637<--1:info score cp 107 depth 1 nodes 1 time 0 pv g4f3
78,637<--1:info score cp 107 depth 2 nodes 2 time 0 pv g4f3 c3d5
78,637<--1:info score cp 107 depth 3 nodes 3 time 0 pv g4f3 c3d5 c6d5
78,637<--1:info score cp 107 depth 4 nodes 4 time 0 pv g4f3 c3d5 c6d5 g2f3
78,637<--1:info score cp 107 depth 5 nodes 5 time 0 pv g4f3 c3d5 c6d5 g2f3 b8e5
78,760<--1:info score cp 117 depth 6 nodes 161023 time 129 pv g4f3 f1f3 b8e5 c1d2 a8b8 a1a2
78,848<--1:info score cp 127 depth 7 nodes 262742 time 218 pv g4f3 f1f3 b8e5 a4a5 a8e8 c1d2 f7f5
78,892<--1:bestmove g4f3
78,892*1*Found move:Bg4xf3
79,043*2*Start calc, move no: 32
79,285-->2:time 709
79,285-->2:otim 602
79,285-->2:g4f3
79,287<--2:1 -116 0 50 f1f3 b8e5
79,288<--2:2 -116 0 254 f1f3 b8e5
79,293<--2:3 -96 0 2194 f1f3 b8e5 c1d2
79,308<--2:4 -106 2 10623 f1f3 b8e5 c1d2 f8b8
79,406<--2:5 -98 12 73460 f1f3 b8e5 f3f4 e5b8 e3e4
79,522<--2:move f1f3
79,523*2*Found move:Qf1xf3
79,680*1*Start calc, move no: 33
79,680-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3
79,680-->1:go wtime 6849 btime 6017 winc 100 binc 100
79,683<--1:info score cp 127 depth 1 nodes 1 time 0 pv b8e5
79,684<--1:info score cp 127 depth 2 nodes 2 time 0 pv b8e5 a4a5
79,684<--1:info score cp 127 depth 3 nodes 3 time 0 pv b8e5 a4a5 e5b8
79,684<--1:info score cp 127 depth 4 nodes 4 time 0 pv b8e5 a4a5 e5b8 a1b1
79,684<--1:info score cp 127 depth 5 nodes 5 time 0 pv b8e5 a4a5 e5b8 a1b1 b8b4
79,794<--1:info score cp 120 depth 6 nodes 129886 time 113 pv b8e5 f3f4 e5f4 e3f4 a8b8 a4a5
79,931<--1:bestmove b8e5
79,931*1*Found move:Qb8xe5
80,102*2*Start calc, move no: 34
80,343-->2:time 685
80,343-->2:otim 578
80,343-->2:b8e5
80,347<--2:1 -96 0 91 c1d2
80,348<--2:2 -106 0 686 c1d2 f8b8
80,359<--2:3 -98 1 7151 f3f4 e5b8 e3e4
80,424<--2:4 -111 8 47423 a4a5 d5d4 f3e4 e5d6
80,571<--2:move a4a5
80,571*2*Found move:a4-a5
80,715*1*Start calc, move no: 35
80,716-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5
80,716-->1:go wtime 6626 btime 5771 winc 100 binc 100
80,720<--1:info score cp 135 depth 1 nodes 1 time 0 pv e5b8
80,720<--1:info score cp 135 depth 2 nodes 2 time 0 pv e5b8 a1b1
80,720<--1:info score cp 135 depth 3 nodes 3 time 0 pv e5b8 a1b1 b8b4
80,720<--1:info score cp 135 depth 4 nodes 4 time 0 pv e5b8 a1b1 b8b4 a5a6
80,720<--1:info score cp 135 depth 5 nodes 5 time 0 pv e5b8 a1b1 b8b4 a5a6 a8e8
80,960<--1:bestmove e5b8
80,960*1*Found move:Qe5-b8
81,112*2*Start calc, move no: 36
81,353-->2:time 663
81,353-->2:otim 554
81,353-->2:e5b8
81,354<--2:1 -97 0 81 e3e4
81,356<--2:2 -100 0 693 e3e4 c5c4
81,370<--2:3 -113 1 8271 a1a2 e6e5 c1d2
81,443<--2:4 -113 9 51293 a1a4 e6e5 e3e4 d5e4 a4e4
81,575<--2:move a1a4
81,575*2*Found move:Ra1-a4
81,725*1*Start calc, move no: 37
81,726-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4
81,726-->1:go wtime 6409 btime 5532 winc 100 binc 100
81,730<--1:info score cp 145 depth 1 nodes 67 time 0 pv e6e5
81,730<--1:info score cp 135 depth 2 nodes 674 time 0 pv f7f5 c3d5
81,730<--1:info score cp 135 depth 3 nodes 2050 time 1 pv f7f5 c3d5 e6d5
81,752<--1:info score cp 130 depth 4 nodes 32253 time 26 pv f8e8 f3f7 g8f7 c1d2
81,810<--1:info score cp 135 depth 5 nodes 104000 time 80 pv f7f5 a4a2 e6e5 c1d2 f8f7
81,962<--1:bestmove f7f5
81,962*1*Found move:f7-f5
82,115*2*Start calc, move no: 38
82,357-->2:time 641
82,357-->2:otim 531
82,357-->2:f7f5
82,360<--2:1 -96 0 98 a4f4
82,360<--2:2 -99 0 675 a4f4 c5c4
82,369<--2:3 -98 1 6136 a4f4 c5c4 a5a6
82,415<--2:4 -109 5 32386 a4f4 c5c4 a5a6 c6c5
82,571<--2:move a4f4
82,571*2*Found move:Ra4-f4
82,729*1*Start calc, move no: 39
82,730-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4
82,730-->1:go wtime 7200 btime 5301 winc 100 binc 100
82,732<--1:info score cp 140 depth 1 nodes 1 time 0 pv b8b7
82,732<--1:info score cp 140 depth 2 nodes 2 time 0 pv b8b7 f3f2
82,732<--1:info score cp 140 depth 3 nodes 3 time 0 pv b8b7 f3f2 a8e8
82,757<--1:info score cp 135 depth 4 nodes 31373 time 26 pv g7g6 f3f1 b8b7 f4f3
82,775<--1:info score cp 138 depth 5 nodes 53217 time 44 pv g7g6 f3g3 e6e5 f4f3 f8f7
82,961<--1:bestmove g7g6
82,961*1*Found move:g7-g6
83,114*2*Start calc, move no: 40
83,355-->2:time 720
83,355-->2:otim 608
83,355-->2:g7g6
83,357<--2:1 -83 0 141 a5a6
83,360<--2:2 -109 0 1107 a5a6 e6e5
83,368<--2:3 -110 1 5746 f3g3 e6e5 f4f2
83,402<--2:4 -114 4 25258 f3g3 e6e5 f4f2 e5e4
83,598<--2:move f3g3
83,598*2*Found move:Qf3-g3
83,754*1*Start calc, move no: 41
83,755-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3
83,755-->1:go wtime 6962 btime 6075 winc 100 binc 100
83,760<--1:info score cp 133 depth 1 nodes 1 time 0 pv e6e5
83,760<--1:info score cp 133 depth 2 nodes 2 time 0 pv e6e5 f4f3
83,760<--1:info score cp 133 depth 3 nodes 3 time 0 pv e6e5 f4f3 f8f7
83,760<--1:info score cp 133 depth 4 nodes 4 time 0 pv e6e5 f4f3 f8f7 a5a6
83,771<--1:info score cp 133 depth 5 nodes 17477 time 15 pv e6e5 f4f3 f8f7 a5a6 f7f6
84,009<--1:bestmove e6e5
84,009*1*Found move:e6-e5
84,169*2*Start calc, move no: 42
84,409-->2:time 697
84,409-->2:otim 583
84,409-->2:e6e5
84,412<--2:1 -110 0 106 f4f3
84,414<--2:2 -114 0 858 f4f3 e5e4
84,420<--2:3 -114 0 3535 f4f3 e5e4 f3f4
84,441<--2:4 -117 3 16247 f4f3 e5e4 f3f4 c5c4
84,615<--2:5 -116 20 123858 f4f1 c5c4 g3g5 e5e4 a5a6
84,643<--2:move f4f1
84,643*2*Found move:Rf4-f1
84,794*1*Start calc, move no: 43
84,794-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1
84,794-->1:go wtime 6733 btime 5826 winc 100 binc 100
84,800<--1:info score cp 138 depth 1 nodes 108 time 0 pv f8f7
84,800<--1:info score cp 133 depth 2 nodes 683 time 1 pv f8f7 c3d5
84,800<--1:info score cp 133 depth 3 nodes 1431 time 1 pv f8f7 c3d5 c6d5
84,809<--1:info score cp 130 depth 4 nodes 14871 time 14 pv f8e8 f1f5 b8b2 c1b2
84,875<--1:info score cp 135 depth 5 nodes 104580 time 82 pv b8d6 a5a6 a8b8 f1d1 b8e8
85,029<--1:info score cp 135 depth 6 nodes 290631 time 234 pv d5d4 e3d4 c5d4 c3a4 f5f4 g3f2
85,041<--1:bestmove d5d4
85,041*1*Found move:d5-d4
85,205*2*Start calc, move no: 44
85,446-->2:time 674
85,446-->2:otim 559
85,446-->2:d5d4
85,448<--2:1 -111 0 194 c3e2
85,450<--2:2 -112 0 784 c3e2 a7a6
85,457<--2:3 -112 1 4241 c3e2 a7a6 g3g5
85,484<--2:4 -115 3 19652 c3e2 b8b5 f1f2 e5e4
85,641<--2:5 -124 19 117029 c3d1 e5e4 g3b8 a8b8 g1f2
85,670<--2:move c3d1
85,670*2*Found move:Nc3-d1
85,825*1*Start calc, move no: 45
85,825-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1
85,825-->1:go wtime 6514 btime 5584 winc 100 binc 100
85,830<--1:info score cp 138 depth 1 nodes 139 time 0 pv f8f7
85,830<--1:info score cp 133 depth 2 nodes 569 time 0 pv a7a6 c1d2
85,830<--1:info score cp 133 depth 3 nodes 1866 time 1 pv a7a6 c1d2 d4e3
85,847<--1:info score cp 120 depth 4 nodes 23508 time 22 pv c5c4 g3f3 e5e4 f3f2
85,893<--1:info score cp 125 depth 5 nodes 81962 time 65 pv b8d6 a5a6 a8d8 c1d2 f8e8
86,045<--1:info score cp 125 depth 6 nodes 267374 time 219 pv e5e4 g3b8 a8b8 e3d4 c5d4 c1f4
86,064<--1:bestmove e5e4
86,065*1*Found move:e5-e4
86,218*2*Start calc, move no: 46
86,459-->2:time 652
86,459-->2:otim 535
86,459-->2:e5e4
86,461<--2:1 -125 0 96 g3g5
86,463<--2:2 -129 0 831 g3g5 d4d3
86,469<--2:3 -124 0 4908 g3b8 a8b8 g1f2
86,495<--2:4 -128 3 21217 g3f2 f8d8 a5a6 d4e3 c1e3
86,591<--2:5 -129 13 83019 g3f2 f8d8 c1d2 d4e3 d2e3
86,675<--2:move g3f2
86,675*2*Found move:Qg3-f2
86,839*1*Start calc, move no: 47
86,841-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2
86,841-->1:go wtime 6303 btime 5350 winc 100 binc 100
86,847<--1:info score cp 125 depth 1 nodes 1 time 0 pv d4d3
86,847<--1:info score cp 125 depth 2 nodes 2 time 0 pv d4d3 c2d3
86,847<--1:info score cp 125 depth 3 nodes 3 time 0 pv d4d3 c2d3 e4d3
86,847<--1:info score cp 125 depth 4 nodes 4 time 0 pv d4d3 c2d3 e4d3 f2f5
86,854<--1:info score cp 130 depth 5 nodes 12035 time 13 pv d4d3 c2d3 e4d3 f2f5 g6f5
86,916<--1:info score cp 140 depth 6 nodes 91531 time 75 pv d4d3 f2d2 b8b4 d2b4 c5b4 f1f2
87,007<--1:info score cp 150 depth 7 nodes 198412 time 166 pv d4d3 f2d2 b8b4 d2b4 c5b4 f1f2 a8d8
87,071<--1:bestmove d4d3
87,071*1*Found move:d4-d3
87,220*2*Start calc, move no: 48
87,461-->2:time 631
87,461-->2:otim 513
87,461-->2:d4d3
87,467<--2:1 -114 0 69 d1c3
87,467<--2:2 -117 0 566 d1c3 c5c4
87,470<--2:3 -116 0 2882 d1c3 c5c4 a5a6
87,497<--2:4 -123 3 15779 d1c3 b8c7 a5a6 f8b8
87,659<--2:5 -168 19 112520 f2d2 b8b4 d2b4 c5b4 f1f2
87,673<--2:move f2d2
87,673*2*Found move:Qf2-d2
87,842*1*Start calc, move no: 49
87,843-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2
87,843-->1:go wtime 6096 btime 5125 winc 100 binc 100
87,846<--1:info score cp 150 depth 1 nodes 1 time 0 pv b8b4
87,847<--1:info score cp 150 depth 2 nodes 2 time 0 pv b8b4 c2d3
87,847<--1:info score cp 150 depth 3 nodes 3 time 0 pv b8b4 c2d3 b4d2
87,847<--1:info score cp 150 depth 4 nodes 4 time 0 pv b8b4 c2d3 b4d2 c1d2
87,847<--1:info score cp 150 depth 5 nodes 5 time 0 pv b8b4 c2d3 b4d2 c1d2 e4d3
87,921<--1:info score cp 155 depth 6 nodes 98633 time 77 pv b8b4 c2d3 b4d2 c1d2 e4d3 d1c3
88,064<--1:bestmove b8b4
88,064*1*Found move:Qb8-b4
88,216*2*Start calc, move no: 50
88,456-->2:time 610
88,456-->2:otim 491
88,456-->2:b8b4
88,458<--2:1 -168 0 223 d2b4 c5b4
88,458<--2:2 -168 0 488 d2b4 c5b4
88,462<--2:3 -168 0 1307 d2b4 c5b4 f1f2
88,470<--2:4 -188 1 4708 d2b4 c5b4 f1f2 g8f7
88,508<--2:5 -194 5 27758 c2d3 b4d2 c1d2 e4d3 g1f2
88,661<--2:move c2d3
88,662*2*Found move:c2xd3
88,857*1*Start calc, move no: 51
88,857-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3
88,857-->1:go wtime 5895 btime 4909 winc 100 binc 100
88,860<--1:info score cp 170 depth 1 nodes 1 time 0 pv b4d2
88,860<--1:info score cp 170 depth 2 nodes 2 time 0 pv b4d2 c1d2
88,860<--1:info score cp 170 depth 3 nodes 3 time 0 pv b4d2 c1d2 e4d3
88,860<--1:info score cp 170 depth 4 nodes 4 time 0 pv b4d2 c1d2 e4d3 d1c3
88,860<--1:info score cp 170 depth 5 nodes 5 time 0 pv b4d2 c1d2 e4d3 d1c3 a8e8
88,947<--1:info score cp 160 depth 6 nodes 80304 time 89 pv b4d2 c1d2 e4d3 d1f2 a8d8 e3e4
88,972<--1:info score cp 165 depth 7 nodes 121595 time 114 pv b4d2 c1d2 e4d3 d1f2 a8d8 e3e4 f8e8
89,075<--1:bestmove b4d2
89,075*1*Found move:Qb4xd2
89,236*2*Start calc, move no: 52
89,477-->2:time 590
89,477-->2:otim 470
89,477-->2:b4d2
89,480<--2:1 -214 0 22 c1d2 e4d3
89,480<--2:2 -214 0 117 c1d2 e4d3
89,480<--2:3 -194 0 542 c1d2 e4d3 g1f2
89,483<--2:4 -207 0 2158 c1d2 e4d3 d1f2 c5c4
89,494<--2:5 -189 1 7726 c1d2 e4d3 d1f2 c5c4 e3e4
89,531<--2:6 -199 5 32677 c1d2 e4d3 d1f2 c5c4 e3e4 a8b8
89,673<--2:move c1d2
89,673*2*Found move:Bc1xd2
89,834*1*Start calc, move no: 53
89,834-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2
89,834-->1:go wtime 5704 btime 4696 winc 100 binc 100
89,839<--1:info score cp 165 depth 1 nodes 1 time 0 pv e4d3
89,840<--1:info score cp 165 depth 2 nodes 2 time 0 pv e4d3 d1f2
89,840<--1:info score cp 165 depth 3 nodes 3 time 1 pv e4d3 d1f2 f8d8
89,840<--1:info score cp 165 depth 4 nodes 4 time 1 pv e4d3 d1f2 f8d8 e3e4
89,840<--1:info score cp 165 depth 5 nodes 5 time 1 pv e4d3 d1f2 f8d8 e3e4 d8f8
89,840<--1:info score cp 165 depth 6 nodes 6 time 1 pv e4d3 d1f2 f8d8 e3e4 d8f8 e4f5
89,888<--1:info score cp 165 depth 7 nodes 61593 time 53 pv e4d3 d1f2 a8b8 f2d3 b8d8 d3c5 d8d2
90,044<--1:bestmove e4d3
90,044*1*Found move:e4xd3
90,201*2*Start calc, move no: 54
90,442-->2:time 571
90,442-->2:otim 450
90,442-->2:e4d3
90,444<--2:1 -194 0 30 g1f2
90,446<--2:2 -207 0 168 d1f2 c5c4
90,446<--2:3 -189 0 745 d1f2 c5c4 e3e4
90,461<--2:4 -199 1 4782 d1f2 c5c4 e3e4 a8b8
90,517<--2:5 -193 7 32330 g2g4 a8e8 g4f5 f8f5 d1c3
90,632<--2:move g2g4
90,632*2*Found move:g2-g4
90,789*1*Start calc, move no: 55
90,789-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4
90,789-->1:go wtime 5519 btime 4491 winc 100 binc 100
90,792<--1:info score cp 165 depth 1 nodes 1 time 0 pv f5g4
90,792<--1:info score cp 165 depth 2 nodes 2 time 0 pv f5g4 f1f8
90,793<--1:info score cp 165 depth 3 nodes 3 time 0 pv f5g4 f1f8
90,793<--1:info score cp 180 depth 4 nodes 1916 time 1 pv f5g4 d1f2 g4g3 h2g3
90,801<--1:info score cp 185 depth 5 nodes 9216 time 9 pv f5g4 f1f8 g8f8 d1f2 a8d8
90,827<--1:info score cp 190 depth 6 nodes 34890 time 37 pv f5g4 d1f2 a8b8 f1b1 b8d8 f2g4
90,845<--1:info score cp 190 depth 7 nodes 52941 time 54 pv f5g4 d1f2 a8b8 f1b1 c5c4 f2g4 b8e8
90,906<--1:info score cp 215 depth 8 nodes 131777 time 115 pv f5g4 d1f2 a8b8 f1d1 f8d8 d2c3 d3d2 f2g4
90,992<--1:bestmove f5g4
90,992*1*Found move:f5xg4
91,160*2*Start calc, move no: 56
91,400-->2:time 552
91,400-->2:otim 430
91,400-->2:f5g4
91,406<--2:1 -256 0 27 e3e4
91,406<--2:2 -191 0 273 d1f2 c5c4 f2g4
91,406<--2:3 -191 0 716 d1f2 c5c4 f2g4
91,406<--2:4 -201 0 3415 d1f2 c5c4 f2g4 a8e8
91,430<--2:5 -216 2 17595 d1f2 a8b8 f1b1 c5c4 f2g4
91,495<--2:6 -220 9 63920 d1f2 a8b8 d2c3 d3d2 f1d1 g4g3 h2g3
91,584<--2:move d1f2
91,584*2*Found move:Nd1-f2
91,742*1*Start calc, move no: 57
91,742-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2
91,742-->1:go wtime 5340 btime 4293 winc 100 binc 100
91,746<--1:info score cp 215 depth 1 nodes 1 time 0 pv a8b8
91,746<--1:info score cp 215 depth 2 nodes 2 time 0 pv a8b8 f2g4
91,746<--1:info score cp 215 depth 3 nodes 3 time 0 pv a8b8 f2g4 f8f1
91,746<--1:info score cp 215 depth 4 nodes 4 time 0 pv a8b8 f2g4 f8f1 g1f1
91,746<--1:info score cp 215 depth 5 nodes 5 time 0 pv a8b8 f2g4 f8f1 g1f1 b8b2
91,747<--1:info score cp 215 depth 6 nodes 6 time 0 pv a8b8 f2g4 f8f1 g1f1 b8b2 g4h6
91,768<--1:info score cp 215 depth 7 nodes 26137 time 24 pv a8b8 f2g4 f8f1 g1f1 b8b2 g4h6 g8f8
91,939<--1:bestmove a8b8
91,939*1*Found move:Ra8-b8
92,092*2*Start calc, move no: 58
92,332-->2:time 534
92,332-->2:otim 411
92,332-->2:a8b8
92,337<--2:1 -49 0 38 f2d3
92,340<--2:2 -59 0 198 f2d3 g8g7
92,340<--2:3 -216 0 1902 f1b1 c5c4 f2g4
92,345<--2:4 -220 1 8239 d2c3 d3d2 f1d1 g4g3 h2g3
92,368<--2:5 -220 3 25308 d2c3 d3d2 f1d1 g4g3 h2g3
92,481<--2:6 -201 14 105004 d2c3 c5c4 f2g4 f8f1 g1f1 b8f8 f1e1 g8f7
92,512<--2:move d2c3
92,512*2*Found move:Bd2-c3
92,668*1*Start calc, move no: 59
92,669-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3
92,669-->1:go wtime 6165 btime 4101 winc 100 binc 100
92,672<--1:info score cp 215 depth 1 nodes 1 time 0 pv f8e8
92,672<--1:info score cp 215 depth 2 nodes 2 time 0 pv f8e8 f2d3
92,672<--1:info score cp 215 depth 3 nodes 3 time 0 pv f8e8 f2d3 b8b3
92,674<--1:info score cp 215 depth 4 nodes 4 time 0 pv f8e8 f2d3 b8b3 d3c5
92,674<--1:info score cp 215 depth 5 nodes 5 time 0 pv f8e8 f2d3 b8b3 d3c5 b3c3
92,674<--1:info score cp 215 depth 6 nodes 6 time 0 pv f8e8 f2d3 b8b3 d3c5 b3c3 b2c3
92,857<--1:bestmove f8e8
92,857*1*Found move:Rf8-e8
93,012*2*Start calc, move no: 60
93,253-->2:time 617
93,253-->2:otim 492
93,253-->2:f8e8
93,257<--2:1 -78 0 43 f2d3 e8e3 d3c5
93,260<--2:2 -78 0 293 f2d3 e8e3 d3c5
93,260<--2:3 -78 0 1651 f2d3 e8e3 d3c5
93,265<--2:4 -7 1 7577 f2g4 h7h6 g4f6 g8f7 f6e8 f7e8
93,293<--2:5 31 3 30471 f2g4 h7h6 g4f6 g8f7 f6e8 f7e8 e3e4
93,448<--2:6 21 19 144708 f2g4 h7h6 g4f6 g8f7 f6e8 f7e8 e3e4 e8e7
93,459<--2:move f2g4
93,459*2*Found move:Nf2xg4
93,616*1*Start calc, move no: 61
93,616-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4
93,616-->1:go wtime 5964 btime 4918 winc 100 binc 100
93,620<--1:info score cp 265 depth 1 nodes 1 time 0 pv b8b2
93,620<--1:info score cp 265 depth 2 nodes 2 time 0 pv b8b2 c3b2
93,621<--1:info score cp 265 depth 3 nodes 3 time 0 pv b8b2 c3b2 e8e3
93,621<--1:info score cp 265 depth 4 nodes 4 time 0 pv b8b2 c3b2 e8e3 g4e3
93,654<--1:info score cp 115 depth 5 nodes 45599 time 38 pv c5c4 g4h6
93,757<--1:info score cp -115 depth 6 nodes 193144 time 140 pv h7h6 g4f6 g8f8 f6e8 f8e8 f1f6
93,831<--1:bestmove h7h6
93,831*1*Found move:h7-h6
94,011*2*Start calc, move no: 62
94,252-->2:time 597
94,252-->2:otim 471
94,252-->2:h7h6
94,257<--2:1 -86 0 34 g4h6
94,258<--2:2 -7 0 515 g4f6 g8f8 f6e8 f8e8
94,260<--2:3 31 0 3000 g4f6 g8f8 f6e8 f8e8 e3e4
94,285<--2:4 21 3 20331 g4f6 g8f8 f6e8 f8e8 e3e4 e8d7
94,451<--2:move g4f6
94,451*2*Found move:Ng4-f6
94,605*1*Start calc, move no: 63
94,605-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6
94,605-->1:go wtime 5770 btime 4708 winc 100 binc 100
94,610<--1:info score cp -225 depth 1 nodes 1 time 0 pv g8f8
94,612<--1:info score cp -225 depth 2 nodes 2 time 0 pv g8f8 f6e8
94,613<--1:info score cp -225 depth 3 nodes 3 time 0 pv g8f8 f6e8 f8e8
94,613<--1:info score cp -225 depth 4 nodes 4 time 0 pv g8f8 f6e8 f8e8 f1d1
94,613<--1:info score cp -225 depth 5 nodes 5 time 0 pv g8f8 f6e8 f8e8 f1d1 b8d8
94,648<--1:info score cp -170 depth 6 nodes 47847 time 41 pv g8f8 f6e8 f8e8 f1f6 e8d7 f6g6
94,813<--1:bestmove g8f8
94,813*1*Found move:Kg8-f8
94,970*2*Start calc, move no: 64
95,212-->2:time 577
95,212-->2:otim 451
95,212-->2:g8f8
95,217<--2:1 -7 0 33 f6e8 f8e8
95,218<--2:2 31 0 508 f6e8 f8e8 e3e4
95,218<--2:3 21 0 2973 f6e8 f8e8 e3e4 e8d7
95,248<--2:4 45 3 28522 f6e8 f8e8 e3e4 e8d7 e4e5
95,392<--2:5 101 18 140215 f6e8 f8e8 f1f6 b8d8 f6g6 d3d2
95,403<--2:move f6e8
95,403*2*Found move:Nf6xe8
95,570*1*Start calc, move no: 65
95,571-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8
95,571-->1:go wtime 5584 btime 4505 winc 100 binc 100
95,572<--1:info score cp -165 depth 1 nodes 1 time 0 pv f8e8
95,574<--1:info score cp -165 depth 2 nodes 2 time 0 pv f8e8 f1f6
95,574<--1:info score cp -165 depth 3 nodes 3 time 0 pv f8e8 f1f6 b8d8
95,574<--1:info score cp -165 depth 4 nodes 4 time 0 pv f8e8 f1f6 b8d8 f6g6
95,574<--1:info score cp -165 depth 5 nodes 5 time 0 pv f8e8 f1f6 b8d8 f6g6 e8d7
95,574<--1:info score cp -165 depth 6 nodes 6 time 0 pv f8e8 f1f6 b8d8 f6g6 e8d7 g6h6
95,755<--1:info score cp -180 depth 7 nodes 253089 time 184 pv f8e8 f1f6 e8d7 f6f7 d7d6 e3e4 d6e6
95,772<--1:bestmove f8e8
95,772*1*Found move:Kf8xe8
95,932*2*Start calc, move no: 66
96,175-->2:time 559
96,175-->2:otim 431
96,175-->2:f8e8
96,176<--2:1 31 0 38 e3e4
96,179<--2:2 21 0 328 e3e4 e8d7
96,182<--2:3 45 0 2182 e3e4 e8d7 e4e5
96,207<--2:4 101 3 18343 f1f6 b8d8 f6g6 d3d2
96,290<--2:5 101 11 86998 f1f6 b8d8 f6g6 d3d2 g6g8
96,361<--2:move f1f6
96,361*2*Found move:Rf1-f6
96,522*1*Start calc, move no: 67
96,523-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6
96,523-->1:go wtime 5403 btime 4309 winc 100 binc 100
96,527<--1:info score cp -180 depth 1 nodes 1 time 0 pv e8d7
96,527<--1:info score cp -180 depth 2 nodes 2 time 0 pv e8d7 f6f7
96,527<--1:info score cp -180 depth 3 nodes 3 time 0 pv e8d7 f6f7 d7d6
96,527<--1:info score cp -180 depth 4 nodes 4 time 0 pv e8d7 f6f7 d7d6 e3e4
96,527<--1:info score cp -180 depth 5 nodes 5 time 0 pv e8d7 f6f7 d7d6 e3e4 a7a6
96,528<--1:info score cp -180 depth 6 nodes 6 time 0 pv e8d7 f6f7 d7d6 e3e4 a7a6 f7f6
96,584<--1:info score cp -185 depth 7 nodes 78761 time 61 pv e8d7 f6f7 d7d6 f7a7 b8e8 e3e4 e8e4
96,718<--1:bestmove e8d7
96,718*1*Found move:Ke8-d7
96,875*2*Start calc, move no: 68
97,116-->2:time 541
97,116-->2:otim 412
97,116-->2:e8d7
97,120<--2:1 105 0 31 f6g6
97,120<--2:2 138 0 291 f6f7 d7d6 f7a7
97,120<--2:3 128 0 1727 f6f7 d7d6 f7a7 d6d5
97,133<--2:4 136 1 9765 f6f7 d7d6 f7a7 d3d2 c3d2 b8b2
97,214<--2:5 136 9 63023 f6f7 d7e6 f7a7 d3d2 c3d2 b8b2
97,297<--2:move f6g6
97,297*2*Found move:Rf6xg6
97,453*1*Start calc, move no: 69
97,453-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6
97,453-->1:go wtime 5227 btime 4119 winc 100 binc 100
97,456<--1:info score cp -185 depth 1 nodes 1 time 0 pv b8e8
97,456<--1:info score cp -185 depth 2 nodes 2 time 0 pv b8e8 g6c6
97,456<--1:info score cp -185 depth 3 nodes 3 time 0 pv b8e8 g6c6 d7c6
97,457<--1:info score cp -185 depth 4 nodes 4 time 0 pv b8e8 g6c6 d7c6 e3e4
97,457<--1:info score cp -185 depth 5 nodes 5 time 0 pv b8e8 g6c6 d7c6 e3e4 e8e4
97,500<--1:info score cp -195 depth 6 nodes 55853 time 47 pv b8e8 g1f2 e8e6 g6g7 e6e7 g7e7
97,641<--1:bestmove b8e8
97,641*1*Found move:Rb8-e8
97,796*2*Start calc, move no: 70
98,037-->2:time 523
98,037-->2:otim 394
98,037-->2:b8e8
98,039<--2:1 125 0 43 g6g7
98,041<--2:2 133 0 260 g6g7 e8e7 e3e4 e7g7 c3g7
98,042<--2:3 138 0 1582 g6g7 e8e7 g7e7 d7e7 e3e4
98,052<--2:4 145 1 8296 g1f2 e8f8 f2g3 f8e8 g6g7
98,104<--2:5 158 6 46535 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 e3e4
98,211<--2:move g1f2
98,211*2*Found move:Kg1-f2
98,366*1*Start calc, move no: 71
98,366-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2
98,366-->1:go wtime 5058 btime 3936 winc 100 binc 100
98,373<--1:info score cp -200 depth 1 nodes 1 time 0 pv a7a6
98,373<--1:info score cp -200 depth 2 nodes 2 time 0 pv a7a6 f2f3
98,373<--1:info score cp -200 depth 3 nodes 3 time 0 pv a7a6 f2f3 e8e6
98,373<--1:info score cp -200 depth 4 nodes 4 time 0 pv a7a6 f2f3 e8e6 g6g7
98,373<--1:info score cp -200 depth 5 nodes 5 time 0 pv a7a6 f2f3 e8e6 g6g7 e6e7
98,450<--1:info score cp -240 depth 6 nodes 103406 time 83 pv e8e6 g6g7 e6e7 g7e7 d7e7 c3f6
98,502<--1:info score cp -210 depth 7 nodes 166226 time 135 pv e8e6 g6g7 e6e7 g7e7 d7e7 c3g7 d3d2
98,548<--1:bestmove e8e6
98,548*1*Found move:Re8-e6
98,704*2*Start calc, move no: 72
98,948-->2:time 506
98,948-->2:otim 376
98,948-->2:e8e6
98,951<--2:1 145 0 38 g6g7
98,954<--2:2 153 0 325 g6g7 e6e7 e3e4 e7g7 c3g7
98,956<--2:3 158 0 1359 g6g7 e6e7 g7e7 d7e7 e3e4
98,961<--2:4 153 1 6161 g6g7 e6e7 e3e4 e7g7 c3g7
99,024<--2:5 172 7 42951 g6g7 e6e7 g7e7 d7e7 e3e4 e7d6 e4e5
99,117<--2:move g6g7
99,117*2*Found move:Rg6-g7
99,275*1*Start calc, move no: 73
99,277-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7
99,277-->1:go wtime 4894 btime 3759 winc 100 binc 100
99,279<--1:info score cp -220 depth 1 nodes 1 time 0 pv e6e7
99,279<--1:info score cp -220 depth 2 nodes 2 time 0 pv e6e7 g7e7
99,279<--1:info score cp -220 depth 3 nodes 3 time 0 pv e6e7 g7e7 d7e7
99,279<--1:info score cp -220 depth 4 nodes 4 time 0 pv e6e7 g7e7 d7e7 e3e4
99,279<--1:info score cp -220 depth 5 nodes 5 time 0 pv e6e7 g7e7 d7e7 e3e4 e7d6
99,279<--1:info score cp -220 depth 6 nodes 6 time 0 pv e6e7 g7e7 d7e7 e3e4 e7d6 f2e3
99,346<--1:info score cp -270 depth 7 nodes 75885 time 69 pv e6e7 g7e7 d7e7 f2f3 c5c4 f3e4 e7d6
99,455<--1:bestmove e6e7
99,455*1*Found move:Re6-e7
99,609*2*Start calc, move no: 74
99,850-->2:time 490
99,850-->2:otim 359
99,850-->2:e6e7
99,852<--2:1 153 0 51 e3e4 e7g7 c3g7
99,854<--2:2 158 0 192 g7e7 d7e7 e3e4
99,854<--2:3 153 0 1048 e3e4 e7g7 c3g7
99,863<--2:4 172 1 5655 g7e7 d7e7 e3e4 e7d6 e4e5
99,901<--2:5 165 5 34341 g7e7 d7e7 e3e4 e7e6 f2e3 c5c4
100,015<--2:move g7e7
100,015*2*Found move:Rg7xe7
100,188*1*Start calc, move no: 75
100,189-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7
100,189-->1:go wtime 4734 btime 3586 winc 100 binc 100
100,192<--1:info score cp -280 depth 1 nodes 1 time 0 pv d7e7
100,192<--1:info score cp -280 depth 2 nodes 2 time 0 pv d7e7 f2f3
100,192<--1:info score cp -280 depth 3 nodes 3 time 0 pv d7e7 f2f3 c5c4
100,193<--1:info score cp -280 depth 4 nodes 4 time 0 pv d7e7 f2f3 c5c4 f3e4
100,193<--1:info score cp -280 depth 5 nodes 5 time 0 pv d7e7 f2f3 c5c4 f3e4 e7d6
100,193<--1:info score cp -280 depth 6 nodes 6 time 0 pv d7e7 f2f3 c5c4 f3e4 e7d6 e4d4
100,193<--1:info score cp -280 depth 7 nodes 7 time 0 pv d7e7 f2f3 c5c4 f3e4 e7d6 e4d4 d6e6
100,360<--1:bestmove d7e7
100,360*1*Found move:Kd7xe7
100,512*2*Start calc, move no: 76
100,754-->2:time 474
100,754-->2:otim 342
100,754-->2:d7e7
100,757<--2:1 158 0 23 e3e4
100,757<--2:2 148 0 103 e3e4 e7d6
100,759<--2:3 172 0 570 e3e4 e7d6 e4e5
100,762<--2:4 165 0 2204 e3e4 e7e6 f2e3 c5c4
100,766<--2:5 189 1 10487 e3e4 e7e6 f2e3 c5c4 e4e5
100,807<--2:6 215 5 47006 f2f3 c5c4 f3e4 e7d6 e4d4 c6c5 d4c4
100,913<--2:move f2f3
100,913*2*Found move:Kf2-f3
101,072*1*Start calc, move no: 77
101,072-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3
101,072-->1:go wtime 4580 btime 3420 winc 100 binc 100
101,078<--1:info score cp -285 depth 1 nodes 1 time 0 pv c5c4
101,078<--1:info score cp -285 depth 2 nodes 2 time 0 pv c5c4 a5a6
101,078<--1:info score cp -285 depth 3 nodes 3 time 0 pv c5c4 a5a6 e7d7
101,079<--1:info score cp -285 depth 4 nodes 4 time 0 pv c5c4 a5a6 e7d7 f3e4
101,079<--1:info score cp -285 depth 5 nodes 5 time 0 pv c5c4 a5a6 e7d7 f3e4 d7c7
101,079<--1:info score cp -285 depth 6 nodes 6 time 0 pv c5c4 a5a6 e7d7 f3e4 d7c7 e4d4
101,080<--1:info score cp -285 depth 7 nodes 7 time 0 pv c5c4 a5a6 e7d7 f3e4 d7c7 e4d4 c7d6
101,220<--1:info score cp -280 depth 8 nodes 154717 time 143 pv c5c4 c3d2 a7a6 f3e4 c6c5 e4d5 e7f6 d5c5
101,242<--1:bestmove c5c4
101,242*1*Found move:c5-c4
101,395*2*Start calc, move no: 78
101,636-->2:time 458
101,636-->2:otim 326
101,636-->2:c5c4
101,637<--2:1 165 0 21 e3e4
101,639<--2:2 155 0 146 e3e4 e7d6
101,641<--2:3 179 0 666 e3e4 e7d6 e4e5
101,645<--2:4 215 0 3316 f3e4 e7d6 e4d4 c6c5 d4c4
101,660<--2:5 217 2 14206 f3e4 e7d6 e4d4 a7a6 d4c4
101,750<--2:6 228 11 92079 f3g4 e7f8 g4h5 f8g8 h5g6 g8f8 g6h6
101,789<--2:move f3g4
101,789*2*Found move:Kf3-g4
101,946*1*Start calc, move no: 79
101,946-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4
101,946-->1:go wtime 5432 btime 3255 winc 100 binc 100
101,949<--1:info score cp -280 depth 1 nodes 1 time 0 pv a7a6
101,949<--1:info score cp -280 depth 2 nodes 2 time 0 pv a7a6 c3d2
101,949<--1:info score cp -280 depth 3 nodes 3 time 0 pv a7a6 c3d2 e7d7
101,949<--1:info score cp -280 depth 4 nodes 4 time 0 pv a7a6 c3d2 e7d7 d2c3
101,951<--1:info score cp -280 depth 5 nodes 5 time 1 pv a7a6 c3d2 e7d7 d2c3 c6c5
101,951<--1:info score cp -280 depth 6 nodes 6 time 1 pv a7a6 c3d2 e7d7 d2c3 c6c5 e3e4
102,021<--1:info score cp -275 depth 7 nodes 94358 time 75 pv c6c5 e3e4 e7d7 g4h5 d7e7 h2h4 e7e6
102,107<--1:bestmove c6c5
102,107*1*Found move:c6-c5
102,266*2*Start calc, move no: 80
102,506-->2:time 544
102,506-->2:otim 410
102,506-->2:c6c5
102,509<--2:1 162 0 22 e3e4
102,511<--2:2 195 0 128 g4h5 e7d6 h5h6
102,515<--2:3 195 0 616 g4h5 e7d6 h5h6
102,518<--2:4 232 1 2269 g4h5 e7d6 e3e4 a7a6 h5h6
102,532<--2:5 232 2 11779 g4h5 e7d6 e3e4 a7a6 h5h6
102,595<--2:6 267 8 62598 g4h5 e7f8 h2h4 f8g8 h5g6 g8f8 g6h6
102,689<--2:move g4h5
102,689*2*Found move:Kg4-h5
102,843*1*Start calc, move no: 81
102,843-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4 c6c5 g4h5
102,843-->1:go wtime 5254 btime 4099 winc 100 binc 100
102,847<--1:info score cp -275 depth 1 nodes 1 time 0 pv e7e6
102,847<--1:info score cp -275 depth 2 nodes 2 time 0 pv e7e6 c3e1
102,847<--1:info score cp -275 depth 3 nodes 3 time 0 pv e7e6 c3e1 e6e5
102,847<--1:info score cp -275 depth 4 nodes 4 time 0 pv e7e6 c3e1 e6e5 h5h6
102,847<--1:info score cp -275 depth 5 nodes 5 time 0 pv e7e6 c3e1 e6e5 h5h6 e5e6
102,847<--1:info score cp -275 depth 6 nodes 6 time 0 pv e7e6 c3e1 e6e5 h5h6 e5e6 e3e4
102,877<--1:info score cp -275 depth 7 nodes 33659 time 32 pv e7e6 e3e4 e6d7 h5h6 d3d2 c3d2 d7e6
102,916<--1:info score cp -280 depth 8 nodes 87210 time 73 pv e7e6 e3e4 e6d7 h2h3 d7e7 h5h6 e7e6 h6g6
103,025<--1:info score cp -295 depth 9 nodes 223035 time 181 pv e7e6 e3e4 e6d7 h2h4 d7c6 h5h6 c6d7 h4h5 d7e6
103,034<--1:bestmove e7e6
103,034*1*Found move:Ke7-e6
103,206*2*Start calc, move no: 82
103,449-->2:time 526
103,449-->2:otim 392
103,449-->2:e7e6
103,450<--2:1 195 0 19 h5h6
103,453<--2:2 232 0 106 e3e4 a7a6 h5h6
103,453<--2:3 232 0 435 e3e4 a7a6 h5h6
103,453<--2:4 274 0 1687 e3e4 a7a6 h2h4 e6d6 h5h6
103,461<--2:5 274 1 6113 e3e4 a7a6 h2h4 e6d6 h5h6
103,484<--2:6 274 3 20685 e3e4 a7a6 h2h4 e6f7 h5h6 f7e6
103,550<--2:7 298 10 82609 e3e4 a7a6 h2h4 e6f7 h5h6 f7e6 e4e5
103,625<--2:move e3e4
103,625*2*Found move:e3-e4
103,777*1*Start calc, move no: 83
103,777-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4 c6c5 g4h5 e7e6 e3e4
103,777-->1:go wtime 5083 btime 3913 winc 100 binc 100
103,782<--1:info score cp -295 depth 1 nodes 1 time 0 pv e6d7
103,782<--1:info score cp -295 depth 2 nodes 2 time 0 pv e6d7 h2h4
103,782<--1:info score cp -295 depth 3 nodes 3 time 0 pv e6d7 h2h4 d7c6
103,783<--1:info score cp -295 depth 4 nodes 4 time 0 pv e6d7 h2h4 d7c6 h5h6
103,783<--1:info score cp -295 depth 5 nodes 5 time 0 pv e6d7 h2h4 d7c6 h5h6 c6d7
103,783<--1:info score cp -295 depth 6 nodes 6 time 0 pv e6d7 h2h4 d7c6 h5h6 c6d7 h4h5
103,784<--1:info score cp -295 depth 7 nodes 7 time 1 pv e6d7 h2h4 d7c6 h5h6 c6d7 h4h5 d7e6
103,815<--1:info score cp -305 depth 8 nodes 45353 time 38 pv e6d7 h2h4 d7c6 h5h6 c6d7 h4h5 d7e6 h6g6
103,935<--1:info score cp -310 depth 9 nodes 192547 time 156 pv e6d7 h5h6 d7c6 h6g6 c6d6 g6f6 d6d7 f6e5 d7c6
103,959<--1:bestmove e6d7
103,959*1*Found move:Ke6-d7
104,117*2*Start calc, move no: 84
104,357-->2:time 509
104,357-->2:otim 374
104,357-->2:e6d7
104,359<--2:1 243 0 19 h5h6
104,359<--2:2 275 0 136 h2h4 d7d6 h5h6
104,361<--2:3 275 0 490 h2h4 d7d6 h5h6
104,361<--2:4 289 0 1884 h2h4 d7d6 e4e5 d6d5 h5h6
104,367<--2:5 298 0 7687 h2h4 d7d6 h5h6 a7a6 e4e5
104,390<--2:6 295 3 29563 h2h4 a7a6 h5h6 d7e6 h4h5 e6d6
104,479<--2:7 319 12 121353 h2h4 a7a6 h5h6 d7e6 h4h5 e6d6 e4e5
104,527<--2:move h2h4
104,527*2*Found move:h2-h4
104,692*1*Start calc, move no: 85
104,693-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4 c6c5 g4h5 e7e6 e3e4 e6d7 h2h4
104,693-->1:go wtime 4918 btime 3736 winc 100 binc 100
104,696<--1:info score cp -305 depth 1 nodes 1 time 0 pv d7c6
104,696<--1:info score cp -305 depth 2 nodes 2 time 0 pv d7c6 h5h6
104,696<--1:info score cp -305 depth 3 nodes 3 time 0 pv d7c6 h5h6 c6d7
104,696<--1:info score cp -305 depth 4 nodes 4 time 0 pv d7c6 h5h6 c6d7 h4h5
104,696<--1:info score cp -305 depth 5 nodes 5 time 0 pv d7c6 h5h6 c6d7 h4h5 d7e6
104,696<--1:info score cp -305 depth 6 nodes 6 time 0 pv d7c6 h5h6 c6d7 h4h5 d7e6 h6g6
104,696<--1:info score cp -305 depth 7 nodes 7 time 0 pv d7c6 h5h6 c6d7 h4h5 d7e6 h6g6 e6d6
104,728<--1:info score cp -335 depth 8 nodes 23797 time 35 pv d7c6 h5h6 c6d7 h4h5 d7e6 h6g6 e6d6 h5h6
104,791<--1:info score cp -335 depth 9 nodes 88224 time 99 pv d7c6 h5h6 c6d7 h4h5 d7e6 h6g6 e6d6 h5h6 d6e6
104,871<--1:bestmove d7c6
104,871*1*Found move:Kd7-c6
105,023*2*Start calc, move no: 86
105,263-->2:time 492
105,263-->2:otim 357
105,263-->2:d7c6
105,270<--2:1 285 0 16 h5h6
105,270<--2:2 289 0 91 e4e5 c6d5 h5h6
105,270<--2:3 299 0 365 h5h6 c6d6 e4e5
105,270<--2:4 295 0 1322 h5h6 a7a6 h4h5 c6d6
105,274<--2:5 319 1 4982 h5h6 a7a6 h4h5 c6d6 e4e5
105,292<--2:6 315 2 18290 h5h6 c6d7 h4h5 d7e6 h6g5 a7a6
105,356<--2:7 339 9 75387 h5h6 c6d7 h4h5 d7e6 h6g5 a7a6 e4e5
105,429<--2:move h5h6
105,429*2*Found move:Kh5xh6
105,582*1*Start calc, move no: 87
105,583-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4 c6c5 g4h5 e7e6 e3e4 e6d7 h2h4 d7c6 h5h6
105,583-->1:go wtime 4757 btime 3563 winc 100 binc 100
105,587<--1:info score cp -380 depth 1 nodes 1 time 0 pv c6b5
105,587<--1:info score cp -380 depth 2 nodes 2 time 0 pv c6b5 h4h5
105,587<--1:info score cp -380 depth 3 nodes 3 time 0 pv c6b5 h4h5 b5a4
105,587<--1:info score cp -380 depth 4 nodes 4 time 0 pv c6b5 h4h5 b5a4 h6g6
105,587<--1:info score cp -380 depth 5 nodes 5 time 0 pv c6b5 h4h5 b5a4 h6g6 a4b3
105,587<--1:info score cp -380 depth 6 nodes 6 time 0 pv c6b5 h4h5 b5a4 h6g6 a4b3 h5h6
105,587<--1:info score cp -380 depth 7 nodes 7 time 0 pv c6b5 h4h5 b5a4 h6g6 a4b3 h5h6 d3d2
105,588<--1:info score cp -380 depth 8 nodes 8 time 0 pv c6b5 h4h5 b5a4 h6g6 a4b3 h5h6 d3d2 c3d2
105,731<--1:info score cp -365 depth 9 nodes 199787 time 149 pv c6b5 h6g6 b5a4 g6f5 a4b3 f5e5 b3c2 e5d6 d3d2
105,752<--1:bestmove c6b5
105,752*1*Found move:Kc6-b5
105,907*2*Start calc, move no: 88
106,149-->2:time 476
106,149-->2:otim 340
106,149-->2:c6b5
106,150<--2:1 309 0 19 e4e5
106,153<--2:2 308 0 66 e4e5 a7a6
106,155<--2:3 332 0 478 e4e5 a7a6 e5e6
106,155<--2:4 316 0 1613 h6g5 b5c6 h4h5 c6d6
106,163<--2:5 340 1 7994 h6g5 b5c6 h4h5 c6d6 e4e5
106,186<--2:6 336 3 24254 h6g5 b5c6 h4h5 a7a6 h5h6 c6d6
106,268<--2:7 360 11 104159 h6g5 b5c6 h4h5 a7a6 h5h6 c6d6 e4e5
106,307<--2:move h6g5
106,307*2*Found move:Kh6-g5
106,462*1*Start calc, move no: 89
106,462-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4 c6c5 g4h5 e7e6 e3e4 e6d7 h2h4 d7c6 h5h6 c6b5 h6g5
106,462-->1:go wtime 4604 btime 3399 winc 100 binc 100
106,467<--1:info score cp -365 depth 1 nodes 1 time 0 pv b5a4
106,467<--1:info score cp -365 depth 2 nodes 2 time 0 pv b5a4 c3d2
106,467<--1:info score cp -365 depth 3 nodes 3 time 0 pv b5a4 c3d2 a7a6
106,467<--1:info score cp -365 depth 4 nodes 4 time 0 pv b5a4 c3d2 a7a6 g5g6
106,467<--1:info score cp -365 depth 5 nodes 5 time 0 pv b5a4 c3d2 a7a6 g5g6 a4b3
106,467<--1:info score cp -365 depth 6 nodes 6 time 0 pv b5a4 c3d2 a7a6 g5g6 a4b3 g6h6
106,467<--1:info score cp -365 depth 7 nodes 7 time 0 pv b5a4 c3d2 a7a6 g5g6 a4b3 g6h6 b3b2
106,542<--1:info score cp -430 depth 8 nodes 114540 time 78 pv b5a6 h4h5 a6b7 h5h6 d3d2 c3d2 a7a6 g5g6
106,629<--1:bestmove b5a6
106,629*1*Found move:Kb5-a6
106,782*2*Start calc, move no: 90
107,023-->2:time 461
107,023-->2:otim 324
107,023-->2:b5a6
107,025<--2:1 349 0 20 e4e5
107,027<--2:2 329 0 66 e4e5 a6b5
107,029<--2:3 353 0 508 e4e5 a6b5 e5e6
107,031<--2:4 352 0 1680 e4e5 a6b5 e5e6 a7a6
107,041<--2:5 376 1 8636 e4e5 a6b5 e5e6 a7a6 e6e7
107,071<--2:6 581 4 33741 h4h5 a6b5 h5h6 d3d2 c3d2 a7a6
107,175<--2:move h4h5
107,175*2*Found move:h4-h5
107,338*1*Start calc, move no: 91
107,339-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4 c6c5 g4h5 e7e6 e3e4 e6d7 h2h4 d7c6 h5h6 c6b5 h6g5 b5a6 h4h5
107,339-->1:go wtime 4457 btime 3237 winc 100 binc 100
107,341<--1:info score cp -585 depth 1 nodes 1 time 0 pv a6b7
107,341<--1:info score cp -585 depth 2 nodes 2 time 0 pv a6b7 h5h6
107,341<--1:info score cp -585 depth 3 nodes 3 time 0 pv a6b7 h5h6 d3d2
107,341<--1:info score cp -585 depth 4 nodes 4 time 0 pv a6b7 h5h6 d3d2 c3d2
107,341<--1:info score cp -585 depth 5 nodes 5 time 0 pv a6b7 h5h6 d3d2 c3d2 b7c6
107,341<--1:info score cp -585 depth 6 nodes 6 time 0 pv a6b7 h5h6 d3d2 c3d2 b7c6 h6h7
107,342<--1:info score cp -585 depth 7 nodes 7 time 0 pv a6b7 h5h6 d3d2 c3d2 b7c6 h6h7 c6d6
107,420<--1:info score cp -680 depth 8 nodes 118716 time 80 pv d3d2 c3d2 c4c3 d2c3 a6b5 h5h6 b5c6 h6h7
107,496<--1:bestmove d3d2
107,496*1*Found move:d3-d2
107,654*2*Start calc, move no: 92
107,896-->2:time 446
107,896-->2:otim 309
107,896-->2:d3d2
107,898<--2:1 581 0 19 c3d2
107,899<--2:2 561 0 62 c3d2 a6b5
107,900<--2:3 585 0 413 c3d2 a6b5 e4e5
107,901<--2:4 584 0 1265 c3d2 a6b5 e4e5 a7a6
107,910<--2:5 608 1 5374 c3d2 a6b5 e4e5 a7a6 e5e6
107,927<--2:6 656 3 18375 c3d2 a6b5 h5h6 c4c3 d2c3 b5c4
107,994<--2:7 680 9 69662 c3d2 a6b5 h5h6 c4c3 d2c3 b5c4 e4e5
108,044<--2:move c3d2
108,044*2*Found move:Bc3xd2
108,202*1*Start calc, move no: 93
108,204-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4 c6c5 g4h5 e7e6 e3e4 e6d7 h2h4 d7c6 h5h6 c6b5 h6g5 b5a6 h4h5 d3d2 c3d2
108,204-->1:go wtime 4314 btime 3085 winc 100 binc 100
108,207<--1:info score cp -595 depth 1 nodes 1 time 0 pv a6b5
108,207<--1:info score cp -595 depth 2 nodes 2 time 0 pv a6b5 h5h6
108,207<--1:info score cp -595 depth 3 nodes 3 time 0 pv a6b5 h5h6 b5c6
108,207<--1:info score cp -595 depth 4 nodes 4 time 0 pv a6b5 h5h6 b5c6 g5f5
108,207<--1:info score cp -595 depth 5 nodes 5 time 0 pv a6b5 h5h6 b5c6 g5f5 c6b5
108,207<--1:info score cp -595 depth 6 nodes 6 time 0 pv a6b5 h5h6 b5c6 g5f5 c6b5 h6h7
108,207<--1:info score cp -595 depth 7 nodes 7 time 0 pv a6b5 h5h6 b5c6 g5f5 c6b5 h6h7 b5c6
108,250<--1:info score cp -1395 depth 8 nodes 67155 time 46 pv a6b5 h5h6 b5c6 d2c3 c6c7 h6h7 c7c8 h7h8q
108,346<--1:info score cp -1395 depth 9 nodes 195239 time 141 pv a6b5 h5h6
108,358<--1:bestmove a6b5
108,358*1*Found move:Ka6-b5
108,516*2*Start calc, move no: 94
108,757-->2:time 432
108,757-->2:otim 294
108,757-->2:a6b5
108,760<--2:1 585 0 20 e4e5
108,761<--2:2 584 0 70 e4e5 a7a6
108,763<--2:3 608 0 507 e4e5 a7a6 e5e6
108,763<--2:4 656 0 1648 h5h6 c4c3 d2c3 b5c4
108,770<--2:5 680 1 7891 h5h6 c4c3 d2c3 b5c4 e4e5
108,793<--2:6 1292 3 25202 d2c3 a7a6 h5h6 b5c6 h6h7 c6d6 h7h8q
108,887<--2:7 1292 13 114765 d2c3 a7a6 h5h6 b5c6 h6h7 c6d6 h7h8q
108,900<--2:move d2c3
108,900*2*Found move:Bd2-c3
109,054*1*Start calc, move no: 95
109,054-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4 c6c5 g4h5 e7e6 e3e4 e6d7 h2h4 d7c6 h5h6 c6b5 h6g5 b5a6 h4h5 d3d2 c3d2 a6b5 d2c3
109,054-->1:go wtime 4176 btime 2936 winc 100 binc 100
109,060<--1:info score cp -1395 depth 1 nodes 1 time 0 pv b5c6
109,060<--1:info score cp -1395 depth 2 nodes 2 time 0 pv b5c6 b2b3
109,060<--1:info score cp -1395 depth 3 nodes 3 time 0 pv b5c6 b2b3 c4b3
109,060<--1:info score cp -1395 depth 4 nodes 4 time 0 pv b5c6 b2b3 c4b3 h5h6
109,060<--1:info score cp -1395 depth 5 nodes 5 time 0 pv b5c6 b2b3 c4b3 h5h6 c6b5
109,060<--1:info score cp -1395 depth 6 nodes 6 time 0 pv b5c6 b2b3 c4b3 h5h6 c6b5 c3d2
109,060<--1:info score cp -1395 depth 7 nodes 7 time 0 pv b5c6 b2b3 c4b3 h5h6 c6b5 c3d2 b5a6
109,129<--1:info score cp -1405 depth 8 nodes 102026 time 74 pv b5c6 h5h6 c6c7 g5f5 c7b7 h6h7 b7c8 h7h8q
109,202<--1:bestmove b5c6
109,202*1*Found move:Kb5-c6
109,360*2*Start calc, move no: 96
109,602-->2:time 418
109,602-->2:otim 280
109,602-->2:b5c6
109,607<--2:1 590 0 21 e4e5
109,607<--2:2 577 0 76 h5h6 c6d6
109,607<--2:3 601 0 492 h5h6 c6d6 e4e5
109,607<--2:4 1292 0 1529 h5h6 c6d6 h6h7 a7a6 h7h8q
109,614<--2:5 1292 1 8582 h5h6 a7a6 h6h7 c6d6 h7h8q
109,640<--2:6 1307 3 29344 h5h6 c6d6 h6h7 d6e6 e4e5 e6d5 h7h8q
109,742<--2:move h5h6
109,742*2*Found move:h5-h6
109,900*1*Start calc, move no: 97
109,900-->1:position startpos moves d2d4 d7d5 g1f3 c8f5 e2e3 e7e6 b1c3 b8c6 f1b5 f8d6 b5c6 b7c6 e1g1 g8f6 f3e5 c6c5 c3b5 d8b8 a2a4 d6e5 d4e5 f6g4 f2f4 e8g8 b5c3 c7c6 f1f3 g4e5 f4e5 f5g4 d1f1 g4f3 f1f3 b8e5 a4a5 e5b8 a1a4 f7f5 a4f4 g7g6 f3g3 e6e5 f4f1 d5d4 c3d1 e5e4 g3f2 d4d3 f2d2 b8b4 c2d3 b4d2 c1d2 e4d3 g2g4 f5g4 d1f2 a8b8 d2c3 f8e8 f2g4 h7h6 g4f6 g8f8 f6e8 f8e8 f1f6 e8d7 f6g6 b8e8 g1f2 e8e6 g6g7 e6e7 g7e7 d7e7 f2f3 c5c4 f3g4 c6c5 g4h5 e7e6 e3e4 e6d7 h2h4 d7c6 h5h6 c6b5 h6g5 b5a6 h4h5 d3d2 c3d2 a6b5 d2c3 b5c6 h5h6
109,900-->1:go wtime 4041 btime 2793 winc 100 binc 100
109,902<--1:info score cp -1405 depth 1 nodes 1 time 0 pv c6c7
109,902<--1:info score cp -1405 depth 2 nodes 2 time 0 pv c6c7 h6h7
109,903<--1:info score cp -1405 depth 3 nodes 3 time 0 pv c6c7 h6h7 c7c6
109,903<--1:info score cp -1405 depth 4 nodes 4 time 0 pv c6c7 h6h7 c7c6 h7h8q
109,903<--1:info score cp -1405 depth 5 nodes 5 time 0 pv c6c7 h6h7 c7c6 h7h8q a7a6
109,903<--1:info score cp -1405 depth 6 nodes 6 time 0 pv c6c7 h6h7 c7c6 h7h8q a7a6 h8c8
109,932<--1:info score cp -1445 depth 7 nodes 18446 time 31 pv c6d6 g5f6 a7a6 h6h7 d6c7 h7h8q c7d7
110,036<--1:info score cp -1465 depth 8 nodes 181523 time 134 pv c6d7 e4e5 a7a6 g5f6 d7d8 h6h7 d8d7 h7h8q
110,045<--1:bestmove c6d7
110,045*1*Found move:Kc6-d7
110,207*2*Start calc, move no: 98
110,447-->2:time 405
110,447-->2:otim 266
110,447-->2:c6d7
110,450<--2:1 611 0 21 e4e5
110,452<--2:2 1293 0 93 h6h7 d7e6 h7h8q
110,453<--2:3 1293 0 497 h6h7 d7e6 h7h8q
110,454<--2:4 1307 0 1652 h6h7 d7e6 e4e5 e6d5 h7h8q
110,463<--2:5 1316 1 7663 h6h7 d7e6 h7h8q a7a6 e4e5
110,490<--2:6 1326 4 28643 h6h7 a7a6 h7h8q d7c6 h8a8 c6b5 e4e5
110,583<--2:move h6h7
110,583*2*Found move:h6-h7
110,740********Game end: 1-0 {Arena Adjudication}
110,741********Last game won by Tscp 1.81 with White in 50 moves
110,742********LiSHeX  -  Tscp 1.81:
110,744********   2 W 2    2.0:0.0        0.0:2.0       15:46:45   +13.26    50 6.136 :4.564  0-2-0
110,760********Saving file /home/mkjm/Tournaments/Testing.pgn
110,781-->2:?
110,787<--2:Error (unknown command): ?
110,801-->2:result 1-0
110,801<--2:Error (unknown command): result
111,967********Round 3 of 10: LiSHeX  -  Tscp 1.81
112,020**----------New game---2023-06-13 15:46:46,939 Tue -------------
112,020-->2:new
112,024-->2:post
112,058*1*Start calc, move no: 0
112,058-->1:ucinewgame
112,058-->1:isready
112,058<--1:readyok
112,065-->1:position startpos
112,065-->1:go wtime 10000 btime 10000 winc 100 binc 100
112,070<--1:info score cp 30 depth 1 nodes 21 time 0 pv d2d4
112,075<--1:info score cp 5 depth 2 nodes 86 time 0 pv a2a4 d7d6
112,075<--1:info score cp 22 depth 3 nodes 600 time 0 pv e2e4 c7c6 f1d3
112,076<--1:info score cp 20 depth 4 nodes 2155 time 2 pv e2e4 e7e5 b1c3 b8c6
112,076<--1:info score cp 22 depth 5 nodes 4840 time 4 pv e2e4 c7c6 f1d3
112,136<--1:info score cp 20 depth 6 nodes 32786 time 70 pv e2e4 e7e5 g1f3 g8f6 f3e5 f8d6
112,179<--1:info score cp 22 depth 7 nodes 72993 time 113 pv e2e4 c7c6 f1d3
112,451<--1:bestmove e2e4
112,452*1*Found move:e2-e4
112,581*2*Start calc, move no: 1
112,822-->2:time 1000
112,822-->2:otim 962
112,822-->2:e2e4
112,825<--2:move e7e5
112,825*2*Found move:e7-e5
113,011*1*Start calc, move no: 2
113,011-->1:position startpos moves e2e4 e7e5
113,011-->1:go wtime 9619 btime 10000 winc 100 binc 100
113,014<--1:info score cp 30 depth 1 nodes 34 time 0 pv d2d4
113,015<--1:info score cp 25 depth 2 nodes 64 time 0 pv d2d4 d8h4
113,015<--1:info score cp 25 depth 3 nodes 94 time 0 pv d2d4 d8h4 b1c3
113,015<--1:info score cp 25 depth 4 nodes 124 time 0 pv d2d4 d8h4 b1c3
113,015<--1:info score cp 25 depth 5 nodes 190 time 0 pv d2d4 d8h4 b1c3
113,385<--1:bestmove d2d4
113,385*1*Found move:d2-d4
113,556*2*Start calc, move no: 3
113,799-->2:time 1000
113,799-->2:otim 925
113,799-->2:d2d4
113,800<--2:1 -13 0 46 g8f6
113,801<--2:2 -35 0 596 d7d5 g1f3
113,811<--2:3 -13 1 3384 e5d4 d1d4 g8f6
113,842<--2:4 -13 4 16614 e5d4 d1d4 b8c6 d4c3
114,132<--2:move e5d4
114,132*2*Found move:e5xd4
114,299*1*Start calc, move no: 4
114,301-->1:position startpos moves e2e4 e7e5 d2d4 e5d4
114,301-->1:go wtime 9250 btime 9672 winc 100 binc 100
114,307<--1:info score cp -12 depth 1 nodes 1 time 0 pv d1d4
114,307<--1:info score cp -12 depth 2 nodes 2 time 0 pv d1d4 b8c6
114,307<--1:info score cp -12 depth 3 nodes 3 time 0 pv d1d4 b8c6
114,307<--1:info score cp -12 depth 4 nodes 4 time 0 pv d1d4 b8c6
114,383<--1:info score cp 13 depth 5 nodes 49642 time 76 pv d1d4 b8c6 d4d2 f8d6 f1d3
114,670<--1:bestmove d1d4
114,670*1*Found move:Qd1xd4
114,856*2*Start calc, move no: 5
115,097-->2:time 968
115,097-->2:otim 889
115,097-->2:d1d4
115,104<--2:1 -13 0 65 g8f6
115,104<--2:2 -13 0 486 b8c6 d4d5
115,106<--2:3 22 0 2969 b8c6 d4d5 g8f6
115,167<--2:4 -13 6 24958 b8c6 d4d2 g8f6 b1c3
115,425<--2:move b8c6
115,425*2*Found move:Nb8-c6
115,613*1*Start calc, move no: 6
115,614-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6
115,614-->1:go wtime 8886 btime 9349 winc 100 binc 100
115,620<--1:info score cp -10 depth 1 nodes 1 time 0 pv d4e3
115,620<--1:info score cp -10 depth 2 nodes 2 time 0 pv d4e3 g8f6
115,620<--1:info score cp -10 depth 3 nodes 3 time 0 pv d4e3 g8f6 f1d3
115,621<--1:info score cp -10 depth 4 nodes 4 time 0 pv d4e3 g8f6 f1d3 f8d6
115,736<--1:info score cp 13 depth 5 nodes 114936 time 121 pv d4d2 g8f6 b1c3 f8d6 f1d3
115,975<--1:bestmove d4d2
115,975*1*Found move:Qd4-d2
116,196*2*Start calc, move no: 7
116,438-->2:time 935
116,438-->2:otim 853
116,438-->2:d4d2
116,439<--2:1 22 0 46 g8f6
116,442<--2:2 -13 0 388 g8f6 b1c3
116,457<--2:3 17 1 3476 g8f6 b1c3 d7d6
116,748<--2:4 -13 30 35153 g8f6 b1c3 f8b4 f1d3 b4c3 d2c3
116,752<--2:move g8f6
116,752*2*Found move:Ng8-f6
116,944*1*Start calc, move no: 8
116,946-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6
116,946-->1:go wtime 8530 btime 9040 winc 100 binc 100
116,950<--1:info score cp -12 depth 1 nodes 1 time 0 pv b1c3
116,950<--1:info score cp -12 depth 2 nodes 2 time 0 pv b1c3 f8d6
116,950<--1:info score cp -12 depth 3 nodes 3 time 0 pv b1c3 f8d6 f1d3
116,950<--1:info score cp -12 depth 4 nodes 4 time 0 pv b1c3 f8d6 f1d3 e8g8
117,088<--1:info score cp -10 depth 5 nodes 78898 time 142 pv f1d3 c6b4 e1f1 f8d6 g1f3
117,284<--1:bestmove f1d3
117,284*1*Found move:Bf1-d3
117,449*2*Start calc, move no: 9
117,690-->2:time 904
117,690-->2:otim 820
117,690-->2:f1d3
117,692<--2:1 45 0 38 d7d5
117,694<--2:2 10 0 430 d7d5 b1c3
117,696<--2:3 35 0 2310 d7d5 b1c3 f8c5
117,859<--2:4 15 16 23364 d7d5 e4d5 f6d5 b1c3
117,992<--2:move d7d5
117,992*2*Found move:d7-d5
118,171*1*Start calc, move no: 10
118,171-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5
118,171-->1:go wtime 8197 btime 8743 winc 100 binc 100
118,174<--1:info score cp -22 depth 1 nodes 1 time 0 pv b1c3
118,183<--1:info score cp -22 depth 2 nodes 2 time 0 pv b1c3 c8e6
118,183<--1:info score cp -22 depth 3 nodes 3 time 0 pv b1c3 c8e6 g1f3
118,185<--1:info score cp -22 depth 4 nodes 4 time 0 pv b1c3 c8e6 g1f3 f8d6
118,222<--1:info score cp -10 depth 5 nodes 37661 time 49 pv b1c3 c8e6 e4d5 f6d5 g1f3
118,500<--1:bestmove b1c3
118,500*1*Found move:Nb1-c3
118,691*2*Start calc, move no: 11
118,936-->2:time 875
118,936-->2:otim 788
118,936-->2:b1c3
118,939<--2:1 35 0 169 f8c5
118,943<--2:2 35 0 2208 f8b4 e4d5 b4c3 d2c3 d8d5
118,954<--2:3 44 1 5176 d5d4 c3e2 f8c5
119,046<--2:4 36 10 27219 d5d4 c3e2 f8b4 c2c3
119,228<--2:move f8b4
119,228*2*Found move:Bf8-b4
119,404*1*Start calc, move no: 12
119,404-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4
119,404-->1:go wtime 7873 btime 8456 winc 100 binc 100
119,408<--1:info score cp -25 depth 1 nodes 1 time 0 pv e4d5
119,409<--1:info score cp -25 depth 2 nodes 2 time 0 pv e4d5 c8e6
119,409<--1:info score cp -25 depth 3 nodes 3 time 0 pv e4d5 c8e6 d5e6
119,409<--1:info score cp -25 depth 4 nodes 4 time 0 pv e4d5 c8e6 d5e6 d8d3
119,502<--1:info score cp -15 depth 5 nodes 49522 time 97 pv e4d5 f6d5 g1e2 c6e5 d3e4
119,748<--1:bestmove e4d5
119,748*1*Found move:e4xd5
119,980*2*Start calc, move no: 13
120,220-->2:time 846
120,220-->2:otim 754
120,220-->2:e4d5
120,222<--2:1 35 0 76 b4c3 d2c3 d8d5
120,226<--2:2 35 0 934 b4c3 d2c3 d8d5
120,258<--2:3 65 3 5707 f6d5 g1e2 e8g8
120,510<--2:move d8d5
120,510*2*Found move:Qd8xd5
120,708*1*Start calc, move no: 14
120,709-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5
120,709-->1:go wtime 7534 btime 8171 winc 100 binc 100
120,711<--1:info score cp -30 depth 1 nodes 1 time 0 pv c3d5
120,711<--1:info score cp -30 depth 2 nodes 2 time 0 pv c3d5 b4d2
120,713<--1:info score cp -30 depth 3 nodes 3 time 0 pv c3d5 b4d2 e1d2
120,713<--1:info score cp -30 depth 4 nodes 4 time 0 pv c3d5 b4d2 e1d2 f6d5
120,898<--1:info score cp 35 depth 5 nodes 85162 time 189 pv c3d5 b4d2 c1d2 f6d5 e1c1
121,038<--1:bestmove c3d5
121,038*1*Found move:Nc3xd5
121,257*2*Start calc, move no: 15
121,498-->2:time 818
121,498-->2:otim 721
121,498-->2:c3d5
121,503<--2:1 20 0 49 b4d2 c1d2 f6d5
121,503<--2:2 20 0 280 b4d2 c1d2 f6d5
121,512<--2:3 -31 1 2103 b4d2 c1d2 f6d5 e1c1
121,594<--2:4 5 9 10081 b4d2 c1d2 f6d5 e1c1 e8g8
121,771<--2:move b4d2
121,772*2*Found move:Bb4xd2
121,951*1*Start calc, move no: 16
121,951-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2
121,951-->1:go wtime 7210 btime 7903 winc 100 binc 100
121,957<--1:info score cp 55 depth 1 nodes 1 time 0 pv c1d2
121,962<--1:info score cp 55 depth 2 nodes 2 time 0 pv c1d2 f6d5
121,962<--1:info score cp 55 depth 3 nodes 3 time 0 pv c1d2 f6d5 e1c1
121,963<--1:info score cp 55 depth 4 nodes 4 time 0 pv c1d2 f6d5 e1c1 e8g8
121,993<--1:info score cp 35 depth 5 nodes 34925 time 41 pv c1d2 f6d5 e1c1 c8e6 c2c4
122,054<--1:info score cp 35 depth 6 nodes 84358 time 102 pv c1d2 f6d5 e1c1 c8e6 g1f3 d5b4
122,246<--1:bestmove c1d2
122,246*1*Found move:Bc1xd2
122,419*2*Start calc, move no: 17
122,666-->2:time 791
122,666-->2:otim 692
122,666-->2:c1d2
122,668<--2:1 20 0 36 f6d5
122,670<--2:2 -31 0 168 f6d5 e1c1
122,672<--2:3 5 0 929 f6d5 e1c1 e8g8
122,689<--2:4 -30 2 6791 f6d5 e1c1 e8g8 g1f3
122,793<--2:5 -5 12 37967 f6d5 e1c1 e8g8 g1f3 c8e6
122,930<--2:move f6d5
122,930*2*Found move:Nf6xd5
123,115*1*Start calc, move no: 18
123,116-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5
123,116-->1:go wtime 6920 btime 7644 winc 100 binc 100
123,119<--1:info score cp 35 depth 1 nodes 1 time 0 pv e1c1
123,120<--1:info score cp 35 depth 2 nodes 2 time 0 pv e1c1 c8e6
123,120<--1:info score cp 35 depth 3 nodes 3 time 0 pv e1c1 c8e6 g1f3
123,120<--1:info score cp 35 depth 4 nodes 4 time 0 pv e1c1 c8e6 g1f3 d5b4
123,120<--1:info score cp 35 depth 5 nodes 5 time 0 pv e1c1 c8e6 g1f3 d5b4 d2b4
123,257<--1:info score cp 35 depth 6 nodes 149474 time 141 pv e1c1 c8e6 g1f3 d5b4 d2b4 c6b4
123,397<--1:bestmove e1c1
123,397*1*Found move:O-O-O
123,578*2*Start calc, move no: 19
123,819-->2:time 765
123,819-->2:otim 765
123,819-->2:e1c1
123,821<--2:1 5 0 44 e8g8
123,823<--2:2 -30 0 361 e8g8 g1f3
123,831<--2:3 -5 1 3427 e8g8 g1f3 c8e6
123,900<--2:4 -15 8 21483 e8g8 g1e2 c8e6 h1e1
124,075<--2:move e8g8
124,075*2*Found move:O-O
124,245*1*Start calc, move no: 20
124,246-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8
124,246-->1:go wtime 7644 btime 8393 winc 100 binc 100
124,247<--1:info score cp 25 depth 1 nodes 1 time 0 pv c2c3
124,249<--1:info score cp 25 depth 2 nodes 2 time 0 pv c2c3 f7f5
124,249<--1:info score cp 25 depth 3 nodes 3 time 0 pv c2c3 f7f5 g1f3
124,249<--1:info score cp 25 depth 4 nodes 4 time 0 pv c2c3 f7f5 g1f3 d5c3
124,249<--1:info score cp 25 depth 5 nodes 5 time 0 pv c2c3 f7f5 g1f3 d5c3 b2c3
124,552<--1:bestmove c2c3
124,552*1*Found move:c2-c3
124,734*2*Start calc, move no: 21
124,975-->2:time 840
124,975-->2:otim 735
124,975-->2:c2c3
124,976<--2:1 30 0 41 c8e6
124,977<--2:2 5 0 437 c6e5 d3e4
124,983<--2:3 30 0 2644 c6e5 d3e4 c8e6
125,044<--2:4 4 6 19342 c6e5 d3e4 d5f6 d1e1 f6e4 e1e4
125,256<--2:move c8g4
125,256*2*Found move:Bc8-g4
125,464*1*Start calc, move no: 22
125,464-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4
125,464-->1:go wtime 7343 btime 8117 winc 100 binc 100
125,474<--1:info score cp 20 depth 1 nodes 1 time 0 pv f2f3
125,474<--1:info score cp 20 depth 2 nodes 2 time 0 pv f2f3 d5c3
125,474<--1:info score cp 20 depth 3 nodes 3 time 0 pv f2f3 d5c3 b2c3
125,474<--1:info score cp 20 depth 4 nodes 4 time 0 pv f2f3 d5c3 b2c3 g4f3
125,525<--1:info score cp 30 depth 5 nodes 21911 time 61 pv f2f3 c6e5 d3h7 g8h7 f3g4
125,596<--1:info score cp 35 depth 6 nodes 123671 time 130 pv f2f3 g4d7 c3c4 d5f6 d2f4 a8c8
125,762<--1:bestmove f2f3
125,762*1*Found move:f2-f3
125,931*2*Start calc, move no: 23
126,183-->2:time 812
126,183-->2:otim 705
126,183-->2:f2f3
126,184<--2:1 27 0 168 g4e6
126,186<--2:2 -3 0 410 g4e6 g1e2
126,189<--2:3 12 0 2684 g4e6 g1e2 a8e8
126,214<--2:4 -1 3 13082 g4e6 g1e2 d5b6 b2b3
126,348<--2:5 11 16 90516 g4e6 g1e2 c6e5 e2f4 a8e8 f4e6 e8e6
126,455<--2:move g4e6
126,455*2*Found move:Bg4-e6
126,637*1*Start calc, move no: 24
126,638-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4 f2f3 g4e6
126,638-->1:go wtime 7050 btime 7850 winc 100 binc 100
126,644<--1:info score cp 40 depth 1 nodes 1 time 0 pv c3c4
126,644<--1:info score cp 40 depth 2 nodes 2 time 0 pv c3c4 d5b4
126,644<--1:info score cp 40 depth 3 nodes 3 time 0 pv c3c4 d5b4 d2b4
126,644<--1:info score cp 40 depth 4 nodes 4 time 0 pv c3c4 d5b4 d2b4 c6b4
126,729<--1:info score cp 15 depth 5 nodes 72237 time 85 pv f3f4 a8d8 g1f3 d5f6 d3b1
126,930<--1:bestmove f3f4
126,930*1*Found move:f3-f4
127,107*2*Start calc, move no: 25
127,347-->2:time 785
127,347-->2:otim 677
127,347-->2:f3f4
127,349<--2:1 39 0 61 a8d8
127,352<--2:2 26 0 830 d5b6 b2b3
127,361<--2:3 41 1 3639 d5b6 b2b3 a8d8
127,413<--2:4 48 6 25894 d5b6 c1b1 e6d5 g1f3 d5f3 g2f3
127,610<--2:move d5b6
127,610*2*Found move:Nd5-b6
127,812*1*Start calc, move no: 26
127,813-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4 f2f3 g4e6 f3f4 d5b6
127,813-->1:go wtime 6763 btime 7592 winc 100 binc 100
127,824<--1:info score cp 5 depth 1 nodes 1 time 0 pv c1b1
127,824<--1:info score cp 5 depth 2 nodes 2 time 0 pv c1b1 e6a2
127,824<--1:info score cp 5 depth 3 nodes 3 time 0 pv c1b1 e6a2 b1a2
127,824<--1:info score cp 5 depth 4 nodes 4 time 0 pv c1b1 e6a2 b1a2 c6b4
127,981<--1:info score cp 20 depth 5 nodes 104952 time 167 pv d3e4 e6d5 e4h7 g8h7 c1c2
128,089<--1:bestmove d3e4
128,089*1*Found move:Bd3-e4
128,256*2*Start calc, move no: 27
128,498-->2:time 760
128,498-->2:otim 650
128,498-->2:d3e4
128,503<--2:1 59 0 43 e6a2 e4c6 b7c6
128,503<--2:2 59 0 282 e6a2 e4c6 b7c6
128,507<--2:3 59 0 2079 e6a2 e4c6 b7c6
128,523<--2:4 24 2 9744 e6a2 e4c6 b7c6 g1f3
128,669<--2:5 44 16 69811 e6a2 e4c6 b7c6 g1f3 a2d5
128,760<--2:move e6a2
128,760*2*Found move:Be6xa2
128,990*1*Start calc, move no: 28
128,991-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4 f2f3 g4e6 f3f4 d5b6 d3e4 e6a2
128,991-->1:go wtime 6492 btime 7335 winc 100 binc 100
128,993<--1:info score cp 10 depth 1 nodes 1 time 0 pv e4d3
128,994<--1:info score cp 10 depth 2 nodes 2 time 0 pv e4d3 a8d8
128,994<--1:info score cp 10 depth 3 nodes 3 time 0 pv e4d3 a8d8 d3h7
128,994<--1:info score cp 10 depth 4 nodes 4 time 0 pv e4d3 a8d8 d3h7 g8h7
129,015<--1:info score cp -45 depth 5 nodes 22139 time 23 pv e4c6 b7c6 g1f3 a2d5 h1f1
129,218<--1:info score cp -60 depth 6 nodes 129208 time 226 pv e4c6 b7c6 g1f3 a2d5 h1e1 d5f3
129,265<--1:bestmove e4c6
129,265*1*Found move:Be4xc6
129,518*2*Start calc, move no: 29
129,759-->2:time 734
129,759-->2:otim 623
129,759-->2:e4c6
129,762<--2:1 59 0 29 b7c6
129,764<--2:2 24 0 118 b7c6 g1f3
129,767<--2:3 44 0 997 b7c6 g1f3 a2d5
129,778<--2:4 44 1 4789 b7c6 g1f3 a2d5 h1f1
129,878<--2:5 59 11 29868 b7c6 g1f3 a2d5 h1f1 a8d8
130,008<--2:move b7c6
130,008*2*Found move:b7xc6
130,214*1*Start calc, move no: 30
130,215-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4 f2f3 g4e6 f3f4 d5b6 d3e4 e6a2 e4c6 b7c6
130,215-->1:go wtime 6223 btime 7091 winc 100 binc 100
130,220<--1:info score cp -60 depth 1 nodes 1 time 0 pv g1f3
130,223<--1:info score cp -60 depth 2 nodes 2 time 0 pv g1f3 a2d5
130,223<--1:info score cp -60 depth 3 nodes 3 time 0 pv g1f3 a2d5 f3h4
130,223<--1:info score cp -60 depth 4 nodes 4 time 0 pv g1f3 a2d5 f3h4 a8d8
130,224<--1:info score cp -60 depth 5 nodes 5 time 0 pv g1f3 a2d5 f3h4 a8d8 h1e1
130,282<--1:info score cp -75 depth 6 nodes 28304 time 68 pv g1f3 a2d5 f3h4 a8d8 h1e1 f8e8
130,395<--1:info score cp -75 depth 7 nodes 191754 time 181 pv g1f3 a2d5 h1g1 d5f3 d2e3 f3d1 c1d1
130,473<--1:bestmove g1f3
130,473*1*Found move:Ng1-f3
130,744*2*Start calc, move no: 31
130,986-->2:time 710
130,986-->2:otim 597
130,986-->2:g1f3
130,989<--2:1 44 0 29 a2d5
130,992<--2:2 44 0 245 a2d5 h1f1
130,993<--2:3 59 0 1343 a2d5 h1f1 a8d8
131,045<--2:4 55 5 7520 a2d5 h1f1 a8e8 f4f5
131,223<--2:move a2d5
131,223*2*Found move:Ba2-d5
131,433*1*Start calc, move no: 32
131,433-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4 f2f3 g4e6 f3f4 d5b6 d3e4 e6a2 e4c6 b7c6 g1f3 a2d5
131,433-->1:go wtime 5970 btime 6859 winc 100 binc 100
131,437<--1:info score cp -75 depth 1 nodes 1 time 0 pv h1f1
131,437<--1:info score cp -75 depth 2 nodes 2 time 0 pv h1f1 b6c4
131,437<--1:info score cp -75 depth 3 nodes 3 time 1 pv h1f1 b6c4 b2b3
131,437<--1:info score cp -75 depth 4 nodes 4 time 1 pv h1f1 b6c4 b2b3 c4d2
131,438<--1:info score cp -75 depth 5 nodes 5 time 1 pv h1f1 b6c4 b2b3 c4d2 d1e1
131,438<--1:info score cp -75 depth 6 nodes 6 time 1 pv h1f1 b6c4 b2b3 c4d2 d1e1 d2f1
131,690<--1:bestmove h1f1
131,690*1*Found move:Rh1-f1
131,866*2*Start calc, move no: 33
132,107-->2:time 686
132,107-->2:otim 572
132,107-->2:h1f1
132,109<--2:1 59 0 31 a8d8
132,111<--2:2 55 0 426 a8e8 f4f5
132,115<--2:3 64 0 2128 a8d8 d1e1 b6c4
132,239<--2:4 61 13 21689 b6c4 f4f5 a8b8 b2b4
132,354<--2:move b6c4
132,354*2*Found move:Nb6-c4
132,600*1*Start calc, move no: 34
132,602-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4 f2f3 g4e6 f3f4 d5b6 d3e4 e6a2 e4c6 b7c6 g1f3 a2d5 h1f1 b6c4
132,602-->1:go wtime 5718 btime 6617 winc 100 binc 100
132,606<--1:info score cp -95 depth 1 nodes 1 time 0 pv f1f2
132,606<--1:info score cp -95 depth 2 nodes 2 time 0 pv f1f2 f8b8
132,606<--1:info score cp -95 depth 3 nodes 3 time 0 pv f1f2 f8b8 b2b4
132,606<--1:info score cp -95 depth 4 nodes 4 time 0 pv f1f2 f8b8 b2b4 a7a5
132,606<--1:info score cp -95 depth 5 nodes 5 time 0 pv f1f2 f8b8 b2b4 a7a5 b4a5
132,845<--1:bestmove f1f2
132,845*1*Found move:Rf1-f2
133,112*2*Start calc, move no: 35
133,353-->2:time 662
133,353-->2:otim 548
133,353-->2:f1f2
133,357<--2:1 64 0 54 a8e8
133,358<--2:2 65 0 1139 f8b8 b2b4
133,361<--2:3 80 0 3391 a8b8 b2b4 f8e8
133,446<--2:4 121 9 27738 f8b8 d2e1 d5f3 g2f3
133,574<--2:move f8b8
133,574*2*Found move:Rf8-b8
133,764*1*Start calc, move no: 36
133,765-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4 f2f3 g4e6 f3f4 d5b6 d3e4 e6a2 e4c6 b7c6 g1f3 a2d5 h1f1 b6c4 f1f2 f8b8
133,765-->1:go wtime 5480 btime 6401 winc 100 binc 100
133,769<--1:info score cp -95 depth 1 nodes 1 time 0 pv b2b4
133,769<--1:info score cp -95 depth 2 nodes 2 time 0 pv b2b4 a7a5
133,769<--1:info score cp -95 depth 3 nodes 3 time 0 pv b2b4 a7a5 b4a5
133,769<--1:info score cp -95 depth 4 nodes 4 time 0 pv b2b4 a7a5 b4a5 a8a5
133,800<--1:info score cp -105 depth 5 nodes 25352 time 35 pv b2b4 a7a5 b4a5 c6c5 f2f1
133,862<--1:info score cp -105 depth 6 nodes 66263 time 97 pv b2b4 a7a5 f3e5 c4d2 d1f1 d2f1
133,999<--1:bestmove b2b4
133,999*1*Found move:b2-b4
134,234*2*Start calc, move no: 37
134,477-->2:time 641
134,477-->2:otim 526
134,477-->2:b2b4
134,479<--2:1 70 0 70 b8e8
134,481<--2:2 132 0 1683 a7a5 b4a5 a8a5
134,491<--2:3 132 1 3798 a7a5 b4a5 a8a5
134,532<--2:4 128 5 18974 a7a5 b4a5 f7f6 f3d4 a8a5
134,598<--2:5 138 12 65069 a7a5 b4a5 a8a5 f3e5 a5a2 e5c4 d5c4
134,689<--2:move a7a5
134,689*2*Found move:a7-a5
134,850*1*Start calc, move no: 38
134,850-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4 f2f3 g4e6 f3f4 d5b6 d3e4 e6a2 e4c6 b7c6 g1f3 a2d5 h1f1 b6c4 f1f2 f8b8 b2b4 a7a5
134,850-->1:go wtime 5251 btime 6194 winc 100 binc 100
134,856<--1:info score cp -160 depth 1 nodes 1 time 0 pv d2e1
134,859<--1:info score cp -160 depth 2 nodes 2 time 0 pv d2e1 a5b4
134,859<--1:info score cp -160 depth 3 nodes 3 time 0 pv d2e1 a5b4 c3b4
134,860<--1:info score cp -160 depth 4 nodes 4 time 0 pv d2e1 a5b4 c3b4 a8a1
134,860<--1:info score cp -160 depth 5 nodes 5 time 0 pv d2e1 a5b4 c3b4 a8a1 c1c2
134,976<--1:info score cp -170 depth 6 nodes 82710 time 125 pv b4a5 c4b2 d2e3 b2d1 c1c2 d1f2
135,084<--1:bestmove b4a5
135,084*1*Found move:b4xa5
135,265*2*Start calc, move no: 39
135,505-->2:time 620
135,505-->2:otim 603
135,505-->2:b4a5
135,508<--2:1 132 0 77 a8a5
135,511<--2:2 128 0 1419 f7f6 f3d4 a8a5
135,520<--2:3 138 1 4405 a8a5 f3e5 a5a2 e5c4 d5c4
135,569<--2:4 9997 6 30467 d5e4 f4f5 b8b1
135,572<--2:move d5e4
135,572*2*Found move:Bd5-e4
135,739*1*Start calc, move no: 40
135,739-->1:position startpos moves e2e4 e7e5 d2d4 e5d4 d1d4 b8c6 d4d2 g8f6 f1d3 d7d5 b1c3 f8b4 e4d5 d8d5 c3d5 b4d2 c1d2 f6d5 e1c1 e8g8 c2c3 c8g4 f2f3 g4e6 f3f4 d5b6 d3e4 e6a2 e4c6 b7c6 g1f3 a2d5 h1f1 b6c4 f1f2 f8b8 b2b4 a7a5 b4a5 d5e4
135,739-->1:go wtime 6022 btime 7132 winc 100 binc 100
135,742<--1:info score cp -110 depth 1 nodes 1 time 0 pv f3d4
135,746<--1:info score cp -110 depth 2 nodes 2 time 0 pv f3d4 c4d2
135,746<--1:info score cp -170 depth 3 nodes 2255 time 2 pv d2e1 b8b1
135,748<--1:info score cp -29998 depth 4 nodes 4210 time 3 pv d2e1 b8b1
135,755<--1:info score cp -29998 depth 5 nodes 10550 time 16 pv d2e1 b8b1
135,781<--1:info score cp -29998 depth 6 nodes 48913 time 42 pv d2e1 b8b1
135,925<--1:info score cp -29998 depth 7 nodes 243777 time 185 pv d2e1 b8b1
136,000<--1:bestmove d2e1
136,000*1*Found move:Bd2-e1
136,178*2*Start calc, move no: 41
136,419-->2:time 714
136,419-->2:otim 577
136,419-->2:d2e1
136,421<--2:1 142 0 45 a8a5
136,425<--2:2 9999 0 502 b8b1
136,428<--2:move b8b1
136,428*2*Found move:Rb8-b1
136,574<--2:0-1 {Black mates}
136,589********Game end: 0-1 {Mate}
136,591********Last game won by Tscp 1.81 with Black in 21 moves
136,593********LiSHeX  -  Tscp 1.81:
136,596********   3 B 2    3.0:0.0        0.0:3.0       15:47:11   -99.99    21 5.969 :4.407  0-3-0
136,617********Saving file /home/mkjm/Tournaments/Testing.pgn
136,634-->2:?
136,640<--2:Error (unknown command): ?
136,655-->2:result 0-1
136,658<--2:Error (unknown command): result
137,814********Round 4 of 10: Tscp 1.81  -  LiSHeX
137,871**----------New game---2023-06-13 15:47:12,790 Tue -------------
137,871-->2:new
137,874-->2:post
137,915*2*Start calc, move no: 0
137,917-->2:time 1000
137,917-->2:otim 1000
137,917-->2:white
137,917-->2:go
137,918<--2:move e2e4
137,918*2*Found move:e2-e4
138,071*1*Start calc, move no: 1
138,071-->1:ucinewgame
138,071-->1:isready
138,071<--1:readyok
138,078-->1:position startpos moves e2e4
138,078-->1:go wtime 10000 btime 10000 winc 100 binc 100
138,083<--1:info score cp -22 depth 1 nodes 1 time 0 pv c7c6
138,084<--1:info score cp -22 depth 2 nodes 2 time 0 pv c7c6 b1c3
138,084<--1:info score cp -22 depth 3 nodes 3 time 0 pv c7c6 b1c3
138,084<--1:info score cp -22 depth 4 nodes 4 time 0 pv c7c6 b1c3
138,084<--1:info score cp -22 depth 5 nodes 5 time 0 pv c7c6 b1c3
138,084<--1:info score cp -22 depth 6 nodes 6 time 0 pv c7c6 b1c3
138,451<--1:info score cp -5 depth 7 nodes 424792 time 371 pv e7e5 g1f3 b8c6 d2d4 f8d6 b1c3 e5d4
138,466<--1:bestmove e7e5
138,466*1*Found move:e7-e5
138,619*2*Start calc, move no: 2
138,860-->2:time 1000
138,860-->2:otim 962
138,860-->2:e7e5
138,860<--2:move g1f3
138,860*2*Found move:Ng1-f3
139,015*1*Start calc, move no: 3
139,016-->1:position startpos moves e2e4 e7e5 g1f3
139,016-->1:go wtime 10000 btime 9617 winc 100 binc 100
139,020<--1:info score cp -5 depth 1 nodes 1 time 0 pv b8c6
139,020<--1:info score cp -5 depth 2 nodes 2 time 0 pv b8c6 d2d4
139,020<--1:info score cp -5 depth 3 nodes 3 time 0 pv b8c6 d2d4 f8d6
139,020<--1:info score cp -5 depth 4 nodes 4 time 0 pv b8c6 d2d4 f8d6 c1e3
139,021<--1:info score cp -5 depth 5 nodes 5 time 0 pv b8c6 d2d4 f8d6 c1e3 g8f6
139,387<--1:bestmove b8c6
139,387*1*Found move:Nb8-c6
139,537*2*Start calc, move no: 4
139,777-->2:time 1000
139,777-->2:otim 926
139,777-->2:b8c6
139,779<--2:move f1b5
139,779*2*Found move:Bf1-b5
139,934*1*Start calc, move no: 5
139,934-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5
139,934-->1:go wtime 10000 btime 9251 winc 100 binc 100
139,938<--1:info score cp -23 depth 1 nodes 1 time 0 pv g8f6
139,938<--1:info score cp -23 depth 2 nodes 2 time 0 pv g8f6 b5c6
139,938<--1:info score cp -23 depth 3 nodes 3 time 0 pv g8f6 b5c6 b7c6
139,938<--1:info score cp -23 depth 4 nodes 4 time 0 pv g8f6 b5c6 b7c6 f3e5
139,985<--1:info score cp 0 depth 5 nodes 47716 time 49 pv g8f6 b1c3 f8b4 b5c6 d7c6
140,295<--1:bestmove g8f6
140,295*1*Found move:Ng8-f6
140,453*2*Start calc, move no: 6
140,694-->2:time 1000
140,694-->2:otim 890
140,694-->2:g8f6
140,696<--2:move e1g1
140,696*2*Found move:O-O
140,852*1*Start calc, move no: 7
140,852-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1
140,852-->1:go wtime 10000 btime 8895 winc 100 binc 100
140,855<--1:info score cp -15 depth 1 nodes 1 time 0 pv f8d6
140,855<--1:info score cp -15 depth 2 nodes 2 time 0 pv f8d6 b1c3
140,855<--1:info score cp -15 depth 3 nodes 3 time 0 pv f8d6 b1c3 e8g8
140,855<--1:info score cp -15 depth 4 nodes 4 time 0 pv f8d6 b1c3 e8g8 d2d4
140,896<--1:info score cp 0 depth 5 nodes 51275 time 42 pv a7a6 b5d3 d7d5 b1c3 f8c5
141,190<--1:info score cp -7 depth 6 nodes 300134 time 334 pv f8c5 d2d3 f6e4 d3e4
141,203<--1:bestmove f8c5
141,203*1*Found move:Bf8-c5
141,357*2*Start calc, move no: 8
141,597-->2:time 1000
141,597-->2:otim 855
141,597-->2:f8c5
141,604<--2:1 35 0 125 b1c3
141,604<--2:2 30 0 1589 b1c3 c5d4
141,612<--2:3 27 1 6200 b1c3 f6g4 d1e2 g4f2 f1f2 c5f2 e2f2
141,719<--2:4 10 11 37969 b1c3 f6g4 d2d3 g4f2 f1f2 c5f2 g1f2
141,933<--2:move b1c3
141,933*2*Found move:Nb1-c3
142,091*1*Start calc, move no: 9
142,092-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3
142,092-->1:go wtime 9669 btime 8549 winc 100 binc 100
142,097<--1:info score cp -7 depth 1 nodes 1 time 0 pv c6d4
142,097<--1:info score cp -7 depth 2 nodes 2 time 0 pv c6d4 f3d4
142,097<--1:info score cp -7 depth 3 nodes 3 time 0 pv c6d4 f3d4 e5d4
142,097<--1:info score cp -7 depth 4 nodes 4 time 0 pv c6d4 f3d4 e5d4 b5d7
142,120<--1:info score cp -5 depth 5 nodes 24704 time 28 pv c6d4 b5c4 d7d6 f3d4 c5d4
142,430<--1:bestmove c6d4
142,430*1*Found move:Nc6-d4
142,605*2*Start calc, move no: 10
142,847-->2:time 967
142,847-->2:otim 822
142,847-->2:c6d4
142,849<--2:1 60 0 96 d2d3
142,849<--2:2 59 0 419 d2d3 a7a6
142,854<--2:3 40 0 3457 f3e5 d4b5 c3b5 f6e4
142,873<--2:4 40 2 13688 f3e5 d4b5 c3b5 f6e4
143,074<--2:5 29 22 102532 d2d3 d4f3 d1f3 a7a6 b5c4 e8g8
143,177<--2:move d2d3
143,177*2*Found move:d2-d3
143,343*1*Start calc, move no: 11
143,343-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3
143,344-->1:go wtime 9344 btime 8216 winc 100 binc 100
143,347<--1:info score cp -5 depth 1 nodes 1 time 0 pv d4b5
143,353<--1:info score cp -5 depth 2 nodes 2 time 0 pv d4b5 c3b5
143,354<--1:info score cp -5 depth 3 nodes 3 time 0 pv d4b5 c3b5 c7c6
143,354<--1:info score cp -5 depth 4 nodes 4 time 0 pv d4b5 c3b5 c7c6 f3e5
143,412<--1:info score cp 10 depth 5 nodes 51698 time 68 pv d4b5 c3b5 c7c6 b5c3 d7d6
143,677<--1:bestmove d4b5
143,677*1*Found move:Nd4xb5
143,877*2*Start calc, move no: 12
144,120-->2:time 935
144,120-->2:otim 789
144,120-->2:d4b5
144,120<--2:1 61 0 38 c3b5
144,121<--2:2 31 0 300 c3b5 d7d6
144,128<--2:3 51 0 2106 c3b5 d7d6 c1d2
144,155<--2:4 33 3 11929 c3b5 c7c6 b5c3 d7d6
144,343<--2:5 53 22 76933 c3b5 c7c6 b5c3 d7d6 c1d2
144,432<--2:move c3b5
144,432*2*Found move:Nc3xb5
144,653*1*Start calc, move no: 13
144,654-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5
144,654-->1:go wtime 9037 btime 7888 winc 100 binc 100
144,658<--1:info score cp -15 depth 1 nodes 1 time 0 pv c7c6
144,659<--1:info score cp -15 depth 2 nodes 2 time 0 pv c7c6 b5c3
144,661<--1:info score cp -15 depth 3 nodes 3 time 0 pv c7c6 b5c3 d7d6
144,661<--1:info score cp -15 depth 4 nodes 4 time 0 pv c7c6 b5c3 d7d6 c1e3
144,742<--1:info score cp -17 depth 5 nodes 51214 time 87 pv a7a6 b5c3 c7c6 f3e5 f6e4
144,985<--1:bestmove a7a6
144,985*1*Found move:a7-a6
145,165*2*Start calc, move no: 14
145,406-->2:time 904
145,406-->2:otim 757
145,406-->2:a7a6
145,406<--2:1 65 0 94 b5c3
145,414<--2:2 35 0 402 b5c3 d7d6
145,414<--2:3 55 0 2302 b5c3 d7d6 c1d2
145,465<--2:4 49 5 13699 b5c3 d7d6 d3d4 e5d4 f3d4 c5d4 d1d4
145,710<--2:move b5c3
145,710*2*Found move:Nb5-c3
145,911*1*Start calc, move no: 15
145,911-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3
145,911-->1:go wtime 8738 btime 7562 winc 100 binc 100
145,917<--1:info score cp -22 depth 1 nodes 1 time 0 pv d8e7
145,917<--1:info score cp -22 depth 2 nodes 2 time 0 pv d8e7 c1e3
145,918<--1:info score cp -22 depth 3 nodes 3 time 0 pv d8e7 c1e3 d7d6
145,918<--1:info score cp -22 depth 4 nodes 4 time 0 pv d8e7 c1e3 d7d6 e3c5
146,031<--1:info score cp -25 depth 5 nodes 78832 time 119 pv d7d6 c1e3 c8g4 h2h3 g4f3
146,231<--1:bestmove d7d6
146,231*1*Found move:d7-d6
146,407*2*Start calc, move no: 16
146,660-->2:time 874
146,660-->2:otim 725
146,660-->2:d7d6
146,663<--2:1 55 0 92 c1d2
146,663<--2:2 49 0 764 d3d4 e5d4 f3d4 c5d4 d1d4
146,689<--2:3 49 2 4290 d3d4 e5d4 f3d4 c5d4 d1d4
146,913<--2:4 36 25 51312 c1g5 c8g4 g5f6 d8f6
146,953<--2:move c1g5
146,953*2*Found move:Bc1-g5
147,118*1*Start calc, move no: 17
147,119-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5
147,119-->1:go wtime 8450 btime 7247 winc 100 binc 100
147,123<--1:info score cp -25 depth 1 nodes 1 time 0 pv e8g8
147,123<--1:info score cp -25 depth 2 nodes 2 time 0 pv e8g8 g5f6
147,123<--1:info score cp -25 depth 3 nodes 3 time 0 pv e8g8 g5f6 g7f6
147,157<--1:info score cp -18 depth 4 nodes 20512 time 37 pv c8e6 d3d4 e5d4 f3d4
147,305<--1:info score cp -5 depth 5 nodes 133497 time 186 pv e8g8 c3d5 c8g4 c2c4 g4e6
147,415<--1:bestmove e8g8
147,415*1*Found move:O-O
147,585*2*Start calc, move no: 18
147,826-->2:time 845
147,826-->2:otim 696
147,826-->2:e8g8
147,827<--2:1 37 0 97 d3d4
147,834<--2:2 55 0 1964 c3d5 c8e6 g5f6 g7f6
147,865<--2:3 55 3 8382 c3d5 c8e6 g5f6 g7f6
148,115<--2:move c3d5
148,115*2*Found move:Nc3-d5
148,318*1*Start calc, move no: 19
148,318-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5
148,318-->1:go wtime 9166 btime 6956 winc 100 binc 100
148,322<--1:info score cp -10 depth 1 nodes 1 time 0 pv c8g4
148,322<--1:info score cp -10 depth 2 nodes 2 time 0 pv c8g4 g5f6
148,324<--1:info score cp -10 depth 3 nodes 3 time 0 pv c8g4 g5f6 g7f6
148,324<--1:info score cp -10 depth 4 nodes 4 time 0 pv c8g4 g5f6 g7f6 c2c4
148,416<--1:info score cp -8 depth 5 nodes 114977 time 96 pv c8g4 h2h3 g4e6 h3h4 e6d5
148,614<--1:bestmove c8g4
148,614*1*Found move:Bc8-g4
148,848*2*Start calc, move no: 20
149,090-->2:time 917
149,090-->2:otim 767
149,090-->2:c8g4
149,091<--2:1 60 0 162 g5f6 g7f6
149,101<--2:2 60 0 2402 g5f6 g7f6
149,116<--2:3 57 2 6962 g5f6 g7f6 c2c3 g4f3 d1f3
149,397<--2:move c2c3
149,397*2*Found move:c2-c3
149,640*1*Start calc, move no: 21
149,641-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3
149,641-->1:go wtime 8864 btime 7665 winc 100 binc 100
149,648<--1:info score cp 0 depth 1 nodes 1 time 0 pv c7c6
149,668<--1:info score cp 0 depth 2 nodes 2 time 0 pv c7c6 d5f6
149,669<--1:info score cp 0 depth 3 nodes 3 time 0 pv c7c6 d5f6 g7f6
149,692<--1:info score cp -10 depth 4 nodes 17360 time 50 pv a8c8 g5f6 g7f6 d3d4
149,870<--1:info score cp -12 depth 5 nodes 142493 time 229 pv c7c6 d5f6 g7f6 g5e3 g4e6
149,952<--1:bestmove c7c6
149,952*1*Found move:c7-c6
150,121*2*Start calc, move no: 22
150,361-->2:time 887
150,361-->2:otim 736
150,361-->2:c7c6
150,363<--2:1 68 0 113 g5f6 g7f6
150,365<--2:2 68 0 483 g5f6 g7f6
150,372<--2:3 43 0 3105 g5f6 g7f6 d5e3 c5e3 f2e3 g4f3 f1f3
150,394<--2:4 43 3 15476 g5f6 g7f6 d5e3 c5e3 f2e3 g4f3 f1f3
150,561<--2:5 43 19 93805 g5f6 g7f6 d5e3 c5e3 f2e3 g4f3 f1f3
150,657<--2:move g5f6
150,657*2*Found move:Bg5xf6
150,835*1*Start calc, move no: 23
150,837-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6
150,837-->1:go wtime 8573 btime 7359 winc 100 binc 100
150,839<--1:info score cp -20 depth 1 nodes 1 time 0 pv g7f6
150,839<--1:info score cp -20 depth 2 nodes 2 time 0 pv g7f6 f3e5
150,839<--1:info score cp -20 depth 3 nodes 3 time 0 pv g7f6 f3e5 g4d1
150,839<--1:info score cp -20 depth 4 nodes 4 time 0 pv g7f6 f3e5 g4d1 f1d1
150,900<--1:info score cp -15 depth 5 nodes 90606 time 62 pv g7f6 d5e3 g4e6 d3d4 c5b6
151,097<--1:info score cp -15 depth 6 nodes 307434 time 260 pv g7f6 d5e3 g4h5 d3d4 h5f3 g2f3
151,134<--1:bestmove g7f6
151,134*1*Found move:g7xf6
151,330*2*Start calc, move no: 24
151,571-->2:time 858
151,571-->2:otim 707
151,571-->2:g7f6
151,571<--2:1 43 0 260 d5e3 c5e3 f2e3 g4f3 f1f3
151,574<--2:2 43 0 580 d5e3 c5e3 f2e3 g4f3 f1f3
151,577<--2:3 43 0 2169 d5e3 c5e3 f2e3 g4f3 f1f3
151,590<--2:4 36 1 10202 d5e3 c5e3 f2e3 d6d5 e4d5 c6d5
151,666<--2:5 36 9 52829 d5e3 c5e3 f2e3 d6d5 e4d5 c6d5
151,857<--2:move d5e3
151,857*2*Found move:Nd5-e3
152,028*1*Start calc, move no: 25
152,028-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3
152,028-->1:go wtime 8292 btime 7067 winc 100 binc 100
152,034<--1:info score cp -15 depth 1 nodes 1 time 0 pv g4e6
152,034<--1:info score cp -15 depth 2 nodes 2 time 0 pv g4e6 d3d4
152,034<--1:info score cp -15 depth 3 nodes 3 time 0 pv g4e6 d3d4 c5b6
152,034<--1:info score cp -15 depth 4 nodes 4 time 0 pv g4e6 d3d4 c5b6 c3c4
152,034<--1:info score cp -15 depth 5 nodes 5 time 0 pv g4e6 d3d4 c5b6 c3c4 c6c5
152,134<--1:info score cp -20 depth 6 nodes 129065 time 105 pv g4e6 d3d4 c5b6 f1e1 c6c5 e3d5
152,266<--1:info score cp -15 depth 7 nodes 321183 time 236 pv g4e6 d3d4 c5b6 c3c4 f8e8 f1e1 c6c5
152,316<--1:bestmove g4e6
152,316*1*Found move:Bg4-e6
152,489*2*Start calc, move no: 26
152,732-->2:time 830
152,732-->2:otim 679
152,732-->2:g4e6
152,737<--2:1 76 0 53 d3d4
152,740<--2:2 81 0 449 d3d4 c5b6
152,742<--2:3 84 0 1989 d3d4 c5b6 c3c4
152,777<--2:4 83 4 17379 d3d4 c5b6 c3c4 a6a5
152,874<--2:5 84 14 72020 d3d4 c5b6 b2b3 a6a5 a2a4
153,009<--2:move d3d4
153,009*2*Found move:d3-d4
153,179*1*Start calc, move no: 27
153,179-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4
153,179-->1:go wtime 8020 btime 6784 winc 100 binc 100
153,183<--1:info score cp -15 depth 1 nodes 1 time 0 pv c5b6
153,184<--1:info score cp -15 depth 2 nodes 2 time 0 pv c5b6 c3c4
153,184<--1:info score cp -15 depth 3 nodes 3 time 0 pv c5b6 c3c4 a8c8
153,184<--1:info score cp -15 depth 4 nodes 4 time 0 pv c5b6 c3c4 a8c8 b2b4
153,184<--1:info score cp -15 depth 5 nodes 5 time 0 pv c5b6 c3c4 a8c8 b2b4 f8e8
153,347<--1:info score cp -15 depth 6 nodes 141192 time 166 pv c5b6 f1e1 f6f5 e4f5 e5d4 f5e6
153,459<--1:bestmove c5b6
153,459*1*Found move:Bc5-b6
153,614*2*Start calc, move no: 28
153,855-->2:time 802
153,855-->2:otim 651
153,855-->2:c5b6
153,856<--2:1 84 0 139 c3c4
153,859<--2:2 83 0 1896 c3c4 a6a5
153,873<--2:3 84 1 9895 a2a4 a6a5 b2b3
154,042<--2:4 82 18 81327 c3c4 a6a5 a1b1 a5a4
154,123<--2:move c3c4
154,123*2*Found move:c3-c4
154,327*1*Start calc, move no: 29
154,328-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4
154,328-->1:go wtime 7757 btime 6509 winc 100 binc 100
154,338<--1:info score cp -10 depth 1 nodes 1 time 0 pv a8c8
154,338<--1:info score cp -10 depth 2 nodes 2 time 0 pv a8c8 b2b4
154,338<--1:info score cp -10 depth 3 nodes 3 time 0 pv a8c8 b2b4 f8e8
154,339<--1:info score cp -10 depth 4 nodes 4 time 0 pv a8c8 b2b4 f8e8 f1e1
154,369<--1:info score cp -10 depth 5 nodes 26964 time 42 pv a8c8 a1c1 c6c5 d4d5 e6d7
154,465<--1:info score cp -10 depth 6 nodes 121136 time 138 pv a8c8 d4d5 e6d7 d1d3 b6c5 a1d1
154,597<--1:bestmove a8c8
154,597*1*Found move:Ra8-c8
154,759*2*Start calc, move no: 30
155,000-->2:time 776
155,000-->2:otim 625
155,000-->2:a8c8
155,001<--2:1 84 0 550 a1b1
155,016<--2:2 83 1 4617 a1c1 a6a5
155,034<--2:3 83 3 12215 a1c1 a6a5 c1c2
155,127<--2:4 83 12 59390 a1c1 a6a5 c1c3 d8e8
155,264<--2:move a1c1
155,264*2*Found move:Ra1-c1
155,422*1*Start calc, move no: 31
155,422-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1
155,422-->1:go wtime 7498 btime 6245 winc 100 binc 100
155,430<--1:info score cp -10 depth 1 nodes 1 time 0 pv c6c5
155,430<--1:info score cp -10 depth 2 nodes 2 time 0 pv c6c5 d4d5
155,430<--1:info score cp -10 depth 3 nodes 3 time 0 pv c6c5 d4d5 e6d7
155,431<--1:info score cp -10 depth 4 nodes 4 time 0 pv c6c5 d4d5 e6d7 f1e1
155,431<--1:info score cp -10 depth 5 nodes 5 time 0 pv c6c5 d4d5 e6d7 f1e1 f8e8
155,613<--1:info score cp -15 depth 6 nodes 262001 time 189 pv c8c7 e3f5 f8e8 f5h6 g8h8 f1e1
155,684<--1:bestmove c8c7
155,684*1*Found move:Rc8-c7
155,864*2*Start calc, move no: 32
156,106-->2:time 750
156,106-->2:otim 599
156,106-->2:c8c7
156,108<--2:1 84 0 389 c1c2
156,115<--2:2 83 0 2978 c1c2 a6a5
156,162<--2:3 86 5 12475 a2a3 a6a5 b2b3
156,296<--2:4 83 18 78531 c1c2 d8e8 c2c3 a6a5
156,356<--2:move c1c2
156,356*2*Found move:Rc1-c2
156,520*1*Start calc, move no: 33
156,520-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2
156,520-->1:go wtime 7253 btime 5988 winc 100 binc 100
156,521<--1:info score cp -15 depth 1 nodes 1 time 0 pv c6c5
156,523<--1:info score cp -15 depth 2 nodes 2 time 0 pv c6c5 d4c5
156,523<--1:info score cp -15 depth 3 nodes 3 time 0 pv c6c5 d4c5 d6c5
156,523<--1:info score cp -15 depth 4 nodes 4 time 0 pv c6c5 d4c5 d6c5 d1d8
156,598<--1:info score cp -20 depth 5 nodes 54047 time 77 pv f8e8 c2c1 c6c5 d4c5 d6c5
156,700<--1:info score cp -13 depth 6 nodes 196495 time 178 pv c6c5 d4d5 f8e8 d5e6 f7e6 f3e5
156,771<--1:bestmove c6c5
156,771*1*Found move:c6-c5
156,957*2*Start calc, move no: 34
157,199-->2:time 726
157,199-->2:otim 575
157,199-->2:c6c5
157,199<--2:1 93 0 132 d4d5
157,202<--2:2 98 0 405 d4d5 e6d7
157,205<--2:3 98 0 1625 d4d5 e6d7 c2c3
157,220<--2:4 97 2 7692 d4d5 e6d7 c2c3 a6a5
157,278<--2:5 100 7 46748 d4d5 e6d7 b2b3 a6a5 a2a3
157,442<--2:move d4d5
157,442*2*Found move:d4-d5
157,624*1*Start calc, move no: 35
157,624-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5
157,624-->1:go wtime 7015 btime 5742 winc 100 binc 100
157,625<--1:info score cp -15 depth 1 nodes 1 time 0 pv e6d7
157,625<--1:info score cp -15 depth 2 nodes 2 time 0 pv e6d7 c2e2
157,625<--1:info score cp -15 depth 3 nodes 3 time 0 pv e6d7 c2e2 d8c8
157,625<--1:info score cp -15 depth 4 nodes 4 time 0 pv e6d7 c2e2 d8c8 f1e1
157,625<--1:info score cp -15 depth 5 nodes 5 time 0 pv e6d7 c2e2 d8c8 f1e1 f8e8
157,719<--1:info score cp -20 depth 6 nodes 45731 time 94 pv e6d7 c2e2 d8c8 d1b3 b6a5 f1d1
157,742<--1:info score cp -20 depth 7 nodes 74740 time 117 pv e6d7 c2e2 d8c8 d1d3 c8b8 e3f5 c7c8
157,868<--1:bestmove e6d7
157,868*1*Found move:Be6-d7
158,031*2*Start calc, move no: 36
158,272-->2:time 702
158,272-->2:otim 551
158,272-->2:e6d7
158,277<--2:1 98 0 47 c2c3
158,277<--2:2 97 0 245 c2c3 a6a5
158,277<--2:3 100 0 1897 b2b3 a6a5 a2a3
158,298<--2:4 97 2 12117 c2c3 a6a5 d1b3 c7c8
158,392<--2:5 100 11 72449 c2e2 a6a5 b2b3 d8c8 a2a3
158,506<--2:move c2e2
158,506*2*Found move:Rc2-e2
158,662*1*Start calc, move no: 37
158,662-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2
158,662-->1:go wtime 6786 btime 5503 winc 100 binc 100
158,667<--1:info score cp -20 depth 1 nodes 1 time 0 pv d8c8
158,667<--1:info score cp -20 depth 2 nodes 2 time 0 pv d8c8 d1d3
158,667<--1:info score cp -20 depth 3 nodes 3 time 0 pv d8c8 d1d3 c8b8
158,667<--1:info score cp -20 depth 4 nodes 4 time 0 pv d8c8 d1d3 c8b8 e3f5
158,667<--1:info score cp -20 depth 5 nodes 5 time 0 pv d8c8 d1d3 c8b8 e3f5 b8c8
158,667<--1:info score cp -20 depth 6 nodes 6 time 0 pv d8c8 d1d3 c8b8 e3f5 b8c8 f5d6
158,752<--1:info score cp -20 depth 7 nodes 108760 time 89 pv d8c8 d1d3 c8b8 e3f5 b8c8 f5d6 d7a4
158,898<--1:bestmove d8c8
158,899*1*Found move:Qd8-c8
159,074*2*Start calc, move no: 38
159,315-->2:time 679
159,315-->2:otim 528
159,315-->2:d8c8
159,317<--2:1 98 0 48 e2d2
159,319<--2:2 108 0 640 d1b3 b6a7
159,323<--2:3 108 0 1878 d1b3 b6a7 e2d2
159,340<--2:4 98 2 10074 d1b3 b6a7 b3d3 a7b6
159,457<--2:5 98 14 77149 d1b3 b6a7 b3d3 a7b6 e2d2
159,542<--2:move d1b3
159,542*2*Found move:Qd1-b3
159,733*1*Start calc, move no: 39
159,733-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3
159,734-->1:go wtime 7564 btime 5272 winc 100 binc 100
159,737<--1:info score cp -20 depth 1 nodes 1 time 0 pv b6a5
159,741<--1:info score cp -20 depth 2 nodes 2 time 0 pv b6a5 f1d1
159,741<--1:info score cp -20 depth 3 nodes 3 time 0 pv b6a5 f1d1 a5b4
159,741<--1:info score cp -20 depth 4 nodes 4 time 0 pv b6a5 f1d1 a5b4 b3b4
159,741<--1:info score cp -20 depth 5 nodes 5 time 0 pv b6a5 f1d1 a5b4 b3b4 c5b4
159,745<--1:info score cp -20 depth 6 nodes 6 time 0 pv b6a5 f1d1 a5b4 b3b4 c5b4
159,855<--1:info score cp -20 depth 7 nodes 124537 time 120 pv b6a5 f1d1 a5b4 a2a3 b4a5 d1f1 c8b8
159,962<--1:bestmove b6a5
159,962*1*Found move:Bb6-a5
160,157*2*Start calc, move no: 40
160,397-->2:time 757
160,397-->2:otim 605
160,397-->2:b6a5
160,400<--2:1 108 0 53 b3a3
160,402<--2:2 98 0 409 b3a3 b7b6
160,408<--2:3 98 0 2624 b3a3 b7b6 a3b3
160,468<--2:4 93 7 21398 b3d3 b7b6 e3f5 d7f5 e4f5
160,616<--2:5 93 21 104801 b3d3 b7b6 e3f5 d7f5 e4f5
160,651<--2:move b3d3
160,651*2*Found move:Qb3-d3
160,805*1*Start calc, move no: 41
160,806-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3
160,806-->1:go wtime 7315 btime 6049 winc 100 binc 100
160,810<--1:info score cp -20 depth 1 nodes 1 time 0 pv c8b8
160,810<--1:info score cp -20 depth 2 nodes 2 time 0 pv c8b8 f3e5
160,810<--1:info score cp -20 depth 3 nodes 3 time 0 pv c8b8 f3e5 d6e5
160,817<--1:info score cp -20 depth 4 nodes 11132 time 11 pv h7h6 e3f5 h6h5 f5d6
160,873<--1:info score cp -20 depth 5 nodes 74177 time 67 pv f8e8 e3f5 d7f5 e4f5 a5b4
160,932<--1:info score cp -20 depth 6 nodes 153726 time 126 pv f8e8 e3f5 c8b8 f5d6 e8c8 d6c8
161,058<--1:bestmove f8e8
161,058*1*Found move:Rf8-e8
161,222*2*Start calc, move no: 42
161,464-->2:time 732
161,464-->2:otim 581
161,464-->2:f8e8
161,465<--2:1 108 0 44 d3b3
161,465<--2:2 103 0 389 e3f5 d7f5 e4f5
161,473<--2:3 103 0 2434 e3f5 d7f5 e4f5
161,499<--2:4 95 3 16507 a2a3 d7g4 e3g4 c8g4
161,648<--2:5 95 18 107160 a2a3 b7b6 b2b3 d7g4 e3g4 c8g4
161,710<--2:move a2a3
161,710*2*Found move:a2-a3
161,884*1*Start calc, move no: 43
161,885-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3
161,885-->1:go wtime 7074 btime 5802 winc 100 binc 100
161,887<--1:info score cp -20 depth 1 nodes 1 time 0 pv d7a4
161,889<--1:info score cp -20 depth 2 nodes 2 time 0 pv d7a4 f3e5
161,889<--1:info score cp -20 depth 3 nodes 3 time 0 pv d7a4 f3e5 f6e5
161,900<--1:info score cp -20 depth 4 nodes 9955 time 16 pv d7a4 e3f5 c7d7 f5d6
161,941<--1:info score cp -20 depth 5 nodes 53140 time 55 pv a5b6 e3f5 d7f5 e4f5 c7d7
162,029<--1:info score cp -10 depth 6 nodes 152953 time 144 pv c8b8 e3f5 c7c8 f1c1 c8d8 c1d1
162,130<--1:bestmove c8b8
162,130*1*Found move:Qc8-b8
162,298*2*Start calc, move no: 44
162,539-->2:time 708
162,539-->2:otim 557
162,539-->2:c8b8
162,542<--2:1 111 0 48 b2b3
162,544<--2:2 101 0 228 b2b3 b7b6
162,549<--2:3 101 0 2094 b2b3 b7b6 d3c2
162,580<--2:4 97 3 15662 b2b3 b7b5 d3c2 a5b6
162,724<--2:5 100 18 94409 b2b3 a5b6 d3c2 a6a5 c2d3
162,776<--2:move b2b3
162,776*2*Found move:b2-b3
162,933*1*Start calc, move no: 45
162,935-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3
162,935-->1:go wtime 6842 btime 5562 winc 100 binc 100
162,940<--1:info score cp -15 depth 1 nodes 1 time 0 pv c7c8
162,940<--1:info score cp 0 depth 2 nodes 240 time 0 pv c7c8 f1d1
162,940<--1:info score cp 0 depth 3 nodes 2370 time 2 pv e8d8 f1d1 a5b6
162,947<--1:info score cp -5 depth 4 nodes 9040 time 11 pv e8d8 f1d1 c7c8 e3f5
162,987<--1:info score cp -10 depth 5 nodes 56478 time 52 pv e8d8 e3f5 d7f5 e4f5 c7d7
163,084<--1:info score cp 0 depth 6 nodes 165391 time 149 pv c7c8 e3f5 c8d8 f1d1 a5b6 d3c2
163,172<--1:bestmove c7c8
163,172*1*Found move:Rc7-c8
163,335*2*Start calc, move no: 46
163,577-->2:time 685
163,577-->2:otim 533
163,577-->2:c7c8
163,579<--2:1 111 0 55 d3c2
163,580<--2:2 101 0 239 d3c2 b7b6
163,586<--2:3 101 0 1969 d3c2 b7b6 c2d3
163,633<--2:4 96 5 21175 e3f5 d7f5 e4f5 b7b6
163,807<--2:move e3f5
163,807*2*Found move:Ne3-f5
163,969*1*Start calc, move no: 47
163,969-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5
163,969-->1:go wtime 6617 btime 5330 winc 100 binc 100
163,973<--1:info score cp -5 depth 1 nodes 1 time 0 pv a5b6
163,973<--1:info score cp -5 depth 2 nodes 2 time 0 pv a5b6 f1d1
163,973<--1:info score cp -5 depth 3 nodes 3 time 0 pv a5b6 f1d1 g8h8
163,973<--1:info score cp -5 depth 4 nodes 4 time 0 pv a5b6 f1d1 g8h8 d3c2
163,973<--1:info score cp -5 depth 5 nodes 5 time 0 pv a5b6 f1d1 g8h8 d3c2 c8d8
164,063<--1:info score cp 0 depth 6 nodes 108855 time 93 pv a5c7 d3c2 c8d8 f5h6 g8g7 h6f5
164,201<--1:bestmove a5c7
164,201*1*Found move:Ba5-c7
164,379*2*Start calc, move no: 48
164,620-->2:time 662
164,620-->2:otim 511
164,620-->2:a5c7
164,621<--2:1 101 0 57 f5e3
164,621<--2:2 137 0 334 f5h6 g8f8 h6f5 d7f5 e4f5
164,626<--2:3 102 0 3237 f5h6 g8h8 d3e3 e8e7
164,650<--2:4 117 3 15617 f5h6 g8h8 f1e1 e8e7 h6f5
164,815<--2:5 107 19 119351 f5h6 g8h8 f3d2 e8f8 d3f3 c7d8
164,840<--2:move f5h6
164,840*2*Found move:Nf5-h6
165,002*1*Start calc, move no: 49
165,002-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6
165,002-->1:go wtime 6402 btime 5103 winc 100 binc 100
165,007<--1:info score cp -10 depth 1 nodes 1 time 0 pv g8g7
165,007<--1:info score cp -10 depth 2 nodes 2 time 0 pv g8g7 d3d2
165,007<--1:info score cp -10 depth 3 nodes 3 time 0 pv g8g7 d3d2 g7f8
165,007<--1:info score cp -10 depth 4 nodes 4 time 0 pv g8g7 d3d2 g7f8 h6f5
165,007<--1:info score cp -10 depth 5 nodes 5 time 0 pv g8g7 d3d2 g7f8 h6f5 f8g8
165,224<--1:bestmove g8g7
165,224*1*Found move:Kg8-g7
165,381*2*Start calc, move no: 50
165,622-->2:time 641
165,622-->2:otim 489
165,622-->2:g8g7
165,623<--2:1 137 0 53 h6f5 d7f5 e4f5
165,623<--2:2 124 0 315 d3e3 b7b6
165,628<--2:3 127 0 2362 d3e3 b7b6 h6f5 d7f5 e4f5
165,653<--2:4 118 3 16071 d3e3 e8f8 b3b4 b7b6
165,799<--2:5 121 17 108910 d3e3 e8f8 b3b4 b7b6 h6f5 d7f5 e4f5
165,836<--2:move d3e3
165,836*2*Found move:Qd3-e3
165,999*1*Start calc, move no: 51
165,999-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3
165,999-->1:go wtime 6193 btime 4886 winc 100 binc 100
166,003<--1:info score cp -5 depth 1 nodes 1 time 0 pv g7f8
166,012<--1:info score cp -5 depth 2 nodes 2 time 0 pv g7f8 f3e5
166,012<--1:info score cp -5 depth 3 nodes 3 time 0 pv g7f8 f3e5 f6e5
166,012<--1:info score cp -5 depth 4 nodes 4 time 0 pv g7f8 f3e5 f6e5 h6f7
166,012<--1:info score cp -5 depth 5 nodes 5 time 0 pv g7f8 f3e5 f6e5 h6f7 f8f7
166,215<--1:bestmove g7f8
166,215*1*Found move:Kg7-f8
166,367*2*Start calc, move no: 52
166,608-->2:time 620
166,608-->2:otim 468
166,608-->2:g7f8
166,609<--2:1 137 0 82 h6f5 d7f5 e4f5
166,610<--2:2 118 0 810 b3b4 b7b6
166,617<--2:3 129 0 4601 f1e1 f8e7 h6f5
166,661<--2:4 116 5 30860 f3h4 b7b5 h4f5 b5c4 b3c4
166,814<--2:move f1e1
166,814*2*Found move:Rf1-e1
166,972*1*Start calc, move no: 53
166,973-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1
166,973-->1:go wtime 5992 btime 4675 winc 100 binc 100
166,977<--1:info score cp -5 depth 1 nodes 1 time 0 pv c8d8
166,977<--1:info score cp -5 depth 2 nodes 2 time 0 pv c8d8 f3e5
166,977<--1:info score cp -5 depth 3 nodes 3 time 0 pv c8d8 f3e5 d6e5
166,985<--1:info score cp -5 depth 4 nodes 11143 time 12 pv c8d8 e1d1 b8c8 f3e5
167,007<--1:info score cp -5 depth 5 nodes 32802 time 32 pv c8d8 h6f5 f8g8 e1d1 b8c8
167,050<--1:info score cp -5 depth 6 nodes 83801 time 76 pv c8d8 h6f5 f8g8 e1d1 b8c8 f3e5
167,182<--1:bestmove c8d8
167,182*1*Found move:Rc8-d8
167,388*2*Start calc, move no: 54
167,629-->2:time 600
167,629-->2:otim 448
167,629-->2:c8d8
167,630<--2:1 147 0 79 h6f5 d7f5 e4f5
167,633<--2:2 118 0 820 b3b4 b7b6
167,641<--2:3 129 1 4305 e3d3 f8e7 h6f5
167,708<--2:4 114 7 37813 e2b2 c7b6 e1d1 f8e7
167,832<--2:move b3b4
167,832*2*Found move:b3-b4
167,991*1*Start calc, move no: 55
167,992-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4
167,992-->1:go wtime 5794 btime 4471 winc 100 binc 100
167,997<--1:info score cp -15 depth 1 nodes 1 time 0 pv c5b4
167,997<--1:info score cp -15 depth 2 nodes 2 time 0 pv c5b4 a3b4
167,997<--1:info score cp -15 depth 3 nodes 3 time 0 pv c5b4 a3b4 b8c8
167,997<--1:info score cp -15 depth 4 nodes 4 time 0 pv c5b4 a3b4 b8c8 f3e5
167,997<--1:info score cp -15 depth 5 nodes 5 time 0 pv c5b4 a3b4 b8c8 f3e5 f6e5
168,115<--1:info score cp -5 depth 6 nodes 151421 time 122 pv c7b6 h6f5 f8g8 e3h6 c5b4 a3b4
168,192<--1:bestmove c7b6
168,192*1*Found move:Bc7-b6
168,346*2*Start calc, move no: 56
168,588-->2:time 580
168,588-->2:otim 428
168,588-->2:c7b6
168,589<--2:1 128 0 247 e3d3
168,594<--2:2 108 0 2184 e3d3 f8e7
168,602<--2:3 123 1 5773 e3d3 f8e7 h6f5
168,673<--2:4 108 8 38782 e3d3 b8c7 d3c3 f8e7
168,781<--2:move e3d3
168,781*2*Found move:Qe3-d3
168,935*1*Start calc, move no: 57
168,936-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3
168,936-->1:go wtime 5606 btime 4276 winc 100 binc 100
168,945<--1:info score cp 0 depth 1 nodes 1 time 0 pv b6a7
168,945<--1:info score cp -5 depth 2 nodes 326 time 1 pv c5b4 a3b4
168,945<--1:info score cp 0 depth 3 nodes 1583 time 2 pv b6a7 h6f5 f8g8
168,954<--1:info score cp -2 depth 4 nodes 12350 time 18 pv b8c7 d3b3 c5b4 a3b4
168,979<--1:info score cp 0 depth 5 nodes 36672 time 41 pv b8c7 d3b3 b6a7 h6f5 f8g8
169,023<--1:info score cp 0 depth 6 nodes 89400 time 86 pv b8c7 h6f5 d7f5 e4f5 f8g7 b4c5
169,130<--1:bestmove b8c7
169,130*1*Found move:Qb8-c7
169,293*2*Start calc, move no: 58
169,533-->2:time 561
169,533-->2:otim 409
169,533-->2:b8c7
169,537<--2:1 141 0 121 h6f5 d7f5 e4f5
169,539<--2:2 108 0 1317 d3c3 f8e7
169,546<--2:3 123 0 5347 d3c3 f8e7 h6f5
169,666<--2:4 114 12 36774 e2b2 f8e7 h6f5 d7f5 e4f5
169,724<--2:move e2b2
169,724*2*Found move:Re2-b2
169,891*1*Start calc, move no: 59
169,892-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2
169,892-->1:go wtime 6420 btime 4087 winc 100 binc 100
169,896<--1:info score cp 0 depth 1 nodes 1 time 0 pv c7c8
169,897<--1:info score cp 0 depth 2 nodes 2 time 0 pv c7c8 b4c5
169,897<--1:info score cp 0 depth 3 nodes 3 time 0 pv c7c8 b4c5 b6c5
169,909<--1:info score cp 3 depth 4 nodes 15129 time 17 pv c5b4 h6f5 b4a3 b2b6
169,939<--1:info score cp 3 depth 5 nodes 48059 time 47 pv c5b4 h6f5 b4a3 b2b6 c7b6
170,047<--1:info score cp 8 depth 6 nodes 173412 time 155 pv c5b4 a3b4 d8c8 b2c2 d7b5 e1c1
170,079<--1:bestmove c5b4
170,080*1*Found move:c5xb4
170,262*2*Start calc, move no: 60
170,502-->2:time 642
170,502-->2:otim 491
170,502-->2:c5b4
170,503<--2:1 141 0 53 a3b4
170,503<--2:2 121 0 354 a3b4 f8e7
170,510<--2:3 131 0 3032 a3b4 f8e7 b2a2
170,551<--2:4 111 4 24907 a3b4 d8c8 b2c2 f8e7
170,717<--2:move a3b4
170,717*2*Found move:a3xb4
170,892*1*Start calc, move no: 61
170,892-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4
170,892-->1:go wtime 6210 btime 4905 winc 100 binc 100
170,897<--1:info score cp 8 depth 1 nodes 1 time 0 pv d8c8
170,897<--1:info score cp 8 depth 2 nodes 2 time 0 pv d8c8 b2c2
170,897<--1:info score cp 8 depth 3 nodes 3 time 0 pv d8c8 b2c2 d7b5
170,897<--1:info score cp 8 depth 4 nodes 4 time 0 pv d8c8 b2c2 d7b5 e1c1
170,897<--1:info score cp 8 depth 5 nodes 5 time 0 pv d8c8 b2c2 d7b5 e1c1 b5d7
171,109<--1:bestmove d8c8
171,109*1*Found move:Rd8-c8
171,287*2*Start calc, move no: 62
171,529-->2:time 621
171,529-->2:otim 470
171,529-->2:d8c8
171,530<--2:1 131 0 464 b2c2
171,540<--2:2 111 1 2669 b2c2 f8e7
171,558<--2:3 121 2 8317 b2c2 f8e7 e1a1
171,703<--2:4 105 17 63260 b2c2 e8d8 e1a1 f8e8
171,741<--2:move b2c2
171,742*2*Found move:Rb2-c2
171,900*1*Start calc, move no: 63
171,900-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2
171,900-->1:go wtime 6003 btime 4693 winc 100 binc 100
171,906<--1:info score cp 0 depth 1 nodes 1 time 0 pv d7a4
171,906<--1:info score cp 0 depth 2 nodes 2 time 0 pv d7a4 c2a2
171,906<--1:info score cp 0 depth 3 nodes 3 time 0 pv d7a4 c2a2 a4d7
171,906<--1:info score cp 0 depth 4 nodes 4 time 0 pv d7a4 c2a2 a4d7 a2c2
172,003<--1:info score cp 0 depth 5 nodes 58235 time 100 pv d7a4 c2a2 a4d7 a2c2 d7a4
172,112<--1:bestmove d7a4
172,112*1*Found move:Bd7-a4
172,292*2*Start calc, move no: 64
172,533-->2:time 601
172,533-->2:otim 449
172,533-->2:d7a4
172,538<--2:1 151 0 344 c2a2
172,541<--2:2 141 0 1007 c2a2 a4d7
172,547<--2:3 141 1 3587 c2a2 a4d7 e1c1
172,584<--2:4 121 5 20768 c2a2 a4d7 e1c1 f8e7
172,734<--2:move c2a2
172,734*2*Found move:Rc2-a2
172,891*1*Start calc, move no: 65
172,892-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2
172,892-->1:go wtime 5807 btime 4486 winc 100 binc 100
172,896<--1:info score cp 3 depth 1 nodes 115 time 0 pv a4d7
172,896<--1:info score cp 0 depth 2 nodes 145 time 0 pv a4d7 a2c2
172,896<--1:info score cp 0 depth 3 nodes 175 time 0 pv a4d7 a2c2 d7a4
172,896<--1:info score cp 0 depth 4 nodes 205 time 0 pv a4d7 a2c2 d7a4 c2c1
172,923<--1:info score cp 0 depth 5 nodes 33744 time 31 pv a4d7 a2c2 d7a4 c2c1 a4d7
172,979<--1:info score cp 0 depth 6 nodes 96649 time 86 pv a4d7 a2c2 d7a4 c2c1 a4d7 d3a3
173,095<--1:bestmove a4d7
173,095*1*Found move:Ba4-d7
173,277*2*Start calc, move no: 66
173,519-->2:time 581
173,519-->2:otim 429
173,519-->2:a4d7
173,522<--2:1 141 0 703 e1c1
173,527<--2:2 121 0 3386 e1c1 f8e7
173,545<--2:3 126 2 10083 f3d2 f8e7 e1a1
173,650<--2:4 108 12 69202 e1c1 e8d8 h6f5 f8g8
173,713<--2:move e1c1
173,713*2*Found move:Re1-c1
173,871*1*Start calc, move no: 67
173,871-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1
173,871-->1:go wtime 5618 btime 4288 winc 100 binc 100
173,874<--1:info score cp 0 depth 1 nodes 1 time 0 pv b6a7
173,874<--1:info score cp 0 depth 2 nodes 2 time 0 pv b6a7 h6f7
173,874<--1:info score cp 0 depth 3 nodes 3 time 0 pv b6a7 h6f7 f8f7
173,897<--1:info score cp 0 depth 4 nodes 24110 time 24 pv b6a7 h6f7 f8f7 f3e5
173,972<--1:info score cp 8 depth 5 nodes 99301 time 100 pv f8g7 d3d2 e8d8 a2c2 g7f8
174,069<--1:bestmove f8g7
174,069*1*Found move:Kf8-g7
174,240*2*Start calc, move no: 68
174,482-->2:time 562
174,482-->2:otim 410
174,482-->2:f8g7
174,485<--2:1 141 0 216 d3d2
174,485<--2:2 131 0 702 d3d2 b6d4
174,491<--2:3 131 0 3871 d3d2 b6d4 a2a3
174,538<--2:4 109 5 25733 d3d2 e8f8 a2a3 g7h8
174,671<--2:move d3d2
174,671*2*Found move:Qd3-d2
174,845*1*Start calc, move no: 69
174,845-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2
174,845-->1:go wtime 5434 btime 4095 winc 100 binc 100
174,851<--1:info score cp -2 depth 1 nodes 1 time 0 pv e8d8
174,851<--1:info score cp -2 depth 2 nodes 2 time 0 pv e8d8 a2c2
174,852<--1:info score cp -2 depth 3 nodes 3 time 0 pv e8d8 a2c2 g7f8
174,852<--1:info score cp -2 depth 4 nodes 4 time 0 pv e8d8 a2c2 g7f8 h6f5
174,942<--1:info score cp -2 depth 5 nodes 106460 time 97 pv g7f8 a2c2 d7a4 d2c3 a4c2
175,034<--1:bestmove g7f8
175,034*1*Found move:Kg7-f8
175,206*2*Start calc, move no: 70
175,448-->2:time 544
175,448-->2:otim 392
175,448-->2:g7f8
175,451<--2:1 141 0 233 a2a3
175,454<--2:2 121 0 1681 a2a3 f8e7
175,473<--2:3 121 2 11727 a2a3 f8e7 a3a2
175,614<--2:4 132 16 86576 a2c2 f8e7 c4c5 d6c5 b4c5
175,629<--2:move a2c2
175,629*2*Found move:Ra2-c2
175,785*1*Start calc, move no: 71
175,786-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2
175,786-->1:go wtime 5258 btime 3911 winc 100 binc 100
175,790<--1:info score cp -2 depth 1 nodes 1 time 0 pv d7a4
175,790<--1:info score cp -2 depth 2 nodes 2 time 0 pv d7a4 d2c3
175,790<--1:info score cp -2 depth 3 nodes 3 time 0 pv d7a4 d2c3 a4c2
175,790<--1:info score cp -2 depth 4 nodes 4 time 0 pv d7a4 d2c3 a4c2 c1c2
175,834<--1:info score cp -12 depth 5 nodes 59297 time 48 pv d7a4 c2c3 c7e7 h6f5 e7c7
175,969<--1:bestmove d7a4
175,969*1*Found move:Bd7-a4
176,127*2*Start calc, move no: 72
176,369-->2:time 526
176,369-->2:otim 374
176,369-->2:d7a4
176,373<--2:1 151 0 234 c2a2
176,375<--2:2 141 0 667 c2a2 a4b5
176,384<--2:3 136 1 4181 c2c3 f8e7 h6f5
176,416<--2:4 146 4 21622 c2c3 f8e7 h6f5 e7d8 c1a1
176,544<--2:move c2c3
176,544*2*Found move:Rc2-c3
176,718*1*Start calc, move no: 73
176,718-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3
176,718-->1:go wtime 5088 btime 3733 winc 100 binc 100
176,722<--1:info score cp -5 depth 1 nodes 1 time 0 pv a4d7
176,722<--1:info score cp -5 depth 2 nodes 2 time 0 pv a4d7 d2d3
176,722<--1:info score cp -5 depth 3 nodes 3 time 0 pv a4d7 d2d3 b6a7
176,724<--1:info score cp -5 depth 4 nodes 4 time 0 pv a4d7 d2d3 b6a7 f3e5
176,900<--1:bestmove a4d7
176,900*1*Found move:Ba4-d7
177,071*2*Start calc, move no: 74
177,311-->2:time 509
177,311-->2:otim 356
177,311-->2:a4d7
177,313<--2:1 141 0 150 c3a3
177,316<--2:2 152 0 973 c4c5 d6c5 b4c5
177,327<--2:3 152 1 5298 c4c5 d6c5 b4c5
177,425<--2:4 168 11 53896 c4c5 d6c5 d5d6 c7d8 b4c5
177,480<--2:move c4c5
177,480*2*Found move:c4-c5
177,636*1*Start calc, move no: 75
177,637-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5
177,637-->1:go wtime 4924 btime 3556 winc 100 binc 100
177,640<--1:info score cp -52 depth 1 nodes 1 time 0 pv d6c5
177,640<--1:info score cp -52 depth 2 nodes 2 time 0 pv d6c5 d5d6
177,640<--1:info score cp -52 depth 3 nodes 3 time 0 pv d6c5 d5d6 c7c6
177,644<--1:info score cp -52 depth 4 nodes 4549 time 7 pv d6c5 d5d6 c7c6 b4c5
177,683<--1:info score cp -52 depth 5 nodes 49499 time 46 pv d6c5 d5d6 c7c6 b4c5 b6a5
177,818<--1:bestmove d6c5
177,818*1*Found move:d6xc5
178,045*2*Start calc, move no: 76
178,291-->2:time 493
178,291-->2:otim 338
178,291-->2:d6c5
178,292<--2:1 152 0 65 b4c5
178,298<--2:2 168 0 2198 d5d6 c7b8 b4c5
178,308<--2:3 168 1 7012 d5d6 c7b8 b4c5
178,362<--2:4 178 7 37614 d5d6 c7b8 b4c5 b6a7
178,456<--2:move d5d6
178,456*2*Found move:d5-d6
178,638*1*Start calc, move no: 77
178,639-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6
178,639-->1:go wtime 4764 btime 3380 winc 100 binc 100
178,643<--1:info score cp 37 depth 1 nodes 1 time 0 pv c7b8
178,643<--1:info score cp 37 depth 2 nodes 2 time 0 pv c7b8 h6f5
178,643<--1:info score cp 37 depth 3 nodes 3 time 0 pv c7b8 h6f5 d7f5
178,643<--1:info score cp 37 depth 4 nodes 4 time 0 pv c7b8 h6f5 d7f5 e4f5
178,714<--1:info score cp 5 depth 5 nodes 85644 time 74 pv c7d8 d2d5 d7e6 d5b7 d8d6
178,803<--1:bestmove c7d8
178,803*1*Found move:Qc7-d8
178,980*2*Start calc, move no: 78
179,222-->2:time 477
179,222-->2:otim 323
179,222-->2:c7d8
179,223<--2:1 168 0 64 b4c5
179,226<--2:2 178 0 863 b4c5 b6a7
179,234<--2:3 81 1 4431 c3c4 c5b4 c4c8 d7c8 d2b4
179,294<--2:4 100 7 28045 d2d5 d7e6 d5b7 c5b4 c3c8 e6c8 b7f7
179,382<--2:move h6f5
179,382*2*Found move:Nh6-f5
179,564*1*Start calc, move no: 79
179,564-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5
179,564-->1:go wtime 5609 btime 3221 winc 100 binc 100
179,570<--1:info score cp -22 depth 1 nodes 1 time 0 pv d7f5
179,570<--1:info score cp -22 depth 2 nodes 2 time 0 pv d7f5 e4f5
179,570<--1:info score cp -22 depth 3 nodes 3 time 0 pv d7f5 e4f5 e5e4
179,570<--1:info score cp -22 depth 4 nodes 4 time 0 pv d7f5 e4f5 e5e4 d6d7
179,663<--1:info score cp -72 depth 5 nodes 67106 time 95 pv d7f5 e4f5 c8c6 b4c5 b6a7
179,727<--1:info score cp -72 depth 6 nodes 105958 time 160 pv d7f5 e4f5 d8d7 b4c5 b6a5 d2h6
179,730<--1:bestmove d7f5
179,730*1*Found move:Bd7xf5
179,909*2*Start calc, move no: 80
180,149-->2:time 561
180,149-->2:otim 406
180,149-->2:d7f5
180,153<--2:1 88 0 52 e4f5
180,156<--2:2 84 0 1083 e4f5 e5e4
180,160<--2:3 108 0 4075 e4f5 e5e4 d6d7
180,209<--2:4 114 5 21400 e4f5 e5e4 d6d7 e4f3 d7c8q d8d2
180,340<--2:move e4f5
180,340*2*Found move:e4xf5
180,493*1*Start calc, move no: 81
180,494-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5
180,494-->1:go wtime 5423 btime 4060 winc 100 binc 100
180,497<--1:info score cp -72 depth 1 nodes 1 time 0 pv d8d7
180,497<--1:info score cp -72 depth 2 nodes 2 time 0 pv d8d7 b4c5
180,497<--1:info score cp -72 depth 3 nodes 3 time 0 pv d8d7 b4c5 b6a5
180,497<--1:info score cp -72 depth 4 nodes 4 time 0 pv d8d7 b4c5 b6a5 d2h6
180,513<--1:info score cp -62 depth 5 nodes 19810 time 19 pv d8d7 b4c5 b6a5 d2h6 f8g8
180,566<--1:info score cp -62 depth 6 nodes 84216 time 71 pv d8d7 b4c5 b6a5 d2h6 f8g8 c3b3
180,681<--1:bestmove d8d7
180,681*1*Found move:Qd8-d7
180,841*2*Start calc, move no: 82
181,082-->2:time 543
181,082-->2:otim 388
181,082-->2:d8d7
181,083<--2:1 161 0 79 b4c5
181,089<--2:2 171 0 784 b4c5 b6a7
181,095<--2:3 171 1 3819 b4c5 b6a7 d2d3
181,121<--2:4 140 3 18031 b4c5 b6d8 d2h6 f8g8 c3b3
181,263<--2:5 136 18 108532 b4c5 b6a5 d2h6 f8g8 c3b3 e5e4
181,265<--2:move b4c5
181,265*2*Found move:b4xc5
181,437*1*Start calc, move no: 83
181,438-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5
181,438-->1:go wtime 5245 btime 3878 winc 100 binc 100
181,450<--1:info score cp -65 depth 1 nodes 1 time 0 pv b6a5
181,450<--1:info score cp -65 depth 2 nodes 2 time 0 pv b6a5 d2h6
181,450<--1:info score cp -65 depth 3 nodes 3 time 0 pv b6a5 d2h6 f8g8
181,450<--1:info score cp -65 depth 4 nodes 4 time 0 pv b6a5 d2h6 f8g8 c3b3
181,450<--1:info score cp -65 depth 5 nodes 5 time 0 pv b6a5 d2h6 f8g8 c3b3 a5d8
181,492<--1:info score cp -60 depth 6 nodes 58005 time 53 pv b6a5 d2h6 f8g8 c3b3 a5d8 h6e3
181,619<--1:bestmove b6a5
181,619*1*Found move:Bb6-a5
181,775*2*Start calc, move no: 84
182,016-->2:time 525
182,016-->2:otim 371
182,016-->2:b6a5
182,017<--2:1 171 0 154 d2h6
182,024<--2:2 140 0 702 d2h6 f8g8 c3b3
182,037<--2:3 136 2 3153 d2h6 f8g8 c3b3 e5e4
182,093<--2:4 140 7 13670 d2h6 f8g8 c3b3 a5d8 h6h5
182,190<--2:move d2h6
182,190*2*Found move:Qd2-h6
182,350*1*Start calc, move no: 85
182,351-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6
182,351-->1:go wtime 5076 btime 3702 winc 100 binc 100
182,356<--1:info score cp -638 depth 1 nodes 1 time 0 pv f8g8
182,358<--1:info score cp -638 depth 2 nodes 2 time 0 pv f8g8 f3e5
182,358<--1:info score cp -638 depth 3 nodes 3 time 0 pv f8g8 f3e5 d7f5
182,358<--1:info score cp -638 depth 4 nodes 4 time 0 pv f8g8 f3e5 d7f5 c3g3
182,358<--1:info score cp -638 depth 5 nodes 5 time 0 pv f8g8 f3e5 d7f5 c3g3 f5g5
182,427<--1:info score cp -715 depth 6 nodes 46025 time 75 pv f8g8 f3e5 a5c3 e5d7 c8d8 c1c3
182,536<--1:bestmove f8g8
182,536*1*Found move:Kf8-g8
182,713*2*Start calc, move no: 86
182,954-->2:time 508
182,954-->2:otim 353
182,954-->2:f8g8
182,959<--2:1 140 0 318 c3b3
182,959<--2:2 136 0 1439 c3b3 e5e4
182,968<--2:3 140 1 4793 c3b3 a5d8 h6e3
183,030<--2:4 119 7 30760 c3b3 a5d8 h6e3 a6a5
183,125<--2:move c3b3
183,125*2*Found move:Rc3-b3
183,280*1*Start calc, move no: 87
183,281-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6 f8g8 c3b3
183,281-->1:go wtime 4910 btime 3522 winc 100 binc 100
183,283<--1:info score cp -65 depth 1 nodes 1 time 0 pv c8c6
183,287<--1:info score cp -65 depth 2 nodes 2 time 0 pv c8c6 b3b2
183,287<--1:info score cp -65 depth 3 nodes 3 time 0 pv c8c6 b3b2 a5d8
183,287<--1:info score cp -65 depth 4 nodes 4 time 0 pv c8c6 b3b2 a5d8 h6e3
183,452<--1:bestmove c8c6
183,452*1*Found move:Rc8-c6
183,608*2*Start calc, move no: 88
183,848-->2:time 491
183,848-->2:otim 336
183,848-->2:c8c6
183,852<--2:1 225 0 82 h6f6
183,858<--2:2 221 0 2441 h6f6 e5e4
183,868<--2:3 226 2 8016 h6f6 e5e4 f3e5
183,945<--2:4 307 9 50954 h6f6 a5d8 f3e5 d8f6 e5d7
184,015<--2:move f3e5
184,015*2*Found move:Nf3xe5
184,198*1*Start calc, move no: 89
184,200-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6 f8g8 c3b3 c8c6 f3e5
184,201-->1:go wtime 4748 btime 3356 winc 100 binc 100
184,202<--1:info score cp -60 depth 1 nodes 1 time 0 pv f6e5
184,204<--1:info score cp -60 depth 2 nodes 2 time 0 pv f6e5 b3b7
184,204<--1:info score cp -60 depth 3 nodes 3 time 0 pv f6e5 b3b7 d7b7
184,220<--1:info score cp -740 depth 4 nodes 19370 time 19 pv d7f5 b3g3 f5g6 g3g6
184,245<--1:info score cp -740 depth 5 nodes 46352 time 43 pv d7f5 b3g3 f5g6 g3g6 f7g6
184,310<--1:info score cp -790 depth 6 nodes 123572 time 109 pv d7f5
184,364<--1:bestmove d7f5
184,364*1*Found move:Qd7xf5
184,522*2*Start calc, move no: 90
184,764-->2:time 475
184,764-->2:otim 320
184,764-->2:d7f5
184,766<--2:1 394 0 58 e5c6 b7c6
184,768<--2:2 394 0 909 e5c6 b7c6
184,780<--2:3 710 1 5630 b3g3 f5g6 g3g6 f7g6 e5c6 b7c6
184,836<--2:4 710 7 32120 b3g3 f5g6 g3g6 f7g6 e5c6 b7c6
184,921<--2:move b3g3
184,921*2*Found move:Rb3-g3
185,084*1*Start calc, move no: 91
185,085-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6 f8g8 c3b3 c8c6 f3e5 d7f5 b3g3
185,085-->1:go wtime 4596 btime 3198 winc 100 binc 100
185,089<--1:info score cp -790 depth 1 nodes 1 time 0 pv f5g6
185,089<--1:info score cp -790 depth 2 nodes 2 time 0 pv f5g6 g3g6
185,089<--1:info score cp -790 depth 3 nodes 3 time 0 pv f5g6 g3g6 f7g6
185,089<--1:info score cp -790 depth 4 nodes 4 time 0 pv f5g6 g3g6 f7g6 e5c6
185,130<--1:info score cp -785 depth 5 nodes 43094 time 45 pv f5g6 g3g6 f7g6 e5c6 b7c6
185,227<--1:info score cp -790 depth 6 nodes 152742 time 142 pv f5g6 e5c6 b7c6 h6f4 a5e1 g3g6
185,245<--1:bestmove f5g6
185,245*1*Found move:Qf5-g6
185,402*2*Start calc, move no: 92
185,643-->2:time 460
185,643-->2:otim 305
185,643-->2:f5g6
185,644<--2:1 710 0 75 g3g6 f7g6 e5c6 b7c6
185,644<--2:2 710 0 592 g3g6 f7g6 e5c6 b7c6
185,650<--2:3 710 0 3302 g3g6 f7g6 e5c6 b7c6
185,687<--2:4 734 4 24796 g3g6 f7g6 e5c6 b7c6 d6d7
185,798<--2:move g3g6
185,798*2*Found move:Rg3xg6
185,950*1*Start calc, move no: 93
185,950-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6 f8g8 c3b3 c8c6 f3e5 d7f5 b3g3 f5g6 g3g6
185,950-->1:go wtime 4446 btime 3043 winc 100 binc 100
185,952<--1:info score cp -785 depth 1 nodes 1 time 0 pv f7g6
185,952<--1:info score cp -785 depth 2 nodes 2 time 0 pv f7g6 e5c6
185,952<--1:info score cp -785 depth 3 nodes 3 time 1 pv f7g6 e5c6 b7c6
185,953<--1:info score cp -785 depth 4 nodes 4 time 1 pv f7g6 e5c6 b7c6 c1a1
185,953<--1:info score cp -785 depth 5 nodes 5 time 1 pv f7g6 e5c6 b7c6 c1a1 e8e1
185,982<--1:info score cp -805 depth 6 nodes 34634 time 33 pv f7g6 e5c6 b7c6 c1a1 e8e1 a1e1
186,103<--1:bestmove f7g6
186,103*1*Found move:f7xg6
186,261*2*Start calc, move no: 94
186,502-->2:time 445
186,502-->2:otim 290
186,502-->2:f7g6
186,503<--2:1 710 0 42 e5c6 b7c6
186,504<--2:2 710 0 390 e5c6 b7c6
186,508<--2:3 734 0 2050 e5c6 b7c6 d6d7
186,531<--2:4 726 2 17896 e5c6 b7c6 c1a1 e8e1 a1e1 a5e1
186,626<--2:5 734 12 83910 e5c6 b7c6 g1f1 a5b4 d6d7
186,651<--2:move e5c6
186,651*2*Found move:Ne5xc6
186,827*1*Start calc, move no: 95
186,828-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6 f8g8 c3b3 c8c6 f3e5 d7f5 b3g3 f5g6 g3g6 f7g6 e5c6
186,828-->1:go wtime 4302 btime 2895 winc 100 binc 100
186,834<--1:info score cp -845 depth 1 nodes 1 time 0 pv b7c6
186,834<--1:info score cp -845 depth 2 nodes 2 time 0 pv b7c6 h6h4
186,834<--1:info score cp -845 depth 3 nodes 3 time 0 pv b7c6 h6h4 f6f5
186,834<--1:info score cp -845 depth 4 nodes 4 time 0 pv b7c6 h6h4 f6f5 h4c4
186,834<--1:info score cp -845 depth 5 nodes 5 time 0 pv b7c6 h6h4 f6f5 h4c4 g8f8
186,834<--1:info score cp -845 depth 6 nodes 6 time 0 pv b7c6 h6h4 f6f5 h4c4 g8f8 c1a1
186,893<--1:info score cp -850 depth 7 nodes 69517 time 62 pv b7c6 h6h4 a5d2 h4c4 g8h8 c1d1 d2g5
186,980<--1:bestmove b7c6
186,980*1*Found move:b7xc6
187,173*2*Start calc, move no: 96
187,415-->2:time 431
187,415-->2:otim 275
187,415-->2:b7c6
187,415<--2:1 734 0 32 d6d7
187,417<--2:2 726 0 531 c1a1 e8e1 a1e1 a5e1
187,423<--2:3 734 0 3037 g1f1 a5b4 d6d7
187,478<--2:4 829 6 21436 h6f4 e8e1 c1e1 a5e1 f4f6
187,553<--2:5 830 13 71460 h6f4 e8b8 f4c4 g8h8 c4a6 a5d2
187,558<--2:move h6f4
187,558*2*Found move:Qh6-f4
187,729*1*Start calc, move no: 97
187,729-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6 f8g8 c3b3 c8c6 f3e5 d7f5 b3g3 f5g6 g3g6 f7g6 e5c6 b7c6 h6f4
187,729-->1:go wtime 4164 btime 2748 winc 100 binc 100
187,732<--1:info score cp -805 depth 1 nodes 1 time 0 pv a5d2
187,732<--1:info score cp -805 depth 2 nodes 2 time 0 pv a5d2 f4d2
187,733<--1:info score cp -805 depth 3 nodes 3 time 0 pv a5d2 f4d2 g8h8
187,739<--1:info score cp -845 depth 4 nodes 7251 time 9 pv e8d8 c1a1 g6g5 f4f6
187,774<--1:info score cp -845 depth 5 nodes 47435 time 44 pv e8e4 f4e4 g8h8 e4c6 a5d2
187,818<--1:info score cp -845 depth 6 nodes 98187 time 87 pv e8e4 f4e4 g8h8 e4c6 a5d2 c6a6
187,874<--1:bestmove e8e4
187,874*1*Found move:Re8-e4
188,056*2*Start calc, move no: 98
188,298-->2:time 417
188,298-->2:otim 261
188,298-->2:e8e4
188,300<--2:1 1225 0 29 f4e4
188,300<--2:2 1215 0 141 f4e4 a5d2
188,300<--2:3 1239 0 812 f4e4 a5d2 d6d7
188,304<--2:4 1394 0 3804 f4e4 a5d2 d6d7 d2c1 d7d8q
188,322<--2:5 1406 2 17153 f4e4 a5d2 e4e6 g8h8 d6d7 d2c1 d7d8q
188,436<--2:6 1529 13 107834 f4e4 a5d2 d6d7 d2a5 e4c6 h7h6 c6a6
188,441<--2:move f4e4
188,441*2*Found move:Qf4xe4
188,602*1*Start calc, move no: 99
188,603-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6 f8g8 c3b3 c8c6 f3e5 d7f5 b3g3 f5g6 g3g6 f7g6 e5c6 b7c6 h6f4 e8e4 f4e4
188,603-->1:go wtime 5026 btime 2608 winc 100 binc 100
188,606<--1:info score cp -1520 depth 1 nodes 1 time 0 pv g8g7
188,606<--1:info score cp -1520 depth 2 nodes 2 time 0 pv g8g7 e4e7
188,606<--1:info score cp -1520 depth 3 nodes 3 time 0 pv g8g7 e4e7 g7h6
188,606<--1:info score cp -1520 depth 4 nodes 4 time 0 pv g8g7 e4e7 g7h6 e7f8
188,606<--1:info score cp -1520 depth 5 nodes 5 time 0 pv g8g7 e4e7 g7h6 e7f8 h6g5
188,673<--1:info score cp -1545 depth 6 nodes 91378 time 69 pv f6f5 e4e6 g8h8 e6c8 h8g7 c8a6
188,741<--1:bestmove f6f5
188,741*1*Found move:f6-f5
188,914*2*Start calc, move no: 100
189,155-->2:time 503
189,155-->2:otim 348
189,155-->2:f6f5
189,156<--2:1 1387 0 39 e4c6
189,156<--2:2 1414 0 308 e4e8 g8g7 e8c6
189,161<--2:3 1414 0 3217 e4e8 g8g7 c1b1 a5c3 e8c6
189,179<--2:4 1532 2 16790 e4c6 a5b4 d6d7 b4a5 c6a6
189,276<--2:5 1545 12 95931 e4c6 h7h6 c6c8 g8f7 d6d7 f7e7 c8a6
189,323<--2:move e4c6
189,323*2*Found move:Qe4xc6
189,486*1*Start calc, move no: 101
189,486-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6 f8g8 c3b3 c8c6 f3e5 d7f5 b3g3 f5g6 g3g6 f7g6 e5c6 b7c6 h6f4 e8e4 f4e4 f6f5 e4c6
189,486-->1:go wtime 4863 btime 3475 winc 100 binc 100
189,490<--1:info score cp -1030 depth 1 nodes 1 time 0 pv a5d2
189,490<--1:info score cp -1030 depth 2 nodes 2 time 0 pv a5d2 c1a1
189,490<--1:info score cp -1030 depth 3 nodes 3 time 0 pv a5d2 c1a1 d2e1
189,498<--1:info score cp -1545 depth 4 nodes 10734 time 11 pv g6g5 c6d5 g8g7 d5f5
189,521<--1:info score cp -1585 depth 5 nodes 40705 time 34 pv g8g7 d6d7 a5d8 c6a6 g7g8
189,604<--1:info score cp -1630 depth 6 nodes 153951 time 117 pv g8g7 c6a4 a5d2 a4d4 g7h6 d4h4
189,652<--1:bestmove g8g7
189,652*1*Found move:Kg8-g7
189,857*2*Start calc, move no: 102
190,098-->2:time 487
190,098-->2:otim 332
190,098-->2:g8g7
190,102<--2:1 1535 0 31 c6a6
190,102<--2:2 1535 0 618 c1a1 a5c3 a1a6
190,105<--2:3 1549 0 3691 c6a6 a5b4 d6d7
190,142<--2:4 1677 4 27572 c6a4 a5d8 a4d7 g7g8 d7d8
190,260<--2:move c6a4
190,260*2*Found move:Qc6-a4
190,439*1*Start calc, move no: 103
190,440-->1:position startpos moves e2e4 e7e5 g1f3 b8c6 f1b5 g8f6 e1g1 f8c5 b1c3 c6d4 d2d3 d4b5 c3b5 a7a6 b5c3 d7d6 c1g5 e8g8 c3d5 c8g4 c2c3 c7c6 g5f6 g7f6 d5e3 g4e6 d3d4 c5b6 c3c4 a8c8 a1c1 c8c7 c1c2 c6c5 d4d5 e6d7 c2e2 d8c8 d1b3 b6a5 b3d3 f8e8 a2a3 c8b8 b2b3 c7c8 e3f5 a5c7 f5h6 g8g7 d3e3 g7f8 f1e1 c8d8 b3b4 c7b6 e3d3 b8c7 e2b2 c5b4 a3b4 d8c8 b2c2 d7a4 c2a2 a4d7 e1c1 f8g7 d3d2 g7f8 a2c2 d7a4 c2c3 a4d7 c4c5 d6c5 d5d6 c7d8 h6f5 d7f5 e4f5 d8d7 b4c5 b6a5 d2h6 f8g8 c3b3 c8c6 f3e5 d7f5 b3g3 f5g6 g3g6 f7g6 e5c6 b7c6 h6f4 e8e4 f4e4 f6f5 e4c6 g8g7 c6a4
190,440-->1:go wtime 4706 btime 3314 winc 100 binc 100
190,443<--1:info score cp -1615 depth 1 nodes 1 time 0 pv a5d8
190,444<--1:info score cp -1615 depth 2 nodes 2 time 0 pv a5d8 a4d7
190,444<--1:info score cp -1615 depth 3 nodes 3 time 0 pv a5d8 a4d7 g7f8
190,444<--1:info score cp -1615 depth 4 nodes 4 time 0 pv a5d8 a4d7 g7f8 d7f5
190,444<--1:info score cp -1615 depth 5 nodes 5 time 1 pv a5d8 a4d7 g7f8 d7f5 g6f5
190,485<--1:info score cp -1645 depth 6 nodes 52371 time 45 pv a5d8 a4d7 g7h6 d7g7 h6h5 g7h7
190,601<--1:bestmove a5d8
190,601*1*Found move:Ba5-d8
190,788********Game end: 1-0 {Arena Adjudication}
190,789********Last game won by Tscp 1.81 with White in 52 moves
190,791********LiSHeX  -  Tscp 1.81:
190,793********   4 W 2    4.0:0.0        0.0:4.0       15:48:05   +16.45    52 5.830 :4.353  0-4-0
190,819********Saving file /home/mkjm/Tournaments/Testing.pgn
190,842-->2:?
190,846<--2:Error (unknown command): ?
190,864-->2:result 1-0
190,864<--2:Error (unknown command): result
192,021********Round 5 of 10: LiSHeX  -  Tscp 1.81
192,111**----------New game---2023-06-13 15:48:07,031 Tue -------------
192,111-->2:new
192,121-->2:post
192,161*1*Start calc, move no: 0
192,163-->1:ucinewgame
192,163-->1:isready
192,163<--1:readyok
192,170-->1:position startpos
192,170-->1:go wtime 10000 btime 10000 winc 100 binc 100
192,173<--1:info score cp 30 depth 1 nodes 21 time 0 pv d2d4
192,179<--1:info score cp 22 depth 2 nodes 49 time 0 pv d2d4 e7e6
192,179<--1:info score cp 22 depth 3 nodes 389 time 0 pv d2d4 e7e6 e2e3
192,179<--1:info score cp 22 depth 4 nodes 814 time 1 pv d2d4 e7e6 e2e3 f8b4
192,179<--1:info score cp 22 depth 5 nodes 844 time 1 pv d2d4 e7e6 e2e3 f8b4
192,189<--1:info score cp 22 depth 6 nodes 13322 time 18 pv d2d4 e7e6 e2e3 f8b4
192,192<--1:info score cp 22 depth 7 nodes 13851 time 18 pv d2d4 e7e6 e2e3 f8b4
192,558<--1:bestmove d2d4
192,558*1*Found move:d2-d4
192,708*2*Start calc, move no: 1
192,948-->2:time 1000
192,948-->2:otim 962
192,948-->2:d2d4
192,950<--2:move g8f6
192,950*2*Found move:Ng8-f6
193,101*1*Start calc, move no: 2
193,103-->1:position startpos moves d2d4 g8f6
193,103-->1:go wtime 9617 btime 10000 winc 100 binc 100
193,107<--1:info score cp 2 depth 1 nodes 1 time 0 pv c1e3
193,107<--1:info score cp 2 depth 2 nodes 2 time 0 pv c1e3 f6g8
193,107<--1:info score cp 2 depth 3 nodes 3 time 0 pv c1e3 f6g8
193,107<--1:info score cp 2 depth 4 nodes 4 time 0 pv c1e3 f6g8
193,107<--1:info score cp 2 depth 5 nodes 5 time 0 pv c1e3 f6g8
193,107<--1:info score cp 2 depth 6 nodes 6 time 0 pv c1e3 f6g8
193,479<--1:bestmove c1e3
193,479*1*Found move:Bc1-e3
193,637*2*Start calc, move no: 3
193,879-->2:time 1000
193,879-->2:otim 925
193,879-->2:c1e3
193,879<--2:1 10 0 23 d7d5
193,882<--2:2 -25 0 148 d7d5 b1c3
193,887<--2:3 10 0 1573 d7d5 b1c3 b8c6
193,911<--2:4 -25 3 11094 d7d5 b1c3 b8c6 g1f3
194,084<--2:5 5 20 83477 d7d5 b1c3 b8c6 g1f3 e7e6
194,215<--2:move d7d5
194,215*2*Found move:d7-d5
194,397*1*Start calc, move no: 4
194,397-->1:position startpos moves d2d4 g8f6 c1e3 d7d5
194,397-->1:go wtime 9246 btime 9669 winc 100 binc 100
194,399<--1:info score cp 5 depth 1 nodes 1 time 0 pv b1c3
194,400<--1:info score cp 5 depth 2 nodes 2 time 0 pv b1c3 c8f5
194,400<--1:info score cp 5 depth 3 nodes 3 time 0 pv b1c3 c8f5 g1f3
194,403<--1:info score cp 5 depth 4 nodes 4 time 0 pv b1c3 c8f5 g1f3 b8c6
194,403<--1:info score cp 5 depth 5 nodes 5 time 0 pv b1c3 c8f5 g1f3 b8c6 a1c1
194,666<--1:info score cp 0 depth 6 nodes 189935 time 268 pv b1c3 c8f5 d1d3 d8c8 d3b5 c7c6
194,759<--1:bestmove b1c3
194,759*1*Found move:Nb1-c3
194,910*2*Start calc, move no: 5
195,152-->2:time 967
195,152-->2:otim 889
195,152-->2:b1c3
195,155<--2:1 10 0 35 b8c6
195,155<--2:2 -25 0 293 b8c6 g1f3
195,160<--2:3 5 0 4013 b8c6 g1f3 e7e6
195,196<--2:4 3 4 20439 b8c6 g1f3 e7e6 a2a4
195,382<--2:5 30 23 123574 e7e6 g1f3 f8b4 d1d2 e8g8
195,476<--2:move e7e6
195,476*2*Found move:e7-e6
195,655*1*Start calc, move no: 6
195,656-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6
195,656-->1:go wtime 8889 btime 9350 winc 100 binc 100
195,660<--1:info score cp 5 depth 1 nodes 1 time 0 pv g1f3
195,660<--1:info score cp 5 depth 2 nodes 2 time 0 pv g1f3 c7c6
195,660<--1:info score cp 5 depth 3 nodes 3 time 0 pv g1f3 c7c6 f3g5
195,668<--1:info score cp 0 depth 4 nodes 6082 time 6 pv e3d2 b8c6 c3d5 e6d5
195,715<--1:info score cp 5 depth 5 nodes 57256 time 59 pv g1f3 f8d6 c3b5 b8c6 b5d6
195,923<--1:info score cp 0 depth 6 nodes 256154 time 266 pv g1f3 f8d6 c3b5 d6e7 e3f4 b8a6
196,004<--1:bestmove g1f3
196,004*1*Found move:Ng1-f3
196,169*2*Start calc, move no: 7
196,410-->2:time 935
196,410-->2:otim 855
196,410-->2:g1f3
196,410<--2:1 5 0 36 b8c6
196,410<--2:2 3 0 322 b8c6 a2a4
196,418<--2:3 30 0 3408 f8d6 f3e5 e8g8
196,483<--2:4 5 7 35392 f8b4 e3d2 e8g8 e2e3
196,722<--2:move b8c6
196,722*2*Found move:Nb8-c6
196,874*1*Start calc, move no: 8
196,875-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6
196,875-->1:go wtime 8546 btime 9043 winc 100 binc 100
196,878<--1:info score cp 5 depth 1 nodes 1 time 0 pv d1d3
196,878<--1:info score cp 5 depth 2 nodes 2 time 0 pv d1d3 f8b4
196,878<--1:info score cp 5 depth 3 nodes 3 time 0 pv d1d3 f8b4 f3g1
196,887<--1:info score cp 0 depth 4 nodes 10107 time 12 pv d1d3 f8b4 f3g1 b4c3
196,933<--1:info score cp 0 depth 5 nodes 64127 time 58 pv e3f4 f8d6 e2e3 e8g8 f1d3
197,213<--1:bestmove e3f4
197,213*1*Found move:Be3-f4
197,367*2*Start calc, move no: 9
197,608-->2:time 905
197,608-->2:otim 822
197,608-->2:e3f4
197,610<--2:1 30 0 68 f8d6
197,612<--2:2 30 0 820 f8b4 f4d2
197,622<--2:3 43 1 4060 f8b4 e2e3 b4c3 b2c3
197,733<--2:4 40 12 42163 f8b4 f4d2 e8g8 e2e3
197,913<--2:move f8b4
197,913*2*Found move:Bf8-b4
198,089*1*Start calc, move no: 10
198,089-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4
198,089-->1:go wtime 8213 btime 8743 winc 100 binc 100
198,093<--1:info score cp 0 depth 1 nodes 1 time 0 pv f4e3
198,094<--1:info score cp 0 depth 2 nodes 2 time 0 pv f4e3 b4c3
198,094<--1:info score cp 0 depth 3 nodes 3 time 0 pv f4e3 b4c3 b2c3
198,103<--1:info score cp 0 depth 4 nodes 5297 time 13 pv f4e3 b4c3 b2c3 c8d7
198,188<--1:info score cp -20 depth 5 nodes 92454 time 98 pv e2e3 e8g8 d1d3 f6e4 f1e2
198,415<--1:bestmove e2e3
198,415*1*Found move:e2-e3
198,569*2*Start calc, move no: 11
198,811-->2:time 875
198,811-->2:otim 790
198,811-->2:e2e3
198,815<--2:1 43 0 44 b4c3 b2c3
198,818<--2:2 79 0 835 b4c3 b2c3 e8g8
198,828<--2:3 54 1 4747 b4c3 b2c3 e8g8 f1d3
198,907<--2:4 74 9 32219 b4c3 b2c3 e8g8 f1d3 c8d7
199,104<--2:move f6e4
199,104*2*Found move:Nf6-e4
199,255*1*Start calc, move no: 12
199,255-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4
199,255-->1:go wtime 7892 btime 8455 winc 100 binc 100
199,259<--1:info score cp -30 depth 1 nodes 1 time 0 pv d1d3
199,259<--1:info score cp -30 depth 2 nodes 2 time 0 pv d1d3 g7g5
199,259<--1:info score cp -30 depth 3 nodes 3 time 0 pv d1d3 g7g5 f4e5
199,259<--1:info score cp -30 depth 4 nodes 4 time 0 pv d1d3 g7g5 f4e5 c6e5
199,347<--1:info score cp -25 depth 5 nodes 100856 time 90 pv d1d3 g7g5 f4g3 b4c3 b2c3
199,466<--1:info score cp -25 depth 6 nodes 255874 time 211 pv f3d2 b4c3 b2c3 e4c3 f1b5 c3d1
199,573<--1:bestmove f3d2
199,573*1*Found move:Nf3-d2
199,727*2*Start calc, move no: 13
199,968-->2:time 846
199,968-->2:otim 758
199,968-->2:f3d2
199,972<--2:1 133 0 79 e4c3 b2c3 b4c3
199,972<--2:2 133 0 411 e4c3 b2c3 b4c3
199,975<--2:3 133 0 2583 e4c3 b2c3 b4c3
200,005<--2:4 133 3 18564 b4c3 b2c3 e4c3 d1f3
200,139<--2:5 169 17 99787 b4c3 b2c3 e4c3 d1f3 e8g8
200,250<--2:move b4c3
200,250*2*Found move:Bb4xc3
200,405*1*Start calc, move no: 14
200,405-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3
200,405-->1:go wtime 7579 btime 8178 winc 100 binc 100
200,409<--1:info score cp -25 depth 1 nodes 1 time 0 pv b2c3
200,409<--1:info score cp -25 depth 2 nodes 2 time 1 pv b2c3 e4c3
200,409<--1:info score cp -25 depth 3 nodes 3 time 1 pv b2c3 e4c3 f1b5
200,409<--1:info score cp -25 depth 4 nodes 4 time 1 pv b2c3 e4c3 f1b5 c3d1
200,409<--1:info score cp -25 depth 5 nodes 5 time 1 pv b2c3 e4c3 f1b5 c3d1 e1d1
200,509<--1:info score cp -103 depth 6 nodes 126894 time 103 pv b2c3 e4c3 d1g4 e8g8 g4d1 c3d1
200,649<--1:info score cp -103 depth 7 nodes 324259 time 243 pv b2c3 e4c3 d1c1 e8g8 c1a3 c3e4 d2e4
200,709<--1:bestmove b2c3
200,709*1*Found move:b2xc3
200,860*2*Start calc, move no: 15
201,101-->2:time 818
201,101-->2:otim 728
201,101-->2:b2c3
201,103<--2:1 133 0 75 e4c3
201,107<--2:2 133 0 460 e4c3 d1f3
201,111<--2:3 169 1 2320 e4c3 d1f3 e8g8
201,133<--2:4 144 3 12027 e4c3 d1g4 e8g8 f1d3
201,243<--2:5 154 14 77706 e4c3 d1c1 e8g8 c1b2 c3a4
201,374<--2:move e4c3
201,374*2*Found move:Ne4xc3
201,531*1*Start calc, move no: 16
201,532-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3
201,532-->1:go wtime 7280 btime 7910 winc 100 binc 100
201,535<--1:info score cp -103 depth 1 nodes 1 time 0 pv d1c1
201,535<--1:info score cp -103 depth 2 nodes 2 time 0 pv d1c1 g7g5
201,536<--1:info score cp -103 depth 3 nodes 3 time 0 pv d1c1 g7g5 f4g3
201,536<--1:info score cp -103 depth 4 nodes 4 time 0 pv d1c1 g7g5 f4g3 e8g8
201,536<--1:info score cp -103 depth 5 nodes 5 time 0 pv d1c1 g7g5 f4g3 e8g8 c1a3
201,635<--1:info score cp -102 depth 6 nodes 128051 time 103 pv d1g4 e8g8 g4d1 c3d1 a1d1 c6d4
201,827<--1:bestmove d1g4
201,827*1*Found move:Qd1-g4
201,986*2*Start calc, move no: 17
202,227-->2:time 791
202,227-->2:otim 699
202,227-->2:d1g4
202,229<--2:1 169 0 214 e8g8
202,232<--2:2 144 0 1089 e8g8 f1d3
202,244<--2:3 161 1 5771 e8g8 g4g3 c6b4 f4c7 b4c2
202,310<--2:4 152 8 35096 e8g8 g4g3 c6b4 f1d3 b4d3 c2d3
202,491<--2:move e8g8
202,491*2*Found move:O-O
202,653*1*Start calc, move no: 18
202,654-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8
202,654-->1:go wtime 6990 btime 7651 winc 100 binc 100
202,656<--1:info score cp -120 depth 1 nodes 1 time 0 pv g4g3
202,657<--1:info score cp -120 depth 2 nodes 2 time 0 pv g4g3 c6b4
202,660<--1:info score cp -120 depth 3 nodes 3 time 0 pv g4g3 c6b4 a1c1
202,660<--1:info score cp -120 depth 4 nodes 4 time 0 pv g4g3 c6b4 a1c1 b4a2
202,660<--1:info score cp -120 depth 5 nodes 5 time 1 pv g4g3 c6b4 a1c1 b4a2 f4c7
202,913<--1:info score cp -120 depth 6 nodes 271791 time 259 pv g4g3 c6b4 a1c1 b4a2 f4c7 d8d7
202,939<--1:bestmove g4g3
202,939*1*Found move:Qg4-g3
203,110*2*Start calc, move no: 19
203,351-->2:time 766
203,351-->2:otim 771
203,351-->2:g4g3
203,353<--2:1 161 0 376 c6b4 f4c7 b4c2
203,354<--2:2 152 0 921 c6b4 f1d3 b4d3 c2d3
203,359<--2:3 152 0 2861 c6b4 f1d3 b4d3 c2d3
203,382<--2:4 155 3 15137 c6b4 f1d3 b4d3 c2d3 c7c6
203,543<--2:5 153 19 93468 c6b4 f1d3 c7c5 f4e5 b4d3 c2d3
203,607<--2:move c6b4
203,607*2*Found move:Nc6-b4
203,765*1*Start calc, move no: 20
203,766-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4
203,766-->1:go wtime 7710 btime 8400 winc 100 binc 100
203,769<--1:info score cp -120 depth 1 nodes 1 time 0 pv a1c1
203,769<--1:info score cp -120 depth 2 nodes 2 time 0 pv a1c1 c3a2
203,769<--1:info score cp -120 depth 3 nodes 3 time 0 pv a1c1 c3a2 f4c7
203,769<--1:info score cp -120 depth 4 nodes 4 time 0 pv a1c1 c3a2 f4c7 d8d7
203,782<--1:info score cp -115 depth 5 nodes 15040 time 15 pv f1d3 b4d3 c2d3 c7c6 e1g1
203,857<--1:info score cp -105 depth 6 nodes 111895 time 90 pv f1d3 c3a2 f4c7 d8d7 e1g1 b4d3
204,076<--1:bestmove f1d3
204,076*1*Found move:Bf1-d3
204,238*2*Start calc, move no: 21
204,479-->2:time 840
204,479-->2:otim 741
204,479-->2:f1d3
204,480<--2:1 152 0 124 b4d3 c2d3
204,482<--2:2 155 0 1017 b4d3 c2d3 c7c6
204,492<--2:3 153 1 4712 c7c5 f4e5 b4d3 c2d3
204,541<--2:4 154 6 30764 c7c6 f4e5 f7f6 e5d6 b4d3 c2d3
204,759<--2:move c7c6
204,759*2*Found move:c7-c6
204,915*1*Start calc, move no: 22
204,915-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6
204,915-->1:go wtime 7405 btime 8125 winc 100 binc 100
204,918<--1:info score cp -110 depth 1 nodes 1 time 0 pv a2a3
204,918<--1:info score cp -110 depth 2 nodes 2 time 0 pv a2a3 b4d3
204,918<--1:info score cp -110 depth 3 nodes 3 time 0 pv a2a3 b4d3 c2d3
204,919<--1:info score cp -110 depth 4 nodes 4 time 0 pv a2a3 b4d3 c2d3 f7f6
204,919<--1:info score cp -110 depth 5 nodes 5 time 0 pv a2a3 b4d3 c2d3 f7f6 g3g7
205,211<--1:bestmove a2a3
205,211*1*Found move:a2-a3
205,373*2*Start calc, move no: 23
205,614-->2:time 813
205,614-->2:otim 712
205,614-->2:a2a3
205,616<--2:1 154 0 44 b4d3 c2d3
205,617<--2:2 174 0 297 b4d3 c2d3 c8d7
205,621<--2:3 142 0 2400 b4d3 c2d3 c8d7 e1g1
205,648<--2:4 142 3 14493 b4d3 c2d3 c8d7 e1g1 d8c8
205,796<--2:5 137 18 93007 b4d3 c2d3 c8d7 d2f3 f8e8 e1g1
205,884<--2:move b4d3
205,884*2*Found move:Nb4xd3
206,051*1*Start calc, move no: 24
206,051-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3
206,051-->1:go wtime 7114 btime 7860 winc 100 binc 100
206,057<--1:info score cp -125 depth 1 nodes 1 time 0 pv c2d3
206,057<--1:info score cp -125 depth 2 nodes 2 time 0 pv c2d3 c8d7
206,057<--1:info score cp -125 depth 3 nodes 3 time 0 pv c2d3 c8d7 f4d6
206,057<--1:info score cp -125 depth 4 nodes 4 time 1 pv c2d3 c8d7 f4d6 f8e8
206,127<--1:info score cp -120 depth 5 nodes 86107 time 76 pv c2d3 c8d7 a1c1 c3b5 f4e5
206,341<--1:bestmove c2d3
206,341*1*Found move:c2xd3
206,501*2*Start calc, move no: 25
206,742-->2:time 786
206,742-->2:otim 683
206,742-->2:c2d3
206,743<--2:1 174 0 38 c8d7
206,747<--2:2 142 0 299 c8d7 e1g1
206,751<--2:3 142 0 3191 c8d7 e1g1 a8c8
206,789<--2:4 137 4 20465 c8d7 d2f3 a8c8 e1g1
206,975<--2:5 141 23 136568 c8d7 d2f3 b7b6 e1g1 a7a5
207,005<--2:move c8d7
207,005*2*Found move:Bc8-d7
207,167*1*Start calc, move no: 26
207,168-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7
207,168-->1:go wtime 6829 btime 7602 winc 100 binc 100
207,177<--1:info score cp -110 depth 1 nodes 1 time 0 pv a1c1
207,177<--1:info score cp -110 depth 2 nodes 2 time 0 pv a1c1 c3b5
207,177<--1:info score cp -110 depth 3 nodes 3 time 0 pv a1c1 c3b5 a3a4
207,177<--1:info score cp -110 depth 4 nodes 4 time 0 pv a1c1 c3b5 a3a4 b5a3
207,177<--1:info score cp -110 depth 5 nodes 5 time 0 pv a1c1 c3b5 a3a4 b5a3 e1g1
207,397<--1:info score cp -45 depth 6 nodes 222554 time 228 pv f4h6 d8f6 a1c1 f6h6 c1c3 f7f5
207,446<--1:bestmove f4h6
207,447*1*Found move:Bf4-h6
207,651*2*Start calc, move no: 27
207,892-->2:time 761
207,892-->2:otim 656
207,892-->2:f4h6
207,893<--2:1 189 0 76 d8f6
207,896<--2:2 174 0 220 d8f6 h6f4
207,896<--2:3 174 0 1743 d8f6 h6f4 a8c8
207,910<--2:4 169 1 8541 d8f6 h6f4 f6f5 f4e5
208,054<--2:5 168 16 59849 d8f6 h6f4 f6f5 f4e5 f7f6
208,148<--2:move d8f6
208,148*2*Found move:Qd8-f6
208,302*1*Start calc, move no: 28
208,302-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6
208,302-->1:go wtime 6555 btime 7351 winc 100 binc 100
208,305<--1:info score cp -130 depth 1 nodes 1 time 0 pv a1c1
208,306<--1:info score cp -130 depth 2 nodes 2 time 0 pv a1c1 c3a2
208,306<--1:info score cp -130 depth 3 nodes 3 time 0 pv a1c1 c3a2 h6g5
208,306<--1:info score cp -130 depth 4 nodes 4 time 0 pv a1c1 c3a2 h6g5 f6g6
208,306<--1:info score cp -130 depth 5 nodes 5 time 0 pv a1c1 c3a2 h6g5 f6g6 c1c2
208,479<--1:info score cp -130 depth 6 nodes 243018 time 176 pv h6f4 f6g6 a1c1 g6g3 f2g3 c3a4
208,574<--1:bestmove h6f4
208,574*1*Found move:Bh6-f4
208,746*2*Start calc, move no: 29
208,987-->2:time 736
208,987-->2:otim 629
208,987-->2:h6f4
208,992<--2:1 174 0 57 a8d8
208,992<--2:2 169 0 840 f6f5 f4e5
209,002<--2:3 168 1 4476 f6f5 f4e5 f7f6
209,061<--2:4 165 7 21274 f6f5 f4h6 f5g6 g3g6 f7g6
209,235<--2:move f6f5
209,235*2*Found move:Qf6-f5
209,389*1*Start calc, move no: 30
209,390-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5
209,390-->1:go wtime 6288 btime 7108 winc 100 binc 100
209,392<--1:info score cp -115 depth 1 nodes 1 time 0 pv a1c1
209,392<--1:info score cp -115 depth 2 nodes 2 time 0 pv a1c1 c3a4
209,392<--1:info score cp -115 depth 3 nodes 3 time 0 pv a1c1 c3a4 e3e4
209,392<--1:info score cp -115 depth 4 nodes 4 time 0 pv a1c1 c3a4 e3e4 f5g6
209,503<--1:info score cp -130 depth 5 nodes 65686 time 113 pv f4h6 f5g6 h6g5 f7f6 g5f6
209,629<--1:info score cp -130 depth 6 nodes 211082 time 240 pv f4h6 f5g6 h6g5 f7f6 g5f6 g6g3
209,652<--1:bestmove f4h6
209,652*1*Found move:Bf4-h6
209,811*2*Start calc, move no: 31
210,055-->2:time 711
210,055-->2:otim 604
210,055-->2:f4h6
210,059<--2:1 189 0 167 f5f6
210,059<--2:2 165 0 478 f5g6 g3g6 f7g6
210,061<--2:3 160 0 2408 f5g6 a1c1 g6h6 c1c3
210,096<--2:4 150 3 11099 f5g6 g3g6 f7g6 h6f4
210,294<--2:move f5g6
210,294*2*Found move:Qf5-g6
210,451*1*Start calc, move no: 32
210,451-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6
210,451-->1:go wtime 6031 btime 6874 winc 100 binc 100
210,457<--1:info score cp -130 depth 1 nodes 1 time 0 pv h6g5
210,457<--1:info score cp -130 depth 2 nodes 2 time 0 pv h6g5 f7f6
210,457<--1:info score cp -130 depth 3 nodes 3 time 0 pv h6g5 f7f6 g5f4
210,457<--1:info score cp -130 depth 4 nodes 4 time 0 pv h6g5 f7f6 g5f4 g6g3
210,525<--1:info score cp -135 depth 5 nodes 21574 time 73 pv g3g6 f7g6 h6f4 a8d8 e1g1
210,660<--1:info score cp -145 depth 6 nodes 100622 time 207 pv g3g6 f7g6 h6f4 c3b5 a1b1 a8e8
210,704<--1:bestmove g3g6
210,704*1*Found move:Qg3xg6
210,856*2*Start calc, move no: 33
211,097-->2:time 688
211,097-->2:otim 579
211,097-->2:g3g6
211,100<--2:1 165 0 31 f7g6
211,103<--2:2 150 0 172 f7g6 h6f4
211,106<--2:3 150 0 1165 f7g6 h6f4 a8c8
211,113<--2:4 135 1 6012 f7g6 h6f4 c3b5 a1b1
211,202<--2:5 142 10 31182 f7g6 h6f4 f8f5 a1c1 g6g5
211,328<--2:move f7g6
211,328*2*Found move:f7xg6
211,511*1*Start calc, move no: 34
211,512-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6
211,512-->1:go wtime 5783 btime 6648 winc 100 binc 100
211,518<--1:info score cp -135 depth 1 nodes 1 time 0 pv h6f4
211,519<--1:info score cp -135 depth 2 nodes 2 time 0 pv h6f4 a8c8
211,521<--1:info score cp -135 depth 3 nodes 3 time 0 pv h6f4 a8c8 f4d6
211,521<--1:info score cp -135 depth 4 nodes 4 time 0 pv h6f4 a8c8 f4d6 f8e8
211,521<--1:info score cp -135 depth 5 nodes 5 time 0 pv h6f4 a8c8 f4d6 f8e8 e1g1
211,616<--1:info score cp -135 depth 6 nodes 62039 time 102 pv h6f4 a8c8 f4d6 f8e8 e1g1 c8d8
211,755<--1:bestmove h6f4
211,755*1*Found move:Bh6-f4
211,909*2*Start calc, move no: 35
212,150-->2:time 665
212,150-->2:otim 555
212,150-->2:h6f4
212,151<--2:1 150 0 46 a8c8
212,152<--2:2 135 0 350 c3b5 a1b1
212,165<--2:3 142 1 3102 f8f5 a1c1 g6g5
212,208<--2:4 135 5 13285 f8f5 a1c1 c3b5 c1b1
212,337<--2:5 138 18 89797 f8f7 d2f3 a8f8 e1g1 f7f5
212,373<--2:move f8f7
212,373*2*Found move:Rf8-f7
212,554*1*Start calc, move no: 36
212,554-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7
212,554-->1:go wtime 5545 btime 6430 winc 100 binc 100
212,557<--1:info score cp -135 depth 1 nodes 1 time 0 pv d2f3
212,557<--1:info score cp -135 depth 2 nodes 2 time 0 pv d2f3 a8c8
212,557<--1:info score cp -135 depth 3 nodes 3 time 0 pv d2f3 a8c8 a1c1
212,557<--1:info score cp -135 depth 4 nodes 4 time 0 pv d2f3 a8c8 a1c1 f7f4
212,586<--1:info score cp -130 depth 5 nodes 19257 time 32 pv d2f3 a8c8 f3e5 c3b5 e5f7
212,699<--1:info score cp -120 depth 6 nodes 96683 time 143 pv d2f3 f7e7 f3e5 a8d8 e1g1 c3b5
212,794<--1:bestmove d2f3
212,794*1*Found move:Nd2-f3
212,963*2*Start calc, move no: 37
213,203-->2:time 643
213,203-->2:otim 531
213,203-->2:d2f3
213,206<--2:1 155 0 35 a8f8
213,210<--2:2 138 0 219 a8f8 e1g1
213,215<--2:3 138 1 2560 a8f8 e1g1 f7f6
213,237<--2:4 125 3 13909 f7f5 a1c1 c3b5 f3e5
213,352<--2:5 119 14 84437 f7f5 a1c1 c3b5 a3a4 b5a3
213,420<--2:move f7f5
213,420*2*Found move:Rf7-f5
213,600*1*Start calc, move no: 38
213,601-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5
213,601-->1:go wtime 5310 btime 6218 winc 100 binc 100
213,604<--1:info score cp -115 depth 1 nodes 1 time 0 pv e1d2
213,604<--1:info score cp -115 depth 2 nodes 2 time 0 pv e1d2 c3a4
213,604<--1:info score cp -115 depth 3 nodes 3 time 0 pv e1d2 c3a4 a1c1
213,604<--1:info score cp -115 depth 4 nodes 4 time 0 pv e1d2 c3a4 a1c1 a8f8
213,617<--1:info score cp -110 depth 5 nodes 16142 time 17 pv a1c1 c3b5 a3a4 b5a3 e1g1
213,704<--1:info score cp -105 depth 6 nodes 117816 time 102 pv a1c1 c3a4 e1g1 a8d8 f3e5 f5f8
213,830<--1:bestmove a1c1
213,830*1*Found move:Ra1-c1
213,989*2*Start calc, move no: 39
214,229-->2:time 622
214,229-->2:otim 609
214,229-->2:a1c1
214,237<--2:1 130 0 143 c3b5
214,237<--2:2 125 0 509 c3b5 f3e5
214,242<--2:3 119 0 3390 c3b5 a3a4 b5a3
214,313<--2:4 108 8 14595 c3a4 e1g1 a4b6 f3e5
214,428<--2:5 112 19 85979 c3a4 c1b1 b7b6 e1g1 a4c3
214,441<--2:move c3a4
214,441*2*Found move:Nc3-a4
214,596*1*Start calc, move no: 40
214,596-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4
214,596-->1:go wtime 6086 btime 7011 winc 100 binc 100
214,599<--1:info score cp -100 depth 1 nodes 1 time 0 pv e1g1
214,599<--1:info score cp -100 depth 2 nodes 2 time 0 pv e1g1 a8c8
214,599<--1:info score cp -100 depth 3 nodes 3 time 0 pv e1g1 a8c8 f4e5
214,599<--1:info score cp -100 depth 4 nodes 4 time 0 pv e1g1 a8c8 f4e5 c6c5
214,599<--1:info score cp -100 depth 5 nodes 5 time 0 pv e1g1 a8c8 f4e5 c6c5 e3e4
214,690<--1:info score cp -100 depth 6 nodes 118154 time 94 pv e1g1 a8d8 f4e5 d8f8 e3e4 f5e5
214,850<--1:bestmove e1g1
214,850*1*Found move:O-O
215,039*2*Start calc, move no: 41
215,280-->2:time 702
215,280-->2:otim 584
215,280-->2:e1g1
215,285<--2:1 113 0 48 a8f8
215,285<--2:2 108 0 326 a8f8 f3e5
215,285<--2:3 115 0 3136 a4b6 f4d6 g6g5
215,316<--2:4 105 3 19015 a4b6 f4d6 g6g5 e3e4
215,495<--2:5 103 21 126675 a4b6 f4c7 a8c8 c7b6 a7b6
215,516<--2:move a4b6
215,516*2*Found move:Na4-b6
215,668*1*Start calc, move no: 42
215,668-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6
215,668-->1:go wtime 5837 btime 6780 winc 100 binc 100
215,672<--1:info score cp -95 depth 1 nodes 1 time 0 pv f4e5
215,672<--1:info score cp -95 depth 2 nodes 2 time 0 pv f4e5 f5e5
215,672<--1:info score cp -95 depth 3 nodes 3 time 0 pv f4e5 f5e5 d4e5
215,674<--1:info score cp -95 depth 4 nodes 4 time 0 pv f4e5 f5e5 d4e5 c6c5
215,674<--1:info score cp -95 depth 5 nodes 5 time 0 pv f4e5 f5e5 d4e5 c6c5 c1c5
215,795<--1:info score cp -85 depth 6 nodes 147615 time 126 pv f4d6 f5f7 e3e4 b6c8 d6e5 c8e7
215,913<--1:bestmove f4d6
215,913*1*Found move:Bf4-d6
216,077*2*Start calc, move no: 43
216,317-->2:time 678
216,317-->2:otim 560
216,317-->2:f4d6
216,318<--2:1 115 0 53 g6g5
216,324<--2:2 105 0 401 g6g5 e3e4
216,334<--2:3 108 1 4294 b6c8 d6e5 c8b6
216,354<--2:4 98 3 15155 b6c8 d6e5 c8b6 e3e4
216,508<--2:5 98 19 110069 f5f6 e3e4 a8c8 d6e5 f6f7
216,544<--2:move f5f6
216,544*2*Found move:Rf5-f6
216,710*1*Start calc, move no: 44
216,710-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6
216,710-->1:go wtime 5597 btime 6558 winc 100 binc 100
216,721<--1:info score cp -85 depth 1 nodes 1 time 0 pv e3e4
216,722<--1:info score cp -85 depth 2 nodes 2 time 0 pv e3e4 f6f3
216,722<--1:info score cp -85 depth 3 nodes 3 time 0 pv e3e4 f6f3
216,722<--1:info score cp -85 depth 4 nodes 4 time 0 pv e3e4 f6f3
216,722<--1:info score cp -90 depth 5 nodes 9825 time 10 pv e3e4 d5e4 d3e4 d7e8 f1d1
216,876<--1:info score cp -10 depth 6 nodes 217608 time 164 pv f3e5 b6c8 e5d7 c6c5 d7f6 g7f6
216,926<--1:info score cp -10 depth 7 nodes 294437 time 215 pv f3e5 d7e8 d6e7 f6f7 e5f7 e8d7 c1c6
216,949<--1:bestmove f3e5
216,949*1*Found move:Nf3-e5
217,101*2*Start calc, move no: 45
217,341-->2:time 656
217,341-->2:otim 537
217,341-->2:f3e5
217,345<--2:1 110 0 78 g6g5
217,345<--2:2 100 0 533 g6g5 e3e4
217,349<--2:3 100 0 3097 g6g5 e3e4 a8c8
217,413<--2:4 98 7 13876 a8c8 d6c5 c8c7 c5b6 a7b6
217,561<--2:move g6g5
217,561*2*Found move:g6-g5
217,720*1*Start calc, move no: 46
217,720-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5
217,720-->1:go wtime 5363 btime 6343 winc 100 binc 100
217,727<--1:info score cp -10 depth 1 nodes 1 time 0 pv d6e7
217,727<--1:info score cp -10 depth 2 nodes 2 time 0 pv d6e7 f6f2
217,727<--1:info score cp -10 depth 3 nodes 3 time 0 pv d6e7 f6f2 g1f2
217,727<--1:info score cp -10 depth 4 nodes 4 time 0 pv d6e7 f6f2 g1f2 a8d8
217,727<--1:info score cp -10 depth 5 nodes 5 time 0 pv d6e7 f6f2 g1f2 a8d8 e7d8
217,952<--1:bestmove d6e7
217,952*1*Found move:Bd6-e7
218,126*2*Start calc, move no: 47
218,367-->2:time 635
218,367-->2:otim 514
218,367-->2:d6e7
218,373<--2:1 115 0 197 f6f5
218,373<--2:2 105 0 394 f6f5 e3e4
218,373<--2:3 11 0 2538 f6h6 e7g5 h6h5
218,381<--2:4 6 1 7406 f6h6 e7g5 h6h5 g5f4
218,445<--2:5 1 7 49545 f6h6 c1b1 d7e8 e7g5 h6h5
218,581<--2:move f6h6
218,581*2*Found move:Rf6-h6
218,768*1*Start calc, move no: 48
218,768-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6
218,768-->1:go wtime 5136 btime 6134 winc 100 binc 100
218,771<--1:info score cp -10 depth 1 nodes 1 time 0 pv e7g5
218,772<--1:info score cp -10 depth 2 nodes 2 time 0 pv e7g5 h6h2
218,774<--1:info score cp -10 depth 3 nodes 3 time 0 pv e7g5 h6h2 g1h2
218,776<--1:info score cp -10 depth 4 nodes 4 time 0 pv e7g5 h6h2 g1h2 c6c5
218,814<--1:info score cp 35 depth 5 nodes 35777 time 44 pv c1b1 g5g4 e5d7 b6a4 b1b7
218,890<--1:info score cp 75 depth 6 nodes 128682 time 120 pv e7g5 h6h5 h2h4 h7h6 g2g4 h6g5
218,921<--1:info score cp 75 depth 7 nodes 165250 time 152 pv e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5
218,966<--1:info score cp 75 depth 8 nodes 225949 time 198 pv e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4
218,991<--1:bestmove e7g5
218,991*1*Found move:Be7xg5
219,143*2*Start calc, move no: 49
219,384-->2:time 614
219,384-->2:otim 492
219,384-->2:e7g5
219,393<--2:1 11 0 199 h6h5
219,393<--2:2 6 0 345 h6h5 g5f4
219,393<--2:3 16 0 1174 h6h5 g5f4 a8f8
219,412<--2:4 11 2 4646 h6h5 g5e7 h5f5 e3e4
219,487<--2:5 -1 9 26969 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4
219,595<--2:move h6h5
219,595*2*Found move:Rh6-h5
219,756*1*Start calc, move no: 50
219,756-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5
219,756-->1:go wtime 4918 btime 5928 winc 100 binc 100
219,758<--1:info score cp 75 depth 1 nodes 1 time 0 pv h2h4
219,761<--1:info score cp 75 depth 2 nodes 2 time 0 pv h2h4 h7h6
219,761<--1:info score cp 75 depth 3 nodes 3 time 0 pv h2h4 h7h6 g2g4
219,761<--1:info score cp 75 depth 4 nodes 4 time 0 pv h2h4 h7h6 g2g4 h6g5
219,761<--1:info score cp 75 depth 5 nodes 5 time 0 pv h2h4 h7h6 g2g4 h6g5 g4h5
219,761<--1:info score cp 75 depth 6 nodes 6 time 0 pv h2h4 h7h6 g2g4 h6g5 g4h5 g5h4
219,810<--1:info score cp 90 depth 7 nodes 65096 time 54 pv h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 e3e4
219,972<--1:bestmove h2h4
219,972*1*Found move:h2-h4
220,122*2*Start calc, move no: 51
220,363-->2:time 593
220,363-->2:otim 471
220,363-->2:h2h4
220,370<--2:1 30 0 79 a8f8
220,370<--2:2 20 0 599 a8f8 e3e4
220,375<--2:3 -1 1 5377 h7h6 g2g4 h6g5 g4h5 g5h4
220,385<--2:4 -1 2 10491 h7h6 g2g4 h6g5 g4h5 g5h4
220,426<--2:5 -9 6 31173 h7h6 g5e7 a8e8 e7c5 e8d8 c5b6 a7b6
220,562<--2:move h7h6
220,562*2*Found move:h7-h6
220,718*1*Start calc, move no: 52
220,719-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6
220,719-->1:go wtime 4707 btime 5734 winc 100 binc 100
220,722<--1:info score cp 60 depth 1 nodes 1 time 0 pv g2g4
220,723<--1:info score cp 60 depth 2 nodes 2 time 0 pv g2g4 h6g5
220,723<--1:info score cp 60 depth 3 nodes 3 time 0 pv g2g4 h6g5 g4h5
220,723<--1:info score cp 60 depth 4 nodes 4 time 0 pv g2g4 h6g5 g4h5 g5h4
220,723<--1:info score cp 60 depth 5 nodes 5 time 0 pv g2g4 h6g5 g4h5 g5h4 e3e4
220,723<--1:info score cp 60 depth 6 nodes 6 time 0 pv g2g4 h6g5 g4h5 g5h4 e3e4 h4h3
220,762<--1:info score cp 75 depth 7 nodes 53788 time 42 pv g2g4 h6g5 g4h5 g5h4 e5d7 b6d7 e3e4
220,849<--1:info score cp 120 depth 8 nodes 161795 time 129 pv g2g4 h6g5 g4h5 g5h4 e5f3 d7e8 f3h4 e8h5
220,929<--1:bestmove g2g4
220,929*1*Found move:g2-g4
221,093*2*Start calc, move no: 53
221,333-->2:time 574
221,333-->2:otim 451
221,333-->2:g2g4
221,335<--2:1 -1 0 78 h6g5 g4h5 g5h4
221,338<--2:2 -1 0 181 h6g5 g4h5 g5h4
221,339<--2:3 -1 0 840 h6g5 g4h5 g5h4
221,348<--2:4 -15 1 3188 h6g5 g4h5 g5h4 f2f4
221,370<--2:5 -1 3 15110 h6g5 g4h5 g5h4 c1b1 a8d8
221,442<--2:6 -15 10 62776 h6g5 g4h5 g5h4 g1g2 a8f8 f2f4
221,526<--2:move h6g5
221,526*2*Found move:h6xg5
221,700*1*Start calc, move no: 54
221,700-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5
221,700-->1:go wtime 4502 btime 5546 winc 100 binc 100
221,707<--1:info score cp 120 depth 1 nodes 1 time 0 pv g4h5
221,707<--1:info score cp 120 depth 2 nodes 2 time 0 pv g4h5 g5h4
221,707<--1:info score cp 120 depth 3 nodes 3 time 0 pv g4h5 g5h4 e5f3
221,708<--1:info score cp 120 depth 4 nodes 4 time 0 pv g4h5 g5h4 e5f3 h4h3
221,708<--1:info score cp 120 depth 5 nodes 5 time 0 pv g4h5 g5h4 e5f3 h4h3 f3g5
221,708<--1:info score cp 120 depth 6 nodes 6 time 0 pv g4h5 g5h4 e5f3 h4h3 f3g5 d7e8
221,709<--1:info score cp 120 depth 7 nodes 7 time 0 pv g4h5 g5h4 e5f3 h4h3 f3g5 d7e8 g5h3
221,755<--1:info score cp 120 depth 8 nodes 63581 time 54 pv g4h5 g5h4 e5f3 h4h3 f3g5 d7e8 g5h3 e8h5
221,902<--1:bestmove g4h5
221,902*1*Found move:g4xh5
222,067*2*Start calc, move no: 55
222,308-->2:time 555
222,308-->2:otim 431
222,308-->2:g4h5
222,311<--2:1 -1 0 31 g5h4
222,311<--2:2 -15 0 167 g5h4 f2f4
222,311<--2:3 -1 0 1025 g5h4 c1b1 a8d8
222,317<--2:4 -15 1 4116 g5h4 g1g2 a8f8 f2f4
222,349<--2:5 -154 4 23063 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4
222,481<--2:6 -154 17 86079 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4
222,494<--2:move g5h4
222,494*2*Found move:g5xh4
222,647*1*Start calc, move no: 56
222,648-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4
222,648-->1:go wtime 4305 btime 5365 winc 100 binc 100
222,653<--1:info score cp 135 depth 1 nodes 1 time 0 pv g1g2
222,653<--1:info score cp 135 depth 2 nodes 2 time 0 pv g1g2 d7e8
222,653<--1:info score cp 135 depth 3 nodes 3 time 0 pv g1g2 d7e8 f1h1
222,654<--1:info score cp 135 depth 4 nodes 4 time 0 pv g1g2 d7e8 f1h1 e8h5
222,654<--1:info score cp 135 depth 5 nodes 5 time 0 pv g1g2 d7e8 f1h1 e8h5 h1h4
222,654<--1:info score cp 135 depth 6 nodes 6 time 0 pv g1g2 d7e8 f1h1 e8h5 h1h4 h5e2
222,654<--1:info score cp 135 depth 7 nodes 7 time 0 pv g1g2 d7e8 f1h1 e8h5 h1h4 h5e2 g2g1
222,843<--1:bestmove g1g2
222,843*1*Found move:Kg1-g2
223,005*2*Start calc, move no: 57
223,245-->2:time 537
223,245-->2:otim 412
223,245-->2:g1g2
223,246<--2:1 -1 0 43 a8f8
223,250<--2:2 -15 0 411 a8f8 f2f4
223,285<--2:3 -154 3 5590 d7e8 f1h1 e8h5 h1h4
223,323<--2:4 -154 7 14553 d7e8 f1h1 e8h5 h1h4
223,367<--2:5 -144 12 40515 d7e8 f1h1 e8h5 h1h4 h5f7
223,427<--2:move d7e8
223,427*2*Found move:Bd7-e8
223,587*1*Start calc, move no: 58
223,587-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8
223,587-->1:go wtime 4115 btime 5188 winc 100 binc 100
223,592<--1:info score cp 125 depth 1 nodes 1 time 0 pv f1h1
223,592<--1:info score cp 125 depth 2 nodes 2 time 0 pv f1h1 e8h5
223,594<--1:info score cp 125 depth 3 nodes 3 time 0 pv f1h1 e8h5 h1h4
223,594<--1:info score cp 125 depth 4 nodes 4 time 0 pv f1h1 e8h5 h1h4 h5e2
223,594<--1:info score cp 125 depth 5 nodes 5 time 0 pv f1h1 e8h5 h1h4 h5e2 g2g1
223,594<--1:info score cp 125 depth 6 nodes 6 time 0 pv f1h1 e8h5 h1h4 h5e2 g2g1 a8d8
223,668<--1:info score cp 130 depth 7 nodes 97752 time 79 pv f1h1 e8h5 h1h4 h5e8 g2g1 b6d7 f2f4
223,780<--1:bestmove f1h1
223,780*1*Found move:Rf1-h1
223,942*2*Start calc, move no: 59
224,183-->2:time 519
224,183-->2:otim 493
224,183-->2:f1h1
224,187<--2:1 -154 0 191 e8h5 h1h4
224,189<--2:2 -154 0 550 e8h5 h1h4
224,189<--2:3 -144 0 2203 e8h5 h1h4 h5f7
224,207<--2:4 -158 2 11189 e8h5 h1h4 h5e2 f2f4
224,284<--2:5 -148 10 58906 e8h5 h1h4 h5e2 f2f4 a8f8
224,357<--2:move e8h5
224,357*2*Found move:Be8xh5
224,577*1*Start calc, move no: 60
224,578-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5
224,578-->1:go wtime 4927 btime 6019 winc 100 binc 100
224,584<--1:info score cp 155 depth 1 nodes 1 time 0 pv h1h4
224,588<--1:info score cp 155 depth 2 nodes 2 time 0 pv h1h4 a8f8
224,588<--1:info score cp 155 depth 3 nodes 3 time 0 pv h1h4 a8f8 c1h1
224,588<--1:info score cp 155 depth 4 nodes 4 time 0 pv h1h4 a8f8 c1h1 g7g6
224,588<--1:info score cp 155 depth 5 nodes 5 time 0 pv h1h4 a8f8 c1h1 g7g6 h4h5
224,588<--1:info score cp 155 depth 6 nodes 6 time 0 pv h1h4 a8f8 c1h1 g7g6 h4h5 g6h5
224,718<--1:info score cp 155 depth 7 nodes 142137 time 140 pv h1h4 a8f8 h4h5 f8a8 e5c6 b7c6 c1c6
224,794<--1:bestmove h1h4
224,794*1*Found move:Rh1xh4
224,959*2*Start calc, move no: 61
225,200-->2:time 602
225,200-->2:otim 472
225,200-->2:h1h4
225,207<--2:1 -144 0 82 h5f7
225,207<--2:2 -158 0 371 h5e2 f2f4
225,208<--2:3 -148 0 1623 h5e2 f2f4 a8f8
225,221<--2:4 -159 1 12319 h5e2 c1h1 a8f8 h4h7
225,368<--2:5 -170 16 115945 g7g6 g2g3 a8f8 f2f4 f8f6
225,404<--2:move g7g6
225,404*2*Found move:g7-g6
225,567*1*Start calc, move no: 62
225,567-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6
225,567-->1:go wtime 4716 btime 5820 winc 100 binc 100
225,573<--1:info score cp 155 depth 1 nodes 1 time 0 pv c1g1
225,573<--1:info score cp 155 depth 2 nodes 2 time 0 pv c1g1 b6a4
225,573<--1:info score cp 155 depth 3 nodes 3 time 0 pv c1g1 b6a4 g2h2
225,573<--1:info score cp 155 depth 4 nodes 4 time 0 pv c1g1 b6a4 g2h2 a8d8
225,573<--1:info score cp 155 depth 5 nodes 5 time 0 pv c1g1 b6a4 g2h2 a8d8 h4h5
225,651<--1:info score cp 205 depth 6 nodes 100480 time 82 pv c1g1 a8f8 g2f1 f8f5 e5g6 h5g6
225,778<--1:bestmove c1g1
225,779*1*Found move:Rc1-g1
225,935*2*Start calc, move no: 63
226,176-->2:time 582
226,176-->2:otim 451
226,176-->2:c1g1
226,177<--2:1 -146 0 41 a8f8
226,181<--2:2 -160 0 446 a8f8 f2f4
226,184<--2:3 -168 0 4763 g8f8 g2h3 f8e7 e5g6 h5g6 g1g6
226,213<--2:4 -171 3 21687 g8f8 g2g3 f8e8 g3f4
226,372<--2:move g8f8
226,372*2*Found move:Kg8-f8
226,531*1*Start calc, move no: 64
226,531-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8
226,532-->1:go wtime 4509 btime 5629 winc 100 binc 100
226,537<--1:info score cp 205 depth 1 nodes 1 time 0 pv g2f1
226,537<--1:info score cp 205 depth 2 nodes 2 time 0 pv g2f1 c6c5
226,537<--1:info score cp 205 depth 3 nodes 3 time 0 pv g2f1 c6c5 d4c5
226,537<--1:info score cp 205 depth 4 nodes 4 time 0 pv g2f1 c6c5 d4c5 b6a4
226,537<--1:info score cp 205 depth 5 nodes 5 time 0 pv g2f1 c6c5 d4c5 b6a4 h4a4
226,604<--1:info score cp 215 depth 6 nodes 88671 time 70 pv g2f1 f8g7 e3e4 g7f6 f2f4 a8e8
226,736<--1:bestmove g2f1
226,736*1*Found move:Kg2-f1
226,914*2*Start calc, move no: 65
227,155-->2:time 563
227,155-->2:otim 431
227,155-->2:g2f1
227,159<--2:1 -168 0 86 f8e7 e5g6 h5g6 g1g6
227,159<--2:2 -168 0 323 f8e7 e5g6 h5g6 g1g6
227,159<--2:3 -172 0 2076 f8e7 f2f4 e7d6 e5g6 h5g6 g1g6
227,172<--2:4 -172 1 9625 f8e7 f2f4 a8f8 e5g6 h5g6 g1g6
227,216<--2:5 -178 6 39530 f8e7 e5g6 h5g6 g1g6 e7d6 f1e2
227,342<--2:move f8e7
227,342*2*Found move:Kf8-e7
227,560*1*Start calc, move no: 66
227,561-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7
227,561-->1:go wtime 4310 btime 5447 winc 100 binc 100
227,567<--1:info score cp 230 depth 1 nodes 1 time 0 pv e5g6
227,567<--1:info score cp 230 depth 2 nodes 2 time 0 pv e5g6 h5g6
227,567<--1:info score cp 230 depth 3 nodes 3 time 0 pv e5g6 h5g6 g1g6
227,567<--1:info score cp 230 depth 4 nodes 4 time 0 pv e5g6 h5g6 g1g6 b6a4
227,567<--1:info score cp 230 depth 5 nodes 5 time 0 pv e5g6 h5g6 g1g6 b6a4 e3e4
227,599<--1:info score cp 310 depth 6 nodes 40602 time 35 pv e5g6 h5g6 g1g6 b6d7 h4h7 e7d6
227,642<--1:info score cp 310 depth 7 nodes 97662 time 79 pv e5g6 h5g6 g1g6 e7f7 h4h6 a8e8 g6f6
227,762<--1:bestmove e5g6
227,762*1*Found move:Ne5xg6
227,920*2*Start calc, move no: 67
228,160-->2:time 545
228,162-->2:otim 412
228,162-->2:e5g6
228,167<--2:1 -168 0 37 h5g6 g1g6
228,167<--2:2 -158 0 247 h5g6 g1g6 a8f8
228,167<--2:3 -178 0 1297 h5g6 g1g6 a8f8 g6g7
228,188<--2:4 -178 2 9624 h5g6 g1g6 e7f7 h4h6 a8e8
228,285<--2:5 -193 12 50955 h5g6 g1g6 b6d7 g6g7 e7d6 h4h7 d7f6
228,344<--2:move h5g6
228,344*2*Found move:Bh5xg6
228,503*1*Start calc, move no: 68
228,505-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6
228,505-->1:go wtime 4114 btime 5270 winc 100 binc 100
228,510<--1:info score cp 305 depth 1 nodes 1 time 0 pv g1g6
228,510<--1:info score cp 305 depth 2 nodes 2 time 0 pv g1g6 b6d7
228,510<--1:info score cp 305 depth 3 nodes 3 time 0 pv g1g6 b6d7 g6g7
228,510<--1:info score cp 305 depth 4 nodes 4 time 0 pv g1g6 b6d7 g6g7 e7d6
228,510<--1:info score cp 305 depth 5 nodes 5 time 0 pv g1g6 b6d7 g6g7 e7d6 e3e4
228,510<--1:info score cp 305 depth 6 nodes 6 time 0 pv g1g6 b6d7 g6g7 e7d6 e3e4 d6c7
228,511<--1:info score cp 305 depth 7 nodes 7 time 0 pv g1g6 b6d7 g6g7 e7d6 e3e4 d6c7 h4h7
228,616<--1:info score cp 305 depth 8 nodes 138185 time 111 pv g1g6 b6d7 g6g7 e7d6 e3e4 a8e8 h4h7 c6c5
228,695<--1:bestmove g1g6
228,695*1*Found move:Rg1xg6
228,854*2*Start calc, move no: 69
229,096-->2:time 527
229,096-->2:otim 393
229,096-->2:g1g6
229,100<--2:1 -158 0 29 a8f8
229,100<--2:2 -178 0 134 a8f8 g6g7
229,100<--2:3 -178 0 1435 e7f7 h4h6 a8e8
229,109<--2:4 -193 1 7305 b6d7 g6g7 e7d6 h4h7 d7f6
229,178<--2:5 -193 8 55383 e7d6 h4h7 b6d7 g6g7 d7f6
229,272<--2:move e7d6
229,272*2*Found move:Ke7-d6
229,434*1*Start calc, move no: 70
229,439-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6
229,439-->1:go wtime 3929 btime 5099 winc 100 binc 100
229,443<--1:info score cp 305 depth 1 nodes 1 time 0 pv g6g7
229,443<--1:info score cp 305 depth 2 nodes 2 time 0 pv g6g7 a8f8
229,443<--1:info score cp 305 depth 3 nodes 3 time 0 pv g6g7 a8f8 g7b7
229,443<--1:info score cp 305 depth 4 nodes 4 time 0 pv g6g7 a8f8 g7b7 f8f2
229,443<--1:info score cp 305 depth 5 nodes 5 time 0 pv g6g7 a8f8 g7b7 f8f2 f1f2
229,443<--1:info score cp 305 depth 6 nodes 6 time 0 pv g6g7 a8f8 g7b7 f8f2 f1f2 c6c5
229,526<--1:info score cp 305 depth 7 nodes 80040 time 85 pv g6g7 b6d7 e3e4 a8e8 h4h7 e8d8 f2f4
229,624<--1:bestmove g6g7
229,624*1*Found move:Rg6-g7
229,802*2*Start calc, move no: 71
230,043-->2:time 510
230,043-->2:otim 375
230,043-->2:g6g7
230,044<--2:1 -178 0 29 a8b8
230,047<--2:2 -198 0 104 a8b8 h4h7
230,047<--2:3 -193 0 778 b6d7 h4h7 d7f6
230,056<--2:4 -208 1 4622 b6d7 f1e2 a8f8 h4h7
230,077<--2:5 -211 3 17869 b6d7 e3e4 c6c5 e4e5 d6c6 h4h7
230,170<--2:6 -224 12 88360 b6d7 e3e4 a8e8 e4e5 d6c7 h4h7 e8d8
230,214<--2:move b6d7
230,214*2*Found move:Nb6-d7
230,368*1*Start calc, move no: 72
230,369-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7
230,369-->1:go wtime 3749 btime 4933 winc 100 binc 100
230,373<--1:info score cp 315 depth 1 nodes 1 time 0 pv e3e4
230,373<--1:info score cp 315 depth 2 nodes 2 time 0 pv e3e4 a8e8
230,373<--1:info score cp 315 depth 3 nodes 3 time 0 pv e3e4 a8e8 h4h7
230,374<--1:info score cp 315 depth 4 nodes 4 time 0 pv e3e4 a8e8 h4h7 e8d8
230,374<--1:info score cp 315 depth 5 nodes 5 time 0 pv e3e4 a8e8 h4h7 e8d8 f2f4
230,374<--1:info score cp 315 depth 6 nodes 6 time 0 pv e3e4 a8e8 h4h7 e8d8 f2f4 d6c7
230,545<--1:bestmove e3e4
230,545*1*Found move:e3-e4
230,700*2*Start calc, move no: 73
230,941-->2:time 494
230,941-->2:otim 358
230,941-->2:e3e4
230,943<--2:1 -178 0 53 a8f8
230,945<--2:2 -193 0 476 e6e5 d4e5 d7e5 g7b7 e5d3
230,950<--2:3 -211 0 4213 c6c5 e4e5 d6c6 h4h7
230,973<--2:4 -224 3 18276 a8e8 e4e5 d6c7 h4h7 e8d8
231,033<--2:5 -241 9 58264 d5e4 d3e4 a8d8 h4h7 d7f6
231,104<--2:move d5e4
231,104*2*Found move:d5xe4
231,333*1*Start calc, move no: 74
231,334-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4
231,334-->1:go wtime 3578 btime 4775 winc 100 binc 100
231,340<--1:info score cp 325 depth 1 nodes 1 time 0 pv d3e4
231,340<--1:info score cp 325 depth 2 nodes 2 time 0 pv d3e4 c6c5
231,340<--1:info score cp 325 depth 3 nodes 3 time 0 pv d3e4 c6c5 h4h7
231,340<--1:info score cp 325 depth 4 nodes 4 time 0 pv d3e4 c6c5 h4h7 a8d8
231,340<--1:info score cp 325 depth 5 nodes 5 time 0 pv d3e4 c6c5 h4h7 a8d8 e4e5
231,505<--1:bestmove d3e4
231,505*1*Found move:d3xe4
231,703*2*Start calc, move no: 75
231,944-->2:time 478
231,944-->2:otim 342
231,944-->2:d3e4
231,946<--2:1 -226 0 33 a8d8
231,948<--2:2 -246 0 168 a8d8 h4h7
231,950<--2:3 -241 0 1086 a8d8 h4h7 d7f6
231,967<--2:4 -238 2 7902 a8d8 f1e2 e6e5 e2d3
232,045<--2:5 -246 10 43318 c6c5 h4h7 a8d8 d4c5 d7c5 f1e2 c5e4 g7b7
232,104<--2:move c6c5
232,104*2*Found move:c6-c5
232,298*1*Start calc, move no: 76
232,299-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5
232,299-->1:go wtime 3412 btime 4620 winc 100 binc 100
232,307<--1:info score cp 265 depth 1 nodes 1 time 0 pv e4e5
232,307<--1:info score cp 265 depth 2 nodes 2 time 0 pv e4e5 d6c7
232,307<--1:info score cp 265 depth 3 nodes 3 time 0 pv e4e5 d6c7 f1e2
232,307<--1:info score cp 265 depth 4 nodes 4 time 0 pv e4e5 d6c7 f1e2 c5d4
232,339<--1:info score cp 275 depth 5 nodes 35341 time 40 pv e4e5 d6c6 d4d5 e6d5 h4h6
232,409<--1:info score cp 325 depth 6 nodes 137600 time 110 pv e4e5 d6c6 h4h6 d7f8 d4c5 a8b8
232,464<--1:bestmove e4e5
232,464*1*Found move:e4-e5
232,634*2*Start calc, move no: 77
232,884-->2:time 462
232,884-->2:otim 326
232,884-->2:e4e5
232,888<--2:1 -259 0 168 d6c6 h4h7
232,892<--2:2 -249 0 463 d6c6 h4h7 a8d8
232,897<--2:3 -245 1 2162 d6c6 h4h7 a8d8 d4c5 d7c5
232,923<--2:4 -244 3 9452 d6c6 d4d5 e6d5 h4h6 c6c7 h6d6 a8d8 d6d5
233,041<--2:move d6c6
233,041*2*Found move:Kd6-c6
233,224*1*Start calc, move no: 78
233,225-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6
233,225-->1:go wtime 3252 btime 4468 winc 100 binc 100
233,230<--1:info score cp 325 depth 1 nodes 1 time 0 pv h4h6
233,230<--1:info score cp 325 depth 2 nodes 2 time 0 pv h4h6 d7f8
233,230<--1:info score cp 325 depth 3 nodes 3 time 0 pv h4h6 d7f8 d4c5
233,230<--1:info score cp 325 depth 4 nodes 4 time 1 pv h4h6 d7f8 d4c5 a8b8
233,231<--1:info score cp 325 depth 5 nodes 5 time 1 pv h4h6 d7f8 d4c5 a8b8 g7g8
233,307<--1:info score cp 425 depth 6 nodes 57778 time 82 pv d4d5 c6b6 g7e7 a8f8 e7e6 b6c7
233,385<--1:bestmove d4d5
233,385*1*Found move:d4-d5
233,551*2*Start calc, move no: 79
233,792-->2:time 447
233,792-->2:otim 410
233,792-->2:d4d5
233,797<--2:1 -127 0 60 e6d5 f2f4
233,798<--2:2 -137 0 473 e6d5 h4h6 c6c7 f2f4
233,800<--2:3 -244 0 2082 e6d5 h4h6 c6c7 h6d6 a8d8 d6d5
233,809<--2:4 -244 1 10371 e6d5 h4h6 c6c7 h6d6 a8d8 d6d5
233,884<--2:5 -396 9 64105 e6d5 h4h6 c6c7 h6h7 c7c6 g7d7 a8b8
233,942<--2:move e6d5
233,942*2*Found move:e6xd5
234,100*1*Start calc, move no: 80
234,102-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5
234,102-->1:go wtime 4097 btime 5323 winc 100 binc 100
234,106<--1:info score cp 485 depth 1 nodes 1 time 0 pv h4h6
234,106<--1:info score cp 485 depth 2 nodes 2 time 0 pv h4h6 c6c7
234,106<--1:info score cp 485 depth 3 nodes 3 time 0 pv h4h6 c6c7 e5e6
234,106<--1:info score cp 485 depth 4 nodes 4 time 0 pv h4h6 c6c7 e5e6 a8e8
234,106<--1:info score cp 485 depth 5 nodes 5 time 0 pv h4h6 c6c7 e5e6 a8e8 e6d7
234,119<--1:info score cp 490 depth 6 nodes 21610 time 17 pv h4h6 c6c7 e5e6 c5c4 h6h7 c4c3
234,236<--1:info score cp 480 depth 7 nodes 186490 time 133 pv h4h6 c6c7 e5e6 a8d8 h6h7 d8f8 e6d7
234,289<--1:bestmove h4h6
234,289*1*Found move:Rh4-h6
234,445*2*Start calc, move no: 81
234,687-->2:time 533
234,687-->2:otim 392
234,687-->2:h4h6
234,688<--2:1 -137 0 70 c6c7 f2f4
234,693<--2:2 -244 0 368 c6c7 h6d6 a8d8 d6d5
234,697<--2:3 -244 0 1674 c6c7 h6d6 a8d8 d6d5
234,711<--2:4 -396 2 10410 c6c7 h6h7 c7c6 g7d7 a8b8
234,767<--2:5 -403 8 54039 c6c7 h6h7 a8d8 e5e6 d5d4 e6d7
234,864<--2:move c6c7
234,864*2*Found move:Kc6-c7
235,047*1*Start calc, move no: 82
235,048-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7
235,048-->1:go wtime 3915 btime 5151 winc 100 binc 100
235,052<--1:info score cp 480 depth 1 nodes 1 time 0 pv e5e6
235,052<--1:info score cp 480 depth 2 nodes 2 time 0 pv e5e6 a8d8
235,052<--1:info score cp 480 depth 3 nodes 3 time 0 pv e5e6 a8d8 h6h7
235,053<--1:info score cp 480 depth 4 nodes 4 time 0 pv e5e6 a8d8 h6h7 c7d6
235,053<--1:info score cp 480 depth 5 nodes 5 time 0 pv e5e6 a8d8 h6h7 c7d6 e6d7
235,053<--1:info score cp 480 depth 6 nodes 6 time 0 pv e5e6 a8d8 h6h7 c7d6 e6d7 d6e5
235,145<--1:info score cp 480 depth 7 nodes 119177 time 97 pv e5e6 a8d8 h6h7 c7d6 e6d7 d6e5 f1e2
235,231<--1:bestmove e5e6
235,231*1*Found move:e5-e6
235,383*2*Start calc, move no: 83
235,623-->2:time 516
235,623-->2:otim 374
235,623-->2:e5e6
235,627<--2:1 -187 0 49 a8d8 e6d7 d8d7
235,628<--2:2 -187 0 123 a8d8 e6d7 d8d7
235,628<--2:3 -395 0 1891 a8e8 g7d7 c7c6 d7g7
235,635<--2:4 -403 1 9197 a8d8 h6h7 d5d4 e6d7
235,678<--2:5 -383 5 46845 a8d8 h6h7 c7d6 e6d7 d5d4
235,795<--2:move a8d8
235,795*2*Found move:Ra8-d8
235,955*1*Start calc, move no: 84
235,956-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8
235,956-->1:go wtime 3737 btime 4984 winc 100 binc 100
235,959<--1:info score cp 480 depth 1 nodes 1 time 0 pv h6h7
235,959<--1:info score cp 480 depth 2 nodes 2 time 0 pv h6h7 d5d4
235,959<--1:info score cp 480 depth 3 nodes 3 time 0 pv h6h7 d5d4 g7d7
235,959<--1:info score cp 480 depth 4 nodes 4 time 0 pv h6h7 d5d4 g7d7 d8d7
235,961<--1:info score cp 480 depth 5 nodes 5 time 0 pv h6h7 d5d4 g7d7 d8d7 e6d7
235,961<--1:info score cp 480 depth 6 nodes 6 time 0 pv h6h7 d5d4 g7d7 d8d7 e6d7 d4d3
236,132<--1:bestmove h6h7
236,132*1*Found move:Rh6-h7
236,285*2*Start calc, move no: 85
236,527-->2:time 499
236,527-->2:otim 357
236,527-->2:h6h7
236,528<--2:1 -403 0 78 d5d4 e6d7
236,529<--2:2 -403 0 167 d5d4 e6d7
236,534<--2:3 -383 0 1594 c7d6 e6d7 d5d4
236,541<--2:4 -417 1 5421 c7d6 e6d7 d8f8 f1e2
236,581<--2:5 -406 5 35978 c5c4 f2f4 c7d6 e6d7 d5d4
236,694<--2:move c5c4
236,694*2*Found move:c5-c4
236,884*1*Start calc, move no: 86
236,884-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4
236,884-->1:go wtime 3566 btime 4822 winc 100 binc 100
236,887<--1:info score cp 475 depth 1 nodes 1 time 0 pv e6e7
236,887<--1:info score cp 475 depth 2 nodes 2 time 0 pv e6e7 d8e8
236,887<--1:info score cp 475 depth 3 nodes 3 time 0 pv e6e7 d8e8 f1e1
236,887<--1:info score cp 475 depth 4 nodes 4 time 0 pv e6e7 d8e8 f1e1 c7c6
236,887<--1:info score cp 475 depth 5 nodes 5 time 0 pv e6e7 d8e8 f1e1 c7c6 f2f3
236,971<--1:info score cp 500 depth 6 nodes 45733 time 87 pv e6d7 c4c3 f1e2 d8f8 e2d3 f8f3
237,045<--1:info score cp 765 depth 7 nodes 128604 time 162 pv g7d7 d8d7 h7d7 c7c8 d7d5 c4c3 e6e7
237,055<--1:bestmove g7d7
237,055*1*Found move:Rg7xd7
237,213*2*Start calc, move no: 87
237,454-->2:time 483
237,454-->2:otim 340
237,454-->2:g7d7
237,457<--2:1 -380 0 31 d8d7 h7d7
237,458<--2:2 -416 0 209 d8d7 h7d7 c7c6 f2f4
237,458<--2:3 -393 0 883 d8d7 h7d7 c7c6 f2f4 c4c3
237,458<--2:4 -416 0 3203 d8d7 h7d7 c7c6 f2f4 c4c3 f4f5
237,476<--2:5 -652 2 19389 d8d7 h7d7 c7c8 d7d5 c8c7 e6e7 c7c6 e7e8q c6d5
237,545<--2:6 -652 9 77072 d8d7 h7d7 c7c8 d7d5 c8c7 e6e7 c7c6 e7e8q c6d5
237,616<--2:move d8d7
237,616*2*Found move:Rd8xd7
237,770*1*Start calc, move no: 88
237,771-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7
237,771-->1:go wtime 3400 btime 4665 winc 100 binc 100
237,775<--1:info score cp 765 depth 1 nodes 1 time 0 pv h7d7
237,775<--1:info score cp 765 depth 2 nodes 2 time 0 pv h7d7 c7c8
237,777<--1:info score cp 765 depth 3 nodes 3 time 0 pv h7d7 c7c8 d7d5
237,777<--1:info score cp 765 depth 4 nodes 4 time 0 pv h7d7 c7c8 d7d5 c8c7
237,777<--1:info score cp 765 depth 5 nodes 5 time 0 pv h7d7 c7c8 d7d5 c8c7 e6e7
237,777<--1:info score cp 765 depth 6 nodes 6 time 0 pv h7d7 c7c8 d7d5 c8c7 e6e7 c7c6
237,810<--1:info score cp 820 depth 7 nodes 45844 time 37 pv h7d7 c7c8 d7d5 c8c7 e6e7 c7c6 e7e8q
237,937<--1:bestmove h7d7
237,937*1*Found move:Rh7xd7
238,088*2*Start calc, move no: 89
238,328-->2:time 467
238,328-->2:otim 324
238,328-->2:h7d7
238,331<--2:1 -416 0 84 c7c6 f2f4
238,331<--2:2 -393 0 275 c7c6 f2f4 c4c3
238,331<--2:3 -416 0 1031 c7c6 f2f4 c4c3 f4f5
238,340<--2:4 -652 1 6347 c7c8 d7d5 c8c7 e6e7 c7c6 e7e8q c6d5
238,360<--2:5 -652 3 20964 c7c8 d7d5 c8c7 e6e7 c7c6 e7e8q c6d5
238,456<--2:6 -1039 12 101681 c7c6 d7d8 c4c3 e6e7 c6c7 e7e8q c3c2
238,485<--2:move c7c6
238,485*2*Found move:Kc7-c6
238,656*1*Start calc, move no: 90
238,658-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6
238,658-->1:go wtime 3239 btime 4513 winc 100 binc 100
238,663<--1:info score cp 1355 depth 1 nodes 1 time 0 pv e6e7
238,664<--1:info score cp 1355 depth 2 nodes 2 time 0 pv e6e7 c6d7
238,664<--1:info score cp 1355 depth 3 nodes 3 time 0 pv e6e7 c6d7 f2f3
238,664<--1:info score cp 1355 depth 4 nodes 4 time 0 pv e6e7 c6d7 f2f3 d7e7
238,664<--1:info score cp 1355 depth 5 nodes 5 time 1 pv e6e7 c6d7 f2f3 d7e7 f1e1
238,664<--1:info score cp 1355 depth 6 nodes 6 time 1 pv e6e7 c6d7 f2f3 d7e7 f1e1 a7a6
238,664<--1:info score cp 1355 depth 7 nodes 7 time 1 pv e6e7 c6d7 f2f3 d7e7 f1e1 a7a6 e1e2
238,819<--1:bestmove e6e7
238,819*1*Found move:e6-e7
238,979*2*Start calc, move no: 91
239,220-->2:time 452
239,220-->2:otim 309
239,220-->2:e6e7
239,222<--2:1 136 0 19 c6d7
239,227<--2:2 342 0 61 c6d7 f2f4 d7e7
239,233<--2:3 332 0 211 c6d7 e7e8q d7e8 f2f4
239,233<--2:4 332 0 662 c6d7 e7e8r d7e8 f2f4
239,233<--2:5 341 1 1960 c6d7 e7e8q d7e8 f2f4 d5d4 f4f5
239,246<--2:6 331 2 7020 c6d7 f2f4 d7e7 f1e2 d5d4 f4f5
239,264<--2:7 355 4 19308 c6d7 f2f4 d7e7 f1e2 d5d4 f4f5 d4d3
239,304<--2:8 355 8 56351 c6d7 f2f4 d7e7 f1e2 d5d4 e2f3 d4d3 f4f5
239,371<--2:move c6d7
239,371*2*Found move:Kc6xd7
239,527*1*Start calc, move no: 92
239,527-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7
239,527-->1:go wtime 3083 btime 4367 winc 100 binc 100
239,531<--1:info score cp -290 depth 1 nodes 1 time 0 pv f1e1
239,535<--1:info score cp -290 depth 2 nodes 2 time 0 pv f1e1 d7e8
239,535<--1:info score cp -290 depth 3 nodes 3 time 0 pv f1e1 d7e8 e1e2
239,535<--1:info score cp -290 depth 4 nodes 4 time 0 pv f1e1 d7e8 e1e2 d5d4
239,535<--1:info score cp -290 depth 5 nodes 5 time 0 pv f1e1 d7e8 e1e2 d5d4 f2f4
239,535<--1:info score cp -290 depth 6 nodes 6 time 0 pv f1e1 d7e8 e1e2 d5d4 f2f4 e8e7
239,551<--1:info score cp -275 depth 7 nodes 18244 time 22 pv f1e2 d5d4 e2d2 d7e7 d2e2 c4c3 e2d3
239,577<--1:info score cp -300 depth 8 nodes 53442 time 49 pv f1e2 d5d4 e7e8q d7e8 e2f3 d4d3 a3a4 a7a6
239,643<--1:info score cp -300 depth 9 nodes 135191 time 115 pv f1e2 d7e7 e2d2 e7d7 f2f4 c4c3 d2c3 d7e7 a3a4
239,682<--1:bestmove f1e2
239,682*1*Found move:Kf1-e2
239,839*2*Start calc, move no: 93
240,082-->2:time 437
240,082-->2:otim 294
240,082-->2:f1e2
240,084<--2:1 368 0 14 d7e7
240,086<--2:2 354 0 134 d5d4 f2f4 d7e7
240,087<--2:3 354 0 323 d7e7 f2f4 d5d4
240,088<--2:4 354 0 1359 d5d4 e2d2 d7e7 f2f4
240,093<--2:5 355 1 3465 d5d4 f2f4 d7e7 f4f5 d4d3
240,108<--2:6 355 2 11768 d5d4 f2f4 d7e7 e2f3 d4d3 f4f5
240,147<--2:7 355 6 46012 d5d4 e7e8q d7e8 f2f4 d4d3 e2e3 e8e7 f4f5 e7d6
240,228<--2:move d5d4
240,228*2*Found move:d5-d4
240,383*1*Start calc, move no: 94
240,384-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4
240,384-->1:go wtime 2933 btime 4226 winc 100 binc 100
240,389<--1:info score cp -295 depth 1 nodes 1 time 0 pv f2f4
240,389<--1:info score cp -295 depth 2 nodes 2 time 0 pv f2f4 d7e7
240,389<--1:info score cp -295 depth 3 nodes 3 time 0 pv f2f4 d7e7 e2f3
240,389<--1:info score cp -295 depth 4 nodes 4 time 0 pv f2f4 d7e7 e2f3 e7d6
240,389<--1:info score cp -295 depth 5 nodes 5 time 0 pv f2f4 d7e7 e2f3 e7d6 f3e4
240,389<--1:info score cp -295 depth 6 nodes 6 time 0 pv f2f4 d7e7 e2f3 e7d6 f3e4 d6c5
240,391<--1:info score cp -295 depth 7 nodes 7 time 0 pv f2f4 d7e7 e2f3 e7d6 f3e4 d6c5 f4f5
240,410<--1:info score cp -305 depth 8 nodes 26222 time 25 pv f2f4 d7e7 e2f3 e7d6 f3e4 d6c5 f4f5 c4c3
240,502<--1:info score cp -305 depth 9 nodes 141973 time 118 pv e7e8r d7e8 f2f4 e8e7 e2f3 e7f6 f3e4 c4c3 a3a4
240,533<--1:bestmove e7e8r
240,533*1*Found move:e7-e8R
240,700*2*Start calc, move no: 95
240,940-->2:time 423
240,940-->2:otim 279
240,940-->2:e7e8r
240,944<--2:1 390 0 11 d7e8
240,945<--2:2 404 0 83 d4d3 e2e3 d7e8
240,945<--2:3 368 0 371 d7e8 f2f4 d4d3
240,945<--2:4 368 0 1330 d7e8 f2f4 d4d3 e2e3 e8d7
240,948<--2:5 355 0 5674 d7e8 f2f4 e8d7 f4f5 d4d3
240,962<--2:6 355 2 19257 d7e8 f2f4 e8d7 f4f5 d4d3 e2e3 d7d6
240,997<--2:7 378 5 51417 d7e8 f2f4 e8e7 e2f3 d4d3 f3e3 e7e6
241,083<--2:move d7e8
241,083*2*Found move:Kd7xe8
241,253*1*Start calc, move no: 96
241,254-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4 e7e8r d7e8
241,254-->1:go wtime 2789 btime 4088 winc 100 binc 100
241,257<--1:info score cp -305 depth 1 nodes 1 time 0 pv f2f4
241,259<--1:info score cp -305 depth 2 nodes 2 time 0 pv f2f4 e8e7
241,259<--1:info score cp -305 depth 3 nodes 3 time 0 pv f2f4 e8e7 e2f3
241,259<--1:info score cp -305 depth 4 nodes 4 time 0 pv f2f4 e8e7 e2f3 e7f6
241,259<--1:info score cp -305 depth 5 nodes 5 time 0 pv f2f4 e8e7 e2f3 e7f6 f3e4
241,260<--1:info score cp -305 depth 6 nodes 6 time 0 pv f2f4 e8e7 e2f3 e7f6 f3e4 d4d3
241,260<--1:info score cp -305 depth 7 nodes 7 time 0 pv f2f4 e8e7 e2f3 e7f6 f3e4 d4d3 e4d4
241,261<--1:info score cp -305 depth 8 nodes 8 time 0 pv f2f4 e8e7 e2f3 e7f6 f3e4 d4d3 e4d4 f6e6
241,261<--1:info score cp -305 depth 9 nodes 9 time 0 pv f2f4 e8e7 e2f3 e7f6 f3e4 d4d3 e4d4 f6e6 d4c4
241,398<--1:bestmove f2f4
241,398*1*Found move:f2-f4
241,555*2*Start calc, move no: 97
241,795-->2:time 409
241,795-->2:otim 265
241,795-->2:f2f4
241,798<--2:1 368 0 12 d4d3
241,800<--2:2 368 0 62 d4d3 e2e3 e8d7
241,800<--2:3 355 0 441 e8d7 f4f5 d4d3
241,802<--2:4 355 0 1971 e8d7 f4f5 d4d3 e2e3 d7d6
241,811<--2:5 378 1 7114 e8e7 e2f3 d4d3 f3e3 e7e6
241,834<--2:6 387 3 23396 e8e7 a3a4 d4d3 e2d2 e7e6 d2e3 e6d5
241,892<--2:7 387 9 77142 e8e7 a3a4 e7e6 e2f3 d4d3 f3e3 e6d5
241,933<--2:move e8e7
241,933*2*Found move:Ke8-e7
242,088*1*Start calc, move no: 98
242,089-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4 e7e8r d7e8 f2f4 e8e7
242,089-->1:go wtime 2650 btime 3955 winc 100 binc 100
242,093<--1:info score cp -305 depth 1 nodes 1 time 0 pv e2f3
242,093<--1:info score cp -305 depth 2 nodes 2 time 0 pv e2f3 e7f6
242,093<--1:info score cp -305 depth 3 nodes 3 time 0 pv e2f3 e7f6 f3e4
242,094<--1:info score cp -305 depth 4 nodes 4 time 0 pv e2f3 e7f6 f3e4 d4d3
242,094<--1:info score cp -305 depth 5 nodes 5 time 0 pv e2f3 e7f6 f3e4 d4d3 e4d4
242,094<--1:info score cp -305 depth 6 nodes 6 time 0 pv e2f3 e7f6 f3e4 d4d3 e4d4 f6e6
242,094<--1:info score cp -305 depth 7 nodes 7 time 0 pv e2f3 e7f6 f3e4 d4d3 e4d4 f6e6 d4c4
242,094<--1:info score cp -305 depth 8 nodes 8 time 0 pv e2f3 e7f6 f3e4 d4d3 e4d4 f6e6 d4c4 d3d2
242,198<--1:info score cp -380 depth 9 nodes 127181 time 108 pv e2f3 e7e6 a3a4 e6f5 a4a5 c4c3 f3g3 b7b6 a5b6
242,229<--1:bestmove e2f3
242,229*1*Found move:Ke2-f3
242,383*2*Start calc, move no: 99
242,624-->2:time 396
242,624-->2:otim 352
242,624-->2:e2f3
242,628<--2:1 378 0 15 d4d3
242,628<--2:2 355 0 56 d4d3 f4f5
242,628<--2:3 378 0 347 d4d3 f3e3 e7d6
242,628<--2:4 392 0 1373 c4c3 f3e2 c3c2 e2d2
242,633<--2:5 416 0 5530 c4c3 f3e2 c3c2 e2d2 d4d3
242,649<--2:6 393 2 16623 c4c3 f3e2 c3c2 e2d2 d4d3 f4f5
242,707<--2:7 403 8 74271 c4c3 f3e2 c3c2 e2d2 d4d3 f4f5 e7d6
242,758<--2:move c4c3
242,758*2*Found move:c4-c3
242,922*1*Start calc, move no: 100
242,922-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4 e7e8r d7e8 f2f4 e8e7 e2f3 c4c3
242,922-->1:go wtime 3515 btime 4826 winc 100 binc 100
242,927<--1:info score cp -345 depth 1 nodes 1 time 0 pv f3e2
242,927<--1:info score cp -345 depth 2 nodes 2 time 0 pv f3e2 e7f7
242,927<--1:info score cp -345 depth 3 nodes 3 time 0 pv f3e2 e7f7 a3a4
242,927<--1:info score cp -345 depth 4 nodes 4 time 0 pv f3e2 e7f7 a3a4 a7a6
242,927<--1:info score cp -345 depth 5 nodes 5 time 0 pv f3e2 e7f7 a3a4 a7a6 e2d3
242,927<--1:info score cp -345 depth 6 nodes 6 time 0 pv f3e2 e7f7 a3a4 a7a6 e2d3 f7f8
242,927<--1:info score cp -345 depth 7 nodes 7 time 0 pv f3e2 e7f7 a3a4 a7a6 e2d3 f7f8 f4f5
242,935<--1:info score cp -380 depth 8 nodes 5202 time 10 pv f3e2 e7f7 a3a4 a7a6 e2d3 f7f8 f4f5 c3c2
242,994<--1:info score cp -400 depth 9 nodes 72778 time 70 pv f3e2 b7b6 a3a4 e7e6 e2d3 e6d5 f4f5 a7a6 d3c2
243,092<--1:bestmove f3e2
243,092*1*Found move:Kf3-e2
243,249*2*Start calc, move no: 101
243,491-->2:time 483
243,491-->2:otim 335
243,491-->2:f3e2
243,493<--2:1 392 0 16 c3c2
243,494<--2:2 392 0 90 c3c2 e2d2
243,494<--2:3 416 0 371 c3c2 e2d2 d4d3
243,494<--2:4 393 0 1082 c3c2 e2d2 d4d3 f4f5
243,498<--2:5 403 0 3975 c3c2 e2d2 d4d3 f4f5 e7d6
243,515<--2:6 424 2 16513 c3c2 e2d2 d4d3 a3a4 e7e6 a4a5
243,585<--2:7 436 9 74822 c3c2 e2d2 d4d3 d2c1 e7e6 c1d2 e6d5
243,652<--2:move c3c2
243,652*2*Found move:c3-c2
243,841*1*Start calc, move no: 102
243,843-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4 e7e8r d7e8 f2f4 e8e7 e2f3 c4c3 f3e2 c3c2
243,843-->1:go wtime 3350 btime 4670 winc 100 binc 100
243,847<--1:info score cp -390 depth 1 nodes 1 time 0 pv e2d2
243,847<--1:info score cp -390 depth 2 nodes 2 time 0 pv e2d2 e7e8
243,847<--1:info score cp -390 depth 3 nodes 3 time 0 pv e2d2 e7e8 a3a4
243,847<--1:info score cp -390 depth 4 nodes 4 time 0 pv e2d2 e7e8 a3a4 e8e7
243,847<--1:info score cp -390 depth 5 nodes 5 time 0 pv e2d2 e7e8 a3a4 e8e7 d2c2
243,847<--1:info score cp -390 depth 6 nodes 6 time 0 pv e2d2 e7e8 a3a4 e8e7 d2c2 e7d6
243,847<--1:info score cp -390 depth 7 nodes 7 time 0 pv e2d2 e7e8 a3a4 e8e7 d2c2 e7d6 c2d3
243,847<--1:info score cp -390 depth 8 nodes 8 time 0 pv e2d2 e7e8 a3a4 e8e7 d2c2 e7d6 c2d3 a7a6
243,939<--1:info score cp -400 depth 9 nodes 67426 time 96 pv e2d2 d4d3 f4f5 e7f6 d2c1 f6f5 a3a4 f5e4 c1d2
244,006<--1:bestmove e2d2
244,006*1*Found move:Ke2-d2
244,160*2*Start calc, move no: 103
244,400-->2:time 467
244,400-->2:otim 320
244,400-->2:e2d2
244,403<--2:1 416 0 32 d4d3
244,405<--2:2 393 0 113 d4d3 f4f5
244,406<--2:3 403 0 420 d4d3 f4f5 e7d6
244,409<--2:4 424 0 1845 d4d3 a3a4 e7e6 a4a5
244,422<--2:5 436 2 6714 d4d3 d2c1 e7e6 c1d2 e6d5
244,439<--2:6 518 3 24450 d4d3 a3a4 e7f6 a4a5 f6f5 a5a6 b7a6
244,494<--2:7 518 9 80428 d4d3 a3a4 e7f6 a4a5 f6f5 a5a6 b7a6
244,557<--2:move d4d3
244,557*2*Found move:d4-d3
244,713*1*Start calc, move no: 104
244,714-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4 e7e8r d7e8 f2f4 e8e7 e2f3 c4c3 f3e2 c3c2 e2d2 d4d3
244,714-->1:go wtime 3192 btime 4518 winc 100 binc 100
244,720<--1:info score cp -460 depth 1 nodes 1 time 0 pv d2c1
244,720<--1:info score cp -460 depth 2 nodes 2 time 0 pv d2c1 e7e6
244,720<--1:info score cp -460 depth 3 nodes 3 time 0 pv d2c1 e7e6 c1d2
244,720<--1:info score cp -460 depth 4 nodes 4 time 0 pv d2c1 e7e6 c1d2 e6f5
244,720<--1:info score cp -460 depth 5 nodes 5 time 0 pv d2c1 e7e6 c1d2 e6f5 d2d3
244,720<--1:info score cp -460 depth 6 nodes 6 time 0 pv d2c1 e7e6 c1d2 e6f5 d2d3 c2c1q
244,721<--1:info score cp -460 depth 7 nodes 7 time 0 pv d2c1 e7e6 c1d2 e6f5 d2d3 c2c1q d3d4
244,721<--1:info score cp -460 depth 8 nodes 8 time 0 pv d2c1 e7e6 c1d2 e6f5 d2d3 c2c1q d3d4 f5f4
244,763<--1:info score cp -460 depth 9 nodes 52609 time 48 pv d2c1 e7e6 c1d2 e6f5 d2c1 f5f4 c1d2 f4e4 d2c3
244,873<--1:bestmove d2c1
244,873*1*Found move:Kd2-c1
245,037*2*Start calc, move no: 105
245,279-->2:time 452
245,279-->2:otim 304
245,279-->2:d2c1
245,282<--2:1 446 0 21 e7d6
245,284<--2:2 426 0 101 e7e6 c1d2
245,284<--2:3 436 0 577 e7e6 c1d2 e6d5
245,286<--2:4 571 0 1892 e7e6 c1d2 e6f5 a3a4 f5f4
245,290<--2:5 571 0 6295 e7e6 c1d2 e6f5 a3a4 f5f4
245,318<--2:6 572 3 33626 e7e6 c1d2 e6f5 d2c1 f5f4 c1d2
245,402<--2:7 582 12 119876 e7e6 c1d2 e6f5 d2c1 f5f4 c1d2 f4e5
245,431<--2:move e7e6
245,431*2*Found move:Ke7-e6
245,584*1*Start calc, move no: 106
245,584-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4 e7e8r d7e8 f2f4 e8e7 e2f3 c4c3 f3e2 c3c2 e2d2 d4d3 d2c1 e7e6
245,584-->1:go wtime 3038 btime 4371 winc 100 binc 100
245,590<--1:info score cp -555 depth 1 nodes 1 time 0 pv f4f5
245,590<--1:info score cp -555 depth 2 nodes 2 time 0 pv f4f5 e6f5
245,590<--1:info score cp -555 depth 3 nodes 3 time 0 pv f4f5 e6f5 a3a4
245,590<--1:info score cp -555 depth 4 nodes 4 time 0 pv f4f5 e6f5 a3a4 f5e4
245,590<--1:info score cp -555 depth 5 nodes 5 time 0 pv f4f5 e6f5 a3a4 f5e4 a4a5
245,590<--1:info score cp -555 depth 6 nodes 6 time 0 pv f4f5 e6f5 a3a4 f5e4 a4a5 e4e5
245,590<--1:info score cp -555 depth 7 nodes 7 time 0 pv f4f5 e6f5 a3a4 f5e4 a4a5 e4e5 c1b2
245,590<--1:info score cp -555 depth 8 nodes 8 time 0 pv f4f5 e6f5 a3a4 f5e4 a4a5 e4e5 c1b2 e5d4
245,661<--1:info score cp -565 depth 9 nodes 95910 time 74 pv f4f5 e6f5 c1b2 f5e4
245,739<--1:bestmove f4f5
245,740*1*Found move:f4-f5
245,895*2*Start calc, move no: 107
246,136-->2:time 438
246,136-->2:otim 289
246,136-->2:f4f5
246,139<--2:1 572 0 67 e6f5 c1d2
246,139<--2:2 582 0 242 e6f5 c1d2 f5e5
246,139<--2:3 581 0 1560 e6f5 a3a4 f5e5 c1d2
246,144<--2:4 581 0 5446 e6f5 a3a4 f5e5 c1d2 e5d5
246,168<--2:5 591 3 25314 e6f5 c1d2 f5e4 d2c1 e4e3 a3a4
246,224<--2:6 601 8 79018 e6f5 c1d2 f5e4 d2c1 e4e3 a3a4 e3d4
246,283<--2:move e6f5
246,283*2*Found move:Ke6xf5
246,455*1*Start calc, move no: 108
246,456-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4 e7e8r d7e8 f2f4 e8e7 e2f3 c4c3 f3e2 c3c2 e2d2 d4d3 d2c1 e7e6 f4f5 e6f5
246,456-->1:go wtime 2887 btime 4229 winc 100 binc 100
246,459<--1:info score cp -1125 depth 1 nodes 1 time 0 pv c1b2
246,459<--1:info score cp -1125 depth 2 nodes 2 time 0 pv c1b2 f5e4
246,459<--1:info score cp -1125 depth 3 nodes 3 time 0 pv c1b2 f5e4 a3a4
246,459<--1:info score cp -1125 depth 4 nodes 4 time 0 pv c1b2 f5e4 a3a4 e4e3
246,459<--1:info score cp -1125 depth 5 nodes 5 time 0 pv c1b2 f5e4 a3a4 e4e3 b2c1
246,459<--1:info score cp -1125 depth 6 nodes 6 time 0 pv c1b2 f5e4 a3a4 e4e3 b2c1 d3d2
246,459<--1:info score cp -1125 depth 7 nodes 7 time 0 pv c1b2 f5e4 a3a4 e4e3 b2c1 d3d2 c1c2
246,459<--1:info score cp -1125 depth 8 nodes 8 time 0 pv c1b2 f5e4 a3a4 e4e3 b2c1 d3d2 c1c2 e3e2
246,459<--1:info score cp -1125 depth 9 nodes 9 time 0 pv c1b2 f5e4 a3a4 e4e3 b2c1 d3d2 c1c2 e3e2 c2c3
246,604<--1:bestmove c1b2
246,604*1*Found move:Kc1-b2
246,777*2*Start calc, move no: 109
247,018-->2:time 423
247,018-->2:otim 275
247,018-->2:c1b2
247,027<--2:1 602 0 29 f5e5
247,027<--2:2 601 0 131 f5e5 a3a4
247,027<--2:3 601 0 648 f5e5 a3a4 e5d5
247,027<--2:4 591 0 3477 f5e4 b2c1 e4e3 a3a4
247,040<--2:5 601 1 11311 f5e4 b2c1 e4e3 a3a4 e3d4
247,073<--2:6 631 5 43506 b7b5 b2c1 a7a5 c1d2 b5b4 a3b4 a5b4
247,154<--2:7 1018 13 125180 f5e4 a3a4 e4e3 b2c1 d3d2 c1c2 e3e2 c2c3 d2d1q
247,163<--2:move f5e4
247,163*2*Found move:Kf5-e4
247,319*1*Start calc, move no: 110
247,320-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4 e7e8r d7e8 f2f4 e8e7 e2f3 c4c3 f3e2 c3c2 e2d2 d4d3 d2c1 e7e6 f4f5 e6f5 c1b2 f5e4
247,320-->1:go wtime 2744 btime 4089 winc 100 binc 100
247,323<--1:info score cp -1285 depth 1 nodes 1 time 0 pv b2c1
247,324<--1:info score cp -1285 depth 2 nodes 2 time 0 pv b2c1 e4e3
247,324<--1:info score cp -1285 depth 3 nodes 3 time 0 pv b2c1 e4e3 c1b2
247,325<--1:info score cp -1285 depth 4 nodes 4 time 0 pv b2c1 e4e3 c1b2 e3d2
247,325<--1:info score cp -1285 depth 5 nodes 5 time 0 pv b2c1 e4e3 c1b2 e3d2 b2b3
247,325<--1:info score cp -1285 depth 6 nodes 6 time 0 pv b2c1 e4e3 c1b2 e3d2 b2b3 a7a6
247,325<--1:info score cp -1285 depth 7 nodes 7 time 0 pv b2c1 e4e3 c1b2 e3d2 b2b3 a7a6 b3c4
247,325<--1:info score cp -1285 depth 8 nodes 8 time 0 pv b2c1 e4e3 c1b2 e3d2 b2b3 a7a6 b3c4 c2c1q
247,447<--1:info score cp -1355 depth 9 nodes 177760 time 127 pv a3a4 b7b6 b2c1 a7a6 a4a5 b6a5 c1d2 a5a4 d2c1
247,465<--1:bestmove a3a4
247,465*1*Found move:a3-a4
247,619*2*Start calc, move no: 111
247,860-->2:time 409
247,860-->2:otim 261
247,860-->2:a3a4
247,862<--2:1 601 0 28 e4d5
247,862<--2:2 600 0 148 e4d5 a4a5
247,862<--2:3 604 0 613 b7b6 b2c1 a7a6
247,862<--2:4 593 0 2642 a7a6 a4a5 e4d5 b2c1
247,874<--2:5 1018 1 8476 e4e3 b2c1 d3d2 c1c2 e3e2 c2c3 d2d1q
247,896<--2:6 1218 3 29040 a7a5 b2c1 e4e3 c1b2 e3d2 b2b3 c2c1q
247,950<--2:7 1218 9 83806 a7a5 b2c1 e4e3 c1b2 e3d2 b2b3 c2c1q
247,996<--2:move a7a5
247,996*2*Found move:a7-a5
248,151*1*Start calc, move no: 112
248,153-->1:position startpos moves d2d4 g8f6 c1e3 d7d5 b1c3 e7e6 g1f3 b8c6 e3f4 f8b4 e2e3 f6e4 f3d2 b4c3 b2c3 e4c3 d1g4 e8g8 g4g3 c6b4 f1d3 c7c6 a2a3 b4d3 c2d3 c8d7 f4h6 d8f6 h6f4 f6f5 f4h6 f5g6 g3g6 f7g6 h6f4 f8f7 d2f3 f7f5 a1c1 c3a4 e1g1 a4b6 f4d6 f5f6 f3e5 g6g5 d6e7 f6h6 e7g5 h6h5 h2h4 h7h6 g2g4 h6g5 g4h5 g5h4 g1g2 d7e8 f1h1 e8h5 h1h4 g7g6 c1g1 g8f8 g2f1 f8e7 e5g6 h5g6 g1g6 e7d6 g6g7 b6d7 e3e4 d5e4 d3e4 c6c5 e4e5 d6c6 d4d5 e6d5 h4h6 c6c7 e5e6 a8d8 h6h7 c5c4 g7d7 d8d7 h7d7 c7c6 e6e7 c6d7 f1e2 d5d4 e7e8r d7e8 f2f4 e8e7 e2f3 c4c3 f3e2 c3c2 e2d2 d4d3 d2c1 e7e6 f4f5 e6f5 c1b2 f5e4 a3a4 a7a5
248,153-->1:go wtime 2604 btime 3958 winc 100 binc 100
248,157<--1:info score cp -1325 depth 1 nodes 1 time 0 pv b2c1
248,157<--1:info score cp -1325 depth 2 nodes 2 time 0 pv b2c1 e4e5
248,157<--1:info score cp -1325 depth 3 nodes 3 time 0 pv b2c1 e4e5 c1d2
248,157<--1:info score cp -1325 depth 4 nodes 4 time 0 pv b2c1 e4e5 c1d2 e5d5
248,157<--1:info score cp -1325 depth 5 nodes 5 time 0 pv b2c1 e4e5 c1d2 e5d5 d2d3
248,157<--1:info score cp -1325 depth 6 nodes 6 time 0 pv b2c1 e4e5 c1d2 e5d5 d2d3 c2c1q
248,157<--1:info score cp -1325 depth 7 nodes 7 time 0 pv b2c1 e4e5 c1d2 e5d5 d2d3 c2c1q d3e2
248,192<--1:info score cp -1495 depth 8 nodes 46903 time 38 pv b2c1 e4e3 c1b2 e3f3 b2b3 c2c1b b3c3 d3d2
248,246<--1:info score cp -2180 depth 9 nodes 121937 time 93 pv b2c1 e4d4 c1b2 d4c5 b2c3 c2c1q c3b3 d3d2 b3a2
248,302<--1:bestmove b2c1
248,302*1*Found move:Kb2-c1
248,461*2*Start calc, move no: 113
248,703-->2:time 396
248,703-->2:otim 246
248,703-->2:b2c1
248,707<--2:1 597 0 19 b7b6
248,707<--2:2 585 0 173 e4e3 c1b2
248,707<--2:3 595 0 576 e4e3 c1b2 e3d4
248,707<--2:4 1218 0 1307 e4e3 c1b2 e3d2 b2b3 c2c1q
248,707<--2:5 1218 0 3678 e4e3 c1b2 e3d2 b2b3 c2c1q
248,720<--2:6 1228 1 13635 e4e3 c1b2 e3d2 b2a2 d2c3 a2a3 c2c1q
248,767<--2:7 1228 6 42211 e4e3 c1b2 e3d2 b2a2 d2c3 a2a3 c2c1q
248,836<--2:move e4e3
248,836*2*Found move:Ke4-e3
249,020********Game end: 0-1 {Arena Adjudication}
249,022********Last game won by Tscp 1.81 with Black in 57 moves
249,025********LiSHeX  -  Tscp 1.81:
249,031********   5 B 2    5.0:0.0        0.0:5.0       15:49:03   -12.28    57 5.885 :4.430  0-5-0
249,055********Saving file /home/mkjm/Tournaments/Testing.pgn
249,082-->2:?
249,087<--2:Error (unknown command): ?
249,103-->2:result 0-1
249,110<--2:Error (unknown command): result
250,236********Round 6 of 10: Tscp 1.81  -  LiSHeX
250,286**----------New game---2023-06-13 15:49:05,205 Tue -------------
250,286-->2:new
250,290-->2:post
250,336*2*Start calc, move no: 0
250,337-->2:time 1000
250,337-->2:otim 1000
250,337-->2:white
250,337-->2:go
250,340<--2:move g2g3
250,340*2*Found move:g2-g3
250,490*1*Start calc, move no: 1
250,491-->1:ucinewgame
250,491-->1:isready
250,491<--1:readyok
250,498-->1:position startpos moves g2g3
250,498-->1:go wtime 10000 btime 10000 winc 100 binc 100
250,503<--1:info score cp -22 depth 1 nodes 1 time 0 pv a7a6
250,504<--1:info score cp -22 depth 2 nodes 2 time 0 pv a7a6
250,504<--1:info score cp -22 depth 3 nodes 3 time 0 pv a7a6
250,505<--1:info score cp 10 depth 4 nodes 6345 time 4 pv e7e5 e2e4 d7d5 d2d4
250,511<--1:info score cp 35 depth 5 nodes 11298 time 14 pv e7e5 e2e4 d7d5 d2d4 c8e6
250,585<--1:info score cp 15 depth 6 nodes 89221 time 86 pv e7e5 e2e4 d7d5 b1c3 g8f6 f1d3
250,797<--1:info score cp 30 depth 7 nodes 316598 time 299 pv e7e5 e2e4 g8f6 f1g2
250,882<--1:bestmove e7e5
250,882*1*Found move:e7-e5
251,039*2*Start calc, move no: 2
251,281-->2:time 1000
251,281-->2:otim 963
251,281-->2:e7e5
251,284<--2:1 -6 0 24 d2d4
251,284<--2:2 -41 0 130 d2d4 b8c6
251,285<--2:3 -11 0 1399 d2d4 f8b4 c1d2 b4d6
251,306<--2:4 -49 2 7310 e2e4 b8c6 b1c3 g8f6
251,399<--2:5 -19 11 45369 b1c3 d7d5 d2d4 e5d4 d1d4
251,617<--2:move d2d4
251,617*2*Found move:d2-d4
251,772*1*Start calc, move no: 3
251,773-->1:position startpos moves g2g3 e7e5 d2d4
251,773-->1:go wtime 9669 btime 9621 winc 100 binc 100
251,796<--1:info score cp 30 depth 1 nodes 1 time 0 pv e5d4
251,803<--1:info score cp 30 depth 2 nodes 2 time 0 pv e5d4 d1d4
251,805<--1:info score cp 30 depth 3 nodes 3 time 0 pv e5d4 d1d4 d7d5
251,807<--1:info score cp 30 depth 4 nodes 4 time 0 pv e5d4 d1d4 d7d5 e2e4
251,807<--1:info score cp 30 depth 5 nodes 5 time 0 pv e5d4 d1d4 d7d5 e2e4 c8e6
251,998<--1:info score cp 35 depth 6 nodes 184400 time 225 pv e5d4 d1d4 b8c6 d4a4 f8b4 c1d2
252,145<--1:bestmove e5d4
252,145*1*Found move:e5xd4
252,294*2*Start calc, move no: 4
252,535-->2:time 967
252,535-->2:otim 926
252,535-->2:e5d4
252,537<--2:1 -6 0 30 d1d4
252,539<--2:2 -54 0 316 d1d4 d7d5
252,548<--2:3 -41 1 2303 d1d4 b8c6 d4c3
252,605<--2:4 -44 7 15711 d1d4 g8e7 e2e4 d7d5
252,822<--2:5 -49 28 109581 d1d4 b8c6 d4a4 d7d5 e2e4
252,858<--2:move d1d4
252,858*2*Found move:Qd1xd4
253,039*1*Start calc, move no: 5
253,039-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4
253,039-->1:go wtime 9351 btime 9254 winc 100 binc 100
253,043<--1:info score cp 35 depth 1 nodes 1 time 0 pv b8c6
253,043<--1:info score cp 35 depth 2 nodes 2 time 0 pv b8c6 d4e3
253,043<--1:info score cp 35 depth 3 nodes 3 time 0 pv b8c6 d4e3 g8e7
253,044<--1:info score cp 35 depth 4 nodes 4 time 0 pv b8c6 d4e3 g8e7 c1d2
253,044<--1:info score cp 35 depth 5 nodes 5 time 0 pv b8c6 d4e3 g8e7 c1d2 d7d5
253,376<--1:info score cp 35 depth 6 nodes 322692 time 336 pv b8c6 d4a4 d7d5 e2e4 f8b4 c1d2
253,400<--1:bestmove b8c6
253,400*1*Found move:Nb8-c6
253,558*2*Start calc, move no: 6
253,799-->2:time 936
253,799-->2:otim 890
253,799-->2:b8c6
253,800<--2:1 -41 0 84 d4d5
253,802<--2:2 -36 0 675 d4e4 g8e7 b1c3
253,825<--2:3 -49 2 6438 d4a4 d7d5 e2e4
253,886<--2:4 -49 8 29947 d4e3 g8e7 b1c3 d7d5 g1f3
254,119<--2:move d4e3
254,119*2*Found move:Qd4-e3
254,282*1*Start calc, move no: 7
254,282-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3
254,282-->1:go wtime 9036 btime 8898 winc 100 binc 100
254,286<--1:info score cp 55 depth 1 nodes 1 time 0 pv g8e7
254,286<--1:info score cp 55 depth 2 nodes 2 time 0 pv g8e7 c1d2
254,286<--1:info score cp 55 depth 3 nodes 3 time 0 pv g8e7 c1d2 d7d5
254,287<--1:info score cp 55 depth 4 nodes 4 time 0 pv g8e7 c1d2 d7d5 f1h3
254,336<--1:info score cp 40 depth 5 nodes 35976 time 54 pv g8e7 c1d2 d7d5 b1a3 c8e6
254,633<--1:bestmove g8e7
254,633*1*Found move:Ng8-e7
254,791*2*Start calc, move no: 8
255,033-->2:time 904
255,033-->2:otim 856
255,033-->2:g8e7
255,035<--2:1 -36 0 44 b1c3
255,035<--2:2 -84 0 737 b1c3 d7d5
255,050<--2:3 -49 1 6065 b1c3 d7d5 g1f3
255,102<--2:4 -74 6 31867 b1c3 d7d5 g1f3 c8e6
255,334<--2:move b1c3
255,334*2*Found move:Nb1-c3
255,506*1*Start calc, move no: 9
255,507-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3
255,507-->1:go wtime 8740 btime 8552 winc 100 binc 100
255,513<--1:info score cp 50 depth 1 nodes 1 time 0 pv d7d5
255,514<--1:info score cp 50 depth 2 nodes 2 time 0 pv d7d5 e3e7
255,514<--1:info score cp 50 depth 3 nodes 3 time 0 pv d7d5 e3e7 e8e7
255,514<--1:info score cp 50 depth 4 nodes 4 time 0 pv d7d5 e3e7 e8e7 c3d5
255,514<--1:info score cp 50 depth 5 nodes 5 time 0 pv d7d5 e3e7 e8e7 c3d5 d8d5
255,845<--1:bestmove d7d5
255,845*1*Found move:d7-d5
256,002*2*Start calc, move no: 10
256,243-->2:time 874
256,243-->2:otim 822
256,243-->2:d7d5
256,245<--2:1 -49 0 66 g1f3
256,248<--2:2 -74 0 910 g1f3 c8e6
256,262<--2:3 -59 2 7211 f1g2 c6b4 e3d2
256,308<--2:4 -103 6 30515 e3f4 d5d4 c3b5 e7d5
256,535<--2:move e3d2
256,535*2*Found move:Qe3-d2
256,684*1*Start calc, move no: 11
256,684-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2
256,684-->1:go wtime 8453 btime 8219 winc 100 binc 100
256,689<--1:info score cp 52 depth 1 nodes 1 time 0 pv c8f5
256,689<--1:info score cp 52 depth 2 nodes 2 time 0 pv c8f5 g1f3
256,689<--1:info score cp 52 depth 3 nodes 3 time 0 pv c8f5 g1f3 f5h3
256,689<--1:info score cp 52 depth 4 nodes 4 time 0 pv c8f5 g1f3 f5h3 f1h3
256,722<--1:info score cp 62 depth 5 nodes 43307 time 37 pv d5d4 c3a4 f7f5 a4c5 e7d5
257,009<--1:bestmove d5d4
257,009*1*Found move:d5-d4
257,163*2*Start calc, move no: 12
257,405-->2:time 846
257,405-->2:otim 790
257,405-->2:d5d4
257,411<--2:1 -83 0 92 c3e4
257,411<--2:2 -108 0 331 c3e4 c8e6
257,418<--2:3 -93 1 2586 c3d1 c8f5 g1f3
257,456<--2:4 -98 5 14039 c3d1 c8f5 g1f3 f5e4
257,636<--2:5 -98 22 75466 c3d1 e7d5 c2c3 f8c5 e2e4 d4e3 d1e3 c5e3 f2e3
257,688<--2:move c3d1
257,688*2*Found move:Nc3-d1
257,839*1*Start calc, move no: 13
257,840-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1
257,840-->1:go wtime 8175 btime 7899 winc 100 binc 100
257,842<--1:info score cp 67 depth 1 nodes 1 time 0 pv f7f5
257,842<--1:info score cp 67 depth 2 nodes 2 time 0 pv f7f5 g1f3
257,842<--1:info score cp 67 depth 3 nodes 3 time 0 pv f7f5 g1f3 c8e6
257,867<--1:info score cp 60 depth 4 nodes 28291 time 28 pv e7d5 d1c3 d4c3 d2d5
257,898<--1:info score cp 72 depth 5 nodes 63968 time 57 pv c8f5 f1g2 e7d5 e2e4 f8b4
258,155<--1:bestmove c8f5
258,155*1*Found move:Bc8-f5
258,307*2*Start calc, move no: 14
258,549-->2:time 818
258,549-->2:otim 759
258,549-->2:c8f5
258,553<--2:1 -93 0 94 g1f3
258,553<--2:2 -98 0 491 g1f3 f5e4
258,561<--2:3 -78 1 4033 f1g2 e7d5 e2e4
258,597<--2:4 -98 4 20649 f1g2 e7d5 e2e4 f8b4
258,782<--2:5 -73 23 117417 f1g2 e7d5 g2d5 d8d5 g1f3
258,823<--2:move f1g2
258,823*2*Found move:Bf1-g2
259,006*1*Start calc, move no: 15
259,006-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2
259,006-->1:go wtime 7906 btime 7589 winc 100 binc 100
259,010<--1:info score cp 72 depth 1 nodes 1 time 0 pv e7d5
259,010<--1:info score cp 72 depth 2 nodes 2 time 0 pv e7d5 g2d5
259,010<--1:info score cp 72 depth 3 nodes 3 time 0 pv e7d5 g2d5 d8d5
259,011<--1:info score cp 72 depth 4 nodes 4 time 1 pv e7d5 g2d5 d8d5 g1f3
259,040<--1:info score cp 70 depth 5 nodes 33902 time 32 pv e7d5 g2f3 f8b4 e2e3 b4d2
259,313<--1:bestmove e7d5
259,313*1*Found move:Ne7-d5
259,475*2*Start calc, move no: 16
259,715-->2:time 791
259,715-->2:otim 729
259,715-->2:e7d5
259,717<--2:1 -78 0 79 e2e4
259,720<--2:2 -98 0 1029 e2e4 f8b4
259,728<--2:3 -73 1 3989 g2d5 d8d5 g1f3
259,776<--2:4 -81 6 28518 c2c3 f8c5 g1f3 d4c3 d1c3
259,938<--2:5 -81 22 111090 c2c3 f8c5 g1f3 d4c3 d1c3
259,980<--2:move c2c3
259,980*2*Found move:c2-c3
260,132*1*Start calc, move no: 17
260,132-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3
260,132-->1:go wtime 7646 btime 7287 winc 100 binc 100
260,137<--1:info score cp 107 depth 1 nodes 421 time 1 pv f8c5
260,137<--1:info score cp 70 depth 2 nodes 491 time 1 pv f8c5 g1f3
260,137<--1:info score cp 70 depth 3 nodes 883 time 1 pv f8c5 g1f3 d4c3
260,137<--1:info score cp 70 depth 4 nodes 1257 time 1 pv f8c5 g1f3 d4c3 d1c3
260,304<--1:info score cp 65 depth 5 nodes 238470 time 171 pv c6b4 e2e4 d4e3 d1e3 b4d3
260,428<--1:bestmove c6b4
260,428*1*Found move:Nc6-b4
260,581*2*Start calc, move no: 18
260,824-->2:time 765
260,824-->2:otim 700
260,824-->2:c6b4
260,830<--2:1 67 0 50 c3b4 f8b4
260,830<--2:2 67 0 786 c3b4 f8b4
260,835<--2:3 -51 0 3819 e2e4 d4e3 d1e3
260,858<--2:4 -56 3 14757 e2e4 d4e3 d1e3 b4d3
260,982<--2:5 -60 15 74907 e2e4 d4e3 d1e3 b4d3 e1f1 d5e3 d2e3
261,081<--2:move e2e4
261,081*2*Found move:e2-e4
261,233*1*Start calc, move no: 19
261,235-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4
261,235-->1:go wtime 8394 btime 6996 winc 100 binc 100
261,240<--1:info score cp 45 depth 1 nodes 1 time 0 pv d4e3
261,240<--1:info score cp 45 depth 2 nodes 2 time 0 pv d4e3 d1e3
261,240<--1:info score cp 45 depth 3 nodes 3 time 0 pv d4e3 d1e3 b4d3
261,240<--1:info score cp 45 depth 4 nodes 4 time 0 pv d4e3 d1e3 b4d3 e1f1
261,315<--1:info score cp 5 depth 5 nodes 117073 time 81 pv d4e3 d1e3 b4d3 e1f1 d3c1
261,520<--1:bestmove d4e3
261,520*1*Found move:d4xe3/ep
261,678*2*Start calc, move no: 20
261,918-->2:time 840
261,918-->2:otim 772
261,918-->2:d4e3
261,923<--2:1 -51 0 167 d1e3
261,923<--2:2 -56 0 719 d1e3 b4d3
261,928<--2:3 -60 0 2925 d1e3 b4d3 e1f1 d5e3 d2e3
261,949<--2:4 -10 3 12233 d1e3 b4d3 e1f1 d3c1 g2d5
262,064<--2:5 -6 14 70428 d1e3 f5e6 g1e2 d5e3 d2d8 a8d8 c1e3
262,200<--2:move d1e3
262,200*2*Found move:Nd1xe3
262,355*1*Start calc, move no: 21
262,356-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3
262,356-->1:go wtime 8117 btime 7716 winc 100 binc 100
262,360<--1:info score cp 20 depth 1 nodes 1 time 0 pv f5e6
262,360<--1:info score cp 20 depth 2 nodes 2 time 0 pv f5e6 g2e4
262,360<--1:info score cp 20 depth 3 nodes 3 time 0 pv f5e6 g2e4 d5e3
262,360<--1:info score cp 20 depth 4 nodes 4 time 0 pv f5e6 g2e4 d5e3 d2d8
262,429<--1:info score cp 20 depth 5 nodes 90058 time 72 pv f5e6 g2e4 d5e3 d2d8 a8d8
262,665<--1:bestmove f5e6
262,665*1*Found move:Bf5-e6
262,819*2*Start calc, move no: 22
263,060-->2:time 812
263,060-->2:otim 742
263,060-->2:f5e6
263,062<--2:1 128 0 153 c3b4 f8b4
263,064<--2:2 128 0 840 c3b4 f8b4
263,079<--2:3 -6 1 7583 g1e2 d5e3 d2d8 a8d8 c1e3
263,133<--2:4 -6 7 35061 g1e2 d5e3 d2d8 a8d8 c1e3
263,331<--2:move g1e2
263,331*2*Found move:Ng1-e2
263,490*1*Start calc, move no: 23
263,491-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2
263,491-->1:go wtime 7851 btime 7412 winc 100 binc 100
263,497<--1:info score cp 10 depth 1 nodes 1 time 0 pv d5e3
263,497<--1:info score cp 10 depth 2 nodes 2 time 0 pv d5e3 d2d8
263,497<--1:info score cp 10 depth 3 nodes 3 time 0 pv d5e3 d2d8 e8d8
263,497<--1:info score cp 10 depth 4 nodes 4 time 0 pv d5e3 d2d8 e8d8 c1e3
263,516<--1:info score cp 165 depth 5 nodes 23561 time 24 pv d5e3 f2e3 d8d2 e1d2 e8c8
263,551<--1:info score cp 150 depth 6 nodes 62842 time 60 pv d5e3 f2e3 d8d2 e1d2 e8c8 e2d4
263,652<--1:info score cp 150 depth 7 nodes 183384 time 161 pv d5e3 f2e3 d8d2 e1d2 e8c8 e2d4 b4a2
263,790<--1:bestmove d5e3
263,790*1*Found move:Nd5xe3
263,941*2*Start calc, move no: 24
264,182-->2:time 786
264,182-->2:otim 712
264,182-->2:d5e3
264,187<--2:1 -6 0 109 d2d8 a8d8 c1e3
264,187<--2:2 -6 0 633 d2d8 a8d8 c1e3
264,187<--2:3 -11 0 2036 d2d8 a8d8 c1e3 b4d3
264,220<--2:4 -162 3 17433 f2e3 d8d2 e1d2 e8c8 d2e1 b4a2
264,376<--2:5 -146 19 71154 f2e3 d8d2 e1d2 e8c8 e2d4 b4a2 e3e4
264,445<--2:move f2e3
264,445*2*Found move:f2xe3
264,605*1*Start calc, move no: 25
264,605-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3
264,605-->1:go wtime 7593 btime 7118 winc 100 binc 100
264,610<--1:info score cp 145 depth 1 nodes 1 time 0 pv b4d3
264,610<--1:info score cp 145 depth 2 nodes 2 time 0 pv b4d3 e1f1
264,610<--1:info score cp 145 depth 3 nodes 3 time 0 pv b4d3 e1f1 d8f6
264,610<--1:info score cp 145 depth 4 nodes 4 time 0 pv b4d3 e1f1 d8f6 e2f4
264,610<--1:info score cp 145 depth 5 nodes 5 time 0 pv b4d3 e1f1 d8f6 e2f4 e8c8
264,610<--1:info score cp 145 depth 6 nodes 6 time 0 pv b4d3 e1f1 d8f6 e2f4 e8c8 e3e4
264,873<--1:info score cp 145 depth 7 nodes 334519 time 265 pv b4d3 e1f1 d8f6 e2f4 e8c8 e3e4 g7g5
264,898<--1:bestmove b4d3
264,898*1*Found move:Nb4-d3
265,057*2*Start calc, move no: 26
265,297-->2:time 760
265,297-->2:otim 683
265,297-->2:b4d3
265,298<--2:1 -64 0 501 e1d1 c7c6
265,306<--2:2 -78 0 2963 e1f1 d8f6 f1g1 e8c8
265,322<--2:3 -108 2 11132 e1f1 d8f6 e2f4 e8c8 e3e4
265,401<--2:4 -133 10 57242 e1f1 d8f6 e2f4 e8c8 e3e4 f8c5
265,551<--2:move e1f1
265,551*2*Found move:Ke1-f1
265,705*1*Start calc, move no: 27
265,706-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1
265,706-->1:go wtime 7344 btime 6830 winc 100 binc 100
265,710<--1:info score cp 145 depth 1 nodes 1 time 0 pv d8f6
265,710<--1:info score cp 145 depth 2 nodes 2 time 0 pv d8f6 e2f4
265,710<--1:info score cp 145 depth 3 nodes 3 time 0 pv d8f6 e2f4 e8c8
265,710<--1:info score cp 145 depth 4 nodes 4 time 0 pv d8f6 e2f4 e8c8 e3e4
265,711<--1:info score cp 145 depth 5 nodes 5 time 0 pv d8f6 e2f4 e8c8 e3e4 g7g5
265,711<--1:info score cp 145 depth 6 nodes 6 time 0 pv d8f6 e2f4 e8c8 e3e4 g7g5 h2h4
265,986<--1:bestmove d8f6
265,986*1*Found move:Qd8-f6
266,137*2*Start calc, move no: 28
266,378-->2:time 735
266,378-->2:otim 656
266,378-->2:d8f6
266,379<--2:1 -78 0 453 f1g1 e8c8
266,384<--2:2 -108 0 2107 e2f4 e8c8 e3e4
266,395<--2:3 -133 1 8345 e2f4 e8c8 e3e4 f8c5
266,476<--2:4 -189 9 50291 e2f4 e8c8 e3e4 g7g5 e4e5 d3e5
266,623<--2:move e2f4
266,624*2*Found move:Ne2-f4
266,812*1*Start calc, move no: 29
266,812-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1 d8f6 e2f4
266,812-->1:go wtime 7104 btime 6555 winc 100 binc 100
266,817<--1:info score cp 145 depth 1 nodes 1 time 0 pv e8c8
266,817<--1:info score cp 145 depth 2 nodes 2 time 0 pv e8c8 f1g1
266,817<--1:info score cp 145 depth 3 nodes 3 time 0 pv e8c8 f1g1 d3f4
266,817<--1:info score cp 145 depth 4 nodes 4 time 0 pv e8c8 f1g1 d3f4 g1f2
266,817<--1:info score cp 145 depth 5 nodes 5 time 0 pv e8c8 f1g1 d3f4 g1f2 d8d2
266,817<--1:info score cp 145 depth 6 nodes 6 time 0 pv e8c8 f1g1 d3f4 g1f2 d8d2 c1d2
267,081<--1:bestmove e8c8
267,081*1*Found move:O-O-O
267,236*2*Start calc, move no: 30
267,477-->2:time 711
267,477-->2:otim 630
267,477-->2:e8c8
267,479<--2:1 -108 0 208 e3e4
267,483<--2:2 -133 0 1122 e3e4 f8c5
267,498<--2:3 -189 2 10390 e3e4 g7g5 e4e5 d3e5
267,537<--2:4 -189 5 32785 e3e4 g7g5 e4e5 d3e5
267,714<--2:move d2c2
267,715*2*Found move:Qd2-c2
267,869*1*Start calc, move no: 31
267,869-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1 d8f6 e2f4 e8c8 d2c2
267,869-->1:go wtime 6871 btime 6291 winc 100 binc 100
267,873<--1:info score cp 145 depth 1 nodes 1 time 0 pv g7g5
267,873<--1:info score cp 145 depth 2 nodes 2 time 0 pv g7g5 c2d3
267,873<--1:info score cp 145 depth 3 nodes 3 time 0 pv g7g5 c2d3 d8d3
267,873<--1:info score cp 145 depth 4 nodes 4 time 0 pv g7g5 c2d3 d8d3 g2b7
267,873<--1:info score cp 145 depth 5 nodes 5 time 0 pv g7g5 c2d3 d8d3 g2b7 c8b7
268,130<--1:bestmove g7g5
268,130*1*Found move:g7-g5
268,285*2*Start calc, move no: 32
268,525-->2:time 688
268,525-->2:otim 604
268,525-->2:g7g5
268,526<--2:1 -202 0 504 g2b7 c8b7
268,531<--2:2 -202 0 1525 g2b7 c8b7 c2g2
268,547<--2:3 -210 2 10319 f1g1 g5f4 e3f4
268,577<--2:4 -235 5 25862 f1g1 g5f4 e3f4 f8c5
268,760<--2:move c3c4
268,760*2*Found move:c3-c4
268,914*1*Start calc, move no: 33
268,915-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1 d8f6 e2f4 e8c8 d2c2 g7g5 c3c4
268,915-->1:go wtime 6641 btime 6035 winc 100 binc 100
268,919<--1:info score cp 255 depth 1 nodes 1 time 0 pv g5f4
268,922<--1:info score cp 255 depth 2 nodes 2 time 0 pv g5f4 e3f4
268,922<--1:info score cp 255 depth 3 nodes 3 time 0 pv g5f4 e3f4 f8a3
268,922<--1:info score cp 255 depth 4 nodes 4 time 0 pv g5f4 e3f4 f8a3 a1b1
268,979<--1:info score cp 270 depth 5 nodes 76525 time 64 pv g5f4 e3f4 f6d4 c2b3 f8b4
269,169<--1:bestmove g5f4
269,169*1*Found move:g5xf4
269,321*2*Start calc, move no: 34
269,562-->2:time 665
269,562-->2:otim 579
269,562-->2:g5f4
269,564<--2:1 -260 0 113 e3f4
269,566<--2:2 -285 0 535 e3f4 f8c5
269,579<--2:3 -280 1 5057 e3f4 f8g7 c2b3
269,614<--2:4 -280 5 23500 e3f4 f8g7 c2b3 d3c5
269,783<--2:move e3f4
269,783*2*Found move:e3xf4
269,936*1*Start calc, move no: 35
269,936-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1 d8f6 e2f4 e8c8 d2c2 g7g5 c3c4 g5f4 e3f4
269,936-->1:go wtime 6425 btime 5786 winc 100 binc 100
269,940<--1:info score cp 347 depth 1 nodes 1 time 0 pv f8a3
269,940<--1:info score cp 347 depth 2 nodes 2 time 0 pv f8a3 g2d5
269,940<--1:info score cp 347 depth 3 nodes 3 time 0 pv f8a3 g2d5 e6d5
269,940<--1:info score cp 347 depth 4 nodes 4 time 0 pv f8a3 g2d5 e6d5 c4d5
270,062<--1:info score cp 347 depth 5 nodes 146028 time 124 pv f6d4 g2d5 f8a3 d5e6 f7e6
270,181<--1:bestmove f6d4
270,182*1*Found move:Qf6-d4
270,333*2*Start calc, move no: 36
270,574-->2:time 643
270,574-->2:otim 555
270,574-->2:f6d4
270,575<--2:1 -260 0 483 c2b3
270,578<--2:2 -280 0 1464 c2b3 f8b4
270,613<--2:3 -347 3 19818 g2d5 e6d5 c4d5 d8d5
270,674<--2:4 -347 9 51355 g2d5 e6d5 c4d5 d8d5
270,788<--2:move g2d5
270,788*2*Found move:Bg2-d5
270,943*1*Start calc, move no: 37
270,944-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1 d8f6 e2f4 e8c8 d2c2 g7g5 c3c4 g5f4 e3f4 f6d4 g2d5
270,944-->1:go wtime 6216 btime 5545 winc 100 binc 100
270,946<--1:info score cp 347 depth 1 nodes 1 time 0 pv e6d5
270,946<--1:info score cp 347 depth 2 nodes 2 time 0 pv e6d5 c4d5
270,946<--1:info score cp 347 depth 3 nodes 3 time 0 pv e6d5 c4d5 f8c5
270,946<--1:info score cp 347 depth 4 nodes 4 time 0 pv e6d5 c4d5 f8c5 c1d2
271,042<--1:info score cp 365 depth 5 nodes 70699 time 98 pv e6d5 c4d5 d8d5 c2e2 f8c5
271,181<--1:bestmove e6d5
271,181*1*Found move:Be6xd5
271,334*2*Start calc, move no: 38
271,574-->2:time 622
271,574-->2:otim 532
271,574-->2:e6d5
271,577<--2:1 -347 0 70 c4d5 d8d5
271,578<--2:2 -347 0 250 c4d5 d8d5
271,586<--2:3 -359 1 4662 c4d5 f8c5 c1d2 d3b2
271,602<--2:4 -359 2 13826 c4d5 f8c5 c1d2 d3b2
271,782<--2:5 -504 20 115075 c4d5 d4e4 f1g1 f8c5 c1e3 c5e3
271,793<--2:move c4d5
271,793*2*Found move:c4xd5
271,949*1*Start calc, move no: 39
271,951-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1 d8f6 e2f4 e8c8 d2c2 g7g5 c3c4 g5f4 e3f4 f6d4 g2d5 e6d5 c4d5
271,954-->1:go wtime 7002 btime 5313 winc 100 binc 100
271,954<--1:info score cp 567 depth 1 nodes 1 time 0 pv d4e4
271,960<--1:info score cp 567 depth 2 nodes 2 time 0 pv d4e4 f1g1
271,961<--1:info score cp 567 depth 3 nodes 3 time 0 pv d4e4 f1g1 f8c5
271,961<--1:info score cp 567 depth 4 nodes 4 time 0 pv d4e4 f1g1 f8c5 c1e3
271,997<--1:info score cp 885 depth 5 nodes 42316 time 45 pv d4e4 c1e3 e4h1 e3g1 h1f3
272,144<--1:info score cp 927 depth 6 nodes 206398 time 193 pv d4e4 h2h3 e4h1 f1e2 d8d5 c2c3
272,181<--1:bestmove d4e4
272,181*1*Found move:Qd4-e4
272,337*2*Start calc, move no: 40
272,578-->2:time 701
272,578-->2:otim 609
272,578-->2:d4e4
272,583<--2:1 -299 0 200 f1g1 d8d5
272,584<--2:2 -299 0 400 f1g1 d8d5
272,594<--2:3 -504 1 7141 f1g1 f8c5 c1e3 c5e3
272,628<--2:4 -821 5 31365 h2h3 e4h1 f1e2 d8d5 c2c4
272,813<--2:move h2h3
272,813*2*Found move:h2-h3
272,980*1*Start calc, move no: 41
272,981-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1 d8f6 e2f4 e8c8 d2c2 g7g5 c3c4 g5f4 e3f4 f6d4 g2d5 e6d5 c4d5 d4e4 h2h3
272,981-->1:go wtime 6772 btime 6088 winc 100 binc 100
272,988<--1:info score cp 927 depth 1 nodes 1 time 0 pv e4h1
272,988<--1:info score cp 927 depth 2 nodes 2 time 0 pv e4h1 f1e2
272,988<--1:info score cp 927 depth 3 nodes 3 time 0 pv e4h1 f1e2 d8d5
272,988<--1:info score cp 927 depth 4 nodes 4 time 0 pv e4h1 f1e2 d8d5 c2c4
273,065<--1:info score cp 1027 depth 5 nodes 97340 time 83 pv e4h1 f1e2 h1g2 e2d1 g2f1
273,237<--1:bestmove e4h1
273,237*1*Found move:Qe4xh1
273,401*2*Start calc, move no: 42
273,642-->2:time 678
273,642-->2:otim 584
273,642-->2:e4h1
273,644<--2:1 -821 0 83 f1e2 d8d5
273,646<--2:2 -821 0 1097 f1e2 d8d5 c2c3
273,663<--2:3 -841 2 10591 f1e2 h1e4 e2d2 f8b4 d2d1 d8d5
273,785<--2:4 -974 14 91488 f1e2 h1e4 e2f1 e4f3 f1g1 f3g3 c2g2 g3g2 g1g2 d8d5
273,869<--2:move f1e2
273,869*2*Found move:Kf1-e2
274,041*1*Start calc, move no: 43
274,042-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1 d8f6 e2f4 e8c8 d2c2 g7g5 c3c4 g5f4 e3f4 f6d4 g2d5 e6d5 c4d5 d4e4 h2h3 e4h1 f1e2
274,042-->1:go wtime 6550 btime 5837 winc 100 binc 100
274,044<--1:info score cp 1027 depth 1 nodes 1 time 0 pv h1g2
274,044<--1:info score cp 1027 depth 2 nodes 2 time 0 pv h1g2 e2d3
274,046<--1:info score cp 1027 depth 3 nodes 3 time 0 pv h1g2 e2d3 d8d5
274,046<--1:info score cp 1027 depth 4 nodes 4 time 0 pv h1g2 e2d3 d8d5 d3e3
274,064<--1:info score cp 1370 depth 5 nodes 24326 time 21 pv h1g2 e2d3 d8d5 d3e3 f8c5
274,289<--1:bestmove h1g2
274,289*1*Found move:Qh1-g2
274,479*2*Start calc, move no: 44
274,723-->2:time 655
274,723-->2:otim 560
274,723-->2:h1g2
274,727<--2:1 -564 0 46 e2d3 g2g3
274,727<--2:2 -662 0 809 e2d3 d8d5 d3c3 g2g3
274,747<--2:3 -927 2 13227 e2d1 g2f1 d1d2 d8d5 c2b3 d3f4
274,885<--2:4 -1134 16 97679 e2d1 d3f2 d1e1 d8e8 c1e3 e8e3 e1d2 e3g3
274,942<--2:move e2d1
274,942*2*Found move:Ke2-d1
275,097*1*Start calc, move no: 45
275,097-->1:position startpos moves g2g3 e7e5 d2d4 e5d4 d1d4 b8c6 d4e3 g8e7 b1c3 d7d5 e3d2 d5d4 c3d1 c8f5 f1g2 e7d5 c2c3 c6b4 e2e4 d4e3 d1e3 f5e6 g1e2 d5e3 f2e3 b4d3 e1f1 d8f6 e2f4 e8c8 d2c2 g7g5 c3c4 g5f4 e3f4 f6d4 g2d5 e6d5 c4d5 d4e4 h2h3 e4h1 f1e2 h1g2 e2d1
275,097-->1:go wtime 6336 btime 5595 winc 100 binc 100
275,103<--1:info score cp 1595 depth 1 nodes 1 time 0 pv g2g1
275,103<--1:info score cp 1595 depth 2 nodes 2 time 0 pv g2g1 d1e2
275,103<--1:info score cp 1595 depth 3 nodes 3 time 0 pv g2g1 d1e2 g1f2
275,104<--1:info score cp 1595 depth 4 nodes 4 time 0 pv g2g1 d1e2 g1f2 e2d3
275,221<--1:info score cp 1980 depth 5 nodes 172298 time 122 pv g2g1 d1d2 g1f2 d2c3 f8b4
275,337<--1:bestmove g2g1
275,337*1*Found move:Qg2-g1
275,485*2*Start calc, move no: 46
275,725-->2:time 634
275,725-->2:otim 536
275,725-->2:g2g1
275,729<--2:1 -821 0 127 d1d2 d8d5
275,729<--2:2 -821 0 1795 d1e2 d8d5 c2c3
275,758<--2:3 -821 3 8416 d1e2 d8d5 c2c4 c7c6
275,866<--2:4 -947 14 78345 d1e2 d8d5 c2c4 g1f2 e2d1 d3b2
275,937<--2:move d1e2
275,937*2*Found move:Kd1-e2
276,121********Game end: 0-1 {Arena Adjudication}
276,123********Last game won by LiSHeX with Black in 24 moves
276,125********LiSHeX  -  Tscp 1.81:
276,127********   6 B 1    6.0:0.0        1.0:5.0       15:49:31    -9.47    24 5.827 :4.424  1-5-0
276,173********Saving file /home/mkjm/Tournaments/Testing.pgn
276,195-->2:?
276,197<--2:Error (unknown command): ?
276,215-->2:result 0-1
276,216<--2:Error (unknown command): result
277,356********Round 7 of 10: LiSHeX  -  Tscp 1.81
277,396**----------New game---2023-06-13 15:49:32,315 Tue -------------
277,396-->2:new
277,400-->2:post
277,440*1*Start calc, move no: 0
277,440-->1:ucinewgame
277,441-->1:isready
277,441<--1:readyok
277,449-->1:position startpos
277,449-->1:go wtime 10000 btime 10000 winc 100 binc 100
277,453<--1:info score cp 22 depth 1 nodes 1 time 0 pv d2d4
277,454<--1:info score cp 22 depth 2 nodes 2 time 0 pv d2d4
277,454<--1:info score cp 22 depth 3 nodes 3 time 0 pv d2d4
277,454<--1:info score cp 22 depth 4 nodes 4 time 0 pv d2d4
277,454<--1:info score cp 22 depth 5 nodes 5 time 0 pv d2d4
277,454<--1:info score cp 22 depth 6 nodes 6 time 0 pv d2d4
277,454<--1:info score cp 22 depth 7 nodes 7 time 0 pv d2d4
277,834<--1:bestmove d2d4
277,834*1*Found move:d2-d4
277,963*2*Start calc, move no: 1
278,203-->2:time 1000
278,203-->2:otim 962
278,203-->2:d2d4
278,204<--2:move d7d5
278,204*2*Found move:d7-d5
278,361*1*Start calc, move no: 2
278,361-->1:position startpos moves d2d4 d7d5
278,361-->1:go wtime 9620 btime 10000 winc 100 binc 100
278,365<--1:info score cp 2 depth 1 nodes 1 time 0 pv c1e3
278,365<--1:info score cp 2 depth 2 nodes 2 time 0 pv c1e3
278,365<--1:info score cp 2 depth 3 nodes 3 time 0 pv c1e3
278,365<--1:info score cp 2 depth 4 nodes 4 time 0 pv c1e3
278,365<--1:info score cp 2 depth 5 nodes 5 time 0 pv c1e3
278,365<--1:info score cp 2 depth 6 nodes 6 time 0 pv c1e3
278,735<--1:bestmove c1e3
278,735*1*Found move:Bc1-e3
278,895*2*Start calc, move no: 3
279,137-->2:time 1000
279,138-->2:otim 926
279,138-->2:c1e3
279,141<--2:1 10 0 29 b8c6
279,142<--2:2 -25 0 214 b8c6 b1c3
279,143<--2:3 10 0 3022 b8c6 b1c3 g8f6
279,176<--2:4 -25 3 17247 b8c6 b1c3 g8f6 g1f3
279,348<--2:5 5 20 112341 b8c6 b1c3 g8f6 g1f3 e7e6
279,472<--2:move b8c6
279,472*2*Found move:Nb8-c6
279,623*1*Start calc, move no: 4
279,623-->1:position startpos moves d2d4 d7d5 c1e3 b8c6
279,623-->1:go wtime 9251 btime 9671 winc 100 binc 100
279,626<--1:info score cp 5 depth 1 nodes 1 time 0 pv b1c3
279,626<--1:info score cp 5 depth 2 nodes 2 time 0 pv b1c3 c6d4
279,626<--1:info score cp 5 depth 3 nodes 3 time 0 pv b1c3 c6d4 e3d4
279,626<--1:info score cp 5 depth 4 nodes 4 time 0 pv b1c3 c6d4 e3d4
279,626<--1:info score cp 5 depth 5 nodes 5 time 0 pv b1c3 c6d4 e3d4
279,962<--1:info score cp 0 depth 6 nodes 366042 time 338 pv b1c3 e7e6 g1f3 g8f6 a2a4 f8b4
279,982<--1:bestmove b1c3
279,983*1*Found move:Nb1-c3
280,148*2*Start calc, move no: 5
280,390-->2:time 968
280,390-->2:otim 890
280,390-->2:b1c3
280,392<--2:1 10 0 41 g8f6
280,394<--2:2 -25 0 436 g8f6 g1f3
280,406<--2:3 5 1 4784 g8f6 g1f3 e7e6
280,469<--2:4 3 7 28218 g8f6 g1f3 e7e6 a2a4
280,714<--2:move e7e6
280,714*2*Found move:e7-e6
280,868*1*Start calc, move no: 6
280,868-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6
280,868-->1:go wtime 8897 btime 9352 winc 100 binc 100
280,873<--1:info score cp 0 depth 1 nodes 1 time 0 pv g1f3
280,873<--1:info score cp 0 depth 2 nodes 2 time 0 pv g1f3 g8f6
280,873<--1:info score cp 0 depth 3 nodes 3 time 0 pv g1f3 g8f6 a2a4
280,873<--1:info score cp 0 depth 4 nodes 4 time 0 pv g1f3 g8f6 a2a4 f8b4
280,901<--1:info score cp 5 depth 5 nodes 29272 time 32 pv d1d2 e6e5 g1f3 c6b4 d4e5
281,156<--1:info score cp 0 depth 6 nodes 307537 time 288 pv g1f3 g8f6 a2a4 f8b4 d1d3 f6g4
281,216<--1:bestmove g1f3
281,217*1*Found move:Ng1-f3
281,396*2*Start calc, move no: 7
281,637-->2:time 936
281,637-->2:otim 856
281,637-->2:g1f3
281,640<--2:1 5 0 50 g8f6
281,640<--2:2 3 0 438 g8f6 a2a4
281,645<--2:3 28 0 3710 f8d6 a2a4 g8f6
281,731<--2:4 -1 9 42911 g8f6 d1d2 f6e4 c3e4 d5e4
281,950<--2:move g8f6
281,950*2*Found move:Ng8-f6
282,107*1*Start calc, move no: 8
282,108-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6
282,108-->1:go wtime 8554 btime 9044 winc 100 binc 100
282,113<--1:info score cp 0 depth 1 nodes 1 time 0 pv a2a4
282,113<--1:info score cp 0 depth 2 nodes 2 time 0 pv a2a4 f8b4
282,113<--1:info score cp 0 depth 3 nodes 3 time 0 pv a2a4 f8b4 d1d3
282,114<--1:info score cp 0 depth 4 nodes 4 time 0 pv a2a4 f8b4 d1d3 f6g4
282,157<--1:info score cp 0 depth 5 nodes 48659 time 48 pv a1b1 f8d6 c3d5 e6d5
282,444<--1:bestmove a1b1
282,444*1*Found move:Ra1-b1
282,602*2*Start calc, move no: 9
282,843-->2:time 905
282,843-->2:otim 823
282,843-->2:a1b1
282,847<--2:1 30 0 44 f8d6
282,848<--2:2 30 0 650 f8b4 e3d2
282,849<--2:3 66 0 3526 f8d6 c3b5 e8g8 b5d6 d8d6
282,921<--2:4 40 7 33438 f8b4 e3d2 e8g8 e2e3
283,145<--2:move f8b4
283,145*2*Found move:Bf8-b4
283,291*1*Start calc, move no: 10
283,292-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4
283,292-->1:go wtime 8223 btime 8747 winc 100 binc 100
283,297<--1:info score cp -22 depth 1 nodes 1 time 0 pv f3e5
283,297<--1:info score cp -22 depth 2 nodes 2 time 0 pv f3e5 b4c3
283,297<--1:info score cp -22 depth 3 nodes 3 time 0 pv f3e5 b4c3 b2c3
283,297<--1:info score cp -22 depth 4 nodes 4 time 0 pv f3e5 b4c3 b2c3 c6e5
283,360<--1:info score cp -20 depth 5 nodes 79122 time 68 pv e3d2 e8g8 e2e3 c8d7 f1d3
283,538<--1:info score cp -25 depth 6 nodes 263083 time 244 pv e3d2 e8g8 e2e3 c8d7 f1d3 b4d6
283,620<--1:bestmove e3d2
283,620*1*Found move:Be3-d2
283,796*2*Start calc, move no: 11
284,036-->2:time 875
284,036-->2:otim 790
284,036-->2:e3d2
284,038<--2:1 70 0 99 e8g8
284,042<--2:2 40 0 1295 e8g8 e2e3
284,050<--2:3 66 1 5052 b4c3 d2c3 e8g8
284,096<--2:4 36 5 27598 b4c3 d2c3 e8g8 e2e3
284,329<--2:move b4c3
284,329*2*Found move:Bb4xc3
284,484*1*Start calc, move no: 12
284,485-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3
284,485-->1:go wtime 7900 btime 8459 winc 100 binc 100
284,489<--1:info score cp -25 depth 1 nodes 1 time 0 pv f3e5
284,489<--1:info score cp -25 depth 2 nodes 2 time 0 pv f3e5 c3d2
284,489<--1:info score cp -25 depth 3 nodes 3 time 0 pv f3e5 c3d2 e1d2
284,489<--1:info score cp -25 depth 4 nodes 4 time 0 pv f3e5 c3d2 e1d2 c6e5
284,531<--1:info score cp -10 depth 5 nodes 33759 time 46 pv b1c1 c3d2
284,589<--1:info score cp -40 depth 6 nodes 91082 time 104 pv b2c3 f6e4 e2e3 e4d2 d1d2 e8g8
284,802<--1:bestmove b2c3
284,802*1*Found move:b2xc3
284,960*2*Start calc, move no: 13
285,202-->2:time 846
285,202-->2:otim 759
285,202-->2:b2c3
285,205<--2:1 104 0 52 e8g8
285,205<--2:2 74 0 556 e8g8 e2e3
285,210<--2:3 79 0 3917 e8g8 e2e3 f6e4
285,310<--2:4 54 10 30549 e8g8 e2e3 f6e4 f1d3
285,486<--2:move e8g8
285,486*2*Found move:O-O
285,657*1*Start calc, move no: 14
285,657-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8
285,657-->1:go wtime 7588 btime 8180 winc 100 binc 100
285,660<--1:info score cp -18 depth 1 nodes 1 time 0 pv e2e3
285,660<--1:info score cp -18 depth 2 nodes 2 time 0 pv e2e3 f6e4
285,662<--1:info score cp -18 depth 3 nodes 3 time 0 pv e2e3 f6e4 f1d3
285,673<--1:info score cp -15 depth 4 nodes 7071 time 16 pv e2e3 f6e4 f1d3 e4d2
285,694<--1:info score cp -15 depth 5 nodes 16910 time 36 pv e2e3 f6e4 f1d3 e4d2 d1d2
285,952<--1:info score cp -20 depth 6 nodes 298932 time 294 pv d2f4 f8e8 e2e3 f6e4 c3c4 f7f5
285,961<--1:bestmove d2f4
285,961*1*Found move:Bd2-f4
286,121*2*Start calc, move no: 15
286,364-->2:time 818
286,364-->2:otim 729
286,364-->2:d2f4
286,364<--2:1 104 0 74 f6e4
286,369<--2:2 104 0 898 f6e4 b1b3
286,387<--2:3 106 2 4055 f6e4 b1b3 a7a5
286,512<--2:4 76 14 36228 f6e4 d1d3 a7a5 e2e3
286,636<--2:move f6e4
286,636*2*Found move:Nf6-e4
286,795*1*Start calc, move no: 16
286,795-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4
286,795-->1:go wtime 7289 btime 7913 winc 100 binc 100
286,799<--1:info score cp -18 depth 1 nodes 1 time 0 pv b1b5
286,799<--1:info score cp -18 depth 2 nodes 2 time 0 pv b1b5 e4c3
286,799<--1:info score cp -18 depth 3 nodes 3 time 0 pv b1b5 e4c3 f4c7
286,799<--1:info score cp -18 depth 4 nodes 4 time 0 pv b1b5 e4c3 f4c7 c3d1
287,007<--1:info score cp -30 depth 5 nodes 203591 time 211 pv d1d3 g7g5 f4e3 g5g4 f3d2
287,099<--1:bestmove d1d3
287,099*1*Found move:Qd1-d3
287,271*2*Start calc, move no: 17
287,512-->2:time 792
287,512-->2:otim 699
287,512-->2:d1d3
287,517<--2:1 106 0 137 a7a5
287,517<--2:2 76 0 1631 a7a5 e2e3
287,534<--2:3 94 2 8127 a8b8 e2e3 c8d7
287,684<--2:4 83 17 79112 f7f6 c3c4 e4d6 f4d6 d8d6
287,778<--2:move f7f6
287,778*2*Found move:f7-f6
287,927*1*Start calc, move no: 18
287,928-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6
287,928-->1:go wtime 6990 btime 7652 winc 100 binc 100
287,932<--1:info score cp -25 depth 1 nodes 1 time 0 pv c3c4
287,932<--1:info score cp -25 depth 2 nodes 2 time 0 pv c3c4 d5c4
287,932<--1:info score cp -25 depth 3 nodes 3 time 0 pv c3c4 d5c4 d3e4
287,968<--1:info score cp -25 depth 4 nodes 45608 time 38 pv c3c4 a8b8 c4d5 e6d5
288,004<--1:info score cp -20 depth 5 nodes 94897 time 75 pv c3c4 c6a5 c4d5 c8d7 d3e4
288,179<--1:info score cp -25 depth 6 nodes 331476 time 250 pv c3c4 c6a5 c4d5 e6d5 e2e3 c8e6
288,215<--1:bestmove c3c4
288,215*1*Found move:c3-c4
288,380*2*Start calc, move no: 19
288,622-->2:time 766
288,622-->2:otim 771
288,622-->2:c3c4
288,627<--2:1 93 0 367 a7a5
288,629<--2:2 83 0 2846 e4d6 f4d6 d8d6
288,641<--2:3 83 1 8787 e4d6 f4d6 d8d6
288,723<--2:4 67 10 52363 g7g5 c4d5 e6d5 f4e3
288,878<--2:move a7a5
288,878*2*Found move:a7-a5
289,065*1*Start calc, move no: 20
289,067-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5
289,067-->1:go wtime 7708 btime 8401 winc 100 binc 100
289,070<--1:info score cp -20 depth 1 nodes 1 time 0 pv c4d5
289,071<--1:info score cp -20 depth 2 nodes 2 time 0 pv c4d5 e6d5
289,071<--1:info score cp -20 depth 3 nodes 3 time 0 pv c4d5 e6d5 f4e3
289,131<--1:info score cp -12 depth 4 nodes 75203 time 64 pv e2e3 c6b4 d3b3 c8d7
289,169<--1:info score cp -2 depth 5 nodes 122862 time 101 pv c4d5 e6d5 c2c4 c6b4 d3b3
289,377<--1:bestmove c4d5
289,377*1*Found move:c4xd5
289,563*2*Start calc, move no: 21
289,805-->2:time 841
289,805-->2:otim 741
289,805-->2:c4d5
289,809<--2:1 99 0 51 e6d5
289,809<--2:2 69 0 661 e6d5 e2e3
289,817<--2:3 79 1 4500 e6d5 e2e3 f8e8
289,872<--2:4 64 6 27742 e6d5 e2e3 c6b4 d3b3
290,086<--2:move e6d5
290,086*2*Found move:e6xd5
290,259*1*Start calc, move no: 22
290,260-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5
290,260-->1:go wtime 7403 btime 8125 winc 100 binc 100
290,264<--1:info score cp -22 depth 1 nodes 1 time 0 pv b1b5
290,264<--1:info score cp -22 depth 2 nodes 2 time 0 pv b1b5 c6b4
290,264<--1:info score cp -22 depth 3 nodes 3 time 0 pv b1b5 c6b4 d3b3
290,264<--1:info score cp -22 depth 4 nodes 4 time 0 pv b1b5 c6b4 d3b3 f6f5
290,561<--1:bestmove b1b5
290,561*1*Found move:Rb1-b5
290,720*2*Start calc, move no: 23
290,960-->2:time 813
290,960-->2:otim 711
290,960-->2:b1b5
290,965<--2:1 109 0 241 f8e8
290,969<--2:2 94 0 3272 c6b4 d3b3
290,988<--2:3 104 2 12908 c6b4 d3b3 f8e8
291,061<--2:4 240 10 49217 c6b4 d3b3 c7c6 a2a3 c6b5 a3b4
291,234<--2:move c6b4
291,234*2*Found move:Nc6-b4
291,407*1*Start calc, move no: 24
291,408-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4
291,408-->1:go wtime 7107 btime 7856 winc 100 binc 100
291,412<--1:info score cp -225 depth 1 nodes 1 time 0 pv d3b3
291,414<--1:info score cp -225 depth 2 nodes 2 time 0 pv d3b3 c7c6
291,414<--1:info score cp -225 depth 3 nodes 3 time 0 pv d3b3 c7c6 a2a3
291,423<--1:info score cp -225 depth 4 nodes 7357 time 15 pv d3b3 c7c6 a2a3 c6b5
291,470<--1:info score cp -227 depth 5 nodes 55592 time 62 pv d3b3 c7c6 b5b4 a5b4 e2e3
291,542<--1:info score cp -252 depth 6 nodes 132170 time 134 pv d3b3 c7c6 b5b4 a5b4 e2e3 c8e6
291,696<--1:bestmove d3b3
291,696*1*Found move:Qd3-b3
291,858*2*Start calc, move no: 25
292,099-->2:time 786
292,099-->2:otim 683
292,099-->2:d3b3
292,099<--2:1 104 0 441 f8e8
292,109<--2:2 240 0 4331 c7c6 a2a3 c6b5 a3b4
292,121<--2:3 240 2 10234 c7c6 a2a3 c6b5 a3b4
292,171<--2:4 267 7 38177 c7c6 b5b4 a5b4 e2e3
292,360<--2:move c7c6
292,360*2*Found move:c7-c6
292,513*1*Start calc, move no: 26
292,513-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6
292,513-->1:go wtime 6824 btime 7600 winc 100 binc 100
292,519<--1:info score cp -227 depth 1 nodes 1 time 0 pv b5b4
292,519<--1:info score cp -227 depth 2 nodes 2 time 0 pv b5b4 a5b4
292,519<--1:info score cp -227 depth 3 nodes 3 time 0 pv b5b4 a5b4 e2e3
292,519<--1:info score cp -227 depth 4 nodes 4 time 0 pv b5b4 a5b4 e2e3 c8e6
292,519<--1:info score cp -227 depth 5 nodes 5 time 0 pv b5b4 a5b4 e2e3 c8e6 f1d3
292,655<--1:info score cp -250 depth 6 nodes 168186 time 139 pv b5b4 a5b4 f3d2 a8a3 b3b4 a3a2
292,794<--1:bestmove b5b4
292,794*1*Found move:Rb5xb4
292,955*2*Start calc, move no: 27
293,196-->2:time 760
293,196-->2:otim 655
293,196-->2:b5b4
293,198<--2:1 297 0 50 a5b4
293,199<--2:2 267 0 318 a5b4 e2e3
293,203<--2:3 278 0 2295 a5b4 e2e3 c8e6 b3b4 a8a2 b4b7 a2c2
293,222<--2:4 267 2 11248 a5b4 e2e3 c8e6 f1d3
293,364<--2:5 276 16 80205 a5b4 e2e3 a8a3 b3b4 a3a2
293,450<--2:move a5b4
293,450*2*Found move:a5xb4
293,602*1*Start calc, move no: 28
293,602-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4
293,602-->1:go wtime 6548 btime 7351 winc 100 binc 100
293,607<--1:info score cp -250 depth 1 nodes 1 time 0 pv f3d2
293,607<--1:info score cp -250 depth 2 nodes 2 time 0 pv f3d2 a8a3
293,607<--1:info score cp -250 depth 3 nodes 3 time 0 pv f3d2 a8a3 b3b4
293,607<--1:info score cp -250 depth 4 nodes 4 time 0 pv f3d2 a8a3 b3b4 a3a2
293,607<--1:info score cp -250 depth 5 nodes 5 time 0 pv f3d2 a8a3 b3b4 a3a2 d2e4
293,872<--1:bestmove f3d2
293,872*1*Found move:Nf3-d2
294,042*2*Start calc, move no: 29
294,283-->2:time 736
294,283-->2:otim 629
294,283-->2:f3d2
294,285<--2:1 305 0 202 c8f5 d2e4 f5e4 b3b4 a8a2 b4b7 a2c2
294,287<--2:2 302 0 655 a8a3 b3b4 a3a2 d2e4 d5e4
294,292<--2:3 302 0 2923 a8a3 b3b4 a3a2 d2e4 d5e4
294,313<--2:4 298 2 11682 a8a3 b3b2 c8f5 e2e3 e4d2 e1d2
294,465<--2:5 299 18 87089 a8a3 b3b2 c8f5 e2e3 b7b6 d2e4 f5e4
294,529<--2:move a8a3
294,529*2*Found move:Ra8-a3
294,684*1*Start calc, move no: 30
294,684-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3
294,684-->1:go wtime 6283 btime 7110 winc 100 binc 100
294,689<--1:info score cp -250 depth 1 nodes 1 time 0 pv b3b4
294,689<--1:info score cp -250 depth 2 nodes 2 time 0 pv b3b4 a3a2
294,689<--1:info score cp -250 depth 3 nodes 3 time 0 pv b3b4 a3a2 d2e4
294,689<--1:info score cp -250 depth 4 nodes 4 time 1 pv b3b4 a3a2 d2e4 d5e4
294,711<--1:info score cp -250 depth 5 nodes 28425 time 26 pv b3b4 a3a2 d2e4 d5e4 c2c3
294,755<--1:info score cp -238 depth 6 nodes 79177 time 69 pv b3b4 a3a2 d2e4 d5e4 b4c4 d8d5
294,947<--1:bestmove b3b4
294,947*1*Found move:Qb3xb4
295,123*2*Start calc, move no: 31
295,363-->2:time 711
295,363-->2:otim 603
295,363-->2:b3b4
295,371<--2:1 302 0 87 a3a2 d2e4 d5e4
295,371<--2:2 302 0 602 a3a2 d2e4 d5e4
295,388<--2:3 302 2 6555 a3a2 d2e4 d5e4
295,443<--2:4 299 7 24211 a3a2 d2e4 d5e4 c2c3
295,603<--2:move a3a2
295,603*2*Found move:Ra3xa2
295,760*1*Start calc, move no: 32
295,760-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2
295,760-->1:go wtime 6025 btime 6875 winc 100 binc 100
295,764<--1:info score cp -243 depth 1 nodes 1 time 0 pv d2e4
295,765<--1:info score cp -243 depth 2 nodes 2 time 0 pv d2e4 d5e4
295,765<--1:info score cp -243 depth 3 nodes 3 time 0 pv d2e4 d5e4 b4b3
295,765<--1:info score cp -243 depth 4 nodes 4 time 0 pv d2e4 d5e4 b4b3 c8e6
295,765<--1:info score cp -243 depth 5 nodes 5 time 0 pv d2e4 d5e4 b4b3 c8e6 b3b7
295,901<--1:info score cp -248 depth 6 nodes 166474 time 138 pv d2e4 d5e4 c2c3 f6f5 b4c4 d8d5
296,013<--1:bestmove d2e4
296,013*1*Found move:Nd2xe4
296,170*2*Start calc, move no: 33
296,412-->2:time 688
296,412-->2:otim 578
296,412-->2:d2e4
296,413<--2:1 302 0 39 d5e4
296,430<--2:2 299 0 513 d5e4 c2c3
296,432<--2:3 272 1 5797 d5e4 b4b3 d8d5 e2e3
296,481<--2:4 272 6 37227 d5e4 b4b3 d8d5 e2e3 d5e6
296,641<--2:move d5e4
296,641*2*Found move:d5xe4
296,800*1*Start calc, move no: 34
296,800-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4
296,800-->1:go wtime 5777 btime 6651 winc 100 binc 100
296,804<--1:info score cp -230 depth 1 nodes 1 time 0 pv e2e3
296,804<--1:info score cp -230 depth 2 nodes 2 time 0 pv e2e3 f8f7
296,804<--1:info score cp -230 depth 3 nodes 3 time 0 pv e2e3 f8f7 f1e2
296,804<--1:info score cp -230 depth 4 nodes 4 time 0 pv e2e3 f8f7 f1e2 c8e6
296,806<--1:info score cp -230 depth 5 nodes 5 time 0 pv e2e3 f8f7 f1e2 c8e6 c2c4
297,007<--1:info score cp -245 depth 6 nodes 252572 time 207 pv e2e3 c8e6 f2f3 e4f3 b4b7 c6c5
297,044<--1:bestmove e2e3
297,044*1*Found move:e2-e3
297,238*2*Start calc, move no: 35
297,481-->2:time 666
297,481-->2:otim 554
297,481-->2:e2e3
297,484<--2:1 369 0 42 a2c2
297,485<--2:2 344 0 679 a2c2 f1c4
297,498<--2:3 262 1 7179 c8e6 b4b7 a2c2
297,559<--2:4 272 7 41570 f8f7 b4c3 c8e6 f1c4
297,703<--2:move f8f7
297,703*2*Found move:Rf8-f7
297,855*1*Start calc, move no: 36
297,855-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7
297,855-->1:go wtime 5538 btime 6434 winc 100 binc 100
297,860<--1:info score cp -240 depth 1 nodes 1 time 0 pv b4c3
297,860<--1:info score cp -240 depth 2 nodes 2 time 0 pv b4c3 c8e6
297,860<--1:info score cp -240 depth 3 nodes 3 time 0 pv b4c3 c8e6 f1e2
297,860<--1:info score cp -240 depth 4 nodes 4 time 1 pv b4c3 c8e6 f1e2 d8b6
297,898<--1:info score cp -248 depth 5 nodes 51511 time 42 pv b4c3 c8e6 f1e2 g7g5 f4g3
298,093<--1:bestmove b4c3
298,093*1*Found move:Qb4-c3
298,249*2*Start calc, move no: 37
298,490-->2:time 644
298,490-->2:otim 531
298,490-->2:b4c3
298,492<--2:1 297 0 47 c8f5
298,493<--2:2 272 0 810 c8f5 f1c4
298,506<--2:3 269 1 7540 c8e6 f1c4 e6c4 c3c4
298,562<--2:4 259 7 37936 c8e6 f1e2 f7d7 e1g1
298,703<--2:move c8e6
298,703*2*Found move:Bc8-e6
298,856*1*Start calc, move no: 38
298,857-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6
298,857-->1:go wtime 5305 btime 6226 winc 100 binc 100
298,860<--1:info score cp -253 depth 1 nodes 1 time 0 pv f1e2
298,860<--1:info score cp -253 depth 2 nodes 2 time 0 pv f1e2 g7g5
298,860<--1:info score cp -253 depth 3 nodes 3 time 0 pv f1e2 g7g5 e2h5
298,860<--1:info score cp -253 depth 4 nodes 4 time 0 pv f1e2 g7g5 e2h5 g5f4
298,880<--1:info score cp -233 depth 5 nodes 24567 time 22 pv f1e2 g7g5 f4g3 f6f5 e1g1
298,926<--1:info score cp -243 depth 6 nodes 83446 time 70 pv f1e2 g7g5 f4g3 f6f5 e1g1 f7d7
299,086<--1:bestmove f1e2
299,086*1*Found move:Bf1-e2
299,284*2*Start calc, move no: 39
299,525-->2:time 623
299,525-->2:otim 609
299,525-->2:f1e2
299,527<--2:1 287 0 67 f7d7
299,527<--2:2 259 0 789 f7d7 e1g1
299,535<--2:3 264 1 5494 f7d7 e1g1 e6d5
299,610<--2:4 249 8 39972 f7d7 e1g1 e6d5 f1a1
299,733<--2:move d8a8
299,733*2*Found move:Qd8-a8
299,886*1*Start calc, move no: 40
299,886-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8
299,886-->1:go wtime 6081 btime 7023 winc 100 binc 100
299,888<--1:info score cp -243 depth 1 nodes 1 time 0 pv e1g1
299,889<--1:info score cp -243 depth 2 nodes 2 time 0 pv e1g1 a2c2
299,889<--1:info score cp -243 depth 3 nodes 3 time 0 pv e1g1 a2c2 c3c2
299,889<--1:info score cp -243 depth 4 nodes 4 time 0 pv e1g1 a2c2 c3c2 e6c4
299,889<--1:info score cp -243 depth 5 nodes 5 time 0 pv e1g1 a2c2 c3c2 e6c4 e2c4
300,142<--1:bestmove e1g1
300,142*1*Found move:O-O
300,307*2*Start calc, move no: 41
300,548-->2:time 703
300,548-->2:otim 583
300,548-->2:e1g1
300,553<--2:1 259 0 47 b7b6
300,553<--2:2 249 0 870 b7b6 f1b1
300,565<--2:3 259 1 5391 a8a4 f1c1 b7b6
300,691<--2:4 259 14 46656 a8a4 f1c1 b7b6 f4d6
300,785<--2:move a8a4
300,785*2*Found move:Qa8-a4
300,955*1*Start calc, move no: 42
300,956-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4
300,956-->1:go wtime 5830 btime 6791 winc 100 binc 100
300,957<--1:info score cp -235 depth 1 nodes 1 time 0 pv f1c1
300,961<--1:info score cp -235 depth 2 nodes 2 time 0 pv f1c1 e6d5
300,961<--1:info score cp -235 depth 3 nodes 3 time 0 pv f1c1 e6d5 f2f3
300,961<--1:info score cp -235 depth 4 nodes 4 time 0 pv f1c1 e6d5 f2f3 e4f3
300,985<--1:info score cp -235 depth 5 nodes 46892 time 29 pv f1c1 e6d5 f2f3 e4f3 g2f3
301,117<--1:info score cp -235 depth 6 nodes 201283 time 161 pv f1c1 e6d5 e2h5 f7d7 h5g4 d7d8
301,204<--1:bestmove f1c1
301,204*1*Found move:Rf1-c1
301,385*2*Start calc, move no: 43
301,626-->2:time 680
301,626-->2:otim 559
301,626-->2:f1c1
301,630<--2:1 259 0 68 f7d7
301,630<--2:2 259 0 763 f7d7 c3c5
301,637<--2:3 265 1 4673 b7b6 f2f3 e6d5
301,683<--2:4 265 5 27413 b7b6 f2f3 e6d5 f3e4 d5e4
301,853<--2:move b7b6
301,853*2*Found move:b7-b6
302,005*1*Start calc, move no: 44
302,006-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6
302,006-->1:go wtime 5587 btime 6569 winc 100 binc 100
302,008<--1:info score cp -235 depth 1 nodes 1 time 0 pv f2f3
302,013<--1:info score cp -235 depth 2 nodes 2 time 0 pv f2f3 e4f3
302,013<--1:info score cp -235 depth 3 nodes 3 time 0 pv f2f3 e4f3 g2f3
302,038<--1:info score cp -220 depth 4 nodes 33757 time 33 pv g1h1 f7e7 f2f3 e6d5
302,092<--1:info score cp -222 depth 5 nodes 109127 time 85 pv e2d1 e6d5 c1b1 b6b5 c3b4
302,245<--1:bestmove e2d1
302,245*1*Found move:Be2-d1
302,406*2*Start calc, move no: 45
302,648-->2:time 657
302,648-->2:otim 536
302,648-->2:e2d1
302,649<--2:1 284 0 57 f7a7
302,652<--2:2 274 0 859 f7a7 c1b1
302,659<--2:3 274 1 4717 f7a7 c1b1 a7a6
302,700<--2:4 274 5 25687 f7a7 c1b1 a7a6 f4d6
302,868<--2:move a4a5
302,868*2*Found move:Qa4-a5
303,046*1*Start calc, move no: 46
303,049-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5
303,049-->1:go wtime 5353 btime 6354 winc 100 binc 100
303,053<--1:info score cp -220 depth 1 nodes 1 time 0 pv c3a5
303,053<--1:info score cp -220 depth 2 nodes 2 time 0 pv c3a5 b6a5
303,053<--1:info score cp -220 depth 3 nodes 3 time 0 pv c3a5 b6a5 f2f3
303,054<--1:info score cp -220 depth 4 nodes 4 time 0 pv c3a5 b6a5 f2f3 e4f3
303,084<--1:info score cp -205 depth 5 nodes 32001 time 35 pv c3a5 b6a5 f2f3 f6f5 f3e4
303,123<--1:info score cp -195 depth 6 nodes 64834 time 73 pv c3a5 b6a5 c1b1 f7f8 b1b7 a5a4
303,153<--1:info score cp -200 depth 7 nodes 96721 time 105 pv c3a5 b6a5 f2f3 f7d7 f3e4 e6d5 e4d5
303,259<--1:info score cp -200 depth 8 nodes 234140 time 210 pv c3a5 b6a5 c1b1 f7f8 f4d6 f8d8 b1b8 d8b8
303,278<--1:bestmove c3a5
303,278*1*Found move:Qc3xa5
303,448*2*Start calc, move no: 47
303,689-->2:time 636
303,689-->2:otim 513
303,689-->2:c3a5
303,694<--2:1 274 0 31 b6a5
303,694<--2:2 259 0 176 b6a5 c1b1
303,694<--2:3 278 0 1134 b6a5 f2f3 e6d5
303,699<--2:4 264 1 4371 b6a5 f2f3 e6d5 c2c4
303,738<--2:5 268 4 27184 b6a5 c2c4 f6f5 d1b3 a2b2
303,876<--2:6 267 18 110433 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1
303,901<--2:move b6a5
303,901*2*Found move:b6xa5
304,063*1*Start calc, move no: 48
304,064-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5
304,064-->1:go wtime 5129 btime 6147 winc 100 binc 100
304,067<--1:info score cp -200 depth 1 nodes 1 time 0 pv c1b1
304,067<--1:info score cp -200 depth 2 nodes 2 time 0 pv c1b1 f7f8
304,067<--1:info score cp -200 depth 3 nodes 3 time 0 pv c1b1 f7f8 f4d6
304,067<--1:info score cp -200 depth 4 nodes 4 time 0 pv c1b1 f7f8 f4d6 f8d8
304,067<--1:info score cp -200 depth 5 nodes 5 time 0 pv c1b1 f7f8 f4d6 f8d8 b1b8
304,067<--1:info score cp -200 depth 6 nodes 6 time 0 pv c1b1 f7f8 f4d6 f8d8 b1b8 d8b8
304,185<--1:info score cp -195 depth 7 nodes 157277 time 122 pv f2f3 f6f5 f3e4 f5e4 d1h5 f7d7 h5e2
304,285<--1:bestmove f2f3
304,285*1*Found move:f2-f3
304,437*2*Start calc, move no: 49
304,678-->2:time 615
304,678-->2:otim 492
304,678-->2:f2f3
304,681<--2:1 278 0 84 e6d5
304,682<--2:2 264 0 368 e6d5 c2c4
304,684<--2:3 282 0 2324 f6f5 f3e4 f5e4
304,696<--2:4 267 1 8727 f6f5 f3e4 f5e4 c1b1
304,745<--2:5 278 6 46840 f6f5 c2c4 a2d2 f3e4 f5e4
304,882<--2:move f6f5
304,882*2*Found move:f6-f5
305,046*1*Start calc, move no: 50
305,046-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5
305,046-->1:go wtime 4913 btime 5948 winc 100 binc 100
305,049<--1:info score cp -195 depth 1 nodes 1 time 0 pv f3e4
305,049<--1:info score cp -195 depth 2 nodes 2 time 0 pv f3e4 f5e4
305,049<--1:info score cp -195 depth 3 nodes 3 time 0 pv f3e4 f5e4 c2c4
305,049<--1:info score cp -195 depth 4 nodes 4 time 0 pv f3e4 f5e4 c2c4 a2d2
305,050<--1:info score cp -195 depth 5 nodes 5 time 0 pv f3e4 f5e4 c2c4 a2d2 d1a4
305,050<--1:info score cp -195 depth 6 nodes 6 time 0 pv f3e4 f5e4 c2c4 a2d2 d1a4 e6d7
305,110<--1:info score cp -200 depth 7 nodes 75681 time 64 pv f3e4 f5e4 d1h5 f7e7 f4d6 e7d7 d6e5
305,260<--1:bestmove f3e4
305,260*1*Found move:f3xe4
305,418*2*Start calc, move no: 51
305,663-->2:time 595
305,663-->2:otim 471
305,663-->2:f3e4
305,666<--2:1 282 0 27 f5e4
305,668<--2:2 267 0 202 f5e4 c1b1
305,669<--2:3 282 0 1237 f5e4 d1h5 f7f8
305,687<--2:4 272 2 6042 f5e4 d1h5 f7f5 h5g4
305,795<--2:5 269 13 39584 f5e4 c2c4 a5a4 c1c2 a2a1
305,863<--2:move f5e4
305,863*2*Found move:f5xe4
306,015*1*Start calc, move no: 52
306,016-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4
306,016-->1:go wtime 4704 btime 5753 winc 100 binc 100
306,020<--1:info score cp -200 depth 1 nodes 1 time 0 pv d1h5
306,020<--1:info score cp -200 depth 2 nodes 2 time 0 pv d1h5 g7g6
306,020<--1:info score cp -200 depth 3 nodes 3 time 0 pv d1h5 g7g6 h5e2
306,020<--1:info score cp -200 depth 4 nodes 4 time 0 pv d1h5 g7g6 h5e2 a5a4
306,020<--1:info score cp -200 depth 5 nodes 5 time 0 pv d1h5 g7g6 h5e2 a5a4 f4e5
306,107<--1:info score cp -200 depth 6 nodes 120775 time 90 pv c1b1 e6d5 b1b8 f7f8 b8f8 g8f8
306,223<--1:bestmove c1b1
306,223*1*Found move:Rc1-b1
306,377*2*Start calc, move no: 53
306,619-->2:time 576
306,619-->2:otim 451
306,619-->2:c1b1
306,620<--2:1 288 0 37 a5a4
306,621<--2:2 283 0 300 a5a4 f4e5
306,628<--2:3 277 0 2464 g8f8 d1h5 f7f6
306,650<--2:4 276 3 13380 a5a4 b1b8 f7f8 b8f8 g8f8 g1f2
306,761<--2:5 283 14 79441 f7d7 f4e5 a5a4 b1b6 e6d5
306,813<--2:move f7d7
306,813*2*Found move:Rf7-d7
306,997*1*Start calc, move no: 54
306,997-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7
306,998-->1:go wtime 4502 btime 5564 winc 100 binc 100
307,003<--1:info score cp -195 depth 1 nodes 1 time 0 pv b1b8
307,003<--1:info score cp -195 depth 2 nodes 2 time 0 pv b1b8 d7d8
307,003<--1:info score cp -195 depth 3 nodes 3 time 0 pv b1b8 d7d8 b8d8
307,004<--1:info score cp -195 depth 4 nodes 4 time 0 pv b1b8 d7d8 b8d8 g8f7
307,004<--1:info score cp -195 depth 5 nodes 5 time 0 pv b1b8 d7d8 b8d8 g8f7 d1h5
307,203<--1:bestmove b1b8
307,203*1*Found move:Rb1-b8
307,356*2*Start calc, move no: 55
307,597-->2:time 557
307,597-->2:otim 431
307,597-->2:b1b8
307,603<--2:1 277 0 67 g8f7 f4e5
307,603<--2:2 287 0 525 g8f7 b8b6 e6d5
307,610<--2:3 297 1 5874 g8f7 d1h5 g7g6 h5d1 a5a4
307,671<--2:4 308 7 38896 g8f7 b8b1 a5a4 d1h5 f7f6 f4e5
307,784<--2:move g8f7
307,785*2*Found move:Kg8-f7
307,981*1*Start calc, move no: 56
307,981-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7
307,981-->1:go wtime 4301 btime 5382 winc 100 binc 100
307,986<--1:info score cp -190 depth 1 nodes 1 time 0 pv d1e2
307,986<--1:info score cp -190 depth 2 nodes 2 time 0 pv d1e2 a2a1
307,986<--1:info score cp -190 depth 3 nodes 3 time 0 pv d1e2 a2a1 g1f2
307,986<--1:info score cp -190 depth 4 nodes 4 time 0 pv d1e2 a2a1 g1f2 a5a4
307,986<--1:info score cp -190 depth 5 nodes 5 time 0 pv d1e2 a2a1 g1f2 a5a4 b8b6
308,161<--1:info score cp -180 depth 6 nodes 215750 time 180 pv f4e5 a2a1 b8b1 a1b1 e5f4 b1d1
308,176<--1:bestmove f4e5
308,176*1*Found move:Bf4-e5
308,336*2*Start calc, move no: 57
308,577-->2:time 539
308,577-->2:otim 412
308,577-->2:f4e5
308,592<--2:1 298 0 59 a5a4
308,592<--2:2 453 0 461 a2a1 e5g7 a1d1
308,592<--2:3 453 0 1523 a2a1 e5g7 a1d1
308,613<--2:4 572 3 6595 a2a1 g1f1 a1d1 f1e2 e6g4
308,656<--2:5 572 7 33197 a2a1 g1f2 a1d1 f2e2 e6g4
308,756<--2:move a2a1
308,756*2*Found move:Ra2-a1
308,910*1*Start calc, move no: 58
308,910-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1
308,910-->1:go wtime 4111 btime 5208 winc 100 binc 100
308,913<--1:info score cp -180 depth 1 nodes 1 time 0 pv b8b1
308,913<--1:info score cp -180 depth 2 nodes 2 time 0 pv b8b1 a1b1
308,913<--1:info score cp -180 depth 3 nodes 3 time 0 pv b8b1 a1b1 e5f4
308,913<--1:info score cp -180 depth 4 nodes 4 time 0 pv b8b1 a1b1 e5f4 b1d1
308,913<--1:info score cp -180 depth 5 nodes 5 time 0 pv b8b1 a1b1 e5f4 b1d1 g1f2
308,963<--1:info score cp -185 depth 6 nodes 60475 time 52 pv g1f2 f7g6 d1e2 a1a2 c2c3 a5a4
309,101<--1:bestmove g1f2
309,101*1*Found move:Kg1-f2
309,291*2*Start calc, move no: 59
309,532-->2:time 521
309,532-->2:otim 493
309,532-->2:g1f2
309,534<--2:1 581 0 32 a1d1
309,536<--2:2 577 0 271 a1d1 f2e2
309,538<--2:3 572 0 1754 a1d1 f2e2 e6g4
309,553<--2:4 582 2 9399 a1d1 b8a8 d1d2 f2g1 d7d5
309,609<--2:5 567 7 45296 a1d1 b8a8 d1d2 f2g1 d2e2 a8a5 e2e3
309,704<--2:move a1d1
309,705*2*Found move:Ra1xd1
309,867*1*Start calc, move no: 60
309,867-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1
309,867-->1:go wtime 4925 btime 6040 winc 100 binc 100
309,873<--1:info score cp -180 depth 1 nodes 1 time 0 pv e5f4
309,873<--1:info score cp -180 depth 2 nodes 2 time 0 pv e5f4 d1d4
309,873<--1:info score cp -180 depth 3 nodes 3 time 0 pv e5f4 d1d4 e3d4
309,873<--1:info score cp -180 depth 4 nodes 4 time 0 pv e5f4 d1d4 e3d4 d7d4
309,947<--1:info score cp -190 depth 5 nodes 91891 time 79 pv f2e2 e6g4 e2f2 f7e7 e5g7
310,085<--1:bestmove f2e2
310,085*1*Found move:Kf2-e2
310,238*2*Start calc, move no: 61
310,479-->2:time 604
310,479-->2:otim 472
310,479-->2:f2e2
310,482<--2:1 572 0 111 e6g4
310,484<--2:2 597 0 380 e6g4 e2f2 a5a4
310,486<--2:3 610 0 2324 e6g4 e2f2 d1d2 f2g3 g4f5
310,508<--2:4 607 2 14598 e6g4 e2f2 d1d2 f2g3 g4e6 c2c3
310,616<--2:5 615 13 90665 e6g4 e2f2 d1d2 f2g3 g4e6 b8a8 d7d5
310,682<--2:move e6g4
310,682*2*Found move:Be6-g4
310,852*1*Start calc, move no: 62
310,853-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4
310,853-->1:go wtime 4712 btime 5842 winc 100 binc 100
310,855<--1:info score cp -590 depth 1 nodes 1 time 0 pv e2f2
310,859<--1:info score cp -590 depth 2 nodes 2 time 0 pv e2f2 d1c1
310,859<--1:info score cp -590 depth 3 nodes 3 time 0 pv e2f2 d1c1 f2g3
310,860<--1:info score cp -590 depth 4 nodes 4 time 0 pv e2f2 d1c1 f2g3 g4f5
310,880<--1:info score cp -605 depth 5 nodes 23128 time 28 pv e2f2 d1c1 f2g3 g4f5 b8a8
310,973<--1:info score cp -600 depth 6 nodes 119111 time 119 pv e2f2 d1c1 f2g3 g4e6 b8a8 c1c2
311,061<--1:bestmove e2f2
311,061*1*Found move:Ke2-f2
311,227*2*Start calc, move no: 63
311,470-->2:time 585
311,470-->2:otim 451
311,470-->2:e2f2
311,472<--2:1 597 0 65 a5a4
311,474<--2:2 610 0 640 d1d2 f2g3 g4f5
311,478<--2:3 607 0 3672 d1d2 f2g3 g4e6 c2c3
311,516<--2:4 615 4 26210 d1d2 f2g3 g4e6 b8a8 d7d5
311,665<--2:move d1d2
311,665*2*Found move:Rd1-d2
311,820*1*Start calc, move no: 64
311,821-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2
311,821-->1:go wtime 4509 btime 5652 winc 100 binc 100
311,824<--1:info score cp -600 depth 1 nodes 1 time 0 pv f2g1
311,824<--1:info score cp -600 depth 2 nodes 2 time 0 pv f2g1 d7d4
311,824<--1:info score cp -600 depth 3 nodes 3 time 0 pv f2g1 d7d4 e3d4
311,824<--1:info score cp -600 depth 4 nodes 4 time 0 pv f2g1 d7d4 e3d4 d2c2
311,824<--1:info score cp -600 depth 5 nodes 5 time 0 pv f2g1 d7d4 e3d4 d2c2 e5g7
312,024<--1:bestmove f2g1
312,024*1*Found move:Kf2-g1
312,183*2*Start calc, move no: 65
312,427-->2:time 566
312,427-->2:otim 432
312,427-->2:f2g1
312,430<--2:1 654 0 55 d2c2
312,430<--2:2 654 0 912 d2c2 b8b6
312,433<--2:3 659 0 3545 d2c2 b8a8 d7d5
312,470<--2:4 674 4 22820 d2c2 h2h3 c2c1 g1h2 g4f5
312,596<--2:5 664 16 113026 d2c2 b8h8 g4f5 h8a8 d7d5
312,616<--2:move d2c2
312,616*2*Found move:Rd2xc2
312,785*1*Start calc, move no: 66
312,786-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2 f2g1 d2c2
312,786-->1:go wtime 4311 btime 5468 winc 100 binc 100
312,791<--1:info score cp -605 depth 1 nodes 1 time 0 pv h2h3
312,792<--1:info score cp -605 depth 2 nodes 2 time 0 pv h2h3 c2c1
312,792<--1:info score cp -605 depth 3 nodes 3 time 0 pv h2h3 c2c1 g1f2
312,792<--1:info score cp -605 depth 4 nodes 4 time 0 pv h2h3 c2c1 g1f2 g4f5
312,792<--1:info score cp -605 depth 5 nodes 5 time 0 pv h2h3 c2c1 g1f2 g4f5 e5g7
312,946<--1:info score cp -665 depth 6 nodes 174066 time 158 pv b8a8 c2e2 a8h8 f7g6 h2h3 g4e6
312,984<--1:bestmove b8a8
312,984*1*Found move:Rb8-a8
313,138*2*Start calc, move no: 67
313,379-->2:time 547
313,379-->2:otim 412
313,379-->2:b8a8
313,381<--2:1 659 0 164 d7d5
313,381<--2:2 683 0 987 c2c1 g1f2 c1c2
313,389<--2:3 664 0 4855 c2e2 e5f4 d7d5
313,428<--2:4 680 5 26658 d7b7 h2h3 b7b1 g1h2 g4f3 a8a5 c2g2
313,561<--2:move d7b7
313,561*2*Found move:Rd7-b7
313,711*1*Start calc, move no: 68
313,711-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2 f2g1 d2c2 b8a8 d7b7
313,711-->1:go wtime 4118 btime 5291 winc 100 binc 100
313,714<--1:info score cp -530 depth 1 nodes 31 time 0 pv a8a5
313,716<--1:info score cp -605 depth 2 nodes 523 time 1 pv a8a5 c2g2
313,716<--1:info score cp -690 depth 3 nodes 2671 time 2 pv h2h3 b7b1 g1h2
313,720<--1:info score cp -675 depth 4 nodes 5077 time 7 pv h2h3 c2e2 h3g4 e2g2
313,768<--1:info score cp -685 depth 5 nodes 47555 time 55 pv a8b8 b7b8 e5b8 c6c5 d4d5
313,786<--1:info score cp -690 depth 6 nodes 73748 time 74 pv a8b8 b7b8 e5b8 c2b2 b8e5 a5a4
313,818<--1:info score cp -690 depth 7 nodes 118235 time 105 pv a8b8 b7b8 e5b8 a5a4 b8d6 f7e6 d6e5
313,901<--1:bestmove a8b8
313,901*1*Found move:Ra8-b8
314,071*2*Start calc, move no: 69
314,313-->2:time 530
314,313-->2:otim 394
314,313-->2:a8b8
314,314<--2:1 677 0 53 b7b8 e5b8
314,315<--2:2 683 0 307 c2c1 g1f2 c1c2
314,321<--2:3 698 0 2076 b7b8 e5b8 a5a4
314,340<--2:4 684 2 15136 b7b5 h2h3 b5b8 e5b8
314,440<--2:5 699 12 79270 b7b8 e5b8 a5a4 b8e5 a4a3
314,490<--2:move b7b8
314,490*2*Found move:Rb7xb8
314,647*1*Start calc, move no: 70
314,648-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2 f2g1 d2c2 b8a8 d7b7 a8b8 b7b8
314,648-->1:go wtime 3933 btime 5119 winc 100 binc 100
314,652<--1:info score cp -700 depth 1 nodes 1 time 0 pv e5b8
314,654<--1:info score cp -700 depth 2 nodes 2 time 0 pv e5b8 a5a4
314,654<--1:info score cp -700 depth 3 nodes 3 time 0 pv e5b8 a5a4 b8d6
314,654<--1:info score cp -700 depth 4 nodes 4 time 0 pv e5b8 a5a4 b8d6 c2e2
314,654<--1:info score cp -700 depth 5 nodes 5 time 0 pv e5b8 a5a4 b8d6 c2e2 h2h3
314,654<--1:info score cp -700 depth 6 nodes 6 time 0 pv e5b8 a5a4 b8d6 c2e2 h2h3 f7e6
314,740<--1:info score cp -695 depth 7 nodes 120025 time 92 pv e5b8 a5a4 b8d6 c2e2 h2h3 f7e6 d6e5
314,831<--1:bestmove e5b8
314,831*1*Found move:Be5xb8
314,988*2*Start calc, move no: 71
315,229-->2:time 512
315,229-->2:otim 376
315,229-->2:e5b8
315,231<--2:1 698 0 34 a5a4
315,231<--2:2 678 0 311 a5a4 b8e5
315,231<--2:3 699 0 2010 a5a4 b8e5 a4a3
315,253<--2:4 689 2 15874 a5a4 b8e5 a4a3 g1f1
315,387<--2:5 708 15 129460 a5a4 b8d6 c2b2 g1f1 f7e6
315,398<--2:move a5a4
315,398*2*Found move:a5-a4
315,604*1*Start calc, move no: 72
315,605-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2 f2g1 d2c2 b8a8 d7b7 a8b8 b7b8 e5b8 a5a4
315,605-->1:go wtime 3755 btime 4955 winc 100 binc 100
315,610<--1:info score cp -725 depth 1 nodes 1 time 0 pv b8d6
315,611<--1:info score cp -725 depth 2 nodes 2 time 0 pv b8d6 c2e2
315,611<--1:info score cp -725 depth 3 nodes 3 time 0 pv b8d6 c2e2 h2h3
315,611<--1:info score cp -725 depth 4 nodes 4 time 0 pv b8d6 c2e2 h2h3 g4e6
315,611<--1:info score cp -725 depth 5 nodes 5 time 0 pv b8d6 c2e2 h2h3 g4e6 d6f4
315,611<--1:info score cp -725 depth 6 nodes 6 time 0 pv b8d6 c2e2 h2h3 g4e6 d6f4 a4a3
315,656<--1:info score cp -725 depth 7 nodes 39007 time 50 pv b8d6 c2e2 h2h3 g4h3 g2h3 e2h2 g1h2
315,781<--1:bestmove b8d6
315,781*1*Found move:Bb8-d6
315,937*2*Start calc, move no: 73
316,179-->2:time 496
316,179-->2:otim 359
316,179-->2:b8d6
316,181<--2:1 703 0 34 f7e6
316,183<--2:2 698 0 257 f7e6 d6e5
316,184<--2:3 708 0 2738 c2b2 g1f1 f7e6
316,252<--2:4 703 7 12408 c2b2 g1f1 f7e6 d6e5
316,319<--2:5 715 14 71285 c2e2 d6f4 a4a3 g1f1 a3a2
316,344<--2:move c2e2
316,344*2*Found move:Rc2-e2
316,498*1*Start calc, move no: 74
316,498-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2 f2g1 d2c2 b8a8 d7b7 a8b8 b7b8 e5b8 a5a4 b8d6 c2e2
316,498-->1:go wtime 3584 btime 4795 winc 100 binc 100
316,503<--1:info score cp -725 depth 1 nodes 1 time 0 pv h2h3
316,504<--1:info score cp -725 depth 2 nodes 2 time 0 pv h2h3 g4h3
316,504<--1:info score cp -725 depth 3 nodes 3 time 0 pv h2h3 g4h3 g2h3
316,504<--1:info score cp -725 depth 4 nodes 4 time 0 pv h2h3 g4h3 g2h3 e2h2
316,504<--1:info score cp -725 depth 5 nodes 5 time 0 pv h2h3 g4h3 g2h3 e2h2 g1h2
316,504<--1:info score cp -725 depth 6 nodes 6 time 0 pv h2h3 g4h3 g2h3 e2h2 g1h2 c6c5
316,530<--1:info score cp -725 depth 7 nodes 34832 time 30 pv h2h3 g4h3 g2h3 e2h2 g1h2 c6c5 d4c5
316,669<--1:bestmove h2h3
316,669*1*Found move:h2-h3
316,829*2*Start calc, move no: 75
317,071-->2:time 480
317,071-->2:otim 342
317,071-->2:h2h3
317,071<--2:1 710 0 37 f7e6
317,074<--2:2 705 0 374 f7e6 d6e5
317,077<--2:3 716 0 1647 g4e6 d6f4 a4a3
317,090<--2:4 706 2 8703 g4e6 d6f4 a4a3 g1f1
317,139<--2:5 727 6 39906 g4e6 d6f4 a4a3 g1f1 a3a2
317,232<--2:move g4e6
317,232*2*Found move:Bg4-e6
317,387*1*Start calc, move no: 76
317,387-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2 f2g1 d2c2 b8a8 d7b7 a8b8 b7b8 e5b8 a5a4 b8d6 c2e2 h2h3 g4e6
317,387-->1:go wtime 3418 btime 4639 winc 100 binc 100
317,393<--1:info score cp -715 depth 1 nodes 1 time 0 pv d6f4
317,393<--1:info score cp -715 depth 2 nodes 2 time 0 pv d6f4 c6c5
317,393<--1:info score cp -715 depth 3 nodes 3 time 0 pv d6f4 c6c5 d4c5
317,393<--1:info score cp -715 depth 4 nodes 4 time 0 pv d6f4 c6c5 d4c5 e2c2
317,393<--1:info score cp -715 depth 5 nodes 5 time 0 pv d6f4 c6c5 d4c5 e2c2 g1f1
317,393<--1:info score cp -715 depth 6 nodes 6 time 0 pv d6f4 c6c5 d4c5 e2c2 g1f1 c2c5
317,553<--1:bestmove d6f4
317,553*1*Found move:Bd6-f4
317,745*2*Start calc, move no: 77
317,985-->2:time 464
317,985-->2:otim 326
317,985-->2:d6f4
317,988<--2:1 716 0 37 a4a3
317,990<--2:2 706 0 469 a4a3 g1f1
317,993<--2:3 727 0 2334 a4a3 g1f1 a3a2
318,006<--2:4 871 2 9592 a4a3 d4d5 e6d5 g1f1
318,066<--2:5 882 7 45658 a4a3 g1f1 a3a2 f1e2 a2a1q
318,142<--2:move a4a3
318,142*2*Found move:a4-a3
318,303*1*Start calc, move no: 78
318,303-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2 f2g1 d2c2 b8a8 d7b7 a8b8 b7b8 e5b8 a5a4 b8d6 c2e2 h2h3 g4e6 d6f4 a4a3
318,303-->1:go wtime 3257 btime 4487 winc 100 binc 100
318,307<--1:info score cp -890 depth 1 nodes 1 time 0 pv d4d5
318,307<--1:info score cp -890 depth 2 nodes 2 time 0 pv d4d5 c6d5
318,307<--1:info score cp -890 depth 3 nodes 3 time 0 pv d4d5 c6d5 g1f1
318,307<--1:info score cp -890 depth 4 nodes 4 time 0 pv d4d5 c6d5 g1f1 e2c2
318,307<--1:info score cp -890 depth 5 nodes 5 time 0 pv d4d5 c6d5 g1f1 e2c2 f4e5
318,320<--1:info score cp -1005 depth 6 nodes 12076 time 15 pv d4d5 c6d5 f4e5 e2e3 g1f2 e3d3
318,342<--1:info score cp -1005 depth 7 nodes 33101 time 37 pv d4d5 c6d5 f4e5 e2e3 g1f2 e3d3 f2e2
318,465<--1:bestmove d4d5
318,465*1*Found move:d4-d5
318,630*2*Start calc, move no: 79
318,871-->2:time 449
318,871-->2:otim 410
318,871-->2:d4d5
318,873<--2:1 881 0 28 e6d5
318,874<--2:2 871 0 244 e6d5 g2g3
318,877<--2:3 892 0 1347 e6d5 g1f1 a3a2
318,889<--2:4 1039 1 8416 c6d5 g1f1 a3a2 f1e2 a2a1q
318,931<--2:5 1069 5 37019 a3a2 f4e5 c6d5 e5g7 f7g7
319,022<--2:move a3a2
319,022*2*Found move:a3-a2
319,186*1*Start calc, move no: 80
319,188-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2 f2g1 d2c2 b8a8 d7b7 a8b8 b7b8 e5b8 a5a4 b8d6 c2e2 h2h3 g4e6 d6f4 a4a3 d4d5 a3a2
319,188-->1:go wtime 4100 btime 5341 winc 100 binc 100
319,192<--1:info score cp -1055 depth 1 nodes 1 time 0 pv f4e5
319,192<--1:info score cp -1055 depth 2 nodes 2 time 0 pv f4e5 c6d5
319,192<--1:info score cp -1055 depth 3 nodes 3 time 0 pv f4e5 c6d5 g1f1
319,194<--1:info score cp -1055 depth 4 nodes 4 time 0 pv f4e5 c6d5 g1f1 e2e3
319,194<--1:info score cp -1055 depth 5 nodes 5 time 0 pv f4e5 c6d5 g1f1 e2e3 e5g7
319,194<--1:info score cp -1055 depth 6 nodes 6 time 0 pv f4e5 c6d5 g1f1 e2e3 e5g7 f7g7
319,221<--1:info score cp -1055 depth 7 nodes 35679 time 33 pv f4e5 c6d5 g1f1 e2e3 f1f2 e3d3 f2e2
319,305<--1:info score cp -1100 depth 8 nodes 136615 time 116 pv f4e5 c6d5 g1f1 e2e3 f1f2 e3a3 e5a1 e4e3
319,375<--1:bestmove f4e5
319,375*1*Found move:Bf4-e5
319,533*2*Start calc, move no: 81
319,774-->2:time 535
319,774-->2:otim 392
319,774-->2:f4e5
319,780<--2:1 897 0 77 e6d5
319,780<--2:2 1069 0 950 c6d5 e5g7 f7g7
319,780<--2:3 1069 0 2971 c6d5 e5g7 f7g7
319,807<--2:4 1059 3 15285 c6d5 g1f1 e2e3 f1f2
319,887<--2:5 1073 11 62647 c6d5 h3h4 e2e3 g1f2 e3b3
319,954<--2:move c6d5
319,954*2*Found move:c6xd5
320,107*1*Start calc, move no: 82
320,108-->1:position startpos moves d2d4 d7d5 c1e3 b8c6 b1c3 e7e6 g1f3 g8f6 a1b1 f8b4 e3d2 b4c3 b2c3 e8g8 d2f4 f6e4 d1d3 f7f6 c3c4 a7a5 c4d5 e6d5 b1b5 c6b4 d3b3 c7c6 b5b4 a5b4 f3d2 a8a3 b3b4 a3a2 d2e4 d5e4 e2e3 f8f7 b4c3 c8e6 f1e2 d8a8 e1g1 a8a4 f1c1 b7b6 e2d1 a4a5 c3a5 b6a5 f2f3 f6f5 f3e4 f5e4 c1b1 f7d7 b1b8 g8f7 f4e5 a2a1 g1f2 a1d1 f2e2 e6g4 e2f2 d1d2 f2g1 d2c2 b8a8 d7b7 a8b8 b7b8 e5b8 a5a4 b8d6 c2e2 h2h3 g4e6 d6f4 a4a3 d4d5 a3a2 f4e5 c6d5
320,108-->1:go wtime 3918 btime 5166 winc 100 binc 100
320,113<--1:info score cp -1095 depth 1 nodes 1 time 0 pv g1h2
320,114<--1:info score cp -1095 depth 2 nodes 2 time 0 pv g1h2 e2e3
320,114<--1:info score cp -1095 depth 3 nodes 3 time 0 pv g1h2 e2e3 h2g1
320,114<--1:info score cp -1095 depth 4 nodes 4 time 0 pv g1h2 e2e3 h2g1 e3a3
320,114<--1:info score cp -1095 depth 5 nodes 5 time 0 pv g1h2 e2e3 h2g1 e3a3 g1f2
320,114<--1:info score cp -1095 depth 6 nodes 6 time 0 pv g1h2 e2e3 h2g1 e3a3 g1f2 a2a1q
320,114<--1:info score cp -1095 depth 7 nodes 7 time 0 pv g1h2 e2e3 h2g1 e3a3 g1f2 a2a1q e5a1
320,292<--1:bestmove g1h2
320,292*1*Found move:Kg1-h2
320,476*2*Start calc, move no: 83
320,718-->2:time 517
320,718-->2:otim 374
320,718-->2:g1h2
320,722<--2:1 1079 0 76 e2e3
320,722<--2:2 1069 0 914 e2e3 g2g3
320,722<--2:3 1089 0 2728 e2e3 g2g3 e3e2
320,741<--2:4 1175 2 16378 e2e3 g2g4 e3e1 h2g3 a2a1q e5a1 e1a1
320,796<--2:5 1175 7 62986 e2e3 g2g4 e3e1 h2g3 a2a1q e5a1 e1a1
320,891<--2:move e2e3
320,891*2*Found move:Re2xe3
321,072********Game end: 0-1 {Arena Adjudication}
321,073********Last game won by Tscp 1.81 with Black in 42 moves
321,074********LiSHeX  -  Tscp 1.81:
321,077********   7 B 2    7.0:0.0        1.0:6.0       15:50:15   -11.75    42 5.817 :4.387  1-6-0
321,095********Saving file /home/mkjm/Tournaments/Testing.pgn
321,114-->2:?
321,120<--2:Error (unknown command): ?
321,135-->2:result 0-1
321,137<--2:Error (unknown command): result
322,310********Round 8 of 10: Tscp 1.81  -  LiSHeX
322,377**----------New game---2023-06-13 15:50:17,296 Tue -------------
322,377-->2:new
322,381-->2:post
322,424*2*Start calc, move no: 0
322,431-->2:time 1000
322,431-->2:otim 1000
322,431-->2:white
322,431-->2:go
322,438<--2:move e2e4
322,438*2*Found move:e2-e4
322,665*1*Start calc, move no: 1
322,666-->1:ucinewgame
322,666-->1:isready
322,666<--1:readyok
322,674-->1:position startpos moves e2e4
322,674-->1:go wtime 9998 btime 10000 winc 100 binc 100
322,681<--1:info score cp 0 depth 1 nodes 25 time 0 pv d7d5
322,681<--1:info score cp -25 depth 2 nodes 123 time 0 pv d7d5 f1d3
322,682<--1:info score cp 0 depth 3 nodes 1144 time 0 pv e7e5 d2d4 d7d5
322,682<--1:info score cp -20 depth 4 nodes 5586 time 5 pv e7e5 f1c4 f8c5 b1c3
322,769<--1:info score cp 0 depth 5 nodes 21305 time 96 pv e7e5 f1c4 f8c5 b1c3 b8c6
323,017<--1:info score cp -15 depth 6 nodes 132122 time 342 pv g8f6 b1c3 d7d5 f1d3 e7e5 g1f3
323,061<--1:bestmove g8f6
323,061*1*Found move:Ng8-f6
323,221*2*Start calc, move no: 2
323,463-->2:time 1000
323,463-->2:otim 962
323,463-->2:g8f6
323,464<--2:move e4e5
323,464*2*Found move:e4-e5
323,648*1*Start calc, move no: 3
323,648-->1:position startpos moves e2e4 g8f6 e4e5
323,648-->1:go wtime 9998 btime 9618 winc 100 binc 100
323,653<--1:info score cp -15 depth 1 nodes 1 time 0 pv b8a6
323,653<--1:info score cp -15 depth 2 nodes 2 time 0 pv b8a6 e5f6
323,653<--1:info score cp -15 depth 3 nodes 3 time 0 pv b8a6 e5f6
323,653<--1:info score cp -15 depth 4 nodes 4 time 0 pv b8a6 e5f6
323,656<--1:info score cp -5 depth 5 nodes 7504 time 6 pv b8a6 e5f6
324,023<--1:bestmove b8a6
324,023*1*Found move:Nb8-a6
324,238*2*Start calc, move no: 4
324,478-->2:time 1000
324,478-->2:otim 925
324,478-->2:b8a6
324,480<--2:1 217 0 39 e5f6 e7f6 f1a6 b7a6
324,483<--2:2 217 0 465 e5f6 e7f6 f1a6 b7a6
324,485<--2:3 217 0 2229 e5f6 e7f6 f1a6 b7a6
324,525<--2:4 217 4 12812 e5f6 e7f6 f1a6 b7a6
324,779<--2:5 265 29 57800 e5f6 e7f6 f1a6 b7a6 d2d4
324,814<--2:move e5f6
324,814*2*Found move:e5xf6
325,016*1*Start calc, move no: 5
325,017-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6
325,017-->1:go wtime 9667 btime 9248 winc 100 binc 100
325,023<--1:info score cp -240 depth 1 nodes 1 time 0 pv e7f6
325,030<--1:info score cp -240 depth 2 nodes 2 time 0 pv e7f6 f1a6
325,030<--1:info score cp -240 depth 3 nodes 3 time 0 pv e7f6 f1a6 b7a6
325,030<--1:info score cp -240 depth 4 nodes 4 time 0 pv e7f6 f1a6 b7a6 d2d4
325,057<--1:info score cp -225 depth 5 nodes 14828 time 41 pv e7f6 f1a6 b7a6 d1e2 f8e7
325,258<--1:info score cp -230 depth 6 nodes 60706 time 240 pv e7f6 f1a6 b7a6 d2d4 d8e7 c1e3
325,378<--1:bestmove e7f6
325,378*1*Found move:e7xf6
325,558*2*Start calc, move no: 6
325,801-->2:time 967
325,801-->2:otim 890
325,801-->2:e7f6
325,802<--2:1 217 0 31 f1a6 b7a6
325,805<--2:2 217 0 186 f1a6 b7a6
325,808<--2:3 265 0 1443 f1a6 b7a6 d2d4
325,853<--2:4 245 5 10147 f1a6 b7a6 d1e2 f8e7 d2d4
326,131<--2:move f1a6
326,131*2*Found move:Bf1xa6
326,303*1*Start calc, move no: 7
326,303-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6
326,303-->1:go wtime 9342 btime 8892 winc 100 binc 100
326,309<--1:info score cp -215 depth 1 nodes 1 time 0 pv b7a6
326,312<--1:info score cp -215 depth 2 nodes 2 time 0 pv b7a6 d2d4
326,313<--1:info score cp -215 depth 3 nodes 3 time 0 pv b7a6 d2d4 f8e7
326,313<--1:info score cp -215 depth 4 nodes 4 time 0 pv b7a6 d2d4 f8e7 c1e3
326,316<--1:info score cp -215 depth 5 nodes 5 time 0 pv b7a6 d2d4 f8e7 c1e3 d7d5
326,380<--1:info score cp -225 depth 6 nodes 52182 time 74 pv b7a6 d2d4 d7d5 b1c3 d8e7 c1e3
326,658<--1:bestmove b7a6
326,658*1*Found move:b7xa6
326,861*2*Start calc, move no: 8
327,102-->2:time 935
327,102-->2:otim 855
327,102-->2:b7a6
327,104<--2:1 265 0 27 d2d4
327,104<--2:2 245 0 189 d1e2 f8e7 d2d4
327,107<--2:3 260 0 1712 b1c3 d7d5 d2d4
327,175<--2:4 235 7 9974 b1c3 c8b7 d1e2 d8e7 f2f3
327,302<--2:5 265 19 64004 g1e2 f8d6 d2d4 e8g8 e1g1
327,415<--2:move g1e2
327,415*2*Found move:Ng1-e2
327,566*1*Start calc, move no: 9
327,568-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2
327,568-->1:go wtime 9034 btime 8542 winc 100 binc 100
327,573<--1:info score cp -215 depth 1 nodes 1 time 0 pv d7d5
327,573<--1:info score cp -215 depth 2 nodes 2 time 0 pv d7d5 d2d4
327,573<--1:info score cp -215 depth 3 nodes 3 time 0 pv d7d5 d2d4 f8e7
327,573<--1:info score cp -215 depth 4 nodes 4 time 0 pv d7d5 d2d4 f8e7 c1e3
327,573<--1:info score cp -215 depth 5 nodes 5 time 0 pv d7d5 d2d4 f8e7 c1e3 c8g4
327,623<--1:info score cp -225 depth 6 nodes 59033 time 55 pv d7d5 d2d4 c8e6 e1g1 f8d6 c1e3
327,904<--1:bestmove d7d5
327,904*1*Found move:d7-d5
328,096*2*Start calc, move no: 10
328,342-->2:time 904
328,342-->2:otim 822
328,342-->2:d7d5
328,344<--2:1 255 0 26 d2d4
328,354<--2:2 230 0 116 d2d4 c8e6
328,358<--2:3 270 0 1496 e1g1 c8e6 d2d4
328,400<--2:4 230 5 8712 e1g1 f8b4 d2d4 e8g8
328,501<--2:5 260 15 51893 e1g1 f8d6 d2d4 e8g8 b1c3
328,646<--2:move e1g1
328,646*2*Found move:O-O
328,804*1*Start calc, move no: 11
328,804-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1
328,804-->1:go wtime 8735 btime 8211 winc 100 binc 100
328,809<--1:info score cp -205 depth 1 nodes 1 time 0 pv f8e7
328,809<--1:info score cp -205 depth 2 nodes 2 time 0 pv f8e7 c2c3
328,809<--1:info score cp -205 depth 3 nodes 3 time 0 pv f8e7 c2c3 c7c6
328,809<--1:info score cp -205 depth 4 nodes 4 time 0 pv f8e7 c2c3 c7c6 d2d4
328,809<--1:info score cp -205 depth 5 nodes 5 time 0 pv f8e7 c2c3 c7c6 d2d4 e8g8
328,923<--1:info score cp -225 depth 6 nodes 132481 time 118 pv f8e7 d2d4 e8g8 c1e3 c8e6 b1c3
329,130<--1:bestmove f8e7
329,130*1*Found move:Bf8-e7
329,280*2*Start calc, move no: 12
329,520-->2:time 874
329,520-->2:otim 789
329,520-->2:f8e7
329,523<--2:1 275 0 26 d2d4
329,524<--2:2 230 0 121 d2d4 e8g8
329,525<--2:3 265 0 1020 d2d4 e8g8 b1c3
329,537<--2:4 240 1 4878 d2d4 e8g8 b1c3 c8e6
329,590<--2:5 265 6 32584 d2d4 e8g8 b1c3 c8e6 c1e3
329,813<--2:move d2d4
329,813*2*Found move:d2-d4
329,971*1*Start calc, move no: 13
329,971-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4
329,971-->1:go wtime 8447 btime 7890 winc 100 binc 100
329,972<--1:info score cp -210 depth 1 nodes 1 time 0 pv e8g8
329,972<--1:info score cp -210 depth 2 nodes 2 time 0 pv e8g8 b1c3
329,972<--1:info score cp -210 depth 3 nodes 3 time 0 pv e8g8 b1c3 c8f5
329,973<--1:info score cp -210 depth 4 nodes 4 time 0 pv e8g8 b1c3 c8f5 c1f4
329,973<--1:info score cp -210 depth 5 nodes 5 time 0 pv e8g8 b1c3 c8f5 c1f4 f8e8
330,105<--1:info score cp -225 depth 6 nodes 138807 time 134 pv e8g8 b1c3 c8e6 e2f4 f6f5 f4e6
330,289<--1:bestmove e8g8
330,289*1*Found move:O-O
330,451*2*Start calc, move no: 14
330,693-->2:time 845
330,693-->2:otim 758
330,693-->2:e8g8
330,695<--2:1 265 0 34 b1c3
330,696<--2:2 240 0 143 b1c3 c8e6
330,699<--2:3 265 0 1375 b1c3 c8e6 c1e3
330,717<--2:4 245 2 8736 b1c3 a8b8 f1e1 c8e6
330,807<--2:5 255 11 62115 b1c3 a8b8 a1b1 c8e6 c1e3
330,975<--2:move b1c3
330,975*2*Found move:Nb1-c3
331,132*1*Start calc, move no: 15
331,132-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3
331,132-->1:go wtime 8170 btime 7577 winc 100 binc 100
331,137<--1:info score cp -215 depth 1 nodes 1 time 0 pv a8b8
331,137<--1:info score cp -215 depth 2 nodes 2 time 0 pv a8b8 e2f4
331,137<--1:info score cp -215 depth 3 nodes 3 time 0 pv a8b8 e2f4 c7c6
331,137<--1:info score cp -215 depth 4 nodes 4 time 0 pv a8b8 e2f4 c7c6 f1e1
331,137<--1:info score cp -215 depth 5 nodes 5 time 0 pv a8b8 e2f4 c7c6 f1e1 c8f5
331,262<--1:info score cp -225 depth 6 nodes 153927 time 131 pv a8b8 e2f4 c7c6 a1b1 c8f5 c1e3
331,436<--1:bestmove a8b8
331,436*1*Found move:Ra8-b8
331,612*2*Start calc, move no: 16
331,852-->2:time 817
331,852-->2:otim 728
331,852-->2:a8b8
331,855<--2:1 270 0 57 f1e1
331,857<--2:2 245 0 374 f1e1 c8e6
331,865<--2:3 255 1 3598 a1b1 c8e6 c1e3
331,912<--2:4 247 5 25002 e2f4 c7c6 f1e1 c8f5
332,056<--2:5 257 20 112345 e2f4 c7c6 a1b1 c8e6 c1e3
332,127<--2:move e2f4
332,127*2*Found move:Ne2-f4
332,279*1*Start calc, move no: 17
332,279-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4
332,279-->1:go wtime 7900 btime 7278 winc 100 binc 100
332,286<--1:info score cp -220 depth 1 nodes 1 time 0 pv c7c6
332,286<--1:info score cp -220 depth 2 nodes 2 time 0 pv c7c6 f4d3
332,286<--1:info score cp -220 depth 3 nodes 3 time 0 pv c7c6 f4d3 e7d6
332,286<--1:info score cp -220 depth 4 nodes 4 time 0 pv c7c6 f4d3 e7d6 c1e3
332,287<--1:info score cp -220 depth 5 nodes 5 time 0 pv c7c6 f4d3 e7d6 c1e3 c8f5
332,377<--1:info score cp -225 depth 6 nodes 109339 time 96 pv c7c6 f4d3 e7d6 c1e3 c8f5 d1e2
332,576<--1:bestmove c7c6
332,576*1*Found move:c7-c6
332,765*2*Start calc, move no: 18
333,010-->2:time 790
333,010-->2:otim 699
333,010-->2:c7c6
333,012<--2:1 272 0 66 f1e1
333,012<--2:2 247 0 792 f1e1 c8f5
333,022<--2:3 257 1 6591 a1b1 c8f5 c1e3
333,111<--2:4 242 9 46641 a1b1 c8f5 c1e3 f8e8
333,274<--2:move a1b1
333,274*2*Found move:Ra1-b1
333,426*1*Start calc, move no: 19
333,428-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1
333,428-->1:go wtime 8641 btime 6986 winc 100 binc 100
333,432<--1:info score cp -210 depth 1 nodes 1 time 0 pv c8f5
333,433<--1:info score cp -210 depth 2 nodes 2 time 0 pv c8f5 c1e3
333,433<--1:info score cp -210 depth 3 nodes 3 time 0 pv c8f5 c1e3 f8e8
333,447<--1:info score cp -220 depth 4 nodes 18684 time 19 pv c8f5 c1e3 f8e8 f1e1
333,462<--1:info score cp -220 depth 5 nodes 29436 time 33 pv c8f5 c1e3 f8e8 f1e1 e7d6
333,713<--1:bestmove c8f5
333,713*1*Found move:Bc8-f5
333,871*2*Start calc, move no: 20
334,111-->2:time 865
334,111-->2:otim 771
334,111-->2:c8f5
334,117<--2:1 257 0 93 c1e3
334,117<--2:2 242 0 752 c1e3 f8e8
334,123<--2:3 257 1 4995 f1e1 f8e8 c1e3
334,180<--2:4 252 6 31222 f1e1 f8e8 c1e3 e7d6
334,401<--2:move f1e1
334,401*2*Found move:Rf1-e1
334,565*1*Start calc, move no: 21
334,567-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1
334,567-->1:go wtime 8356 btime 7706 winc 100 binc 100
334,573<--1:info score cp -220 depth 1 nodes 1 time 0 pv f8e8
334,573<--1:info score cp -220 depth 2 nodes 2 time 0 pv f8e8 c1e3
334,573<--1:info score cp -220 depth 3 nodes 3 time 0 pv f8e8 c1e3 e7d6
334,592<--1:info score cp -220 depth 4 nodes 23584 time 24 pv f8e8 c1e3 e7d6 e1e2
334,634<--1:info score cp -215 depth 5 nodes 71927 time 66 pv f8e8 c1e3 e7d6 e1e2 d8e7
334,875<--1:bestmove f8e8
334,876*1*Found move:Rf8-e8
335,036*2*Start calc, move no: 22
335,276-->2:time 836
335,276-->2:otim 741
335,276-->2:f8e8
335,280<--2:1 257 0 158 c1e3
335,280<--2:2 252 0 1373 c1e3 e7d6
335,291<--2:3 252 1 6448 c1e3 e7d6 f4d3
335,367<--2:4 253 9 45518 a2a4 a6a5 c1e3 e7d6
335,557<--2:move a2a4
335,557*2*Found move:a2-a4
335,765*1*Start calc, move no: 23
335,765-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4
335,765-->1:go wtime 8080 btime 7403 winc 100 binc 100
335,771<--1:info score cp -215 depth 1 nodes 1 time 0 pv h7h6
335,772<--1:info score cp -215 depth 2 nodes 2 time 0 pv h7h6 e1e7
335,772<--1:info score cp -215 depth 3 nodes 3 time 0 pv h7h6 e1e7 e8e7
335,835<--1:info score cp -205 depth 4 nodes 67094 time 68 pv e7d6 c1e3 d8c7 c3e2
335,888<--1:info score cp -200 depth 5 nodes 146461 time 123 pv b8b4 c1e3 e7d6 f4d3 e8e3
336,064<--1:bestmove b8b4
336,064*1*Found move:Rb8-b4
336,216*2*Start calc, move no: 24
336,457-->2:time 808
336,457-->2:otim 711
336,457-->2:b8b4
336,458<--2:1 259 0 282 c1e3
336,463<--2:2 254 0 1719 c1e3 e7d6
336,476<--2:3 254 2 7732 c1e3 e7d6 f4d3
336,566<--2:4 254 10 46382 c1e3 e7d6 f4d3 f5d3 d1d3
336,727<--2:move c1e3
336,727*2*Found move:Bc1-e3
336,895*1*Start calc, move no: 25
336,896-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3
336,896-->1:go wtime 7815 btime 7109 winc 100 binc 100
336,898<--1:info score cp -207 depth 1 nodes 1 time 0 pv d8b8
336,898<--1:info score cp -207 depth 2 nodes 2 time 0 pv d8b8 d1c1
336,898<--1:info score cp -207 depth 3 nodes 3 time 0 pv d8b8 d1c1 e7d6
336,898<--1:info score cp -207 depth 4 nodes 4 time 0 pv d8b8 d1c1 e7d6 e1e2
336,933<--1:info score cp -207 depth 5 nodes 43909 time 36 pv d8b8 d1c1 e7d6 e1e2 b4c4
337,187<--1:bestmove d8b8
337,187*1*Found move:Qd8-b8
337,339*2*Start calc, move no: 26
337,579-->2:time 782
337,579-->2:otim 683
337,579-->2:d8b8
337,582<--2:1 259 0 966 d1c1
337,589<--2:2 254 0 4189 d1c1 e7d6
337,606<--2:3 254 2 14021 d1c1 e7d6 e1e2
337,692<--2:4 253 11 63227 d1c1 e7d6 e1e2 a6a5
337,840<--2:move d1c1
337,840*2*Found move:Qd1-c1
338,007*1*Start calc, move no: 27
338,009-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1
338,009-->1:go wtime 7559 btime 6823 winc 100 binc 100
338,009<--1:info score cp -197 depth 1 nodes 1 time 0 pv e7d6
338,009<--1:info score cp -197 depth 2 nodes 2 time 0 pv e7d6 g2g3
338,009<--1:info score cp -197 depth 3 nodes 3 time 0 pv e7d6 g2g3 b8b6
338,009<--1:info score cp -197 depth 4 nodes 4 time 0 pv e7d6 g2g3 b8b6 e1e2
338,047<--1:info score cp -187 depth 5 nodes 46964 time 39 pv e7d6 g2g3 b4b7 a4a5 b7e7
338,245<--1:info score cp -192 depth 6 nodes 295410 time 237 pv e7d6 g2g3 b4b7 f4d3 b7e7 f2f4
338,289<--1:bestmove e7d6
338,289*1*Found move:Be7-d6
338,457*2*Start calc, move no: 28
338,698-->2:time 756
338,698-->2:otim 655
338,698-->2:e7d6
338,701<--2:1 254 0 1636 e1e2
338,708<--2:2 253 0 4392 e1e2 a6a5
338,750<--2:3 227 5 26430 g2g3 b8c8 f4e2
338,820<--2:4 226 12 63615 g2g3 b8c8 f4e2 a6a5
338,952<--2:move g2g3
338,952*2*Found move:g2-g3
339,114*1*Start calc, move no: 29
339,114-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3
339,114-->1:go wtime 7310 btime 6548 winc 100 binc 100
339,117<--1:info score cp -192 depth 1 nodes 1 time 0 pv b4b7
339,117<--1:info score cp -192 depth 2 nodes 2 time 1 pv b4b7 f4d3
339,117<--1:info score cp -192 depth 3 nodes 3 time 1 pv b4b7 f4d3 b7e7
339,117<--1:info score cp -192 depth 4 nodes 4 time 1 pv b4b7 f4d3 b7e7 f2f4
339,143<--1:info score cp -192 depth 5 nodes 40476 time 29 pv b4b7 f4d3 b7e7 f2f4 b8b6
339,293<--1:info score cp -192 depth 6 nodes 257916 time 178 pv b4b7 f4d3 b7e7 f2f4 b8b6 b1a1
339,384<--1:bestmove b4b7
339,384*1*Found move:Rb4-b7
339,557*2*Start calc, move no: 30
339,798-->2:time 731
339,798-->2:otim 629
339,798-->2:b4b7
339,804<--2:1 239 0 303 f2f3
339,804<--2:2 234 0 2813 f2f3 b7e7
339,822<--2:3 229 2 12928 f2f3 b7e7 f4g2
339,983<--2:4 228 18 62668 f2f3 b7e7 f4g2 a6a5
340,042<--2:move f2f3
340,042*2*Found move:f2-f3
340,193*1*Start calc, move no: 31
340,194-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3
340,194-->1:go wtime 7071 btime 6283 winc 100 binc 100
340,196<--1:info score cp -192 depth 1 nodes 1 time 0 pv b7e7
340,196<--1:info score cp -192 depth 2 nodes 2 time 0 pv b7e7 c3d5
340,196<--1:info score cp -192 depth 3 nodes 3 time 0 pv b7e7 c3d5 c6d5
340,196<--1:info score cp -192 depth 4 nodes 4 time 0 pv b7e7 c3d5 c6d5 f4d5
340,196<--1:info score cp -192 depth 5 nodes 5 time 0 pv b7e7 c3d5 c6d5 f4d5 e7b7
340,454<--1:bestmove b7e7
340,454*1*Found move:Rb7-e7
340,605*2*Start calc, move no: 32
340,847-->2:time 708
340,847-->2:otim 603
340,847-->2:b7e7
340,850<--2:1 229 0 558 f4g2
340,855<--2:2 228 0 2729 f4g2 a6a5
340,872<--2:3 228 2 9580 f4g2 a6a5 b1a1
340,920<--2:4 221 7 35896 f4d5 c6d5 c3d5 e7e6
341,046<--2:5 222 19 102390 f4d5 c6d5 c3d5 e7e6 a4a5
341,084<--2:move f4d5
341,084*2*Found move:Nf4xd5
341,246*1*Start calc, move no: 33
341,247-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5
341,247-->1:go wtime 6839 btime 6028 winc 100 binc 100
341,249<--1:info score cp -112 depth 1 nodes 1 time 0 pv c6d5
341,253<--1:info score cp -112 depth 2 nodes 2 time 0 pv c6d5 c3d5
341,253<--1:info score cp -112 depth 3 nodes 3 time 0 pv c6d5 c3d5 e7e6
341,253<--1:info score cp -112 depth 4 nodes 4 time 0 pv c6d5 c3d5 e7e6 f3f4
341,288<--1:info score cp -107 depth 5 nodes 42476 time 39 pv c6d5 c3d5 e7e6 f3f4 f5e4
341,344<--1:info score cp -82 depth 6 nodes 116402 time 95 pv c6d5 c3d5 e7d7 d5c3 d7e7 c3d1
341,415<--1:info score cp -82 depth 7 nodes 208098 time 166 pv c6d5 c3d5 e7d7 d5c3 d7e7 c3d1 e7e6
341,501<--1:bestmove c6d5
341,501*1*Found move:c6xd5
341,691*2*Start calc, move no: 34
341,933-->2:time 684
341,933-->2:otim 578
341,933-->2:c6d5
341,934<--2:1 221 0 51 c3d5
341,937<--2:2 221 0 643 c3d5 e7e6
341,944<--2:3 222 1 2253 c3d5 e7e6 a4a5
341,984<--2:4 220 5 9970 c3d5 e7d7 f3f4 f5e4
342,078<--2:5 221 14 55086 c3d5 e7d7 d5c3 d7e7 c3d5
342,160<--2:move c3d5
342,160*2*Found move:Nc3xd5
342,317*1*Start calc, move no: 35
342,317-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5
342,317-->1:go wtime 6617 btime 5779 winc 100 binc 100
342,320<--1:info score cp -82 depth 1 nodes 1 time 0 pv e7d7
342,320<--1:info score cp -82 depth 2 nodes 2 time 0 pv e7d7 d5c3
342,323<--1:info score cp -82 depth 3 nodes 3 time 0 pv e7d7 d5c3 d7e7
342,323<--1:info score cp -82 depth 4 nodes 4 time 0 pv e7d7 d5c3 d7e7 e3f2
342,323<--1:info score cp -82 depth 5 nodes 5 time 0 pv e7d7 d5c3 d7e7 e3f2 e7e1
342,473<--1:info score cp -82 depth 6 nodes 189603 time 154 pv e7d7 b1a1 d6g3 a1b1 g3e1 c1e1
342,564<--1:bestmove e7d7
342,564*1*Found move:Re7-d7
342,715*2*Start calc, move no: 36
342,957-->2:time 662
342,957-->2:otim 554
342,957-->2:e7d7
342,959<--2:1 225 0 355 f3f4
342,962<--2:2 220 0 1687 f3f4 f5e4
342,977<--2:3 221 1 8341 d5c3 d7e7 c3d5
343,027<--2:4 212 6 36114 f3f4 f5e4 d5c3 f6f5
343,179<--2:move f3f4
343,179*2*Found move:f3-f4
343,332*1*Start calc, move no: 37
343,333-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4
343,333-->1:go wtime 6400 btime 5537 winc 100 binc 100
343,337<--1:info score cp -77 depth 1 nodes 1 time 0 pv b8a8
343,337<--1:info score cp -77 depth 2 nodes 2 time 0 pv b8a8 d5c3
343,337<--1:info score cp -77 depth 3 nodes 3 time 0 pv b8a8 d5c3 d7e7
343,337<--1:info score cp -77 depth 4 nodes 4 time 0 pv b8a8 d5c3 d7e7 c3d1
343,348<--1:info score cp -87 depth 5 nodes 14874 time 15 pv d6f8 d5c3 b8b7 a4a5 e8e3
343,571<--1:bestmove d6f8
343,571*1*Found move:Bd6-f8
343,724*2*Start calc, move no: 38
343,965-->2:time 640
343,965-->2:otim 531
343,965-->2:d6f8
343,968<--2:1 245 0 166 d5c3
343,970<--2:2 220 0 881 d5c3 f8d6
343,978<--2:3 235 1 4296 d5c3 f8b4 d4d5 d7d5 c3d5 b4e1 c1e1 f5c2
344,003<--2:4 225 3 17633 d5c3 f5e6 c3e4 f8d6
344,180<--2:move d5c3
344,180*2*Found move:Nd5-c3
344,337*1*Start calc, move no: 39
344,337-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3
344,337-->1:go wtime 7190 btime 5304 winc 100 binc 100
344,343<--1:info score cp -92 depth 1 nodes 1 time 0 pv d7e7
344,344<--1:info score cp -92 depth 2 nodes 2 time 0 pv d7e7 g1f2
344,344<--1:info score cp -92 depth 3 nodes 3 time 0 pv d7e7 g1f2 b8b7
344,344<--1:info score cp -92 depth 4 nodes 4 time 0 pv d7e7 g1f2 b8b7 d4d5
344,379<--1:info score cp -102 depth 5 nodes 53379 time 41 pv f8d6 b1a1 d7b7 a1a2 b7e7
344,568<--1:bestmove f8d6
344,568*1*Found move:Bf8-d6
344,722*2*Start calc, move no: 40
344,964-->2:time 719
344,964-->2:otim 608
344,965-->2:f8d6
344,970<--2:1 244 0 96 d4d5
344,972<--2:2 239 0 2351 d4d5 d7e7
344,987<--2:3 227 2 9413 d4d5 d7e7 e3d2 e7e1 d2e1
345,064<--2:4 227 9 54110 d4d5 d7e7 e3d2 e7e1 d2e1
345,204<--2:move d4d5
345,204*2*Found move:d4-d5
345,384*1*Start calc, move no: 41
345,386-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5
345,386-->1:go wtime 6955 btime 6078 winc 100 binc 100
345,388<--1:info score cp -97 depth 1 nodes 1 time 0 pv d7e7
345,390<--1:info score cp -97 depth 2 nodes 2 time 0 pv d7e7 e3d2
345,390<--1:info score cp -97 depth 3 nodes 3 time 0 pv d7e7 e3d2 e7e1
345,390<--1:info score cp -97 depth 4 nodes 4 time 0 pv d7e7 e3d2 e7e1 d2e1
345,411<--1:info score cp -92 depth 5 nodes 30137 time 25 pv d7e7 e3f2 e7e1 f2e1 d6c5
345,640<--1:bestmove d7e7
345,641*1*Found move:Rd7-e7
345,827*2*Start calc, move no: 42
346,068-->2:time 696
346,068-->2:otim 583
346,068-->2:d7e7
346,070<--2:1 227 0 715 e3d2 e7e1 d2e1
346,086<--2:2 227 1 2307 e3d2 e7e1 d2e1
346,099<--2:3 226 3 7147 e3f2 e7e1 f2e1 a6a5
346,141<--2:4 213 7 26842 e3f2 e7e1 f2e1 d6c5 e1f2 c5f2 g1f2
346,267<--2:5 213 19 92539 e3f2 e7e1 f2e1 e8e1 c1e1 f5c2 b1c1 b8b2
346,300<--2:move e3f2
346,300*2*Found move:Be3-f2
346,460*1*Start calc, move no: 43
346,462-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2
346,462-->1:go wtime 6728 btime 5829 winc 100 binc 100
346,466<--1:info score cp -97 depth 1 nodes 1 time 0 pv e7e1
346,468<--1:info score cp -97 depth 2 nodes 2 time 0 pv e7e1 f2e1
346,468<--1:info score cp -97 depth 3 nodes 3 time 0 pv e7e1 f2e1 d6c5
346,468<--1:info score cp -97 depth 4 nodes 4 time 0 pv e7e1 f2e1 d6c5 e1f2
346,522<--1:info score cp -92 depth 5 nodes 72956 time 60 pv e7e1 f2e1 b8b7 e1d2 d6c5
346,710<--1:bestmove e7e1
346,710*1*Found move:Re7xe1
346,871*2*Start calc, move no: 44
347,111-->2:time 673
347,111-->2:otim 559
347,111-->2:e7e1
347,114<--2:1 226 0 119 f2e1 a6a5
347,117<--2:2 213 0 1465 f2e1 d6c5 e1f2 c5f2 g1f2
347,133<--2:3 213 2 6546 f2e1 e8e1 c1e1 f5c2 b1c1 b8b2
347,198<--2:4 209 8 46444 f2e1 e8e1 c1e1 d6c5 g1h1 f5c2 b2b4 c5b4
347,337<--2:move f2e1
347,337*2*Found move:Bf2xe1
347,493*1*Start calc, move no: 45
347,494-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1
347,494-->1:go wtime 6507 btime 5586 winc 100 binc 100
347,496<--1:info score cp -35 depth 1 nodes 1 time 0 pv b8b6
347,496<--1:info score cp -35 depth 2 nodes 2 time 0 pv b8b6 e1f2
347,496<--1:info score cp -35 depth 3 nodes 3 time 0 pv b8b6 e1f2 d6c5
347,496<--1:info score cp -35 depth 4 nodes 4 time 0 pv b8b6 e1f2 d6c5 f2c5
347,496<--1:info score cp -35 depth 5 nodes 5 time 0 pv b8b6 e1f2 d6c5 f2c5 b6c5
347,733<--1:bestmove b8b6
347,733*1*Found move:Qb8-b6
347,896*2*Start calc, move no: 46
348,137-->2:time 651
348,137-->2:otim 536
348,137-->2:b8b6
348,138<--2:1 237 0 400 e1f2 b6b7
348,147<--2:2 244 0 1605 e1f2 d6c5 f2c5 b6c5
348,168<--2:3 244 2 10152 e1f2 d6c5 f2c5 b6c5
348,259<--2:4 233 12 59574 e1f2 d6c5 f2c5 b6c5 g1h1 a6a5
348,357<--2:move e1f2
348,357*2*Found move:Be1-f2
348,509*1*Start calc, move no: 47
348,509-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2
348,509-->1:go wtime 6292 btime 5352 winc 100 binc 100
348,513<--1:info score cp -62 depth 1 nodes 1 time 0 pv d6c5
348,514<--1:info score cp -62 depth 2 nodes 2 time 0 pv d6c5 f2c5
348,514<--1:info score cp -62 depth 3 nodes 3 time 0 pv d6c5 f2c5 b6b8
348,514<--1:info score cp -62 depth 4 nodes 4 time 1 pv d6c5 f2c5 b6b8 c5a7
348,514<--1:info score cp -62 depth 5 nodes 5 time 1 pv d6c5 f2c5 b6b8 c5a7 b8a7
348,570<--1:info score cp -20 depth 6 nodes 75767 time 61 pv d6c5 c1f1
348,760<--1:bestmove d6c5
348,760*1*Found move:Bd6-c5
348,922*2*Start calc, move no: 48
349,165-->2:time 630
349,165-->2:otim 511
349,165-->2:d6c5
349,169<--2:1 244 0 30 f2c5 b6c5
349,169<--2:2 244 0 125 f2c5 b6c5
349,169<--2:3 233 0 997 f2c5 b6c5 g1h1 a6a5
349,181<--2:4 219 1 7954 f2c5 b6c5 g1g2 f5e4 c3e4 e8e4
349,266<--2:5 111 10 57329 c1d2 c5f2 d2f2 f5c2 b1c1 c2d3
349,376<--2:move c1d2
349,376*2*Found move:Qc1-d2
349,530*1*Start calc, move no: 49
349,531-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2
349,531-->1:go wtime 6086 btime 5106 winc 100 binc 100
349,537<--1:info score cp -25 depth 1 nodes 1 time 0 pv c5f2
349,537<--1:info score cp -25 depth 2 nodes 2 time 0 pv c5f2 d2f2
349,537<--1:info score cp -25 depth 3 nodes 3 time 0 pv c5f2 d2f2 b6f2
349,537<--1:info score cp -25 depth 4 nodes 4 time 0 pv c5f2 d2f2 b6f2 g1f2
349,537<--1:info score cp -25 depth 5 nodes 5 time 0 pv c5f2 d2f2 b6f2 g1f2 f5c2
349,583<--1:info score cp 5 depth 6 nodes 60934 time 52 pv c5f2 d2f2 b6f2 g1f2 e8b8 b2b4
349,713<--1:info score cp 5 depth 7 nodes 233581 time 182 pv c5f2 d2f2 b6f2 g1f2 e8b8 b2b4 b8c8
349,760<--1:bestmove c5f2
349,760*1*Found move:Bc5xf2
349,915*2*Start calc, move no: 50
350,156-->2:time 609
350,156-->2:otim 489
350,156-->2:c5f2
350,158<--2:1 101 0 62 d2f2 f5c2
350,160<--2:2 116 0 555 d2f2 f5c2 b1c1
350,164<--2:3 111 0 2948 d2f2 f5c2 b1c1 c2d3
350,191<--2:4 103 3 17558 d2f2 f5c2 b1c1 c2f5 h2h4
350,345<--2:5 102 18 106590 d2f2 f5c2 b1c1 c2f5 h2h4 a6a5
350,360<--2:move d2f2
350,360*2*Found move:Qd2xf2
350,528*1*Start calc, move no: 51
350,528-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2
350,528-->1:go wtime 5887 btime 4882 winc 100 binc 100
350,531<--1:info score cp 5 depth 1 nodes 1 time 0 pv b6f2
350,531<--1:info score cp 5 depth 2 nodes 2 time 0 pv b6f2 g1f2
350,531<--1:info score cp 5 depth 3 nodes 3 time 0 pv b6f2 g1f2 e8b8
350,533<--1:info score cp 5 depth 4 nodes 4 time 0 pv b6f2 g1f2 e8b8 b2b4
350,534<--1:info score cp 5 depth 5 nodes 5 time 0 pv b6f2 g1f2 e8b8 b2b4 b8c8
350,534<--1:info score cp 5 depth 6 nodes 6 time 0 pv b6f2 g1f2 e8b8 b2b4 b8c8 b1b3
350,723<--1:info score cp 5 depth 7 nodes 151631 time 193 pv b6f2 g1f2 e8b8 b2b4 b8c8 b1b3 f5c2
350,747<--1:bestmove b6f2
350,747*1*Found move:Qb6xf2
350,908*2*Start calc, move no: 52
351,151-->2:time 589
351,151-->2:otim 467
351,151-->2:b6f2
351,157<--2:1 132 0 32 g1f2 f5c2
351,157<--2:2 147 0 240 g1f2 f5c2 b1c1
351,157<--2:3 142 0 1171 g1f2 f5c2 b1c1 c2d3
351,170<--2:4 144 1 7751 g1f2 e8b8 b2b4 b8c8 b1b3 f5c2
351,214<--2:5 144 6 27679 g1f2 e8b8 b2b4 b8c8 b1b3 f5c2
351,351<--2:move g1f2
351,351*2*Found move:Kg1xf2
351,546*1*Start calc, move no: 53
351,547-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2
351,547-->1:go wtime 5692 btime 4668 winc 100 binc 100
351,551<--1:info score cp 5 depth 1 nodes 1 time 0 pv e8b8
351,552<--1:info score cp 5 depth 2 nodes 2 time 0 pv e8b8 b2b4
351,552<--1:info score cp 5 depth 3 nodes 3 time 0 pv e8b8 b2b4 b8c8
351,552<--1:info score cp 5 depth 4 nodes 4 time 0 pv e8b8 b2b4 b8c8 b1e1
351,552<--1:info score cp 5 depth 5 nodes 5 time 0 pv e8b8 b2b4 b8c8 b1e1 f5c2
351,552<--1:info score cp 5 depth 6 nodes 6 time 0 pv e8b8 b2b4 b8c8 b1e1 f5c2 e1e3
351,753<--1:bestmove e8b8
351,753*1*Found move:Re8-b8
351,947*2*Start calc, move no: 54
352,188-->2:time 570
352,188-->2:otim 447
352,188-->2:e8b8
352,194<--2:1 161 0 58 d5d6 f5c2
352,196<--2:2 161 0 142 d5d6 f5c2
352,196<--2:3 144 0 2035 b2b4 b8c8 b1b3 f5c2
352,199<--2:4 144 1 5355 b2b4 b8c8 b1b3 f5c2
352,242<--2:5 144 5 31453 b2b4 b8c8 b1b3 f5c2 b3a3
352,378<--2:move d5d6
352,378*2*Found move:d5-d6
352,544*1*Start calc, move no: 55
352,544-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6
352,544-->1:go wtime 5507 btime 4467 winc 100 binc 100
352,547<--1:info score cp 0 depth 1 nodes 1 time 0 pv f5c2
352,547<--1:info score cp 0 depth 2 nodes 2 time 0 pv f5c2 b1e1
352,547<--1:info score cp 0 depth 3 nodes 3 time 0 pv f5c2 b1e1 g8f8
352,547<--1:info score cp 0 depth 4 nodes 4 time 0 pv f5c2 b1e1 g8f8 e1b1
352,547<--1:info score cp 0 depth 5 nodes 5 time 0 pv f5c2 b1e1 g8f8 e1b1 c2b1
352,582<--1:info score cp 15 depth 6 nodes 29987 time 36 pv f5c2 b1e1 a6a5 g3g4 b8b2 f2g1
352,746<--1:bestmove f5c2
352,746*1*Found move:Bf5xc2
352,906*2*Start calc, move no: 56
353,147-->2:time 551
353,147-->2:otim 427
353,147-->2:f5c2
353,149<--2:1 39 0 123 b1c1 b8b2
353,151<--2:2 39 0 255 b1c1 b8b2
353,151<--2:3 59 0 1229 b1c1 b8b2 f2e3
353,159<--2:4 146 1 5532 b1e1 b8d8 e1e2 c2a4 c3a4 d8d6
353,209<--2:5 56 6 37860 b1c1 b8b2 f2e3 c2f5 h2h4
353,329<--2:move b1e1
353,329*2*Found move:Rb1-e1
353,519*1*Start calc, move no: 57
353,520-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1
353,520-->1:go wtime 5330 btime 4270 winc 100 binc 100
353,527<--1:info score cp -10 depth 1 nodes 1 time 0 pv g8f8
353,527<--1:info score cp -10 depth 2 nodes 2 time 0 pv g8f8 e1e7
353,527<--1:info score cp -10 depth 3 nodes 3 time 0 pv g8f8 e1e7 b8b2
353,528<--1:info score cp -10 depth 4 nodes 4 time 0 pv g8f8 e1e7 b8b2 f2g1
353,528<--1:info score cp -10 depth 5 nodes 5 time 0 pv g8f8 e1e7 b8b2 f2g1 b2b3
353,717<--1:bestmove g8f8
353,717*1*Found move:Kg8-f8
353,869*2*Start calc, move no: 58
354,109-->2:time 533
354,109-->2:otim 408
354,109-->2:g8f8
354,112<--2:1 190 0 50 d6d7
354,116<--2:2 185 0 309 d6d7 c2d3
354,124<--2:3 73 1 3564 b2b4 b8b4 d6d7
354,141<--2:4 146 3 11982 e1e2 c2d3 e2d2 d3c4
354,219<--2:5 166 10 64295 e1e2 c2d3 e2d2 d3f5 f2e3
354,288<--2:move e1e2
354,288*2*Found move:Re1-e2
354,441*1*Start calc, move no: 59
354,442-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2
354,442-->1:go wtime 6156 btime 4078 winc 100 binc 100
354,447<--1:info score cp -85 depth 1 nodes 1 time 0 pv c2f5
354,447<--1:info score cp -85 depth 2 nodes 2 time 0 pv c2f5 e2d2
354,447<--1:info score cp -85 depth 3 nodes 3 time 0 pv c2f5 e2d2 b8d8
354,447<--1:info score cp -85 depth 4 nodes 4 time 0 pv c2f5 e2d2 b8d8 f2g1
354,452<--1:info score cp -75 depth 5 nodes 9348 time 10 pv c2f5 e2d2 b8d8 f2g1 f8g8
354,520<--1:info score cp 0 depth 6 nodes 76160 time 78 pv c2d3 e2d2 b8b2 d2b2 d3c2 b2c2
354,615<--1:info score cp -75 depth 7 nodes 193825 time 172 pv c2f5 e2d2 b8b2 d2e2 b2e2 f2e2 f5e6
354,630<--1:bestmove c2f5
354,630*1*Found move:Bc2-f5
354,806*2*Start calc, move no: 60
355,047-->2:time 616
355,047-->2:otim 490
355,047-->2:c2f5
355,052<--2:1 181 0 39 f2e3
355,053<--2:2 171 0 171 f2e3 f8e8
355,053<--2:3 166 0 2331 f2e3 b8b6 e2d2
355,070<--2:4 156 1 14499 f2e3 b8b6 e2d2 f8e8
355,196<--2:5 161 14 102941 f2e3 b8b6 e2d2 f8e8 c3e4
355,257<--2:move f2e3
355,257*2*Found move:Kf2-e3
355,413*1*Start calc, move no: 61
355,413-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3
355,413-->1:go wtime 5951 btime 4895 winc 100 binc 100
355,417<--1:info score cp -75 depth 1 nodes 1 time 0 pv b8d8
355,417<--1:info score cp -75 depth 2 nodes 2 time 0 pv b8d8 d6d7
355,417<--1:info score cp -75 depth 3 nodes 3 time 0 pv b8d8 d6d7 f5d7
355,424<--1:info score cp -35 depth 4 nodes 8637 time 9 pv b8b7 e3f3 b7d7 g3g4
355,432<--1:info score cp -35 depth 5 nodes 16495 time 18 pv b8b7 e3f3 b7d7 g3g4 f5d3
355,472<--1:info score cp -35 depth 6 nodes 63595 time 58 pv f5g4 e2d2 f8g8 e3f2 g4d1 c3d1
355,581<--1:info score cp -35 depth 7 nodes 207264 time 167 pv f5g4 e2d2 b8d8 e3f2 d8e8 a4a5 f8g8
355,628<--1:bestmove f5g4
355,628*1*Found move:Bf5-g4
355,807*2*Start calc, move no: 62
356,047-->2:time 596
356,047-->2:otim 469
356,047-->2:f5g4
356,050<--2:1 186 0 91 e2c2
356,052<--2:2 176 0 223 e2c2 f8e8
356,053<--2:3 186 0 1189 e2c2 f8e8 e3d4
356,062<--2:4 176 1 5682 e2c2 f8e8 e3d4 e8d7
356,128<--2:5 171 8 45690 e2d2 f8e8 d2c2 e8d7 c3e4
356,246<--2:move e2d2
356,246*2*Found move:Re2-d2
356,399*1*Start calc, move no: 63
356,400-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2
356,400-->1:go wtime 5757 btime 4685 winc 100 binc 100
356,402<--1:info score cp -35 depth 1 nodes 1 time 0 pv b8d8
356,404<--1:info score cp -35 depth 2 nodes 2 time 0 pv b8d8 c3e4
356,404<--1:info score cp -35 depth 3 nodes 3 time 0 pv b8d8 c3e4 f6f5
356,404<--1:info score cp -35 depth 4 nodes 4 time 0 pv b8d8 c3e4 f6f5 e4c5
356,404<--1:info score cp -35 depth 5 nodes 5 time 0 pv b8d8 c3e4 f6f5 e4c5 d8e8
356,456<--1:info score cp -30 depth 6 nodes 64659 time 55 pv b8c8 a4a5 g4e6 d2e2 c8c5 c3d5
356,615<--1:bestmove b8c8
356,615*1*Found move:Rb8-c8
356,795*2*Start calc, move no: 64
357,035-->2:time 576
357,035-->2:otim 448
357,035-->2:b8c8
357,038<--2:1 190 0 34 d6d7
357,040<--2:2 195 0 195 d6d7 c8d8
357,044<--2:3 181 0 2683 e3d4 f8e8 d2c2
357,120<--2:4 171 8 12376 e3d4 f8e8 d2c2 e8d7
357,230<--2:move e3d4
357,230*2*Found move:Ke3-d4
357,450*1*Start calc, move no: 65
357,451-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4
357,451-->1:go wtime 5567 btime 4475 winc 100 binc 100
357,453<--1:info score cp 0 depth 1 nodes 28 time 0 pv f6f5
357,456<--1:info score cp -20 depth 2 nodes 310 time 0 pv f8g8 d4d3
357,456<--1:info score cp -10 depth 3 nodes 1037 time 1 pv f8g8 d4d3 f6f5
357,456<--1:info score cp -20 depth 4 nodes 6982 time 5 pv a6a5 c3e4 g4d7 e4c5
357,538<--1:info score cp -25 depth 5 nodes 35524 time 86 pv c8e8 c3d5 e8e1 d4d3 f8g8
357,654<--1:bestmove c8e8
357,654*1*Found move:Rc8-e8
357,827*2*Start calc, move no: 66
358,071-->2:time 557
358,071-->2:otim 428
358,071-->2:c8e8
358,075<--2:1 191 0 27 d2c2
358,079<--2:2 186 0 118 d2c2 g4f5
358,080<--2:3 193 0 1229 b2b4 g4f5 d2e2 e8e2 c3e2
358,088<--2:4 188 1 4862 b2b4 e8d8 c3e4 f8e8
358,135<--2:5 183 6 36148 b2b4 e8d8 d4e3 g4f5 c3e4
358,258<--2:move b2b4
358,258*2*Found move:b2-b4
358,411*1*Start calc, move no: 67
358,412-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4
358,412-->1:go wtime 5385 btime 4277 winc 100 binc 100
358,417<--1:info score cp -25 depth 1 nodes 1 time 0 pv f8g8
358,417<--1:info score cp -25 depth 2 nodes 2 time 0 pv f8g8 c3d5
358,417<--1:info score cp -25 depth 3 nodes 3 time 0 pv f8g8 c3d5 g4d7
358,424<--1:info score cp -5 depth 4 nodes 8976 time 10 pv e8b8 c3a2 g4d7 a4a5
358,448<--1:info score cp -10 depth 5 nodes 40023 time 34 pv g4f5 b4b5 a6a5 d2e2 f5e6
358,518<--1:info score cp -5 depth 6 nodes 118606 time 105 pv f8g8 c3d5 e8d8 d5e7 g8h8 d4e3
358,607<--1:bestmove f8g8
358,607*1*Found move:Kf8-g8
358,771*2*Start calc, move no: 68
359,012-->2:time 539
359,012-->2:otim 409
359,012-->2:f8g8
359,017<--2:1 213 0 31 d2c2
359,017<--2:2 203 0 133 d2c2 g8f8
359,017<--2:3 208 0 1160 d2c2 g8f8 c3d5
359,020<--2:4 200 0 5975 h2h4 e8d8 c3e4 g8f8
359,098<--2:5 203 8 58322 d2c2 e8d8 d4c5 g4f5 c2e2
359,192<--2:move d2c2
359,192*2*Found move:Rd2-c2
359,350*1*Start calc, move no: 69
359,350-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2
359,350-->1:go wtime 5210 btime 4087 winc 100 binc 100
359,353<--1:info score cp -15 depth 1 nodes 1 time 0 pv g4d7
359,354<--1:info score cp -15 depth 2 nodes 2 time 0 pv g4d7 b4b5
359,354<--1:info score cp -5 depth 3 nodes 1752 time 1 pv h7h6 d4d3 f6f5
359,361<--1:info score cp 5 depth 4 nodes 8443 time 7 pv g4f5 c2e2 e8d8 d4d5
359,380<--1:info score cp 5 depth 5 nodes 17186 time 28 pv g4f5 c2e2 e8d8 d4d5 f5e6
359,526<--1:info score cp 15 depth 6 nodes 156140 time 174 pv e8d8 d4c5 f6f5 c5d5 g4f3 d5e5
359,541<--1:bestmove e8d8
359,541*1*Found move:Re8-d8
359,696*2*Start calc, move no: 70
359,936-->2:time 521
359,936-->2:otim 391
359,936-->2:e8d8
359,939<--2:1 223 0 46 c3e4
359,941<--2:2 213 0 139 c3e4 g8f8
359,942<--2:3 203 0 1691 d4c5 g4f5 c2e2
359,953<--2:4 198 1 8005 d4d5 d8b8 d5c5 g8f8
360,022<--2:5 170 8 49125 d4d5 g4e6 d5c6 d8c8 c6b7 e6f5 h2h4
360,111<--2:move d4d5
360,111*2*Found move:Kd4-d5
360,263*1*Start calc, move no: 71
360,263-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5
360,263-->1:go wtime 5040 btime 3901 winc 100 binc 100
360,267<--1:info score cp 15 depth 1 nodes 1 time 0 pv g4f5
360,267<--1:info score cp 15 depth 2 nodes 2 time 0 pv g4f5 c3e2
360,267<--1:info score cp 15 depth 3 nodes 3 time 0 pv g4f5 c3e2 f5c2
360,267<--1:info score cp 15 depth 4 nodes 4 time 0 pv g4f5 c3e2 f5c2 b4b5
360,300<--1:info score cp 60 depth 5 nodes 42984 time 36 pv g4f3 c3e4 g8f8 c2c3 f3e4
360,335<--1:info score cp 105 depth 6 nodes 87340 time 71 pv g4f3 d5d4 d8d6 d4e3 f3h5 c3e4
360,446<--1:bestmove g4f3
360,446*1*Found move:Bg4-f3
360,607*2*Start calc, move no: 72
360,848-->2:time 504
360,848-->2:otim 373
360,848-->2:g4f3
360,851<--2:1 193 0 37 d5c5 g8f8
360,853<--2:2 198 0 312 d5c5 d8c8 c5d4 g8f8
360,855<--2:3 192 0 2311 d5c5 g8f8 h2h3 f8e8
360,878<--2:4 197 2 15847 d5c5 g8f8 h2h3 f8e8 c3d5
360,960<--2:5 188 11 76361 d5c5 d8c8 c5d4 c8d8 d4e3 f3c6 c2d2
361,017<--2:move d5c5
361,017*2*Found move:Kd5-c5
361,184*1*Start calc, move no: 73
361,184-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5
361,184-->1:go wtime 4876 btime 3723 winc 100 binc 100
361,190<--1:info score cp 100 depth 1 nodes 1 time 0 pv d8c8
361,190<--1:info score cp 100 depth 2 nodes 2 time 0 pv d8c8 c5d4
361,190<--1:info score cp 100 depth 3 nodes 3 time 0 pv d8c8 c5d4 c8b8
361,190<--1:info score cp 100 depth 4 nodes 4 time 0 pv d8c8 c5d4 c8b8 b4b5
361,190<--1:info score cp 100 depth 5 nodes 5 time 0 pv d8c8 c5d4 c8b8 b4b5 a6b5
361,190<--1:info score cp 100 depth 6 nodes 6 time 0 pv d8c8 c5d4 c8b8 b4b5 a6b5 a4b5
361,362<--1:bestmove d8c8
361,362*1*Found move:Rd8-c8
361,520*2*Start calc, move no: 74
361,763-->2:time 488
361,763-->2:otim 355
361,763-->2:d8c8
361,767<--2:1 198 0 33 c5d4 g8f8
361,767<--2:2 203 0 262 c5d4 c8d8 d4c5
361,770<--2:3 203 0 1473 c5d4 c8d8 d4e3 f3c6
361,791<--2:4 188 2 12258 c5d4 c8d8 d4e3 f3c6 c2d2
361,848<--2:5 113 8 54740 c5d4 c8c6 d4e3 f3g4 h2h3 g4h3
361,926<--2:move c5d4
361,926*2*Found move:Kc5-d4
362,104*1*Start calc, move no: 75
362,104-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4
362,104-->1:go wtime 4718 btime 3550 winc 100 binc 100
362,109<--1:info score cp 105 depth 1 nodes 1 time 0 pv c8b8
362,109<--1:info score cp 105 depth 2 nodes 2 time 0 pv c8b8 c2f2
362,111<--1:info score cp 105 depth 3 nodes 3 time 0 pv c8b8 c2f2 f3c6
362,111<--1:info score cp 105 depth 4 nodes 4 time 0 pv c8b8 c2f2 f3c6 b4b5
362,123<--1:info score cp 75 depth 5 nodes 16381 time 18 pv c8c6 d6d7 c6d6 d4c4 f3b7
362,156<--1:info score cp 75 depth 6 nodes 43955 time 50 pv c8c6 d6d7 c6d6 d4c4 f3b7 b4b5
362,277<--1:bestmove c8c6
362,277*1*Found move:Rc8-c6
362,498*2*Start calc, move no: 76
362,739-->2:time 472
362,739-->2:otim 339
362,739-->2:c8c6
362,740<--2:1 232 0 26 d6d7
362,743<--2:2 237 0 242 d6d7 c6d6
362,747<--2:3 227 0 1153 d6d7 c6d6 d4e3 f3d5 c3d5 d6d5
362,791<--2:4 113 5 6377 d4e3 f3g4 h2h3 g4h3
362,874<--2:5 22 13 26604 d4e3 f3g4 e3e4 c6d6 c3d5
362,896<--2:move d4e3
362,896*2*Found move:Kd4-e3
363,056*1*Start calc, move no: 77
363,056-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3
363,056-->1:go wtime 4566 btime 3382 winc 100 binc 100
363,060<--1:info score cp 75 depth 1 nodes 1 time 0 pv c6c3
363,060<--1:info score cp 75 depth 2 nodes 2 time 0 pv c6c3 c2c3
363,060<--1:info score cp 75 depth 3 nodes 3 time 0 pv c6c3 c2c3 f6f5
363,060<--1:info score cp 75 depth 4 nodes 4 time 0 pv c6c3 c2c3 f6f5 e3f3
363,074<--1:info score cp 70 depth 5 nodes 15209 time 17 pv f3d1 b4b5 d1c2 b5c6 c2a4
363,119<--1:info score cp 70 depth 6 nodes 65496 time 62 pv f3g4 b4b5 a6b5 a4b5 c6d6 e3e4
363,172<--1:info score cp 65 depth 7 nodes 127805 time 116 pv f3g4 b4b5 a6b5 a4b5 c6d6 e3e4 f6f5
363,218<--1:bestmove f3g4
363,218*1*Found move:Bf3-g4
363,401*2*Start calc, move no: 78
363,642-->2:time 457
363,642-->2:otim 323
363,642-->2:f3g4
363,644<--2:1 113 0 97 h2h3 g4h3
363,645<--2:2 113 0 215 h2h3 g4h3
363,650<--2:3 22 0 2067 e3e4 c6d6 c3d5
363,657<--2:4 12 1 7419 e3e4 c6d6 c3d5 g8f8
363,710<--2:5 12 6 42815 c2c1 g8f8 e3e4 c6d6 c3d5
363,799<--2:move c2c1
363,799*2*Found move:Rc2-c1
363,969*1*Start calc, move no: 79
363,970-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1
363,970-->1:go wtime 5414 btime 3225 winc 100 binc 100
363,975<--1:info score cp 70 depth 1 nodes 1 time 0 pv g8f8
363,975<--1:info score cp 70 depth 2 nodes 2 time 0 pv g8f8 c1d1
363,975<--1:info score cp 70 depth 3 nodes 3 time 0 pv g8f8 c1d1 g4d1
363,976<--1:info score cp 70 depth 4 nodes 4 time 0 pv g8f8 c1d1 g4d1 c3d1
363,990<--1:info score cp 75 depth 5 nodes 20763 time 19 pv h7h6 b4b5 a6b5 a4b5 c6d6
364,117<--1:info score cp 75 depth 6 nodes 148896 time 146 pv g4e6 e3e4 c6d6 a4a5 g8f8 c3a2
364,130<--1:bestmove g4e6
364,130*1*Found move:Bg4-e6
364,299*2*Start calc, move no: 80
364,540-->2:time 542
364,540-->2:otim 407
364,540-->2:g4e6
364,541<--2:1 92 0 118 f4f5 e6f5
364,542<--2:2 92 0 255 f4f5 e6f5
364,547<--2:3 20 0 2157 f4f5 e6d7 e3d4 c6d6
364,560<--2:4 20 2 8675 f4f5 e6d7 e3d4 c6d6
364,654<--2:5 24 11 68349 e3e4 c6d6 f4f5 e6c4 h2h3
364,722<--2:move e3e4
364,722*2*Found move:Ke3-e4
364,884*1*Start calc, move no: 81
364,884-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4
364,884-->1:go wtime 5237 btime 4070 winc 100 binc 100
364,890<--1:info score cp 75 depth 1 nodes 1 time 0 pv c6d6
364,890<--1:info score cp 75 depth 2 nodes 2 time 0 pv c6d6 e4e3
364,890<--1:info score cp 75 depth 3 nodes 3 time 0 pv c6d6 e4e3 h7h6
364,890<--1:info score cp 75 depth 4 nodes 4 time 0 pv c6d6 e4e3 h7h6 b4b5
364,905<--1:info score cp 95 depth 5 nodes 18085 time 18 pv g7g6 b4b5 c6d6 b5a6 d6a6
365,006<--1:info score cp 80 depth 6 nodes 146207 time 120 pv c6d6 c1d1 f6f5 e4e5 d6d1 c3d1
365,074<--1:bestmove c6d6
365,074*1*Found move:Rc6xd6
365,261*2*Start calc, move no: 82
365,503-->2:time 524
365,503-->2:otim 389
365,503-->2:c6d6
365,505<--2:1 15 0 30 f4f5
365,507<--2:2 15 0 182 f4f5 e6c4
365,507<--2:3 24 0 993 f4f5 e6c4 h2h3
365,517<--2:4 5 1 5917 f4f5 e6c4 c1c2 g8f8
365,588<--2:5 2 8 58185 f4f5 e6b3 a4a5 d6d2 h2h3
365,676<--2:move f4f5
365,676*2*Found move:f4-f5
365,828*1*Start calc, move no: 83
365,830-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5
365,830-->1:go wtime 5069 btime 3885 winc 100 binc 100
365,832<--1:info score cp 70 depth 1 nodes 1 time 0 pv e6d7
365,832<--1:info score cp 70 depth 2 nodes 2 time 0 pv e6d7 c3d5
365,832<--1:info score cp 70 depth 3 nodes 3 time 0 pv e6d7 c3d5 d7f5
365,834<--1:info score cp 70 depth 4 nodes 4 time 0 pv e6d7 c3d5 d7f5 e4d4
365,834<--1:info score cp 70 depth 5 nodes 5 time 0 pv e6d7 c3d5 d7f5 e4d4 d6d8
365,897<--1:info score cp 110 depth 6 nodes 83280 time 67 pv e6b3 c3b5 d6d8 b5a7 d8d6 b4b5
365,975<--1:info score cp 90 depth 7 nodes 185017 time 145 pv e6d7 b4b5 g8f8 c1e1 d6d2 b5a6 d2h2
366,013<--1:bestmove e6d7
366,013*1*Found move:Be6-d7
366,202*2*Start calc, move no: 84
366,444-->2:time 507
366,444-->2:otim 371
366,444-->2:e6d7
366,446<--2:1 29 0 46 h2h3
366,448<--2:2 10 0 222 c1c2 g8f8
366,451<--2:3 4 0 1962 h2h3 d7c6 e4e3 g8f8
366,470<--2:4 2 2 10628 g3g4 g8f8 h2h4 d6d2
366,612<--2:5 -12 16 100755 a4a5 g8f8 c1d1 d6d1 c3d1
366,617<--2:move a4a5
366,617*2*Found move:a4-a5
366,792*1*Start calc, move no: 85
366,793-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5
366,793-->1:go wtime 4901 btime 3707 winc 100 binc 100
366,796<--1:info score cp 70 depth 1 nodes 1 time 0 pv g8f8
366,796<--1:info score cp 70 depth 2 nodes 2 time 0 pv g8f8 c3a4
366,796<--1:info score cp 70 depth 3 nodes 3 time 0 pv g8f8 c3a4 d7a4
366,807<--1:info score cp 135 depth 4 nodes 8324 time 13 pv g8h8 c1e1 d7c6 e4e3
366,829<--1:info score cp 150 depth 5 nodes 32347 time 35 pv h7h5 c1d1 d6d2 e4f4 d2f2
366,864<--1:info score cp 140 depth 6 nodes 74882 time 71 pv h7h5 c1d1 d6d1 c3d1 d7c8 e4f4
366,969<--1:bestmove h7h5
366,969*1*Found move:h7-h5
367,139*2*Start calc, move no: 86
367,380-->2:time 491
367,380-->2:otim 354
367,380-->2:h7h5
367,382<--2:1 20 0 42 h2h3
367,382<--2:2 1 0 192 c1c2 g8f8
367,382<--2:3 -4 0 2252 c1d1 d6d1 c3d1
367,399<--2:4 -5 1 11430 h2h3 d6d2 c1d1 d7c6
367,480<--2:5 -15 10 70399 h2h3 d6d2 c1d1 d7c6 e4e3 d2c2
367,544<--2:move h2h3
367,544*2*Found move:h2-h3
367,698*1*Start calc, move no: 87
367,699-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3
367,699-->1:go wtime 4742 btime 3536 winc 100 binc 100
367,703<--1:info score cp 150 depth 1 nodes 1 time 0 pv g8f8
367,703<--1:info score cp 150 depth 2 nodes 2 time 0 pv g8f8 e4e3
367,703<--1:info score cp 150 depth 3 nodes 3 time 0 pv g8f8 e4e3 d7f5
367,710<--1:info score cp 150 depth 4 nodes 8980 time 10 pv g8h7 g3g4 h7g8 g4h5
367,732<--1:info score cp 140 depth 5 nodes 29839 time 32 pv d6d2 c1d1 d7c6 e4e3 d2b2
367,821<--1:info score cp 150 depth 6 nodes 106545 time 122 pv g8h7 e4e3 d6c6 g3g4 h5h4 c3e2
367,867<--1:bestmove g8h7
367,867*1*Found move:Kg8-h7
368,023*2*Start calc, move no: 88
368,265-->2:time 475
368,265-->2:otim 338
368,265-->2:g8h7
368,270<--2:1 20 0 40 c1c2
368,270<--2:2 10 0 171 c1c2 h7h6
368,270<--2:3 5 0 1376 c1d1 d6d1 c3d1
368,279<--2:4 -2 1 8514 c1c2 h7h6 h3h4 d7c6
368,363<--2:5 -5 9 65683 c3e2 d7c6 e4e3 h7h6 e2d4 c6d5
368,423<--2:move c3e2
368,423*2*Found move:Nc3-e2
368,577*1*Start calc, move no: 89
368,577-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2
368,577-->1:go wtime 4589 btime 3373 winc 100 binc 100
368,580<--1:info score cp 70 depth 1 nodes 1 time 0 pv d6d2
368,580<--1:info score cp 70 depth 2 nodes 2 time 0 pv d6d2 e4e3
368,580<--1:info score cp 70 depth 3 nodes 3 time 0 pv d6d2 e4e3 d2d5
368,584<--1:info score cp 170 depth 4 nodes 5322 time 6 pv d7f5 e4f5 d6c6 c1c6
368,625<--1:info score cp 140 depth 5 nodes 50264 time 48 pv d7b5 e2d4 d6d4 e4d4 h7g8
368,688<--1:info score cp 135 depth 6 nodes 123801 time 110 pv d6d2 e4e3 d2d3 e3d3 d7c6 c1c6
368,742<--1:bestmove d6d2
368,743*1*Found move:Rd6-d2
368,898*2*Start calc, move no: 90
369,140-->2:time 459
369,140-->2:otim 322
369,140-->2:d6d2
369,142<--2:1 5 0 44 e2d4
369,144<--2:2 -5 0 208 e2d4 h7h6
369,144<--2:3 15 0 1394 e2d4 h7h6 c1c7
369,156<--2:4 20 1 7464 e2d4 d7b5 c1c7 b5d3
369,192<--2:5 40 5 30940 e2d4 d7b5 c1c7 d2g2 d4b5 a6b5 c7a7 g2g3
369,294<--2:move e2d4
369,294*2*Found move:Ne2-d4
369,448*1*Start calc, move no: 91
369,448-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4
369,448-->1:go wtime 4440 btime 3212 winc 100 binc 100
369,453<--1:info score cp 140 depth 1 nodes 1 time 0 pv d2d4
369,453<--1:info score cp 140 depth 2 nodes 2 time 0 pv d2d4 e4d4
369,453<--1:info score cp 140 depth 3 nodes 3 time 0 pv d2d4 e4d4 d7a4
369,454<--1:info score cp 135 depth 4 nodes 3779 time 2 pv d2d4 e4d4 d7b5 g3g4
369,496<--1:info score cp 90 depth 5 nodes 55149 time 46 pv h5h4 c1g1 h4g3 g1g3 h7h6
369,591<--1:info score cp 40 depth 6 nodes 173565 time 143 pv g7g6 f5g6 h7g6 c1c7 d7h3 c7a7
369,607<--1:bestmove g7g6
369,607*1*Found move:g7-g6
369,807*2*Start calc, move no: 92
370,047-->2:time 444
370,047-->2:otim 306
370,047-->2:g7g6
370,053<--2:1 31 0 142 c1c7
370,053<--2:2 56 0 520 c1c7 g6f5 d4f5 d7f5 e4f5
370,053<--2:3 56 0 1961 c1c7 d7f5 d4f5 g6f5 e4f5
370,067<--2:4 68 1 10704 c1c7 g6f5 e4e3 d2g2 c7d7 g2g3
370,130<--2:5 66 8 47497 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f2e2
370,196<--2:move c1c7
370,196*2*Found move:Rc1-c7
370,349*1*Start calc, move no: 93
370,349-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7
370,349-->1:go wtime 4296 btime 3058 winc 100 binc 100
370,352<--1:info score cp 40 depth 1 nodes 1 time 0 pv d7f5
370,352<--1:info score cp 40 depth 2 nodes 2 time 0 pv d7f5 d4f5
370,352<--1:info score cp 40 depth 3 nodes 3 time 0 pv d7f5 d4f5 d2d6
370,354<--1:info score cp 40 depth 4 nodes 4 time 0 pv d7f5 d4f5 d2d6 f5d6
370,374<--1:info score cp 0 depth 5 nodes 23656 time 23 pv g6f5 d4f5 d2e2 e4f3 e2d2
370,419<--1:info score cp -45 depth 6 nodes 78819 time 69 pv d7f5 d4f5 g6f5 e4f5 h7h6 f5f6
370,479<--1:info score cp -45 depth 7 nodes 153513 time 129 pv d7f5 d4f5 g6f5 e4f5 h7g7 c7a7 d2f2
370,503<--1:bestmove d7f5
370,503*1*Found move:Bd7xf5
370,669*2*Start calc, move no: 94
370,909-->2:time 430
370,909-->2:otim 291
370,909-->2:d7f5
370,912<--2:1 56 0 84 d4f5 g6f5 e4f5
370,914<--2:2 71 0 449 d4f5 g6f5 e4f5 d2f2
370,916<--2:3 66 0 1782 d4f5 g6f5 e4f5 d2f2 f5e4 f2e2
370,926<--2:4 116 1 7873 d4f5 g6f5 e4f5 d2f2 f5e4 h7g6 c7a7
370,963<--2:5 101 5 34652 d4f5 g6f5 e4f5 d2f2 f5e4 h7g6 c7a7 f2e2
371,053<--2:move d4f5
371,053*2*Found move:Nd4xf5
371,211*1*Start calc, move no: 95
371,211-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5
371,211-->1:go wtime 4157 btime 2909 winc 100 binc 100
371,212<--1:info score cp -45 depth 1 nodes 1 time 0 pv g6f5
371,214<--1:info score cp -45 depth 2 nodes 2 time 0 pv g6f5 e4f5
371,214<--1:info score cp -45 depth 3 nodes 3 time 0 pv g6f5 e4f5 d2f2
371,214<--1:info score cp -45 depth 4 nodes 4 time 0 pv g6f5 e4f5 d2f2 f5e4
371,214<--1:info score cp -45 depth 5 nodes 5 time 0 pv g6f5 e4f5 d2f2 f5e4 h7g6
371,214<--1:info score cp -45 depth 6 nodes 6 time 0 pv g6f5 e4f5 d2f2 f5e4 h7g6 c7a7
371,268<--1:info score cp -45 depth 7 nodes 22615 time 57 pv g6f5 e4f5 d2f2 f5e4 h7g6 c7a7 f2c2
371,361<--1:bestmove g6f5
371,361*1*Found move:g6xf5
371,517*2*Start calc, move no: 96
371,758-->2:time 416
371,758-->2:otim 277
371,758-->2:g6f5
371,761<--2:1 71 0 110 e4f5 d2f2
371,762<--2:2 66 0 398 e4f5 d2f2 f5e4 f2e2
371,763<--2:3 116 0 2116 e4f5 d2f2 f5e4 h7g6 c7a7
371,771<--2:4 101 1 8246 e4f5 d2f2 f5e4 h7g6 c7a7 f2e2
371,807<--2:5 96 4 37184 e4f5 d2f2 f5e4 f2b2 c7f7 h7g6 f7b7 g6g5
371,897<--2:move e4f5
371,897*2*Found move:Ke4xf5
372,058*1*Start calc, move no: 97
372,059-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5
372,059-->1:go wtime 4023 btime 2764 winc 100 binc 100
372,063<--1:info score cp -60 depth 1 nodes 1 time 0 pv d2f2
372,063<--1:info score cp -60 depth 2 nodes 2 time 0 pv d2f2 f5e4
372,063<--1:info score cp -60 depth 3 nodes 3 time 0 pv d2f2 f5e4 f6f5
372,064<--1:info score cp -60 depth 4 nodes 4 time 0 pv d2f2 f5e4 f6f5 e4e3
372,064<--1:info score cp -60 depth 5 nodes 5 time 0 pv d2f2 f5e4 f6f5 e4e3 f2g2
372,064<--1:info score cp -60 depth 6 nodes 6 time 0 pv d2f2 f5e4 f6f5 e4e3 f2g2 c7f7
372,064<--1:info score cp -60 depth 7 nodes 7 time 0 pv d2f2 f5e4 f6f5 e4e3 f2g2 c7f7 h7g6
372,148<--1:info score cp -60 depth 8 nodes 100179 time 89 pv d2f2 f5e4 f6f5 e4e3 f2g2 c7f7 h7g6 f7a7
372,202<--1:bestmove d2f2
372,202*1*Found move:Rd2-f2
372,357*2*Start calc, move no: 98
372,597-->2:time 403
372,597-->2:otim 263
372,597-->2:d2f2
372,600<--2:1 66 0 31 f5e4 f2e2
372,601<--2:2 116 0 535 f5e4 h7g6 c7a7
372,601<--2:3 101 0 1552 f5e4 h7g6 c7a7 f2e2
372,610<--2:4 96 1 7728 f5e4 f2b2 c7f7 h7g6 f7b7 g6g5
372,633<--2:5 96 3 28459 f5e4 f2b2 c7f7 h7g6 f7b7 g6g5 e4d5
372,733<--2:move f5e4
372,733*2*Found move:Kf5-e4
372,894*1*Start calc, move no: 99
372,894-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4
372,894-->1:go wtime 4892 btime 2626 winc 100 binc 100
372,900<--1:info score cp -60 depth 1 nodes 1 time 0 pv f6f5
372,900<--1:info score cp -60 depth 2 nodes 2 time 0 pv f6f5 e4e3
372,900<--1:info score cp -60 depth 3 nodes 3 time 1 pv f6f5 e4e3 f2h2
372,900<--1:info score cp -60 depth 4 nodes 4 time 1 pv f6f5 e4e3 f2h2 c7f7
372,900<--1:info score cp -60 depth 5 nodes 5 time 1 pv f6f5 e4e3 f2h2 c7f7 h7g8
372,900<--1:info score cp -60 depth 6 nodes 6 time 1 pv f6f5 e4e3 f2h2 c7f7 h7g8 f7a7
372,901<--1:info score cp -60 depth 7 nodes 7 time 1 pv f6f5 e4e3 f2h2 c7f7 h7g8 f7a7 h2f2
373,042<--1:bestmove f6f5
373,042*1*Found move:f6-f5
373,200*2*Start calc, move no: 100
373,442-->2:time 490
373,442-->2:otim 349
373,442-->2:f6f5
373,444<--2:1 123 0 191 e4e3 f2b2 c7f7
373,446<--2:2 123 0 437 e4e3 f2b2 c7f7
373,451<--2:3 103 0 3279 e4e3 f2h2 c7f7 h7g8 f7f5 h2h3
373,469<--2:4 103 2 16828 e4e3 f2h2 c7f7 h7g8 f7f5 h2h3
373,520<--2:5 103 7 56423 e4e3 f2h2 c7f7 h7g8 f7f5 h2h3 f5f3
373,606<--2:move e4e3
373,606*2*Found move:Ke4-e3
373,772*1*Start calc, move no: 101
373,774-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3
373,774-->1:go wtime 4733 btime 3483 winc 100 binc 100
373,777<--1:info score cp -60 depth 1 nodes 1 time 0 pv f2h2
373,777<--1:info score cp -60 depth 2 nodes 2 time 0 pv f2h2 c7f7
373,777<--1:info score cp -60 depth 3 nodes 3 time 0 pv f2h2 c7f7 h7g8
373,777<--1:info score cp -60 depth 4 nodes 4 time 0 pv f2h2 c7f7 h7g8 f7a7
373,777<--1:info score cp -60 depth 5 nodes 5 time 0 pv f2h2 c7f7 h7g8 f7a7 h2f2
373,777<--1:info score cp -60 depth 6 nodes 6 time 0 pv f2h2 c7f7 h7g8 f7a7 h2f2 e3f2
373,777<--1:info score cp -60 depth 7 nodes 7 time 0 pv f2h2 c7f7 h7g8 f7a7 h2f2 e3f2 h5h4
373,854<--1:info score cp -110 depth 8 nodes 84747 time 79 pv f2b2 c7f7 h7g8 f7f5 b2b3 e3d2 b3g3
373,943<--1:bestmove f2b2
373,943*1*Found move:Rf2-b2
374,111*2*Start calc, move no: 102
374,351-->2:time 474
374,351-->2:otim 332
374,351-->2:f2b2
374,360<--2:1 123 0 23 c7f7
374,360<--2:2 163 0 140 c7f7 h7g6 f7a7
374,362<--2:3 183 0 773 c7f7 h7g6 f7a7 b2b3
374,362<--2:4 153 0 3124 c7f7 h7g6 f7a7 b2b3 e3d2 b3b2
374,381<--2:5 193 2 15483 c7f7 h7g6 f7a7 b2b3 e3d4 b3b4 d4c3 b4b5 a7a6
374,434<--2:6 153 8 58017 c7f7 h7g6 f7a7 b2b3 e3f2 b3b2 f2f3 b2b3 f3e2 b3b2
374,509<--2:move c7f7
374,509*2*Found move:Rc7xf7
374,662*1*Start calc, move no: 103
374,662-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7
374,662-->1:go wtime 4580 btime 3319 winc 100 binc 100
374,667<--1:info score cp -100 depth 1 nodes 1 time 0 pv h7g8
374,667<--1:info score cp -100 depth 2 nodes 2 time 0 pv h7g8 f7f5
374,667<--1:info score cp -100 depth 3 nodes 3 time 0 pv h7g8 f7f5 b2b3
374,667<--1:info score cp -100 depth 4 nodes 4 time 0 pv h7g8 f7f5 b2b3 e3f4
374,667<--1:info score cp -100 depth 5 nodes 5 time 0 pv h7g8 f7f5 b2b3 e3f4 b3b4
374,667<--1:info score cp -100 depth 6 nodes 6 time 0 pv h7g8 f7f5 b2b3 e3f4 b3b4 f4g5
374,667<--1:info score cp -100 depth 7 nodes 7 time 1 pv h7g8 f7f5 b2b3 e3f4 b3b4 f4g5 b4b5
374,823<--1:bestmove h7g8
374,823*1*Found move:Kh7-g8
374,984*2*Start calc, move no: 104
375,226-->2:time 458
375,226-->2:otim 317
375,226-->2:h7g8
375,227<--2:1 194 0 22 f7f5
375,229<--2:2 194 0 121 f7f5 b2g2
375,229<--2:3 184 0 597 f7f5 b2b3 e3d2 b3g3 f5h5
375,235<--2:4 204 0 2283 f7f5 b2b3 e3f2 b3b2 f2f3 b2b3
375,247<--2:5 184 2 9110 f7f5 b2b3 e3f2 b3b2 f2f3 b2b3 f3e2 b3g3 f5h5
375,283<--2:6 184 5 36656 f7f5 b2b3 e3f2 b3b2 f2f3 b2b3 f3e2 b3g3 f5h5
375,379<--2:move f7f5
375,379*2*Found move:Rf7xf5
375,534*1*Start calc, move no: 105
375,534-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5
375,534-->1:go wtime 4432 btime 3163 winc 100 binc 100
375,540<--1:info score cp -95 depth 1 nodes 1 time 0 pv h5h4
375,540<--1:info score cp -95 depth 2 nodes 2 time 0 pv h5h4 g3h4
375,540<--1:info score cp -95 depth 3 nodes 3 time 0 pv h5h4 g3h4 b2b4
375,540<--1:info score cp -95 depth 4 nodes 4 time 1 pv h5h4 g3h4 b2b4 e3e2
375,540<--1:info score cp -95 depth 5 nodes 5 time 1 pv h5h4 g3h4 b2b4 e3e2 b4h4
375,540<--1:info score cp -95 depth 6 nodes 6 time 1 pv h5h4 g3h4 b2b4 e3e2 b4h4 e2d3
375,541<--1:info score cp -95 depth 7 nodes 7 time 1 pv h5h4 g3h4 b2b4 e3e2 b4h4 e2d3 h4h3
375,657<--1:info score cp -90 depth 8 nodes 142582 time 122 pv h5h4 e3f3 b2b3 f3f4 h4g3 f5f6 b3b4 f4g3
375,694<--1:bestmove h5h4
375,694*1*Found move:h5-h4
375,848*2*Start calc, move no: 106
376,089-->2:time 444
376,089-->2:otim 301
376,089-->2:h5h4
376,093<--2:1 225 0 24 g3h4 b2b4
376,094<--2:2 225 0 116 g3h4 b2b4
376,094<--2:3 235 0 667 g3h4 b2b3 e3d4 b3b4
376,094<--2:4 226 0 3169 g3h4 b2b4 f5g5 g8f7 h4h5
376,109<--2:5 206 1 16458 g3h4 b2b4 f5g5 g8f7 h4h5 b4b2
376,177<--2:6 165 8 79977 f5g5 g8f7 g3h4 b2b4 g5f5 f7e6 f5f4 b4b2
376,239<--2:move f5g5
376,239*2*Found move:Rf5-g5
376,392*1*Start calc, move no: 107
376,393-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5
376,393-->1:go wtime 4287 btime 3008 winc 100 binc 100
376,397<--1:info score cp -85 depth 1 nodes 1 time 0 pv g8f7
376,397<--1:info score cp -85 depth 2 nodes 2 time 0 pv g8f7 g3h4
376,398<--1:info score cp -85 depth 3 nodes 3 time 0 pv g8f7 g3h4 b2b4
376,398<--1:info score cp -85 depth 4 nodes 4 time 0 pv g8f7 g3h4 b2b4 g5h5
376,398<--1:info score cp -85 depth 5 nodes 5 time 0 pv g8f7 g3h4 b2b4 g5h5 b4b3
376,398<--1:info score cp -85 depth 6 nodes 6 time 0 pv g8f7 g3h4 b2b4 g5h5 b4b3 e3e4
376,459<--1:info score cp -85 depth 7 nodes 78621 time 66 pv g8f7 g5g4 b2b3 e3e2 h4g3 g4g3 b3g3
376,544<--1:bestmove g8f7
376,544*1*Found move:Kg8-f7
376,702*2*Start calc, move no: 108
376,943-->2:time 429
376,943-->2:otim 287
376,943-->2:g8f7
376,944<--2:1 205 0 21 g3h4 b2b4
376,945<--2:2 205 0 117 g3h4 b2b4
376,947<--2:3 215 0 622 g3h4 b2b3 e3d4 b3b4
376,952<--2:4 195 0 3039 g3h4 b2b3 e3e2 f7f6 g5g4 b3h3
376,966<--2:5 165 2 12993 g3h4 b2b4 g5f5 f7e6 f5f4 b4b2
377,022<--2:6 120 8 59319 g3h4 b2b4 h4h5 b4h4 e3d3 h4h3
377,087<--2:move g3h4
377,087*2*Found move:g3xh4
377,242*1*Start calc, move no: 109
377,242-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4
377,242-->1:go wtime 4148 btime 2862 winc 100 binc 100
377,247<--1:info score cp -75 depth 1 nodes 1 time 0 pv b2b4
377,247<--1:info score cp -75 depth 2 nodes 2 time 0 pv b2b4 h4h5
377,247<--1:info score cp -75 depth 3 nodes 3 time 0 pv b2b4 h4h5 b4h4
377,247<--1:info score cp -75 depth 4 nodes 4 time 0 pv b2b4 h4h5 b4h4 e3f2
377,247<--1:info score cp -75 depth 5 nodes 5 time 0 pv b2b4 h4h5 b4h4 e3f2 h4h3
377,247<--1:info score cp -75 depth 6 nodes 6 time 0 pv b2b4 h4h5 b4h4 e3f2 h4h3 g5d5
377,360<--1:info score cp -105 depth 7 nodes 150433 time 116 pv f7f6 g5h5 b2b4 h5h6 f6e5 e3d2 b4b2
377,390<--1:bestmove f7f6
377,390*1*Found move:Kf7-f6
377,590*2*Start calc, move no: 110
377,832-->2:time 415
377,832-->2:otim 272
377,832-->2:f7f6
377,834<--2:1 296 0 38 g5g4
377,837<--2:2 276 0 107 g5g4 f6e5
377,837<--2:3 205 0 654 g5g4 b2b3 e3d4 b3b4
377,843<--2:4 196 1 3351 g5c5 b2b4 h4h5 b4b2
377,857<--2:5 196 2 16128 g5d5 b2b4 h4h5 b4b3 d5d3 b3b2
377,913<--2:6 191 8 67633 g5g4 b2b3 e3f2 b3h3 f2g2 h3d3 h4h5
377,970<--2:move g5g4
377,970*2*Found move:Rg5-g4
378,165*1*Start calc, move no: 111
378,165-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4
378,165-->1:go wtime 4015 btime 2719 winc 100 binc 100
378,170<--1:info score cp -85 depth 1 nodes 1 time 0 pv b2b4
378,170<--1:info score cp -85 depth 2 nodes 2 time 0 pv b2b4 h4h5
378,170<--1:info score cp -85 depth 3 nodes 3 time 0 pv b2b4 h4h5 b4g4
378,170<--1:info score cp -85 depth 4 nodes 4 time 0 pv b2b4 h4h5 b4g4 h3g4
378,172<--1:info score cp -85 depth 5 nodes 5 time 0 pv b2b4 h4h5 b4g4 h3g4
378,227<--1:info score cp -115 depth 6 nodes 43526 time 59 pv b2h2 g4f4 f6e5 f4e4 e5d5 e3f4
378,272<--1:info score cp -115 depth 7 nodes 100491 time 106 pv b2b3 e3f2 b3b2 f2f3 b2b3 f3f4 b3f3
378,308<--1:bestmove b2b3
378,308*1*Found move:Rb2-b3
378,462*2*Start calc, move no: 112
378,704-->2:time 402
378,704-->2:otim 259
378,704-->2:b2b3
378,706<--2:1 205 0 32 e3d4 b3b4
378,708<--2:2 195 0 451 e3d2 b3h3 g4f4
378,710<--2:3 185 0 2276 e3d4 b3b4 d4c3 b4b5 g4f4
378,728<--2:4 191 2 15358 e3f2 b3h3 f2g2 h3e3 h4h5
378,782<--2:5 171 7 50746 e3f2 b3h3 f2g2 h3d3 h4h5 f6e5
378,838<--2:move e3f2
378,838*2*Found move:Ke3-f2
378,992*1*Start calc, move no: 113
378,992-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4 b2b3 e3f2
378,992-->1:go wtime 3886 btime 2581 winc 100 binc 100
378,996<--1:info score cp -110 depth 1 nodes 1 time 0 pv f6f5
378,996<--1:info score cp -110 depth 2 nodes 2 time 0 pv f6f5 g4e4
378,996<--1:info score cp -110 depth 3 nodes 3 time 0 pv f6f5 g4e4 b3h3
378,997<--1:info score cp -110 depth 4 nodes 4 time 0 pv f6f5 g4e4 b3h3 e4c4
378,997<--1:info score cp -110 depth 5 nodes 5 time 0 pv f6f5 g4e4 b3h3 e4c4 h3h2
378,997<--1:info score cp -110 depth 6 nodes 6 time 0 pv f6f5 g4e4 b3h3 e4c4 h3h2 f2e3
378,997<--1:info score cp -110 depth 7 nodes 7 time 0 pv f6f5 g4e4 b3h3 e4c4 h3h2 f2e3 h2h3
379,130<--1:bestmove f6f5
379,130*1*Found move:Kf6-f5
379,303*2*Start calc, move no: 114
379,543-->2:time 389
379,543-->2:otim 245
379,543-->2:f6f5
379,546<--2:1 286 0 30 g4g5
379,548<--2:2 256 0 276 f2g2 b3b2
379,551<--2:3 266 0 1047 f2g2 b3b2 g2f3 f5e5
379,558<--2:4 257 1 4512 f2g2 b3b2 g2g1 f5e5 h4h5
379,577<--2:5 246 3 20380 f2g2 b3b2 g2g1 b2b3 g1h2 b3b2
379,659<--2:6 257 11 89057 f2g2 b3b2 g2g3 b2b3 g3h2 f5e5 h4h5 b3b2
379,674<--2:move f2g2
379,674*2*Found move:Kf2-g2
379,841*1*Start calc, move no: 115
379,841-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4 b2b3 e3f2 f6f5 f2g2
379,841-->1:go wtime 3760 btime 2448 winc 100 binc 100
379,847<--1:info score cp -120 depth 1 nodes 1 time 0 pv b3b2
379,847<--1:info score cp -120 depth 2 nodes 2 time 0 pv b3b2 g2h1
379,847<--1:info score cp -120 depth 3 nodes 3 time 0 pv b3b2 g2h1 b2b1
379,847<--1:info score cp -120 depth 4 nodes 4 time 0 pv b3b2 g2h1 b2b1 g4g1
379,848<--1:info score cp -120 depth 5 nodes 5 time 0 pv b3b2 g2h1 b2b1 g4g1 b1b2
379,848<--1:info score cp -120 depth 6 nodes 6 time 0 pv b3b2 g2h1 b2b1 g4g1 b1b2 g1g5
379,887<--1:info score cp -125 depth 7 nodes 45936 time 43 pv b3b2 g2g1 b2b1 g1h2 b1b2 g4g2 b2b4
379,976<--1:bestmove b3b2
379,976*1*Found move:Rb3-b2
380,134*2*Start calc, move no: 116
380,374-->2:time 376
380,374-->2:otim 232
380,374-->2:b3b2
380,376<--2:1 266 0 32 g2f3 f5e5
380,379<--2:2 257 0 453 g2g1 f5e5 h4h5
380,380<--2:3 246 0 1759 g2g1 b2b3 g1h2 b3b2
380,391<--2:4 257 1 8201 g2g3 b2b3 g3h2 f5e5 h4h5 b3b2
380,437<--2:5 185 6 45728 g2f1 b2b3 g4g5 f5f6 f1e2 b3b4 g5g4
380,501<--2:move g2f1
380,501*2*Found move:Kg2-f1
380,656*1*Start calc, move no: 117
380,656-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4 b2b3 e3f2 f6f5 f2g2 b3b2 g2f1
380,656-->1:go wtime 3638 btime 2318 winc 100 binc 100
380,659<--1:info score cp -115 depth 1 nodes 1 time 0 pv b2b1
380,659<--1:info score cp -115 depth 2 nodes 2 time 0 pv b2b1 f1f2
380,659<--1:info score cp -115 depth 3 nodes 3 time 0 pv b2b1 f1f2 f5e5
380,659<--1:info score cp -115 depth 4 nodes 4 time 0 pv b2b1 f1f2 f5e5 g4g6
380,659<--1:info score cp -115 depth 5 nodes 5 time 0 pv b2b1 f1f2 f5e5 g4g6 b1b4
380,671<--1:info score cp -115 depth 6 nodes 9993 time 14 pv b2b1 f1e2 b1b2 e2d3 b2b4 g4b4
380,686<--1:info score cp -115 depth 7 nodes 23555 time 28 pv b2b1 f1e2 b1b2 e2d3 b2b4 g4b4 f5e6
380,786<--1:bestmove b2b1
380,786*1*Found move:Rb2-b1
380,939*2*Start calc, move no: 118
381,179-->2:time 364
381,179-->2:otim 220
381,179-->2:b2b1
381,182<--2:1 276 0 24 f1e2 b1b2
381,182<--2:2 276 0 206 f1e2 b1b2 e2d3 f5e5
381,183<--2:3 206 0 1513 f1e2 b1b3 h4h5 b3h3
381,192<--2:4 196 1 6815 f1e2 b1b2 e2e1 b2b3 h4h5 b3h3
381,223<--2:5 195 4 30747 f1e2 b1b2 e2e1 b2b3 g4g7 b3h3 g7f7
381,301<--2:move f1e2
381,301*2*Found move:Kf1-e2
381,456*1*Start calc, move no: 119
381,456-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4 b2b3 e3f2 f6f5 f2g2 b3b2 g2f1 b2b1 f1e2
381,456-->1:go wtime 4521 btime 2193 winc 100 binc 100
381,460<--1:info score cp -125 depth 1 nodes 1 time 0 pv b1b2
381,460<--1:info score cp -125 depth 2 nodes 2 time 1 pv b1b2 e2d3
381,460<--1:info score cp -125 depth 3 nodes 3 time 1 pv b1b2 e2d3 b2b3
381,460<--1:info score cp -125 depth 4 nodes 4 time 1 pv b1b2 e2d3 b2b3 d3c4
381,460<--1:info score cp -125 depth 5 nodes 5 time 1 pv b1b2 e2d3 b2b3 d3c4 b3h3
381,463<--1:info score cp -125 depth 6 nodes 6 time 1 pv b1b2 e2d3 b2b3 d3c4 b3h3 g4d4
381,463<--1:info score cp -125 depth 7 nodes 7 time 1 pv b1b2 e2d3 b2b3 d3c4 b3h3 g4d4 h3h2
381,562<--1:info score cp -120 depth 8 nodes 127454 time 105 pv b1h1 g4d4 h1h3 d4d7 h3h4 e2e1 h4b4 d7a7
381,582<--1:bestmove b1h1
381,582*1*Found move:Rb1-h1
381,741*2*Start calc, move no: 120
381,983-->2:time 453
381,983-->2:otim 308
381,983-->2:b1h1
381,985<--2:1 296 0 26 g4g5
381,986<--2:2 286 0 178 g4g5 f5e4 g5g3
381,989<--2:3 276 0 789 g4g3 h1h2 e2d3 f5e5
381,993<--2:4 286 0 2690 g4g3 h1h2 e2d3 f5f4 g3g4
382,006<--2:5 281 2 11229 g4g3 h1h2 e2d3 f5f4 g3e3 h2g2
382,058<--2:6 276 7 52528 g4g3 h1b1 g3g5 f5e6 g5g4 b1b2 e2d3 e6d5
382,134<--2:move g4g3
382,134*2*Found move:Rg4-g3
382,295*1*Start calc, move no: 121
382,297-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4 b2b3 e3f2 f6f5 f2g2 b3b2 g2f1 b2b1 f1e2 b1h1 g4g3
382,297-->1:go wtime 4375 btime 3072 winc 100 binc 100
382,303<--1:info score cp -115 depth 1 nodes 1 time 0 pv h1h3
382,303<--1:info score cp -115 depth 2 nodes 2 time 0 pv h1h3 g3h3
382,303<--1:info score cp -115 depth 3 nodes 3 time 0 pv h1h3 g3h3 f5e5
382,304<--1:info score cp -115 depth 4 nodes 4 time 0 pv h1h3 g3h3 f5e5 h4h5
382,316<--1:info score cp -150 depth 5 nodes 14826 time 17 pv h1b1 e2f3 b1b2 g3g7 b2b4
382,336<--1:info score cp -145 depth 6 nodes 35203 time 37 pv h1b1 e2d2 b1b2 d2c3 b2f2 c3d4
382,419<--1:info score cp -185 depth 7 nodes 141184 time 121 pv h1h2 e2d1 f5e4 g3g7 h2h3 g7a7 h3h1
382,452<--1:bestmove h1h2
382,452*1*Found move:Rh1-h2
382,607*2*Start calc, move no: 122
382,849-->2:time 438
382,849-->2:otim 293
382,849-->2:h1h2
382,852<--2:1 276 0 46 e2d3 f5e5
382,852<--2:2 286 0 398 e2d3 f5f4 g3g4
382,852<--2:3 281 0 1680 e2d3 f5f4 g3e3 h2g2
382,859<--2:4 286 1 7846 e2d3 f5f4 g3e3 h2b2 e3e4
382,893<--2:5 291 4 36053 e2d3 h2b2 d3c3 b2h2 c3d4 h2e2
382,996<--2:move e2d3
382,996*2*Found move:Ke2-d3
383,155*1*Start calc, move no: 123
383,155-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4 b2b3 e3f2 f6f5 f2g2 b3b2 g2f1 b2b1 f1e2 b1h1 g4g3 h1h2 e2d3
383,155-->1:go wtime 4233 btime 2922 winc 100 binc 100
383,160<--1:info score cp -185 depth 1 nodes 1 time 0 pv f5f4
383,160<--1:info score cp -185 depth 2 nodes 2 time 0 pv f5f4 g3e3
383,160<--1:info score cp -185 depth 3 nodes 3 time 0 pv f5f4 g3e3 h2d2
383,161<--1:info score cp -185 depth 4 nodes 4 time 0 pv f5f4 g3e3 h2d2 d3d2
383,161<--1:info score cp -185 depth 5 nodes 5 time 0 pv f5f4 g3e3 h2d2 d3d2 f4f5
383,161<--1:info score cp -185 depth 6 nodes 6 time 0 pv f5f4 g3e3 h2d2 d3d2 f4f5 h4h5
383,209<--1:info score cp -185 depth 7 nodes 56230 time 53 pv h2g2 g3f3 f5e5 f3e3 e5d5 h4h5 g2b2
383,305<--1:bestmove h2g2
383,305*1*Found move:Rh2-g2
383,467*2*Start calc, move no: 124
383,709-->2:time 424
383,709-->2:otim 278
383,709-->2:h2g2
383,713<--2:1 816 0 15 g3g2
383,714<--2:2 806 0 76 g3g2 f5e5
383,714<--2:3 827 0 317 g3g2 f5e5 h4h5
383,714<--2:4 827 0 1246 g3g2 f5f6 h4h5 f6e5
383,719<--2:5 848 0 4186 g3g2 f5f6 h4h5 f6e5 h3h4
383,733<--2:6 902 2 14284 g3g2 f5f6 h4h5 f6e5 g2g7 e5d5 g7a7
383,787<--2:7 902 7 66074 g3g2 f5f6 h4h5 f6e5 g2g7 e5d5 g7a7
383,850<--2:move g3g2
383,850*2*Found move:Rg3xg2
384,002*1*Start calc, move no: 125
384,003-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4 b2b3 e3f2 f6f5 f2g2 b3b2 g2f1 b2b1 f1e2 b1h1 g4g3 h1h2 e2d3 h2g2 g3g2
384,003-->1:go wtime 4097 btime 2777 winc 100 binc 100
384,011<--1:info score cp -900 depth 1 nodes 1 time 0 pv f5f6
384,011<--1:info score cp -900 depth 2 nodes 2 time 0 pv f5f6 h4h5
384,011<--1:info score cp -900 depth 3 nodes 3 time 0 pv f5f6 h4h5 f6f7
384,011<--1:info score cp -900 depth 4 nodes 4 time 0 pv f5f6 h4h5 f6f7 g2g6
384,011<--1:info score cp -900 depth 5 nodes 5 time 0 pv f5f6 h4h5 f6f7 g2g6 f7e7
384,012<--1:info score cp -900 depth 6 nodes 6 time 0 pv f5f6 h4h5 f6f7 g2g6 f7e7 g6a6
384,060<--1:info score cp -980 depth 7 nodes 71817 time 56 pv f5f4 g2g6 f4f3 d3d4 f3f2 g6a6 f2g3
384,114<--1:info score cp -1035 depth 8 nodes 153969 time 110 pv f5f4 h4h5 f4f3 h5h6 f3g2 h6h7 g2h3 h7h8q
384,147<--1:bestmove f5f4
384,147*1*Found move:Kf5-f4
384,303*2*Start calc, move no: 126
384,544-->2:time 410
384,544-->2:otim 264
384,544-->2:f5f4
384,551<--2:1 837 0 24 h4h5
384,551<--2:2 881 0 122 g2g7 f4e5 g7a7
384,551<--2:3 881 0 729 g2g7 f4e5 g7a7
384,551<--2:4 1000 0 3568 g2g6 f4f3 g6a6 f3g3 a6a7 g3h4
384,582<--2:5 1000 3 20099 g2g6 f4f3 g6a6 f3g3 a6a7 g3h4
384,683<--2:move g2g6
384,683*2*Found move:Rg2-g6
384,840*1*Start calc, move no: 127
384,841-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4 b2b3 e3f2 f6f5 f2g2 b3b2 g2f1 b2b1 f1e2 b1h1 g4g3 h1h2 e2d3 h2g2 g3g2 f5f4 g2g6
384,841-->1:go wtime 3963 btime 2638 winc 100 binc 100
384,847<--1:info score cp -1045 depth 1 nodes 1 time 0 pv f4f5
384,847<--1:info score cp -1045 depth 2 nodes 2 time 0 pv f4f5 g6a6
384,847<--1:info score cp -1045 depth 3 nodes 3 time 0 pv f4f5 g6a6 f5f4
384,847<--1:info score cp -1045 depth 4 nodes 4 time 0 pv f4f5 g6a6 f5f4 a6a7
384,847<--1:info score cp -1045 depth 5 nodes 5 time 0 pv f4f5 g6a6 f5f4 a6a7 f4f5
384,847<--1:info score cp -1045 depth 6 nodes 6 time 0 pv f4f5 g6a6 f5f4 a6a7 f4f5 h4h5
384,847<--1:info score cp -1045 depth 7 nodes 7 time 0 pv f4f5 g6a6 f5f4 a6a7 f4f5 h4h5 f5e5
384,879<--1:info score cp -1135 depth 8 nodes 43665 time 37 pv f4f5 h4h5 f5f4 h5h6 f4f5 g6e6 f5f4 e6e2
384,983<--1:bestmove f4f5
384,983*1*Found move:Kf4-f5
385,152*2*Start calc, move no: 128
385,393-->2:time 397
385,393-->2:otim 251
385,393-->2:f4f5
385,394<--2:1 872 0 24 g6a6
385,397<--2:2 1102 0 113 g6a6 f5e5 a6a7
385,398<--2:3 1102 0 545 g6a6 f5e5 a6a7
385,402<--2:4 1102 0 2514 g6a6 f5f4 a6a7 f4e5
385,416<--2:5 1052 2 13979 g6a6 f5f4 a6a7 f4g3 h4h5 g3h3
385,469<--2:6 1089 7 63704 h4h5 f5f4 h5h6 f4f5 h6h7 f5g6 h7h8q
385,526<--2:move h4h5
385,526*2*Found move:h4-h5
385,680*1*Start calc, move no: 129
385,681-->1:position startpos moves e2e4 g8f6 e4e5 b8a6 e5f6 e7f6 f1a6 b7a6 g1e2 d7d5 e1g1 f8e7 d2d4 e8g8 b1c3 a8b8 e2f4 c7c6 a1b1 c8f5 f1e1 f8e8 a2a4 b8b4 c1e3 d8b8 d1c1 e7d6 g2g3 b4b7 f2f3 b7e7 f4d5 c6d5 c3d5 e7d7 f3f4 d6f8 d5c3 f8d6 d4d5 d7e7 e3f2 e7e1 f2e1 b8b6 e1f2 d6c5 c1d2 c5f2 d2f2 b6f2 g1f2 e8b8 d5d6 f5c2 b1e1 g8f8 e1e2 c2f5 f2e3 f5g4 e2d2 b8c8 e3d4 c8e8 b2b4 f8g8 d2c2 e8d8 d4d5 g4f3 d5c5 d8c8 c5d4 c8c6 d4e3 f3g4 c2c1 g4e6 e3e4 c6d6 f4f5 e6d7 a4a5 h7h5 h2h3 g8h7 c3e2 d6d2 e2d4 g7g6 c1c7 d7f5 d4f5 g6f5 e4f5 d2f2 f5e4 f6f5 e4e3 f2b2 c7f7 h7g8 f7f5 h5h4 f5g5 g8f7 g3h4 f7f6 g5g4 b2b3 e3f2 f6f5 f2g2 b3b2 g2f1 b2b1 f1e2 b1h1 g4g3 h1h2 e2d3 h2g2 g3g2 f5f4 g2g6 f4f5 h4h5
385,681-->1:go wtime 3835 btime 2501 winc 100 binc 100
385,684<--1:info score cp -1725 depth 1 nodes 1 time 0 pv f5f4
385,684<--1:info score cp -1725 depth 2 nodes 2 time 0 pv f5f4 g6g4
385,684<--1:info score cp -1725 depth 3 nodes 3 time 0 pv f5f4 g6g4 f4e5
385,684<--1:info score cp -1725 depth 4 nodes 4 time 0 pv f5f4 g6g4 f4e5 h5h6
385,684<--1:info score cp -1725 depth 5 nodes 5 time 0 pv f5f4 g6g4 f4e5 h5h6 e5f6
385,684<--1:info score cp -1725 depth 6 nodes 6 time 0 pv f5f4 g6g4 f4e5 h5h6 e5f6 h6h7
385,685<--1:info score cp -1725 depth 7 nodes 7 time 0 pv f5f4 g6g4 f4e5 h5h6 e5f6 h6h7 f6f7
385,809<--1:info score cp -1785 depth 8 nodes 148924 time 127 pv f5f4 d3d4 f4f3 h5h6 f3f2 h6h7 f2f3 h7h8q
385,816<--1:bestmove f5f4
385,816*1*Found move:Kf5-f4
385,980********Game end: 1-0 {Arena Adjudication}
385,982********Last game won by Tscp 1.81 with White in 65 moves
385,984********LiSHeX  -  Tscp 1.81:
385,985********   8 W 2    8.0:0.0        1.0:7.0       15:51:20   +17.85    65 5.796 :4.396  1-7-0
386,002********Saving file /home/mkjm/Tournaments/Testing.pgn
386,025-->2:?
386,032<--2:Error (unknown command): ?
386,046-->2:result 1-0
386,050<--2:Error (unknown command): result
387,182********Round 9 of 10: LiSHeX  -  Tscp 1.81
387,232**----------New game---2023-06-13 15:51:22,151 Tue -------------
387,232-->2:new
387,235-->2:post
387,270*1*Start calc, move no: 0
387,270-->1:ucinewgame
387,270-->1:isready
387,270<--1:readyok
387,277-->1:position startpos
387,277-->1:go wtime 10000 btime 10000 winc 100 binc 100
387,282<--1:info score cp 30 depth 1 nodes 21 time 0 pv d2d4
387,284<--1:info score cp 0 depth 2 nodes 89 time 0 pv d2d4 d7d5
387,284<--1:info score cp 25 depth 3 nodes 632 time 0 pv d2d4 d7d5 c1e3
387,284<--1:info score cp 15 depth 4 nodes 3655 time 3 pv e2e4 f7f5 e4f5 d7d5
387,289<--1:info score cp 20 depth 5 nodes 7613 time 11 pv d2d4 d7d5 b1c3 c8g4 c3d5
387,340<--1:info score cp 15 depth 6 nodes 63596 time 61 pv e2e4 f7f5 e4f5 d7d5
387,450<--1:info score cp 20 depth 7 nodes 203899 time 171 pv d2d4 d7d5 b1c3 c8f5 g1f3 g8f6 c1e3
387,665<--1:bestmove d2d4
387,666*1*Found move:d2-d4
387,817*2*Start calc, move no: 1
388,058-->2:time 1000
388,058-->2:otim 962
388,058-->2:d2d4
388,059<--2:move g8f6
388,059*2*Found move:Ng8-f6
388,212*1*Start calc, move no: 2
388,213-->1:position startpos moves d2d4 g8f6
388,213-->1:go wtime 9617 btime 10000 winc 100 binc 100
388,219<--1:info score cp 20 depth 1 nodes 1 time 0 pv b1c3
388,219<--1:info score cp 20 depth 2 nodes 2 time 0 pv b1c3 d7d5
388,219<--1:info score cp 20 depth 3 nodes 3 time 0 pv b1c3 d7d5 g1f3
388,219<--1:info score cp 20 depth 4 nodes 4 time 0 pv b1c3 d7d5 g1f3 c8e6
388,219<--1:info score cp 20 depth 5 nodes 5 time 0 pv b1c3 d7d5 g1f3 c8e6 c1e3
388,339<--1:info score cp 15 depth 6 nodes 140326 time 127 pv b1c3 d7d5 e2e3 c7c6
388,597<--1:bestmove b1c3
388,597*1*Found move:Nb1-c3
388,753*2*Start calc, move no: 3
388,994-->2:time 1000
388,994-->2:otim 924
388,994-->2:b1c3
388,998<--2:1 0 0 25 d7d5
388,998<--2:2 -35 0 167 d7d5 g1f3
388,999<--2:3 0 0 1607 d7d5 g1f3 b8c6
389,013<--2:4 -30 1 7449 d7d5 g1f3 b8c6 e2e3
389,107<--2:5 0 11 54059 d7d5 g1f3 b8c6 e2e3 e7e6
389,327<--2:move d7d5
389,327*2*Found move:d7-d5
389,481*1*Start calc, move no: 4
389,481-->1:position startpos moves d2d4 g8f6 b1c3 d7d5
389,481-->1:go wtime 9238 btime 9672 winc 100 binc 100
389,485<--1:info score cp 15 depth 1 nodes 1 time 0 pv e2e3
389,485<--1:info score cp 15 depth 2 nodes 2 time 0 pv e2e3 c7c6
389,485<--1:info score cp 15 depth 3 nodes 3 time 0 pv e2e3 c7c6
389,485<--1:info score cp 15 depth 4 nodes 4 time 0 pv e2e3 c7c6
389,485<--1:info score cp 15 depth 5 nodes 5 time 0 pv e2e3 c7c6
389,820<--1:info score cp 5 depth 6 nodes 386039 time 336 pv c1f4 c8d7 e2e3 e7e6 f1d3 f8d6
389,842<--1:bestmove c1f4
389,842*1*Found move:Bc1-f4
389,997*2*Start calc, move no: 5
390,238-->2:time 968
390,238-->2:otim 889
390,238-->2:c1f4
390,242<--2:1 10 0 43 b8c6
390,242<--2:2 -25 0 556 b8c6 g1f3
390,252<--2:3 5 1 6607 e7e6 g1f3 b8c6
390,306<--2:4 -25 6 33419 e7e6 e2e3 b8c6 g1f3
390,521<--2:5 5 28 153479 e7e6 e2e3 f8b4 g1e2 e8g8
390,561<--2:move e7e6
390,561*2*Found move:e7-e6
390,711*1*Start calc, move no: 6
390,712-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6
390,712-->1:go wtime 8882 btime 9354 winc 100 binc 100
390,714<--1:info score cp 25 depth 1 nodes 1 time 0 pv e2e3
390,715<--1:info score cp 25 depth 2 nodes 2 time 0 pv e2e3 f8d6
390,715<--1:info score cp 25 depth 3 nodes 3 time 0 pv e2e3 f8d6 f1d3
390,722<--1:info score cp 15 depth 4 nodes 8085 time 10 pv g2g3 a7a6 c3d5 e6d5
390,778<--1:info score cp 15 depth 5 nodes 68740 time 65 pv g1f3 f8b4 f3g1 b4c3 b2c3
391,061<--1:bestmove g1f3
391,061*1*Found move:Ng1-f3
391,212*2*Start calc, move no: 7
391,453-->2:time 936
391,453-->2:otim 854
391,453-->2:g1f3
391,456<--2:1 5 0 44 b8c6
391,456<--2:2 -5 0 653 f8b4 f4d2
391,467<--2:3 8 1 3995 f8b4 e2e3 b4c3 b2c3
391,511<--2:4 5 5 21086 f8b4 f4d2 e8g8 e2e3
391,664<--2:5 19 21 115722 f8b4 e2e3 b4c3 b2c3 e8g8 f1d3
391,765<--2:move f8b4
391,765*2*Found move:Bf8-b4
391,920*1*Start calc, move no: 8
391,920-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4
391,920-->1:go wtime 8538 btime 9047 winc 100 binc 100
391,923<--1:info score cp 15 depth 1 nodes 1 time 0 pv f3g1
391,923<--1:info score cp 15 depth 2 nodes 2 time 0 pv f3g1 b4c3
391,923<--1:info score cp 15 depth 3 nodes 3 time 0 pv f3g1 b4c3 b2c3
391,923<--1:info score cp 15 depth 4 nodes 4 time 0 pv f3g1 b4c3 b2c3 b8c6
391,980<--1:info score cp 0 depth 5 nodes 61256 time 59 pv f4c7 d8c7 f3g1 b4c3 b2c3
392,256<--1:bestmove f4c7
392,256*1*Found move:Bf4xc7
392,407*2*Start calc, move no: 9
392,653-->2:time 905
392,653-->2:otim 821
392,653-->2:f4c7
392,659<--2:1 205 0 38 b4c3
392,662<--2:2 243 0 306 b4c3 b2c3 d8c7
392,662<--2:3 243 0 1700 b4c3 b2c3 d8c7 d1d2
392,680<--2:4 278 2 10566 b4c3 b2c3 d8c7 d1d2 b8c6
392,751<--2:5 283 9 55760 d8c7 d1d3 f6e4 d3b5 b8c6 b5d3 b4c3 b2c3
392,959<--2:move d8c7
392,959*2*Found move:Qd8xc7
393,121*1*Start calc, move no: 10
393,121-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7
393,121-->1:go wtime 8207 btime 8746 winc 100 binc 100
393,127<--1:info score cp -303 depth 1 nodes 1 time 0 pv d1d3
393,129<--1:info score cp -303 depth 2 nodes 2 time 0 pv d1d3 f6e4
393,129<--1:info score cp -303 depth 3 nodes 3 time 1 pv d1d3 f6e4 d3b5
393,129<--1:info score cp -303 depth 4 nodes 4 time 1 pv d1d3 f6e4 d3b5 b8c6
393,178<--1:info score cp -313 depth 5 nodes 59639 time 57 pv f3d2 c8d7 d2b1 e8g8 e2e3
393,251<--1:info score cp -333 depth 6 nodes 157244 time 129 pv f3d2 c8d7 c3b1 e8g8 b1c3 b4c3
393,446<--1:bestmove f3d2
393,446*1*Found move:Nf3-d2
393,607*2*Start calc, move no: 11
393,848-->2:time 875
393,848-->2:otim 789
393,848-->2:f3d2
393,850<--2:1 333 0 53 b4c3 b2c3 c7c3
393,851<--2:2 333 0 639 b4c3 b2c3 c7c3
393,867<--2:3 333 1 4645 b4c3 b2c3 c7c3
393,926<--2:4 310 7 36204 b4c3 b2c3 e8g8 d2b1
394,141<--2:move b4c3
394,141*2*Found move:Bb4xc3
394,312*1*Start calc, move no: 12
394,313-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3
394,313-->1:go wtime 7887 btime 8458 winc 100 binc 100
394,318<--1:info score cp -333 depth 1 nodes 1 time 0 pv b2c3
394,318<--1:info score cp -333 depth 2 nodes 2 time 0 pv b2c3 c7c3
394,318<--1:info score cp -333 depth 3 nodes 3 time 0 pv b2c3 c7c3 e2e3
394,318<--1:info score cp -333 depth 4 nodes 4 time 0 pv b2c3 c7c3 e2e3 e8g8
394,318<--1:info score cp -333 depth 5 nodes 5 time 0 pv b2c3 c7c3 e2e3 e8g8 a2a3
394,371<--1:info score cp -333 depth 6 nodes 68488 time 57 pv b2c3 c7c3 e2e3 e8g8 a2a3 c8d7
394,550<--1:info score cp -355 depth 7 nodes 291488 time 236 pv b2c3 c7c3 e2e3 e8g8 f1d3 e6e5 d4e5
394,629<--1:bestmove b2c3
394,629*1*Found move:b2xc3
394,806*2*Start calc, move no: 13
395,048-->2:time 846
395,048-->2:otim 758
395,048-->2:b2c3
395,050<--2:1 333 0 41 c7c3
395,053<--2:2 310 0 586 e8g8 d2b1
395,059<--2:3 338 1 2459 c7c3 e2e3 b8c6
395,097<--2:4 313 4 12691 c7c3 e2e3 b8c6 f1d3
395,204<--2:5 345 15 77998 c7c3 e2e3 e8g8 f1b5 b8d7
395,331<--2:move c7c3
395,331*2*Found move:Qc7xc3
395,488*1*Start calc, move no: 14
395,488-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3
395,488-->1:go wtime 7576 btime 8180 winc 100 binc 100
395,492<--1:info score cp -360 depth 1 nodes 1 time 0 pv e2e3
395,492<--1:info score cp -360 depth 2 nodes 2 time 0 pv e2e3 e6e5
395,493<--1:info score cp -360 depth 3 nodes 3 time 0 pv e2e3 e6e5 d4e5
395,493<--1:info score cp -360 depth 4 nodes 4 time 0 pv e2e3 e6e5 d4e5 c8g4
395,493<--1:info score cp -360 depth 5 nodes 5 time 0 pv e2e3 e6e5 d4e5 c8g4 f1b5
395,493<--1:info score cp -360 depth 6 nodes 6 time 0 pv e2e3 e6e5 d4e5 c8g4 f1b5 e8f8
395,796<--1:bestmove e2e3
395,796*1*Found move:e2-e3
395,950*2*Start calc, move no: 15
396,191-->2:time 818
396,191-->2:otim 728
396,191-->2:e2e3
396,193<--2:1 338 0 56 b8c6
396,195<--2:2 313 0 1000 b8c6 f1d3
396,204<--2:3 345 1 4546 e8g8 f1b5 b8d7
396,286<--2:4 323 9 39297 b8d7 f1b5 e6e5 d4e5 c3e5
396,466<--2:move b8c6
396,466*2*Found move:Nb8-c6
396,626*1*Start calc, move no: 16
396,626-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6
396,626-->1:go wtime 7273 btime 7910 winc 100 binc 100
396,630<--1:info score cp -360 depth 1 nodes 1 time 0 pv f1d3
396,630<--1:info score cp -360 depth 2 nodes 2 time 0 pv f1d3 e8g8
396,630<--1:info score cp -360 depth 3 nodes 3 time 0 pv f1d3 e8g8 e1g1
396,630<--1:info score cp -360 depth 4 nodes 4 time 0 pv f1d3 e8g8 e1g1 e6e5
396,693<--1:info score cp -358 depth 5 nodes 75858 time 66 pv f1b5 c3e3 f2e3 h8g8 b5c6
396,922<--1:bestmove f1b5
396,922*1*Found move:Bf1-b5
397,084*2*Start calc, move no: 17
397,326-->2:time 791
397,326-->2:otim 699
397,326-->2:f1b5
397,330<--2:1 341 0 96 e8g8 b5c6 c3c6
397,330<--2:2 314 0 469 e8g8 e1g1
397,334<--2:3 334 0 3099 e8g8 e1g1 c8d7
397,360<--2:4 309 3 17272 e8g8 b5c6 c3c6 e1g1
397,589<--2:move c8d7
397,589*2*Found move:Bc8-d7
397,768*1*Start calc, move no: 18
397,769-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7
397,769-->1:go wtime 6982 btime 7652 winc 100 binc 100
397,772<--1:info score cp -358 depth 1 nodes 1 time 0 pv e1g1
397,772<--1:info score cp -358 depth 2 nodes 2 time 0 pv e1g1 e8g8
397,772<--1:info score cp -358 depth 3 nodes 3 time 0 pv e1g1 e8g8 a1b1
397,786<--1:info score cp -363 depth 4 nodes 16010 time 16 pv e1g1 e8g8 a1b1 e6e5
397,923<--1:info score cp -363 depth 5 nodes 97476 time 155 pv e1g1 e8c8 b5c6 f6h5 c6d7
398,055<--1:bestmove e1g1
398,055*1*Found move:O-O
398,235*2*Start calc, move no: 19
398,476-->2:time 766
398,476-->2:otim 771
398,476-->2:e1g1
398,476<--2:1 334 0 165 e8g8
398,476<--2:2 324 0 697 e8g8 a1b1
398,490<--2:3 334 1 4584 e8g8 a1b1 e6e5 b5c6 d7c6 d4e5 c3e5
398,527<--2:4 324 5 19380 e8g8 b5c6 d7c6 a1b1
398,731<--2:move e8g8
398,731*2*Found move:O-O
398,951*1*Start calc, move no: 20
398,951-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8
398,951-->1:go wtime 7701 btime 8402 winc 100 binc 100
398,957<--1:info score cp -363 depth 1 nodes 1 time 0 pv a1b1
398,957<--1:info score cp -363 depth 2 nodes 2 time 0 pv a1b1 a8c8
398,957<--1:info score cp -363 depth 3 nodes 3 time 0 pv a1b1 a8c8 b5d3
398,958<--1:info score cp -363 depth 4 nodes 4 time 0 pv a1b1 a8c8 b5d3 c6b4
399,009<--1:info score cp -358 depth 5 nodes 32101 time 56 pv b5c6 d7c6 d2f3 a8c8 f3e5
399,260<--1:bestmove b5c6
399,261*1*Found move:Bb5xc6
399,414*2*Start calc, move no: 21
399,654-->2:time 841
399,654-->2:otim 740
399,654-->2:b5c6
399,656<--2:1 334 0 47 d7c6
399,656<--2:2 324 0 507 d7c6 a1b1
399,659<--2:3 334 0 2506 d7c6 a1b1 e6e5 d4e5 c3e5
399,678<--2:4 329 2 14471 d7c6 d2f3 f8c8 a1b1
399,769<--2:5 334 11 80509 d7c6 d2f3 f8c8 a1b1 f6e4
399,936<--2:move d7c6
399,936*2*Found move:Bd7xc6
400,088*1*Start calc, move no: 22
400,089-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6
400,089-->1:go wtime 7396 btime 8125 winc 100 binc 100
400,092<--1:info score cp -363 depth 1 nodes 1 time 0 pv f1e1
400,092<--1:info score cp -363 depth 2 nodes 2 time 0 pv f1e1 a8c8
400,092<--1:info score cp -363 depth 3 nodes 3 time 0 pv f1e1 a8c8 f2f4
400,092<--1:info score cp -363 depth 4 nodes 4 time 0 pv f1e1 a8c8 f2f4 f8e8
400,134<--1:info score cp -363 depth 5 nodes 48136 time 44 pv f1e1 a8c8 d2f3 f6e4 f3e5
400,388<--1:bestmove f1e1
400,388*1*Found move:Rf1-e1
400,543*2*Start calc, move no: 23
400,784-->2:time 813
400,784-->2:otim 711
400,784-->2:f1e1
400,789<--2:1 344 0 54 f8c8
400,790<--2:2 344 0 1510 e6e5 d4e5 c3e5
400,795<--2:3 344 1 5563 f8c8 d2f3 f6e4
400,942<--2:4 334 15 80529 f8c8 d2f3 f6e4 a1b1
401,057<--2:move f8c8
401,057*2*Found move:Rf8-c8
401,242*1*Start calc, move no: 24
401,242-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8
401,242-->1:go wtime 7102 btime 7857 winc 100 binc 100
401,250<--1:info score cp -363 depth 1 nodes 1 time 0 pv d2f3
401,251<--1:info score cp -363 depth 2 nodes 2 time 0 pv d2f3 f6e4
401,251<--1:info score cp -363 depth 3 nodes 3 time 0 pv d2f3 f6e4 a1b1
401,283<--1:info score cp -363 depth 4 nodes 24918 time 40 pv e1f1 f6d7 a1b1 e6e5
401,339<--1:info score cp -355 depth 5 nodes 99876 time 97 pv a1b1 a8b8 b1b3 c3a5 b3b2
401,524<--1:info score cp -363 depth 6 nodes 362312 time 281 pv a1b1 c3a3 b1b3 a3a2 b3b7 c6b7
401,531<--1:bestmove a1b1
401,531*1*Found move:Ra1-b1
401,692*2*Start calc, move no: 25
401,934-->2:time 786
401,934-->2:otim 682
401,934-->2:a1b1
401,937<--2:1 344 0 60 e6e5 d4e5 c3e5
401,939<--2:2 344 0 1117 e6e5 d4e5 c3e5
401,949<--2:3 344 1 6377 c3a3 b1a1 c8c7
402,051<--2:4 339 11 50399 c3a3 b1a1 a3a4 d2f3
402,198<--2:move c3a3
402,198*2*Found move:Qc3-a3
402,367*1*Start calc, move no: 26
402,367-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3
402,367-->1:go wtime 6818 btime 7598 winc 100 binc 100
402,373<--1:info score cp -363 depth 1 nodes 1 time 0 pv b1b3
402,374<--1:info score cp -363 depth 2 nodes 2 time 0 pv b1b3 a3a2
402,374<--1:info score cp -363 depth 3 nodes 3 time 0 pv b1b3 a3a2 f2f4
402,374<--1:info score cp -363 depth 4 nodes 4 time 0 pv b1b3 a3a2 f2f4 a7a5
402,425<--1:info score cp -348 depth 5 nodes 70268 time 57 pv d1c1 a3a5 b1b2 a5c3 f2f4
402,502<--1:info score cp -355 depth 6 nodes 166426 time 134 pv d1c1 a3a5 b1b2 c8c7 f2f4 a8c8
402,647<--1:bestmove d1c1
402,647*1*Found move:Qd1-c1
402,818*2*Start calc, move no: 27
403,058-->2:time 760
403,058-->2:otim 655
403,058-->2:d1c1
403,063<--2:1 434 0 48 a3a2
403,063<--2:2 429 0 303 a3a2 d2f3
403,063<--2:3 334 0 2689 a3c1 e1c1 c8c7
403,125<--2:4 329 6 19628 a3d6 d2f3 f6e4 f3e5
403,316<--2:move a3c1
403,316*2*Found move:Qa3xc1
403,467*1*Start calc, move no: 28
403,469-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1
403,469-->1:go wtime 6543 btime 7345 winc 100 binc 100
403,473<--1:info score cp -355 depth 1 nodes 30 time 0 pv b1c1
403,473<--1:info score cp -345 depth 2 nodes 60 time 0 pv b1c1 c8c7
403,473<--1:info score cp -345 depth 3 nodes 90 time 0 pv b1c1 c8c7 f2f4
403,473<--1:info score cp -345 depth 4 nodes 1427 time 1 pv b1c1 c8c7 f2f4 c6a4
403,473<--1:info score cp -345 depth 5 nodes 1577 time 1 pv b1c1 c8c7 f2f4 c6a4 c2c4
403,486<--1:info score cp -345 depth 6 nodes 19185 time 17 pv b1c1 c8c7 f2f4 a8b8 c2c4 b8c8
403,613<--1:info score cp -350 depth 7 nodes 146573 time 145 pv b1c1 c8c7 f2f4 a8c8 c2c4 c6b5 c4c5
403,740<--1:bestmove b1c1
403,740*1*Found move:Rb1xc1
403,900*2*Start calc, move no: 29
404,140-->2:time 735
404,140-->2:otim 628
404,140-->2:b1c1
404,142<--2:1 344 0 30 a8b8
404,143<--2:2 331 0 599 f6e4 d2e4 d5e4
404,151<--2:3 340 1 3241 b7b5 c1b1 a7a5
404,249<--2:4 335 10 19436 c8c7 f2f3 a8c8 e3e4
404,357<--2:5 334 21 98777 c8c7 c2c4 a8c8 a2a3 h7h6 c4d5 f6d5
404,387<--2:move c8c7
404,387*2*Found move:Rc8-c7
404,539*1*Start calc, move no: 30
404,539-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1 b1c1 c8c7
404,541-->1:go wtime 6277 btime 7103 winc 100 binc 100
404,543<--1:info score cp -355 depth 1 nodes 1 time 0 pv f2f4
404,543<--1:info score cp -355 depth 2 nodes 2 time 0 pv f2f4 a8c8
404,543<--1:info score cp -355 depth 3 nodes 3 time 0 pv f2f4 a8c8 c2c4
404,544<--1:info score cp -355 depth 4 nodes 4 time 0 pv f2f4 a8c8 c2c4 c6b5
404,544<--1:info score cp -355 depth 5 nodes 5 time 0 pv f2f4 a8c8 c2c4 c6b5 c4c5
404,544<--1:info score cp -355 depth 6 nodes 6 time 0 pv f2f4 a8c8 c2c4 c6b5 c4c5 b5d3
404,803<--1:bestmove f2f4
404,803*1*Found move:f2-f4
404,958*2*Start calc, move no: 31
405,199-->2:time 711
405,199-->2:otim 602
405,199-->2:f2f4
405,202<--2:1 361 0 30 a8c8
405,203<--2:2 347 0 264 a8c8 c2c4
405,208<--2:3 347 0 3320 b7b5 c1b1 a8c8
405,234<--2:4 344 3 13506 a8b8 c2c4 b8c8 c4c5
405,302<--2:5 352 10 59074 b7b5 d2f3 a8c8 c1b1 a7a5
405,437<--2:move b7b5
405,437*2*Found move:b7-b5
405,598*1*Start calc, move no: 32
405,599-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1 b1c1 c8c7 f2f4 b7b5
405,599-->1:go wtime 6018 btime 6870 winc 100 binc 100
405,603<--1:info score cp -350 depth 1 nodes 1 time 0 pv d2f3
405,603<--1:info score cp -350 depth 2 nodes 2 time 0 pv d2f3 h7h6
405,603<--1:info score cp -350 depth 3 nodes 3 time 0 pv d2f3 h7h6 c1a1
405,604<--1:info score cp -340 depth 4 nodes 3689 time 3 pv d2f3 a8c8 f3e5 f6e4
405,613<--1:info score cp -335 depth 5 nodes 11724 time 14 pv d2f3 a8c8 f3e5 f6e4 c1d1
405,688<--1:info score cp -340 depth 6 nodes 92046 time 88 pv c2c3 a8c8 d2b3 f6e4 b3c5 e4c5
405,823<--1:info score cp -345 depth 7 nodes 247019 time 223 pv c2c3 c6d7 c1c2 a8c8 e1c1 b5b4 c3c4
405,852<--1:bestmove c2c3
405,852*1*Found move:c2-c3
406,008*2*Start calc, move no: 33
406,248-->2:time 687
406,248-->2:otim 577
406,248-->2:c2c3
406,254<--2:1 354 0 29 a8c8
406,254<--2:2 344 0 194 a8c8 c1b1
406,254<--2:3 354 0 1778 a8c8 c1b1 a7a5
406,290<--2:4 354 3 13899 a8c8 d2b3 f6e4 b3c5
406,399<--2:5 351 14 83008 a8c8 d2b3 c6d7 b3c5 a7a5 c5d7 f6d7
406,479<--2:move a8c8
406,480*2*Found move:Ra8-c8
406,632*1*Start calc, move no: 34
406,634-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1 b1c1 c8c7 f2f4 b7b5 c2c3 a8c8
406,634-->1:go wtime 5770 btime 6644 winc 100 binc 100
406,637<--1:info score cp -340 depth 1 nodes 1 time 0 pv d2b3
406,637<--1:info score cp -340 depth 2 nodes 2 time 0 pv d2b3 f6e4
406,637<--1:info score cp -340 depth 3 nodes 3 time 0 pv d2b3 f6e4 b3c5
406,637<--1:info score cp -340 depth 4 nodes 4 time 0 pv d2b3 f6e4 b3c5 e4c5
406,637<--1:info score cp -340 depth 5 nodes 5 time 0 pv d2b3 f6e4 b3c5 e4c5 d4c5
406,697<--1:info score cp -350 depth 6 nodes 67987 time 62 pv d2b3 f6e4 b3c5 e4c5 d4c5 f7f5
406,879<--1:bestmove d2b3
406,879*1*Found move:Nd2-b3
407,047*2*Start calc, move no: 35
407,288-->2:time 665
407,288-->2:otim 553
407,288-->2:d2b3
407,307<--2:1 359 0 30 f6e4
407,307<--2:2 354 0 214 f6e4 b3c5
407,307<--2:3 351 0 2059 c6d7 b3c5 a7a5 c5d7 f6d7
407,329<--2:4 350 4 10836 f6e4 b3c5 a7a5 c5e4 d5e4
407,395<--2:5 350 10 57513 f6e4 b3c5 a7a5 c5e4 d5e4
407,510<--2:move f6e4
407,510*2*Found move:Nf6-e4
407,661*1*Start calc, move no: 36
407,662-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1 b1c1 c8c7 f2f4 b7b5 c2c3 a8c8 d2b3 f6e4
407,662-->1:go wtime 5530 btime 6427 winc 100 binc 100
407,666<--1:info score cp -445 depth 1 nodes 1 time 0 pv c1c2
407,666<--1:info score cp -445 depth 2 nodes 2 time 0 pv c1c2 c6d7
407,666<--1:info score cp -445 depth 3 nodes 3 time 0 pv c1c2 c6d7 b3d2
407,666<--1:info score cp -445 depth 4 nodes 4 time 0 pv c1c2 c6d7 b3d2 e4d2
407,666<--1:info score cp -445 depth 5 nodes 5 time 0 pv c1c2 c6d7 b3d2 e4d2 c2d2
407,741<--1:info score cp -410 depth 6 nodes 103060 time 79 pv b3d2 e4d2 c1d1 b5b4 d1d2 b4c3
407,899<--1:bestmove b3d2
407,899*1*Found move:Nb3-d2
408,056*2*Start calc, move no: 37
408,297-->2:time 643
408,297-->2:otim 530
408,297-->2:b3d2
408,299<--2:1 643 0 33 e4d2
408,302<--2:2 642 0 160 e4d2 a2a3
408,302<--2:3 652 0 1097 e4d2 a2a3 d2e4
408,316<--2:4 643 1 4544 e4d2 e1e2 d2e4 e2b2
408,360<--2:5 653 6 28674 e4d2 e1e2 d2e4 e2b2 g8f8
408,512<--2:move e4d2
408,512*2*Found move:Ne4xd2
408,667*1*Start calc, move no: 38
408,668-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1 b1c1 c8c7 f2f4 b7b5 c2c3 a8c8 d2b3 f6e4 b3d2 e4d2
408,668-->1:go wtime 5298 btime 6217 winc 100 binc 100
408,670<--1:info score cp -685 depth 1 nodes 1 time 0 pv c1d1
408,670<--1:info score cp -685 depth 2 nodes 2 time 0 pv c1d1 d2c4
408,670<--1:info score cp -685 depth 3 nodes 3 time 0 pv c1d1 d2c4 d1b1
408,670<--1:info score cp -685 depth 4 nodes 4 time 0 pv c1d1 d2c4 d1b1 f7f5
408,670<--1:info score cp -685 depth 5 nodes 5 time 0 pv c1d1 d2c4 d1b1 f7f5 b1d1
408,715<--1:info score cp -690 depth 6 nodes 53861 time 47 pv c1d1 d2c4 d1b1 f7f6 b1d1 e6e5
408,772<--1:info score cp -690 depth 7 nodes 122019 time 103 pv c1d1 d2c4 h2h3 f7f6 d1b1 e6e5 d4e5
408,897<--1:bestmove c1d1
408,897*1*Found move:Rc1-d1
409,050*2*Start calc, move no: 39
409,292-->2:time 622
409,292-->2:otim 608
409,292-->2:c1d1
409,293<--2:1 653 0 65 d2e4
409,294<--2:2 653 0 201 d2e4 d1d3
409,296<--2:3 663 0 1123 d2e4 d1d3 g8f8
409,308<--2:4 733 1 4679 d2e4 d1d3 c6b7 e1c1 e4c3
409,376<--2:5 733 8 31223 d2e4 d1d3 c6b7 e1c1 e4c3
409,500<--2:move d2e4
409,500*2*Found move:Nd2-e4
409,652*1*Start calc, move no: 40
409,652-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1 b1c1 c8c7 f2f4 b7b5 c2c3 a8c8 d2b3 f6e4 b3d2 e4d2 c1d1 d2e4
409,652-->1:go wtime 6074 btime 7014 winc 100 binc 100
409,656<--1:info score cp -690 depth 1 nodes 1 time 0 pv d1a1
409,657<--1:info score cp -690 depth 2 nodes 2 time 0 pv d1a1 e4c3
409,657<--1:info score cp -690 depth 3 nodes 3 time 0 pv d1a1 e4c3 e1d1
409,657<--1:info score cp -690 depth 4 nodes 4 time 0 pv d1a1 e4c3 e1d1 c3d1
409,668<--1:info score cp -690 depth 5 nodes 15786 time 15 pv c3c4 d5c4 d1c1 f7f5 c1c4
409,682<--1:info score cp -690 depth 6 nodes 29971 time 29 pv d1c1 c6d7 c1c2 e4c3 c2c3 c7c3
409,813<--1:info score cp -780 depth 7 nodes 216502 time 160 pv e1e2 f7f5 d1c1 c6d7 e2b2 e4c3 b2c2
409,909<--1:bestmove e1e2
409,909*1*Found move:Re1-e2
410,082*2*Start calc, move no: 41
410,324-->2:time 702
410,324-->2:otim 583
410,324-->2:e1e2
410,331<--2:1 753 0 33 e4c3
410,331<--2:2 951 0 214 e4c3 e2d2 c3d1 d2d1
410,331<--2:3 951 0 1323 e4c3 e2d2 c3d1 d2d1
410,360<--2:4 951 3 11960 e4c3 e2d2 c3d1 d2d1
410,434<--2:5 946 10 75826 e4c3 d1d2 c3e2 d2e2 g8f8 e2c2
410,570<--2:move e4c3
410,570*2*Found move:Ne4xc3
410,722*1*Start calc, move no: 42
410,722-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1 b1c1 c8c7 f2f4 b7b5 c2c3 a8c8 d2b3 f6e4 b3d2 e4d2 c1d1 d2e4 e1e2 e4c3
410,722-->1:go wtime 5822 btime 6773 winc 100 binc 100
410,727<--1:info score cp -1000 depth 1 nodes 1 time 0 pv e2d2
410,727<--1:info score cp -1000 depth 2 nodes 2 time 0 pv e2d2 c3d1
410,727<--1:info score cp -1000 depth 3 nodes 3 time 0 pv e2d2 c3d1 d2d1
410,727<--1:info score cp -1000 depth 4 nodes 4 time 0 pv e2d2 c3d1 d2d1 g8f8
410,727<--1:info score cp -1000 depth 5 nodes 5 time 0 pv e2d2 c3d1 d2d1 g8f8 d1c1
410,727<--1:info score cp -1000 depth 6 nodes 6 time 0 pv e2d2 c3d1 d2d1 g8f8 d1c1 f7f5
410,740<--1:info score cp -1000 depth 7 nodes 15793 time 16 pv e2d2 c3d1 d2d1 g8f8 d1c1 f7f5 c1c2
410,946<--1:info score cp -1010 depth 8 nodes 273734 time 221 pv e2d2 c3d1 d2d1 g8f8 d1c1 f7f5
410,970<--1:bestmove e2d2
410,970*1*Found move:Re2-d2
411,136*2*Start calc, move no: 43
411,378-->2:time 678
411,378-->2:otim 558
411,378-->2:e2d2
411,380<--2:1 951 0 32 c3d1 d2d1
411,381<--2:2 951 0 328 c3d1 d2d1
411,383<--2:3 961 0 1440 c3d1 d2d1 g8f8
411,394<--2:4 946 1 6489 c3d1 d2d1 g8f8 d1c1
411,444<--2:5 966 6 44383 c3d1 d2d1 g8f8 d1c1 f8e7
411,603<--2:move c3d1
411,603*2*Found move:Nc3xd1
411,760*1*Start calc, move no: 44
411,762-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1 b1c1 c8c7 f2f4 b7b5 c2c3 a8c8 d2b3 f6e4 b3d2 e4d2 c1d1 d2e4 e1e2 e4c3 e2d2 c3d1
411,762-->1:go wtime 5579 btime 6553 winc 100 binc 100
411,767<--1:info score cp -1010 depth 1 nodes 1 time 0 pv d2d1
411,767<--1:info score cp -1010 depth 2 nodes 2 time 0 pv d2d1 g8f8
411,767<--1:info score cp -1010 depth 3 nodes 3 time 0 pv d2d1 g8f8 d1c1
411,767<--1:info score cp -1010 depth 4 nodes 4 time 0 pv d2d1 g8f8 d1c1 f7f5
411,767<--1:info score cp -1010 depth 5 nodes 5 time 0 pv d2d1 g8f8 d1c1 f7f5 c1b1
411,767<--1:info score cp -1010 depth 6 nodes 6 time 0 pv d2d1 g8f8 d1c1 f7f5 c1b1 f8f7
411,784<--1:info score cp -1010 depth 7 nodes 17604 time 21 pv d2d1 g8f8 d1c1 f7f5 c1b1 f8f7 b1b5
411,961<--1:info score cp -1040 depth 8 nodes 265497 time 199 pv d2d1 c6a8 h2h3 c7c2 d1f1 c2a2 f1c1 c8c1
411,998<--1:bestmove d2d1
411,998*1*Found move:Rd2xd1
412,152*2*Start calc, move no: 45
412,394-->2:time 656
412,394-->2:otim 535
412,394-->2:d2d1
412,397<--2:1 961 0 26 g8f8
412,398<--2:2 946 0 133 g8f8 d1c1
412,400<--2:3 966 0 954 g8f8 d1c1 f8e7
412,409<--2:4 965 1 5574 g8f8 d1c1 f8e7 a2a3
412,459<--2:5 975 6 46637 g8f8 d1c1 f8e7 a2a3 a7a5
412,612<--2:move g8f8
412,612*2*Found move:Kg8-f8
412,767*1*Start calc, move no: 46
412,767-->1:position startpos moves d2d4 g8f6 b1c3 d7d5 c1f4 e7e6 g1f3 f8b4 f4c7 d8c7 f3d2 b4c3 b2c3 c7c3 e2e3 b8c6 f1b5 c8d7 e1g1 e8g8 b5c6 d7c6 f1e1 f8c8 a1b1 c3a3 d1c1 a3c1 b1c1 c8c7 f2f4 b7b5 c2c3 a8c8 d2b3 f6e4 b3d2 e4d2 c1d1 d2e4 e1e2 e4c3 e2d2 c3d1 d2d1 g8f8
412,767-->1:go wtime 5348 btime 6340 winc 100 binc 100
412,770<--1:info score cp -1015 depth 1 nodes 1 time 0 pv g2g4
412,770<--1:info score cp -1015 depth 2 nodes 2 time 0 pv g2g4 f7f6
412,770<--1:info score cp -1015 depth 3 nodes 3 time 0 pv g2g4 f7f6 d1c1
412,770<--1:info score cp -1015 depth 4 nodes 4 time 0 pv g2g4 f7f6 d1c1 f8f7
412,771<--1:info score cp -1015 depth 5 nodes 5 time 0 pv g2g4 f7f6 d1c1 f8f7 c1d1
412,771<--1:info score cp -1015 depth 6 nodes 6 time 0 pv g2g4 f7f6 d1c1 f8f7 c1d1 c6d7
412,860<--1:info score cp -1020 depth 7 nodes 114845 time 90 pv d1d2 f7f5 h2h3 c6d7 d2d1 c7c2 d1c1
412,999<--1:bestmove d1d2
413,000*1*Found move:Rd1-d2
413,155********Game end: 0-1 {Arena Adjudication}
413,157********Last game won by Tscp 1.81 with Black in 24 moves
413,157********LiSHeX  -  Tscp 1.81:
413,160********   9 B 2    9.0:0.0        1.0:8.0       15:51:48   -10.20    24 5.804 :4.411  1-8-0
413,176********Saving file /home/mkjm/Tournaments/Testing.pgn
413,194-->2:?
413,196<--2:Error (unknown command): ?
413,214-->2:result 0-1
413,214<--2:Error (unknown command): result
414,374********Round 10 of 10: Tscp 1.81  -  LiSHeX
414,451**----------New game---2023-06-13 15:51:49,370 Tue -------------
414,451-->2:new
414,457-->2:post
414,499*2*Start calc, move no: 0
414,500-->2:time 1000
414,500-->2:otim 1000
414,500-->2:white
414,500-->2:go
414,505<--2:move g1f3
414,505*2*Found move:Ng1-f3
414,631*1*Start calc, move no: 1
414,631-->1:ucinewgame
414,631-->1:isready
414,631<--1:readyok
414,638-->1:position startpos moves g1f3
414,638-->1:go wtime 10000 btime 10000 winc 100 binc 100
414,642<--1:info score cp 10 depth 1 nodes 21 time 0 pv d7d5
414,643<--1:info score cp -15 depth 2 nodes 141 time 0 pv f7f5 d2d3
414,643<--1:info score cp 0 depth 3 nodes 738 time 0 pv g8f6 d2d4 d7d5
414,645<--1:info score cp -15 depth 4 nodes 3488 time 2 pv f7f5 d2d3
414,656<--1:info score cp -5 depth 5 nodes 15371 time 18 pv b8c6 d2d4 e7e6 c1e3 c6d4
414,726<--1:info score cp -10 depth 6 nodes 94566 time 88 pv d7d5 e2e4 g8f6 e4e5 f6e4 d2d4
414,850<--1:info score cp -5 depth 7 nodes 262250 time 211 pv d7d5 d2d4 e7e6 c1e3 f8d6 b1a3
415,025<--1:bestmove d7d5
415,025*1*Found move:d7-d5
415,177*2*Start calc, move no: 2
415,418-->2:time 1000
415,418-->2:otim 962
415,418-->2:d7d5
415,423<--2:move d2d4
415,423*2*Found move:d2-d4
415,575*1*Start calc, move no: 3
415,576-->1:position startpos moves g1f3 d7d5 d2d4
415,576-->1:go wtime 10000 btime 9618 winc 100 binc 100
415,579<--1:info score cp -5 depth 1 nodes 1 time 0 pv e7e6
415,579<--1:info score cp -5 depth 2 nodes 2 time 0 pv e7e6
415,579<--1:info score cp -5 depth 3 nodes 3 time 0 pv e7e6
415,579<--1:info score cp -5 depth 4 nodes 4 time 0 pv e7e6
415,579<--1:info score cp -5 depth 5 nodes 5 time 0 pv e7e6
415,676<--1:info score cp -15 depth 6 nodes 117349 time 100 pv e7e6 e2e3 f8b4 b1d2 b8c6 f3e5
415,949<--1:bestmove e7e6
415,949*1*Found move:e7-e6
416,129*2*Start calc, move no: 4
416,371-->2:time 1000
416,371-->2:otim 925
416,371-->2:e7e6
416,381<--2:1 40 0 36 b1c3
416,381<--2:2 5 0 167 b1c3 b8c6
416,381<--2:3 35 0 1906 b1c3 g8f6 e2e3
416,404<--2:4 0 2 14714 b1c3 g8f6 e2e3 b8c6
416,599<--2:5 25 22 118407 b1c3 g8f6 e2e3 b8c6 f1d3
416,710<--2:move b1c3
416,710*2*Found move:Nb1-c3
416,861*1*Start calc, move no: 5
416,862-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3
416,862-->1:go wtime 9666 btime 9250 winc 100 binc 100
416,867<--1:info score cp -5 depth 1 nodes 1 time 0 pv g8f6
416,867<--1:info score cp -5 depth 2 nodes 2 time 0 pv g8f6 c3b1
416,867<--1:info score cp -5 depth 3 nodes 3 time 0 pv g8f6 c3b1 c8d7
416,867<--1:info score cp -5 depth 4 nodes 4 time 0 pv g8f6 c3b1 c8d7 f3g5
416,867<--1:info score cp -5 depth 5 nodes 5 time 0 pv g8f6 c3b1 c8d7 f3g5 f8b4
417,067<--1:info score cp -10 depth 6 nodes 175430 time 205 pv g8f6 e2e3 f8b4 f1d3 b4c3 b2c3
417,224<--1:bestmove g8f6
417,224*1*Found move:Ng8-f6
417,377*2*Start calc, move no: 6
417,618-->2:time 967
417,618-->2:otim 890
417,618-->2:g8f6
417,623<--2:1 35 0 38 e2e3
417,623<--2:2 0 0 252 e2e3 b8c6
417,627<--2:3 25 0 2127 e2e3 b8c6 f1d3
417,653<--2:4 5 3 12298 c1g5 f8b4 g5f6 b4c3
417,782<--2:5 20 16 66350 e2e3 f8b4 c1d2 e8g8 f1d3
417,943<--2:move e2e3
417,943*2*Found move:e2-e3
418,103*1*Start calc, move no: 7
418,105-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3
418,105-->1:go wtime 9346 btime 8893 winc 100 binc 100
418,110<--1:info score cp -5 depth 1 nodes 1 time 0 pv f8b4
418,110<--1:info score cp -5 depth 2 nodes 2 time 0 pv f8b4 f1d3
418,110<--1:info score cp -5 depth 3 nodes 3 time 0 pv f8b4 f1d3 e8g8
418,110<--1:info score cp -5 depth 4 nodes 4 time 0 pv f8b4 f1d3 e8g8 e1g1
418,110<--1:info score cp -5 depth 5 nodes 5 time 0 pv f8b4 f1d3 e8g8 e1g1 c8d7
418,453<--1:bestmove f8b4
418,453*1*Found move:Bf8-b4
418,604*2*Start calc, move no: 8
418,846-->2:time 935
418,846-->2:otim 855
418,846-->2:f8b4
418,848<--2:1 35 0 64 c1d2
418,848<--2:2 -5 0 342 c1d2 e8g8
418,851<--2:3 20 0 2299 c1d2 e8g8 f1d3
418,877<--2:4 -8 3 14588 f1d3 b4c3 b2c3 e8g8 e1g1
419,130<--2:5 24 28 138184 c1d2 b4c3 d2c3 e8g8 f1d3
419,158<--2:move c1d2
419,158*2*Found move:Bc1-d2
419,309*1*Start calc, move no: 9
419,310-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2
419,310-->1:go wtime 9039 btime 8550 winc 100 binc 100
419,313<--1:info score cp -20 depth 1 nodes 1 time 0 pv b8c6
419,313<--1:info score cp -20 depth 2 nodes 2 time 0 pv b8c6 f1e2
419,313<--1:info score cp -20 depth 3 nodes 3 time 0 pv b8c6 f1e2 e8g8
419,314<--1:info score cp -20 depth 4 nodes 4 time 0 pv b8c6 f1e2 e8g8 e1g1
419,332<--1:info score cp -5 depth 5 nodes 22919 time 21 pv b8c6 f1d3 e8g8 e1g1 c8d7
419,647<--1:bestmove b8c6
419,647*1*Found move:Nb8-c6
419,819*2*Start calc, move no: 10
420,059-->2:time 904
420,059-->2:otim 822
420,059-->2:b8c6
420,062<--2:1 25 0 116 f1d3
420,064<--2:2 0 0 634 f1b5 c8d7
420,070<--2:3 25 1 2750 f1d3 b4c3 d2c3
420,110<--2:4 0 5 14078 f1b5 c8d7 b5c6 d7c6
420,184<--2:5 30 12 49275 f1b5 d8d6 b5c6 d6c6 f3e5 c6b6
420,361<--2:move f1b5
420,361*2*Found move:Bf1-b5
420,521*1*Start calc, move no: 11
420,522-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5
420,522-->1:go wtime 8742 btime 8218 winc 100 binc 100
420,530<--1:info score cp -15 depth 1 nodes 1 time 0 pv e8g8
420,530<--1:info score cp -15 depth 2 nodes 2 time 0 pv e8g8 b5c6
420,530<--1:info score cp -15 depth 3 nodes 3 time 0 pv e8g8 b5c6
420,530<--1:info score cp -15 depth 4 nodes 4 time 0 pv e8g8 b5c6
420,584<--1:info score cp 0 depth 5 nodes 26203 time 61 pv e8g8 e1g1 c8d7 b5d3 b4d6
420,827<--1:info score cp -10 depth 6 nodes 289284 time 305 pv e8g8 e1g1 c8d7 d1e1 b4d6 e3e4
420,847<--1:bestmove e8g8
420,847*1*Found move:O-O
421,002*2*Start calc, move no: 12
421,242-->2:time 875
421,242-->2:otim 790
421,242-->2:e8g8
421,247<--2:1 32 0 63 b5c6 b7c6
421,248<--2:2 32 0 280 b5c6 b7c6
421,251<--2:3 36 0 1756 b5c6 b4c3 d2c3 b7c6
421,266<--2:4 36 2 9532 b5c6 b4c3 d2c3 b7c6
421,363<--2:5 53 11 60598 b5c6 b7c6 e1g1 c8b7 f3e5
421,537<--2:move b5c6
421,537*2*Found move:Bb5xc6
421,690*1*Start calc, move no: 13
421,690-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6
421,690-->1:go wtime 8452 btime 7898 winc 100 binc 100
421,696<--1:info score cp -10 depth 1 nodes 1 time 0 pv b7c6
421,696<--1:info score cp -10 depth 2 nodes 2 time 0 pv b7c6 c3e4
421,696<--1:info score cp -10 depth 3 nodes 3 time 0 pv b7c6 c3e4 b4e7
421,696<--1:info score cp -10 depth 4 nodes 4 time 0 pv b7c6 c3e4 b4e7 e4f6
421,723<--1:info score cp 0 depth 5 nodes 39110 time 31 pv b7c6 c3e4 f6e4 d2b4 f8e8
421,859<--1:info score cp -3 depth 6 nodes 191786 time 168 pv b7c6 f3e5 d8d6 a2a3 c6c5 a3b4
421,985<--1:info score cp -5 depth 7 nodes 349310 time 294 pv b7c6 f3e5 c6c5 e1g1 c5d4 e3d4 c7c5
422,006<--1:bestmove b7c6
422,006*1*Found move:b7xc6
422,176*2*Start calc, move no: 14
422,417-->2:time 846
422,417-->2:otim 759
422,417-->2:b7c6
422,419<--2:1 68 0 98 e1g1
422,419<--2:2 48 0 281 e1g1 c8b7
422,425<--2:3 53 0 2236 e1g1 c8b7 f3e5
422,441<--2:4 43 2 9957 e1g1 c8a6 f1e1 a6c4
422,530<--2:5 45 11 53334 e1g1 c8b7 a2a3 b4d6 a3a4
422,700<--2:move e1g1
422,700*2*Found move:O-O
422,854*1*Start calc, move no: 15
422,856-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1
422,856-->1:go wtime 8174 btime 7587 winc 100 binc 100
422,860<--1:info score cp -5 depth 1 nodes 1 time 0 pv c8a6
422,860<--1:info score cp -5 depth 2 nodes 2 time 0 pv c8a6 f1e1
422,860<--1:info score cp -5 depth 3 nodes 3 time 0 pv c8a6 f1e1 f8e8
422,860<--1:info score cp -5 depth 4 nodes 4 time 0 pv c8a6 f1e1 f8e8 f3e5
422,860<--1:info score cp -5 depth 5 nodes 5 time 0 pv c8a6 f1e1 f8e8 f3e5 c6c5
423,162<--1:bestmove c8a6
423,162*1*Found move:Bc8-a6
423,319*2*Start calc, move no: 16
423,559-->2:time 818
423,559-->2:otim 729
423,559-->2:c8a6
423,563<--2:1 58 0 335 f1e1
423,564<--2:2 43 0 572 f1e1 a6c4
423,570<--2:3 48 1 2931 f1e1 a6c4 f3e5
423,590<--2:4 43 3 13229 f1e1 b4c3 d2c3 a6c4
423,731<--2:5 44 17 84626 f1e1 a8b8 f3e5 c6c5 a2a4
423,834<--2:move f1e1
423,834*2*Found move:Rf1-e1
423,991*1*Start calc, move no: 17
423,992-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1
423,992-->1:go wtime 7904 btime 7286 winc 100 binc 100
423,997<--1:info score cp -7 depth 1 nodes 1 time 0 pv b4d6
423,997<--1:info score cp -7 depth 2 nodes 2 time 0 pv b4d6 f3e5
423,997<--1:info score cp -7 depth 3 nodes 3 time 0 pv b4d6 f3e5 d8b8
423,997<--1:info score cp -7 depth 4 nodes 4 time 0 pv b4d6 f3e5 d8b8 a1b1
424,066<--1:info score cp 3 depth 5 nodes 96757 time 73 pv a8b8 f3e5 b4d6 e5c6 d6h2
424,285<--1:bestmove a8b8
424,285*1*Found move:Ra8-b8
424,437*2*Start calc, move no: 18
424,679-->2:time 791
424,679-->2:otim 700
424,679-->2:a8b8
424,683<--2:1 53 0 111 f3e5
424,684<--2:2 44 0 617 a2a3 b4d6
424,684<--2:3 44 0 2690 a2a3 b4d6 a1a2
424,715<--2:4 39 3 10474 f3e5 a6b7 a2a3 b4d6
424,847<--2:5 44 16 61305 f3e5 a6b7 a2a3 b4c3 d2c3
424,945<--2:move f3e5
424,945*2*Found move:Nf3-e5
425,105*1*Start calc, move no: 19
425,105-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5
425,105-->1:go wtime 8643 btime 6998 winc 100 binc 100
425,108<--1:info score cp -10 depth 1 nodes 1 time 0 pv d8e8
425,108<--1:info score cp -10 depth 2 nodes 2 time 0 pv d8e8 f2f4
425,108<--1:info score cp -10 depth 3 nodes 3 time 0 pv d8e8 f2f4 c6c5
425,108<--1:info score cp -10 depth 4 nodes 4 time 0 pv d8e8 f2f4 c6c5 a1c1
425,138<--1:info score cp -10 depth 5 nodes 42096 time 34 pv d8e8 a1b1 b4d6 e3e4 c6c5
425,295<--1:info score cp -8 depth 6 nodes 254615 time 191 pv d8e8 a1b1 b4d6 e3e4 c6c5 d2f4
425,390<--1:bestmove d8e8
425,390*1*Found move:Qd8-e8
425,542*2*Start calc, move no: 20
425,784-->2:time 865
425,784-->2:otim 772
425,784-->2:d8e8
425,791<--2:1 55 0 252 a2a4
425,791<--2:2 49 0 912 a2a3 b4d6
425,805<--2:3 44 1 7249 d1c1 c6c5 a2a4
425,833<--2:4 39 4 23965 d1c1 a6b7 a2a3 b4d6
426,005<--2:5 43 21 127098 a1b1 b4c3 d2c3 f6e4 c3d2
426,075<--2:move a1b1
426,075*2*Found move:Ra1-b1
426,229*1*Start calc, move no: 21
426,229-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1
426,229-->1:go wtime 8357 btime 7718 winc 100 binc 100
426,233<--1:info score cp -8 depth 1 nodes 1 time 0 pv b4d6
426,233<--1:info score cp -8 depth 2 nodes 2 time 0 pv b4d6 e3e4
426,233<--1:info score cp -8 depth 3 nodes 3 time 0 pv b4d6 e3e4 c6c5
426,233<--1:info score cp -8 depth 4 nodes 4 time 0 pv b4d6 e3e4 c6c5 d2f4
426,233<--1:info score cp -8 depth 5 nodes 5 time 0 pv b4d6 e3e4 c6c5 d2f4 c5d4
426,408<--1:info score cp -8 depth 6 nodes 219012 time 177 pv b4d6 e3e4 c6c5 d2f4 c5d4 d1d4
426,539<--1:bestmove b4d6
426,539*1*Found move:Bb4-d6
426,700*2*Start calc, move no: 22
426,942-->2:time 836
426,942-->2:otim 742
426,942-->2:b4d6
426,944<--2:1 55 0 161 e3e4 d6e5 d4e5
426,946<--2:2 55 0 447 e3e4 d6e5 d4e5
426,952<--2:3 52 0 3253 e3e4 c6c5 e4d5 e6d5
426,982<--2:4 51 4 15588 e3e4 a6b7 e5g4 f6g4 d1g4
427,118<--2:5 47 17 91694 e3e4 c6c5 d2f4 a6b7 e4d5 e6d5
427,220<--2:move e3e4
427,220*2*Found move:e3-e4
427,372*1*Start calc, move no: 23
427,372-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4
427,372-->1:go wtime 8084 btime 7413 winc 100 binc 100
427,377<--1:info score cp 2 depth 1 nodes 1 time 0 pv c6c5
427,377<--1:info score cp 2 depth 2 nodes 2 time 0 pv c6c5 d2f4
427,377<--1:info score cp 2 depth 3 nodes 3 time 0 pv c6c5 d2f4 c5d4
427,377<--1:info score cp 2 depth 4 nodes 4 time 0 pv c6c5 d2f4 c5d4 d1d4
427,377<--1:info score cp 2 depth 5 nodes 5 time 0 pv c6c5 d2f4 c5d4 d1d4 c7c5
427,472<--1:info score cp 2 depth 6 nodes 142116 time 99 pv c6c5 d2f4 c5d4 d1d4 c7c5 d4d2
427,671<--1:bestmove c6c5
427,671*1*Found move:c6-c5
427,823*2*Start calc, move no: 24
428,063-->2:time 809
428,063-->2:otim 712
428,063-->2:c6c5
428,067<--2:1 52 0 332 e4d5 e6d5
428,070<--2:2 52 0 698 e4d5 e6d5
428,083<--2:3 47 1 9039 d2f4 c7c6 a2a4 c5d4 d1d4
428,133<--2:4 34 7 34547 d2f4 c5d4 d1d4 c7c5
428,305<--2:5 34 24 138515 d2f4 c5d4 d1d4 c7c5 d4e3
428,334<--2:move d2f4
428,334*2*Found move:Bd2-f4
428,491*1*Start calc, move no: 25
428,492-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4
428,492-->1:go wtime 7818 btime 7119 winc 100 binc 100
428,497<--1:info score cp 2 depth 1 nodes 1 time 0 pv c5d4
428,497<--1:info score cp 2 depth 2 nodes 2 time 0 pv c5d4 d1d4
428,497<--1:info score cp 2 depth 3 nodes 3 time 0 pv c5d4 d1d4 c7c5
428,497<--1:info score cp 2 depth 4 nodes 4 time 0 pv c5d4 d1d4 c7c5 d4d2
428,497<--1:info score cp 2 depth 5 nodes 5 time 0 pv c5d4 d1d4 c7c5 d4d2 a6b7
428,599<--1:info score cp 2 depth 6 nodes 149617 time 108 pv c5d4 d1d4 c7c5 d4d1 b8b4 f2f3
428,781<--1:bestmove c5d4
428,781*1*Found move:c5xd4
428,936*2*Start calc, move no: 26
429,176-->2:time 782
429,176-->2:otim 684
429,176-->2:c5d4
429,182<--2:1 48 0 534 d1d4
429,182<--2:2 34 0 1175 d1d4 c7c5
429,193<--2:3 34 1 4547 d1d4 c7c5 d4e3
429,240<--2:4 34 6 18591 d1d4 c7c5 d4d1 d6e5 f4e5
429,403<--2:5 23 22 118167 d1d4 c7c5 d4d2 d5d4 c3d1
429,441<--2:move d1d4
429,441*2*Found move:Qd1xd4
429,596*1*Start calc, move no: 27
429,596-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4
429,596-->1:go wtime 7558 btime 6835 winc 100 binc 100
429,599<--1:info score cp 0 depth 1 nodes 1 time 0 pv c7c5
429,599<--1:info score cp 0 depth 2 nodes 2 time 1 pv c7c5 d4d2
429,599<--1:info score cp 0 depth 3 nodes 3 time 1 pv c7c5 d4d2 d5d4
429,599<--1:info score cp 0 depth 4 nodes 4 time 1 pv c7c5 d4d2 d5d4 d2d1
429,601<--1:info score cp 0 depth 5 nodes 5 time 1 pv c7c5 d4d2 d5d4 d2d1 d6e5
429,874<--1:bestmove c7c5
429,874*1*Found move:c7-c5
430,038*2*Start calc, move no: 28
430,278-->2:time 756
430,278-->2:otim 657
430,278-->2:c7c5
430,281<--2:1 34 0 391 d4d2
430,284<--2:2 34 0 1250 d4d1 d6e5 f4e5
430,304<--2:3 23 2 12160 d4d2 d5d4 c3d1
430,354<--2:4 13 7 39769 d4d2 d5d4 c3d1 a6b7
430,528<--2:5 11 24 146145 d4d2 d5d4 c3d1 a6b7 f2f3
430,533<--2:move d4d2
430,533*2*Found move:Qd4-d2
430,730*1*Start calc, move no: 29
430,730-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2
430,730-->1:go wtime 7308 btime 6562 winc 100 binc 100
430,732<--1:info score cp 7 depth 1 nodes 1 time 0 pv d5d4
430,735<--1:info score cp 7 depth 2 nodes 2 time 0 pv d5d4 c3d1
430,735<--1:info score cp 7 depth 3 nodes 3 time 0 pv d5d4 c3d1 g7g5
430,735<--1:info score cp 7 depth 4 nodes 4 time 0 pv d5d4 c3d1 g7g5 f4g3
430,761<--1:info score cp 12 depth 5 nodes 37623 time 29 pv d5d4 c3d1 b8d8 b1c1 a6b5
430,913<--1:info score cp 17 depth 6 nodes 197096 time 182 pv d5d4 c3d1 f6h5 e5g6 h5f4 g6f4
431,002<--1:bestmove d5d4
431,002*1*Found move:d5-d4
431,155*2*Start calc, move no: 30
431,397-->2:time 731
431,397-->2:otim 630
431,397-->2:d5d4
431,404<--2:1 23 0 3171 c3d1
431,412<--2:2 13 1 7430 c3d1 a6b7
431,436<--2:3 11 3 19374 c3d1 a6b7 f2f3
431,490<--2:4 8 9 45480 c3d1 a6b7 d2d3 b7c6
431,641<--2:move c3d1
431,641*2*Found move:Nc3-d1
431,808*1*Start calc, move no: 31
431,810-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1
431,810-->1:go wtime 7069 btime 6295 winc 100 binc 100
431,813<--1:info score cp 32 depth 1 nodes 1 time 0 pv f6h5
431,813<--1:info score cp 32 depth 2 nodes 2 time 0 pv f6h5
431,813<--1:info score cp 32 depth 3 nodes 3 time 0 pv f6h5
431,814<--1:info score cp 32 depth 4 nodes 4 time 0 pv f6h5
431,814<--1:info score cp 32 depth 5 nodes 5 time 0 pv f6h5
432,009<--1:info score cp 100 depth 6 nodes 268580 time 200 pv f6h5 g2g3 g7g5 e5f7 d6f4 g3f4
432,070<--1:bestmove f6h5
432,070*1*Found move:Nf6-h5
432,229*2*Start calc, move no: 32
432,470-->2:time 707
432,470-->2:otim 604
432,470-->2:f6h5
432,471<--2:1 21 0 484 c2c3 h5f4 d2f4 d6e5 f4e5
432,474<--2:2 19 0 1283 a2a3 h5f4 d2f4 d6e5 f4e5
432,489<--2:3 18 1 8046 e5g6 h5f4 g6f4
432,518<--2:4 0 4 23024 e5g6 h5f4 g6f4 e6e5
432,706<--2:move e5g6
432,706*2*Found move:Ne5-g6
432,875*1*Start calc, move no: 33
432,875-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6
432,876-->1:go wtime 6838 btime 6040 winc 100 binc 100
432,880<--1:info score cp 100 depth 1 nodes 1 time 0 pv h5f4
432,880<--1:info score cp 100 depth 2 nodes 2 time 0 pv h5f4 g6f4
432,880<--1:info score cp 100 depth 3 nodes 3 time 0 pv h5f4 g6f4 e8a4
432,880<--1:info score cp 100 depth 4 nodes 4 time 0 pv h5f4 g6f4 e8a4 f4e6
432,917<--1:info score cp 15 depth 5 nodes 55421 time 40 pv h5f4 g6f8 e8f8 e4e5 f4e2
433,018<--1:info score cp 100 depth 6 nodes 184472 time 142 pv d6f4 g6f4 h5f4 d2f4 e8d7 b1c1
433,130<--1:bestmove d6f4
433,130*1*Found move:Bd6xf4
433,296*2*Start calc, move no: 34
433,537-->2:time 684
433,537-->2:otim 579
433,537-->2:d6f4
433,544<--2:1 18 0 59 g6f4 h5f4 d2f4
433,544<--2:2 18 0 258 g6f4 h5f4 d2f4
433,544<--2:3 18 0 1516 g6f4 h5f4 d2f4
433,553<--2:4 0 1 7587 g6f4 h5f4 d2f4 e6e5
433,618<--2:5 -82 7 42694 g6f4 h5f4 d2f4 e8a4 f4d2 a4a2
433,767<--2:move g6f4
433,767*2*Found move:Ng6xf4
433,926*1*Start calc, move no: 35
433,927-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4
433,927-->1:go wtime 6613 btime 5790 winc 100 binc 100
433,930<--1:info score cp 90 depth 1 nodes 1 time 0 pv h5f4
433,930<--1:info score cp 90 depth 2 nodes 2 time 0 pv h5f4 d2f4
433,930<--1:info score cp 90 depth 3 nodes 3 time 0 pv h5f4 d2f4 e8a4
433,930<--1:info score cp 90 depth 4 nodes 4 time 0 pv h5f4 d2f4 e8a4 b1c1
433,930<--1:info score cp 90 depth 5 nodes 5 time 0 pv h5f4 d2f4 e8a4 b1c1 a4a2
433,978<--1:info score cp 87 depth 6 nodes 58014 time 50 pv h5f4 d2f4 e8a4 f4d2 a4a2 b1c1
434,064<--1:info score cp 55 depth 7 nodes 170699 time 136 pv h5f4 d2f4 e8a4 b1a1 a4a5 c2c3 d4d3
434,173<--1:bestmove h5f4
434,173*1*Found move:Nh5xf4
434,325*2*Start calc, move no: 36
434,566-->2:time 662
434,566-->2:otim 555
434,566-->2:h5f4
434,569<--2:1 18 0 32 d2f4
434,570<--2:2 0 0 211 d2f4 e6e5
434,573<--2:3 -82 0 1997 d2f4 e8a4 f4d2 a4a2
434,588<--2:4 -82 2 9474 d2f4 e8a4 f4d2 a4a2
434,674<--2:5 -78 10 58896 d2f4 e8a4 b2b3 a4a2 d1b2
434,786<--2:move d2f4
434,786*2*Found move:Qd2xf4
434,992*1*Start calc, move no: 37
434,992-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4
434,992-->1:go wtime 6398 btime 5549 winc 100 binc 100
434,997<--1:info score cp 55 depth 1 nodes 1 time 0 pv e8a4
434,997<--1:info score cp 55 depth 2 nodes 2 time 0 pv e8a4 b2b3
434,997<--1:info score cp 55 depth 3 nodes 3 time 0 pv e8a4 b2b3 a4a2
434,997<--1:info score cp 55 depth 4 nodes 4 time 0 pv e8a4 b2b3 a4a2 f4c7
434,997<--1:info score cp 55 depth 5 nodes 5 time 0 pv e8a4 b2b3 a4a2 f4c7 a2b1
435,164<--1:info score cp 52 depth 6 nodes 126232 time 171 pv e8a4 b2b3 a4a2 f4c7 a2b1 c7b8
435,230<--1:bestmove e8a4
435,230*1*Found move:Qe8-a4
435,390*2*Start calc, move no: 38
435,630-->2:time 640
435,630-->2:otim 532
435,630-->2:e8a4
435,635<--2:1 -82 0 427 f4d2 a4a2
435,635<--2:2 -82 0 1198 f4d2 a4a2
435,643<--2:3 -78 1 5469 b2b3 a4a2 d1b2
435,695<--2:4 -87 6 31356 f4c1 a4a5 c2c3 a5a2
435,845<--2:move a2a3
435,845*2*Found move:a2-a3
436,011*1*Start calc, move no: 39
436,011-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3
436,011-->1:go wtime 7188 btime 5316 winc 100 binc 100
436,013<--1:info score cp 75 depth 1 nodes 1 time 0 pv a4c2
436,014<--1:info score cp 75 depth 2 nodes 2 time 0 pv a4c2 b1c1
436,014<--1:info score cp 75 depth 3 nodes 3 time 0 pv a4c2 b1c1 b8c8
436,014<--1:info score cp 75 depth 4 nodes 4 time 0 pv a4c2 b1c1 b8c8 c1c2
436,145<--1:info score cp 70 depth 5 nodes 132611 time 133 pv a4a5 c2c3 d4d3 b1c1 a6c4
436,240<--1:bestmove a4a5
436,240*1*Found move:Qa4-a5
436,399*2*Start calc, move no: 40
436,641-->2:time 719
436,641-->2:otim 610
436,641-->2:a4a5
436,643<--2:1 14 0 163 c2c3
436,643<--2:2 -90 0 450 c2c3 d4d3
436,651<--2:3 -75 0 3017 c2c3 d4d3 d1e3
436,671<--2:4 -96 3 12287 c2c3 d4d3 e4e5 a6b7
436,847<--2:5 -81 20 97667 c2c3 d4d3 e4e5 a6b7 d1e3
436,882<--2:move c2c3
436,882*2*Found move:c2-c3
437,045*1*Start calc, move no: 41
437,047-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3
437,047-->1:go wtime 6952 btime 6092 winc 100 binc 100
437,051<--1:info score cp 65 depth 1 nodes 1 time 0 pv d4d3
437,051<--1:info score cp 65 depth 2 nodes 2 time 0 pv d4d3 f4d6
437,051<--1:info score cp 65 depth 3 nodes 3 time 0 pv d4d3 f4d6 f8d8
437,051<--1:info score cp 65 depth 4 nodes 4 time 0 pv d4d3 f4d6 f8d8 d6e5
437,086<--1:info score cp 70 depth 5 nodes 40717 time 38 pv d4d3 f4d2 f7f5 b1c1 f5e4
437,234<--1:info score cp 70 depth 6 nodes 208807 time 187 pv d4c3 d1c3 a6d3 b1d1 d3c2 b2b4
437,303<--1:bestmove d4c3
437,303*1*Found move:d4xc3
437,462*2*Start calc, move no: 42
437,703-->2:time 696
437,703-->2:otim 585
437,703-->2:d4c3
437,708<--2:1 50 0 66 d1c3
437,709<--2:2 35 0 391 d1c3 f8d8
437,709<--2:3 45 0 2568 d1c3 f8d8 e1c1
437,740<--2:4 35 3 13137 d1c3 f8d8 e1d1 d8d1 c3d1
437,892<--2:5 -77 18 81521 d1c3 a6d3 b1d1 d3c2 b2b4 c5b4 a3b4 b8b4
437,937<--2:move d1c3
437,937*2*Found move:Nd1xc3
438,105*1*Start calc, move no: 43
438,106-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3
438,106-->1:go wtime 6723 btime 5841 winc 100 binc 100
438,110<--1:info score cp 70 depth 1 nodes 1 time 0 pv a6d3
438,110<--1:info score cp 70 depth 2 nodes 2 time 0 pv a6d3 b1d1
438,110<--1:info score cp 70 depth 3 nodes 3 time 0 pv a6d3 b1d1 d3c2
438,110<--1:info score cp 70 depth 4 nodes 4 time 0 pv a6d3 b1d1 d3c2 b2b4
438,110<--1:info score cp 70 depth 5 nodes 5 time 0 pv a6d3 b1d1 d3c2 b2b4 c5b4
438,162<--1:info score cp 115 depth 6 nodes 71814 time 55 pv a6d3 b1d1 d3c2 d1c1 b8b2 f4d2
438,351<--1:bestmove a6d3
438,351*1*Found move:Ba6-d3
438,506*2*Start calc, move no: 44
438,747-->2:time 673
438,747-->2:otim 561
438,747-->2:a6d3
438,754<--2:1 50 0 369 b1d1
438,755<--2:2 45 0 981 b1d1 b8d8
438,759<--2:3 -77 0 4710 b1d1 d3c2 b2b4 c5b4 a3b4 b8b4
438,805<--2:4 -77 5 29471 b1d1 d3c2 b2b4 c5b4 a3b4 b8b4
438,974<--2:move b1d1
438,975*2*Found move:Rb1-d1
439,151*1*Start calc, move no: 45
439,153-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1
439,153-->1:go wtime 6501 btime 5601 winc 100 binc 100
439,157<--1:info score cp 115 depth 1 nodes 1 time 0 pv d3c2
439,157<--1:info score cp 115 depth 2 nodes 2 time 0 pv d3c2 f4c1
439,157<--1:info score cp 115 depth 3 nodes 3 time 0 pv d3c2 f4c1 c2d1
439,157<--1:info score cp 115 depth 4 nodes 4 time 0 pv d3c2 f4c1 c2d1 c3b1
439,157<--1:info score cp 115 depth 5 nodes 5 time 0 pv d3c2 f4c1 c2d1 c3b1 a5e1
439,219<--1:info score cp 135 depth 6 nodes 81205 time 65 pv d3c2 d1c1 b8b2 f4d2 f8d8 d2g5
439,390<--1:bestmove d3c2
439,390*1*Found move:Bd3-c2
439,543*2*Start calc, move no: 46
439,785-->2:time 651
439,785-->2:otim 537
439,785-->2:d3c2
439,786<--2:1 -77 0 551 b2b4 c5b4 a3b4 b8b4
439,789<--2:2 -77 0 1274 b2b4 c5b4 a3b4 b8b4
439,801<--2:3 -142 1 7183 f4c1 c2d1 e1d1
439,853<--2:4 -160 6 33807 f4c1 c2d1 e1d1 e6e5
440,002<--2:move f4c1
440,002*2*Found move:Qf4-c1
440,174*1*Start calc, move no: 47
440,175-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1
440,175-->1:go wtime 6289 btime 5369 winc 100 binc 100
440,176<--1:info score cp 115 depth 1 nodes 1 time 0 pv c2d1
440,176<--1:info score cp 115 depth 2 nodes 2 time 0 pv c2d1 f2f3
440,176<--1:info score cp 115 depth 3 nodes 3 time 0 pv c2d1 f2f3 d1f3
440,176<--1:info score cp 115 depth 4 nodes 4 time 0 pv c2d1 f2f3 d1f3 g2f3
440,177<--1:info score cp 115 depth 5 nodes 5 time 0 pv c2d1 f2f3 d1f3 g2f3 f7f5
440,271<--1:info score cp 200 depth 6 nodes 72697 time 94 pv c2d1 e1d1 f8d8 d1d2 a5b6 c3d1
440,413<--1:bestmove c2d1
440,413*1*Found move:Bc2xd1
440,569*2*Start calc, move no: 48
440,810-->2:time 629
440,810-->2:otim 514
440,810-->2:c2d1
440,813<--2:1 -142 0 44 e1d1
440,816<--2:2 -160 0 703 e1d1 e6e5
440,824<--2:3 -157 1 3755 e1d1 f8d8 d1d8 b8d8
440,906<--2:4 -159 9 19838 e1d1 a5c7 a3a4 e6e5
441,019<--2:move e1d1
441,019*2*Found move:Re1xd1
441,178*1*Start calc, move no: 49
441,178-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1
441,178-->1:go wtime 6085 btime 5136 winc 100 binc 100
441,183<--1:info score cp 200 depth 1 nodes 1 time 0 pv f8d8
441,183<--1:info score cp 200 depth 2 nodes 2 time 0 pv f8d8 d1d2
441,183<--1:info score cp 200 depth 3 nodes 3 time 0 pv f8d8 d1d2 d8d2
441,183<--1:info score cp 200 depth 4 nodes 4 time 0 pv f8d8 d1d2 d8d2 c1d2
441,183<--1:info score cp 200 depth 5 nodes 5 time 0 pv f8d8 d1d2 d8d2 c1d2 b8d8
441,234<--1:info score cp 202 depth 6 nodes 45963 time 54 pv f8d8 d1d2 d8d2 c1d2 b8d8 d2c2
441,374<--1:info score cp 207 depth 7 nodes 248239 time 193 pv f8d8 d1d8 a5d8 c1c2 d8d4 g1h1 f7f5
441,403<--1:bestmove f8d8
441,403*1*Found move:Rf8-d8
441,561*2*Start calc, move no: 50
441,802-->2:time 609
441,802-->2:otim 492
441,802-->2:f8d8
441,805<--2:1 -157 0 64 d1d8 b8d8
441,806<--2:2 -148 0 312 d1d8 a5d8 e4e5
441,813<--2:3 -163 1 2288 d1d8 b8d8 e4e5 g8f8
441,834<--2:4 -155 3 12048 d1d8 b8d8 e4e5 c5c4 f2f4
441,951<--2:5 -168 14 86334 d1d8 a5d8 c1c2 e6e5 c3d5 c5c4
442,006<--2:move d1d8
442,006*2*Found move:Rd1xd8
442,161*1*Start calc, move no: 51
442,161-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8
442,161-->1:go wtime 5886 btime 4916 winc 100 binc 100
442,167<--1:info score cp 207 depth 1 nodes 1 time 0 pv a5d8
442,167<--1:info score cp 207 depth 2 nodes 2 time 0 pv a5d8 c1c2
442,167<--1:info score cp 207 depth 3 nodes 3 time 0 pv a5d8 c1c2 d8d4
442,167<--1:info score cp 207 depth 4 nodes 4 time 0 pv a5d8 c1c2 d8d4 a3a4
442,167<--1:info score cp 207 depth 5 nodes 5 time 0 pv a5d8 c1c2 d8d4 a3a4 f7f5
442,214<--1:info score cp 207 depth 6 nodes 55514 time 52 pv a5d8 c1c2 d8d4 a3a4 f7f5 c3d1
442,377<--1:bestmove a5d8
442,377*1*Found move:Qa5xd8
442,566*2*Start calc, move no: 52
442,809-->2:time 589
442,809-->2:otim 471
442,809-->2:a5d8
442,811<--2:1 -148 0 37 e4e5
442,814<--2:2 -158 0 372 e4e5 g8f8
442,823<--2:3 -152 1 3530 c3a4 d8d4 a4c3
442,851<--2:4 -168 4 19687 c1c2 e6e5 c3d5 c5c4
443,005<--2:move c3a4
443,005*2*Found move:Nc3-a4
443,175*1*Start calc, move no: 53
443,176-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4
443,176-->1:go wtime 5695 btime 4705 winc 100 binc 100
443,183<--1:info score cp 212 depth 1 nodes 1 time 0 pv d8d4
443,183<--1:info score cp 212 depth 2 nodes 2 time 0 pv d8d4 a4c5
443,183<--1:info score cp 212 depth 3 nodes 3 time 0 pv d8d4 a4c5 b8b2
443,183<--1:info score cp 212 depth 4 nodes 4 time 0 pv d8d4 a4c5 b8b2 c1b2
443,183<--1:info score cp 212 depth 5 nodes 5 time 0 pv d8d4 a4c5 b8b2 c1b2 d4b2
443,184<--1:info score cp 212 depth 6 nodes 6 time 1 pv d8d4 a4c5 b8b2 c1b2 d4b2 c5e6
443,274<--1:info score cp 217 depth 7 nodes 115634 time 98 pv d8d4 c1c2 f7f5 e4f5 e6f5 a4c3 d4d7
443,384<--1:bestmove d8d4
443,384*1*Found move:Qd8-d4
443,577*2*Start calc, move no: 54
443,818-->2:time 570
443,818-->2:otim 451
443,818-->2:d8d4
443,820<--2:1 -152 0 59 a4c3
443,820<--2:2 -170 0 312 a4c3 e6e5
443,824<--2:3 -170 0 2651 c1c2 e6e5 a4c3
443,850<--2:4 -175 3 9805 c1c2 e6e5 b2b3 d4a1
443,982<--2:5 -175 16 74798 a4c3 f7f5 e4f5 e6f5 a3a4
444,008<--2:move a4c3
444,008*2*Found move:Na4-c3
444,163*1*Start calc, move no: 55
444,164-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3
444,164-->1:go wtime 5510 btime 4502 winc 100 binc 100
444,166<--1:info score cp 215 depth 1 nodes 1 time 0 pv f7f5
444,166<--1:info score cp 215 depth 2 nodes 2 time 0 pv f7f5 c1c2
444,166<--1:info score cp 215 depth 3 nodes 3 time 0 pv f7f5 c1c2 f5e4
444,166<--1:info score cp 215 depth 4 nodes 4 time 0 pv f7f5 c1c2 f5e4 c3e4
444,166<--1:info score cp 215 depth 5 nodes 5 time 0 pv f7f5 c1c2 f5e4 c3e4 b8b2
444,166<--1:info score cp 215 depth 6 nodes 6 time 0 pv f7f5 c1c2 f5e4 c3e4 b8b2 c2b2
444,315<--1:info score cp 230 depth 7 nodes 200325 time 151 pv f7f5 e4f5
444,365<--1:bestmove f7f5
444,365*1*Found move:f7-f5
444,517*2*Start calc, move no: 56
444,757-->2:time 551
444,757-->2:otim 431
444,757-->2:f7f5
444,763<--2:1 -176 0 227 e4f5 e6f5
444,763<--2:2 -176 0 684 e4f5 e6f5
444,763<--2:3 -175 0 2523 e4f5 e6f5 a3a4
444,785<--2:4 -180 2 14135 e4f5 e6f5 c1c2 f5f4
444,871<--2:5 -178 11 72209 e4f5 e6f5 c1c2 c5c4 a3a4
444,940<--2:move e4f5
444,940*2*Found move:e4xf5
445,115*1*Start calc, move no: 57
445,116-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5
445,116-->1:go wtime 5332 btime 4306 winc 100 binc 100
445,120<--1:info score cp 217 depth 1 nodes 63 time 0 pv e6f5
445,120<--1:info score cp 230 depth 2 nodes 265 time 0 pv b8e8 f5e6
445,120<--1:info score cp 230 depth 3 nodes 1488 time 2 pv b8e8 f5e6 d4c3
445,128<--1:info score cp 230 depth 4 nodes 8092 time 11 pv b8e8 f5e6 d4c3 b2c3
445,130<--1:info score cp 230 depth 5 nodes 8459 time 11 pv b8e8 f5e6 d4c3 b2c3 g8h8
445,216<--1:info score cp 225 depth 6 nodes 127859 time 100 pv e6f5 c1e1 d4d7 e1b1 b8d8 f2f4
445,310<--1:bestmove e6f5
445,311*1*Found move:e6xf5
445,478*2*Start calc, move no: 58
445,719-->2:time 534
445,719-->2:otim 412
445,719-->2:e6f5
445,721<--2:1 -175 0 56 a3a4
445,722<--2:2 -180 0 451 c1c2 f5f4
445,727<--2:3 -178 0 3016 c1c2 c5c4 a3a4
445,769<--2:4 -190 5 16135 c1c2 f5f4 b2b3 g8f7
445,882<--2:5 -195 16 89032 c1c2 d4e5 c2d2 g8f7 a3a4
445,897<--2:move c1c2
445,897*2*Found move:Qc1-c2
446,049*1*Start calc, move no: 59
446,051-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2
446,051-->1:go wtime 6159 btime 4117 winc 100 binc 100
446,056<--1:info score cp 230 depth 1 nodes 1 time 0 pv b8d8
446,057<--1:info score cp 230 depth 2 nodes 2 time 0 pv b8d8 c2f5
446,057<--1:info score cp 230 depth 3 nodes 3 time 0 pv b8d8 c2f5 d8b8
446,057<--1:info score cp 230 depth 4 nodes 4 time 0 pv b8d8 c2f5 d8b8 c3e4
446,090<--1:info score cp 230 depth 5 nodes 48697 time 39 pv b8e8 c2b1 d4d1 b1d1 e8e1
446,241<--1:bestmove b8e8
446,241*1*Found move:Rb8-e8
446,413*2*Start calc, move no: 60
446,654-->2:time 616
446,654-->2:otim 494
446,654-->2:b8e8
446,657<--2:1 -79 0 32 c2f5
446,662<--2:2 -82 0 442 c2f5 c5c4
446,668<--2:3 -184 1 4474 c2b1 f5f4 a3a4
446,696<--2:4 -187 4 21607 c2b1 f5f4 a3a4 c5c4
446,858<--2:5 -191 20 129675 c2b1 d4e5 b1c1 g8f7 b2b3
446,862<--2:move c2b1
446,862*2*Found move:Qc2-b1
447,064*1*Start calc, move no: 61
447,065-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1
447,065-->1:go wtime 5956 btime 4932 winc 100 binc 100
447,071<--1:info score cp 230 depth 1 nodes 1 time 0 pv g8h8
447,071<--1:info score cp 230 depth 2 nodes 2 time 0 pv g8h8 h2h3
447,073<--1:info score cp 230 depth 3 nodes 3 time 0 pv g8h8 h2h3 d4e5
447,074<--1:info score cp 230 depth 4 nodes 4 time 0 pv g8h8 h2h3 d4e5 b1d1
447,126<--1:info score cp 232 depth 5 nodes 63112 time 61 pv d4d2 g1f1 d2d7 b1f5 d7f5
447,159<--1:info score cp 235 depth 6 nodes 102807 time 93 pv d4d2 g1f1 e8e6 b1a1 e6e7 f1g1
447,280<--1:bestmove d4d2
447,280*1*Found move:Qd4-d2
447,442*2*Start calc, move no: 62
447,683-->2:time 596
447,683-->2:otim 473
447,683-->2:d4d2
447,684<--2:1 -105 0 43 b1f5 d2b2 f5c5
447,688<--2:2 -105 0 371 b1f5 d2b2 f5c5
447,696<--2:3 -185 1 4353 g1f1 f5f4 f1g1
447,711<--2:4 -198 2 14348 g1f1 d2d7 b1a2 d7f7 b2b3
447,815<--2:5 -215 13 88144 g1f1 c5c4 c3b5 e8e2 b1f5 d2b2 b5a7
447,881<--2:move g1f1
447,881*2*Found move:Kg1-f1
448,060*1*Start calc, move no: 63
448,061-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1
448,061-->1:go wtime 5763 btime 4722 winc 100 binc 100
448,067<--1:info score cp 240 depth 1 nodes 1 time 0 pv e8e5
448,067<--1:info score cp 240 depth 2 nodes 2 time 0 pv e8e5 h2h3
448,067<--1:info score cp 240 depth 3 nodes 3 time 0 pv e8e5 h2h3 g8h8
448,067<--1:info score cp 240 depth 4 nodes 4 time 0 pv e8e5 h2h3 g8h8 f1g1
448,067<--1:info score cp 240 depth 5 nodes 5 time 0 pv e8e5 h2h3 g8h8 f1g1 h8g8
448,269<--1:bestmove e8e5
448,269*1*Found move:Re8-e5
448,444*2*Start calc, move no: 64
448,684-->2:time 577
448,684-->2:otim 452
448,684-->2:e8e5
448,688<--2:1 -181 0 59 f1g1
448,688<--2:2 -191 0 347 b1a2 g8f8 f1g1
448,693<--2:3 -200 0 3462 a3a4 g8f7 f1g1
448,715<--2:4 -210 3 16353 a3a4 g8f7 b1a2 f7f6 f1g1
448,879<--2:move a3a4
448,879*2*Found move:a3-a4
449,041*1*Start calc, move no: 65
449,041-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4
449,041-->1:go wtime 5573 btime 4519 winc 100 binc 100
449,045<--1:info score cp 240 depth 1 nodes 1 time 0 pv g8h8
449,045<--1:info score cp 240 depth 2 nodes 2 time 0 pv g8h8 b1f5
449,045<--1:info score cp 240 depth 3 nodes 3 time 0 pv g8h8 b1f5 e5f5
449,068<--1:info score cp 240 depth 4 nodes 31150 time 26 pv e5e6 f1g1 e6e1 b1e1
449,122<--1:info score cp 245 depth 5 nodes 99081 time 79 pv d2f4 h2h3 f4d4 f1g1 d4d2
449,244<--1:bestmove d2f4
449,244*1*Found move:Qd2-f4
449,403*2*Start calc, move no: 66
449,643-->2:time 558
449,643-->2:otim 433
449,643-->2:d2f4
449,645<--2:1 -180 0 95 f1g1
449,645<--2:2 -190 0 413 b1a2 g8f8 f1g1
449,650<--2:3 -198 0 2393 f1g1 g8f7 b2b3
449,686<--2:4 -208 4 16680 f1g1 g8f8 b2b3 f8e7
449,831<--2:move f1g1
449,831*2*Found move:Kf1-g1
450,000*1*Start calc, move no: 67
450,002-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1
450,002-->1:go wtime 5390 btime 4321 winc 100 binc 100
450,009<--1:info score cp 240 depth 1 nodes 1 time 0 pv e5e1
450,009<--1:info score cp 240 depth 2 nodes 2 time 0 pv e5e1 b1e1
450,009<--1:info score cp 240 depth 3 nodes 3 time 0 pv e5e1 b1e1 f4d4
450,009<--1:info score cp 240 depth 4 nodes 4 time 0 pv e5e1 b1e1 f4d4 c3b5
450,016<--1:info score cp 240 depth 5 nodes 5501 time 13 pv e5e1 b1e1 f4d4 c3b5 d4a4
450,153<--1:info score cp 240 depth 6 nodes 168692 time 150 pv f4f2 g1f2 h7h6 a4a5 e5e2 f2e2
450,202<--1:bestmove f4f2
450,202*1*Found move:Qf4xf2
450,367*2*Start calc, move no: 68
450,609-->2:time 539
450,609-->2:otim 413
450,609-->2:f4f2
450,610<--2:1 612 0 29 g1f2 g8f7
450,615<--2:2 622 0 173 g1f2 g8f7 f2f3
450,615<--2:3 612 0 1125 g1f2 g8f7 b1a2 f7e7 f2f3
450,633<--2:4 612 2 7561 g1f2 g8f7 f2f3 f7e6 f3f4
450,753<--2:5 644 14 90294 g1f2 c5c4 b1a2 e5c5 f2e3 g8f7
450,788<--2:move g1f2
450,788*2*Found move:Kg1xf2
450,942*1*Start calc, move no: 69
450,943-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2
450,943-->1:go wtime 5216 btime 4126 winc 100 binc 100
450,947<--1:info score cp 240 depth 1 nodes 1 time 0 pv h7h6
450,947<--1:info score cp 240 depth 2 nodes 2 time 0 pv h7h6 b1a2
450,947<--1:info score cp 240 depth 3 nodes 3 time 0 pv h7h6 b1a2 g8h8
450,947<--1:info score cp 240 depth 4 nodes 4 time 0 pv h7h6 b1a2 g8h8 a2c4
450,947<--1:info score cp 240 depth 5 nodes 5 time 0 pv h7h6 b1a2 g8h8 a2c4 g7g5
451,010<--1:info score cp -695 depth 6 nodes 75080 time 67 pv c5c4 b1a2 h7h6 a2c4 g8h8 c3d5
451,131<--1:bestmove c5c4
451,131*1*Found move:c5-c4
451,297*2*Start calc, move no: 70
451,537-->2:time 522
451,537-->2:otim 395
451,537-->2:c5c4
451,539<--2:1 639 0 40 f2f3
451,540<--2:2 644 0 246 b1a2 e5c5
451,541<--2:3 664 0 1254 b1a2 e5c5 f2e3
451,553<--2:4 644 1 6592 b1a2 e5c5 f2e3 g8f7
451,617<--2:5 716 7 58860 b1d1 a7a5 d1d4 e5e7 d4c4
451,713<--2:move b1d1
451,713*2*Found move:Qb1-d1
451,870*1*Start calc, move no: 71
451,871-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2 c5c4 b1d1
451,871-->1:go wtime 5045 btime 3943 winc 100 binc 100
451,873<--1:info score cp -708 depth 1 nodes 1 time 0 pv a7a6
451,873<--1:info score cp -685 depth 2 nodes 156 time 0 pv e5e6 c3d5
451,877<--1:info score cp -740 depth 3 nodes 1873 time 1 pv e5c5 d1d8 g8f7
451,882<--1:info score cp -790 depth 4 nodes 9897 time 10 pv e5e8 d1d5 g8h8 d5b5
451,900<--1:info score cp -790 depth 5 nodes 29849 time 29 pv e5e8 d1d4 g8h8 d4a7 h8g8
451,943<--1:info score cp -795 depth 6 nodes 79061 time 73 pv e5e8 d1d5 g8h8 d5d7 e8b8 c3d1
452,005<--1:info score cp -795 depth 7 nodes 145118 time 134 pv e5e8 d1d5 g8h8 d5d7 e8b8 c3d1 h8g8
452,056<--1:bestmove e5e8
452,056*1*Found move:Re5-e8
452,208*2*Start calc, move no: 72
452,449-->2:time 505
452,449-->2:otim 377
452,449-->2:e5e8
452,454<--2:1 639 0 38 f2f3
452,454<--2:2 725 0 366 d1d5 g8f8 d5f5
452,459<--2:3 743 0 2432 d1d5 g8h8 d5b5 e8f8 b5c4
452,477<--2:4 745 2 10898 d1d5 g8h8 d5f5 h8g8 f2f3
452,588<--2:5 758 13 80576 d1d5 g8h8 d5b7 a7a5 b7b5 e8a8 b5f5
452,617<--2:move d1d5
452,617*2*Found move:Qd1-d5
452,780*1*Start calc, move no: 73
452,781-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2 c5c4 b1d1 e5e8 d1d5
452,781-->1:go wtime 4882 btime 3763 winc 100 binc 100
452,783<--1:info score cp -795 depth 1 nodes 1 time 0 pv g8h8
452,783<--1:info score cp -795 depth 2 nodes 2 time 0 pv g8h8 d5d7
452,783<--1:info score cp -795 depth 3 nodes 3 time 0 pv g8h8 d5d7 e8b8
452,784<--1:info score cp -795 depth 4 nodes 4 time 0 pv g8h8 d5d7 e8b8 d7d8
452,784<--1:info score cp -795 depth 5 nodes 5 time 0 pv g8h8 d5d7 e8b8 d7d8 b8d8
452,784<--1:info score cp -795 depth 6 nodes 6 time 0 pv g8h8 d5d7 e8b8 d7d8 b8d8 c3d5
452,958<--1:bestmove g8h8
452,958*1*Found move:Kg8-h8
453,123*2*Start calc, move no: 74
453,364-->2:time 489
453,364-->2:otim 360
453,364-->2:g8h8
453,367<--2:1 745 0 39 d5f5
453,368<--2:2 743 0 503 d5b5 e8f8 b5c4
453,368<--2:3 745 0 3169 d5f5 h8g8 f2f3
453,393<--2:4 758 2 18326 d5b7 a7a5 b7b5 e8a8 b5f5
453,529<--2:move d5f5
453,529*2*Found move:Qd5xf5
453,685*1*Start calc, move no: 75
453,686-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2 c5c4 b1d1 e5e8 d1d5 g8h8 d5f5
453,686-->1:go wtime 4722 btime 3591 winc 100 binc 100
453,689<--1:info score cp -780 depth 1 nodes 1 time 0 pv h8g8
453,689<--1:info score cp -780 depth 2 nodes 2 time 0 pv h8g8 c3d5
453,689<--1:info score cp -780 depth 3 nodes 3 time 0 pv h8g8 c3d5 e8f8
453,689<--1:info score cp -695 depth 4 nodes 700 time 1 pv h8g8 c3d5 e8f8 d5e7
453,740<--1:info score cp -875 depth 5 nodes 66102 time 54 pv e8d8 f5f4 h7h6 f4c4 d8d2
453,813<--1:info score cp -845 depth 6 nodes 155097 time 126 pv e8b8 f5f8 b8f8 f2e2 f8e8 e2f3
453,858<--1:bestmove e8b8
453,858*1*Found move:Re8-b8
454,031*2*Start calc, move no: 76
454,271-->2:time 473
454,271-->2:otim 343
454,271-->2:e8b8
454,273<--2:1 750 0 76 f5c2
454,274<--2:2 740 0 270 f5c2 h8g8
454,278<--2:3 755 0 2363 f5c2 b8f8 f2e3 h8g8
454,306<--2:4 755 3 22061 f2e3 h8g8 f5f2 b8f8
454,429<--2:move f2e3
454,429*2*Found move:Kf2-e3
454,580*1*Start calc, move no: 77
454,582-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2 c5c4 b1d1 e5e8 d1d5 g8h8 d5f5 e8b8 f2e3
454,582-->1:go wtime 4569 btime 3424 winc 100 binc 100
454,587<--1:info score cp -815 depth 1 nodes 1 time 0 pv a7a5
454,587<--1:info score cp -815 depth 2 nodes 2 time 0 pv a7a5 f5a5
454,587<--1:info score cp -815 depth 3 nodes 3 time 0 pv a7a5 f5a5 b8b2
454,587<--1:info score cp -840 depth 4 nodes 4766 time 3 pv a7a5 f5f8 b8f8 e3e4
454,633<--1:info score cp -845 depth 5 nodes 58207 time 50 pv a7a6 f5f8 b8f8 c3b5 a6b5
454,673<--1:info score cp -845 depth 6 nodes 111261 time 91 pv a7a6 e3d4 h8g8 f5e6 g8h8 d4e3
454,749<--1:bestmove a7a6
454,749*1*Found move:a7-a6
454,905*2*Start calc, move no: 78
455,145-->2:time 457
455,145-->2:otim 327
455,145-->2:a7a6
455,149<--2:1 769 0 122 f5c2
455,150<--2:2 759 0 367 f5c2 h8g8
455,153<--2:3 769 0 2419 f5c2 h8g8 e3d4
455,197<--2:4 779 5 29398 f5f4 b8c8 e3d4 h8g8
455,299<--2:move f5f4
455,299*2*Found move:Qf5-f4
455,471*1*Start calc, move no: 79
455,471-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2 c5c4 b1d1 e5e8 d1d5 g8h8 d5f5 e8b8 f2e3 a7a6 f5f4
455,471-->1:go wtime 5420 btime 3262 winc 100 binc 100
455,474<--1:info score cp -890 depth 1 nodes 1 time 0 pv b8e8
455,474<--1:info score cp -890 depth 2 nodes 2 time 0 pv b8e8 e3f3
455,474<--1:info score cp -890 depth 3 nodes 3 time 0 pv b8e8 e3f3 e8c8
455,474<--1:info score cp -890 depth 4 nodes 4 time 0 pv b8e8 e3f3 e8c8 f3f2
455,474<--1:info score cp -890 depth 5 nodes 5 time 0 pv b8e8 e3f3 e8c8 f3f2 h7h6
455,501<--1:info score cp -900 depth 6 nodes 32807 time 30 pv b8e8 e3f3 e8c8 b2b3 c8d8 f3e3
455,608<--1:info score cp -915 depth 7 nodes 171108 time 135 pv b8e8 e3d4 e8d8 c3d5 h7h6 f4b8 d8b8
455,633<--1:bestmove b8e8
455,633*1*Found move:Rb8-e8
455,821*2*Start calc, move no: 80
456,063-->2:time 542
456,063-->2:otim 411
456,063-->2:b8e8
456,065<--2:1 789 0 142 e3d4 e8c8
456,068<--2:2 794 0 592 e3d4 e8c8 c3e4
456,072<--2:3 788 0 3855 e3d4 e8c8 f4d6 a6a5
456,109<--2:4 838 4 27725 c3e4 h8g8 f4c7 g8f8 c7c4
456,243<--2:move c3e4
456,243*2*Found move:Nc3-e4
456,398*1*Start calc, move no: 81
456,399-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2 c5c4 b1d1 e5e8 d1d5 g8h8 d5f5 e8b8 f2e3 a7a6 f5f4 b8e8 c3e4
456,399-->1:go wtime 5245 btime 4105 winc 100 binc 100
456,403<--1:info score cp -845 depth 1 nodes 1 time 0 pv e8d8
456,404<--1:info score cp -845 depth 2 nodes 2 time 0 pv e8d8 f4f8
456,404<--1:info score cp -850 depth 3 nodes 670 time 1 pv e8a8 f4c7 a8e8
456,407<--1:info score cp -850 depth 4 nodes 5773 time 8 pv h7h6 e3d4 e8c8 f4f2
456,424<--1:info score cp -910 depth 5 nodes 25657 time 26 pv c4c3 f4f8 e8f8 e3e2 c3b2
456,449<--1:info score cp -915 depth 6 nodes 42883 time 51 pv c4c3 f4f7 e8c8 e4c3 c8b8 f7f2
456,551<--1:info score cp -915 depth 7 nodes 173002 time 152 pv c4c3 f4f7 e8c8 e4c3 c8b8 f7a2 b8d8
456,586<--1:bestmove c4c3
456,586*1*Found move:c4-c3
456,761*2*Start calc, move no: 82
457,003-->2:time 525
457,003-->2:otim 393
457,003-->2:c4c3
457,005<--2:1 869 0 32 b2c3
457,007<--2:2 859 0 246 b2c3 h8g8
457,008<--2:3 882 0 984 b2c3 h8g8 c3c4
457,018<--2:4 874 1 5749 b2c3 e8c8 e3d4 h8g8
457,093<--2:5 882 9 59995 b2c3 h8g8 c3c4 e8f8 f4g5
457,182<--2:move b2c3
457,182*2*Found move:b2xc3
457,355*1*Start calc, move no: 83
457,357-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2 c5c4 b1d1 e5e8 d1d5 g8h8 d5f5 e8b8 f2e3 a7a6 f5f4 b8e8 c3e4 c4c3 b2c3
457,357-->1:go wtime 5071 btime 3923 winc 100 binc 100
457,360<--1:info score cp -910 depth 1 nodes 1 time 0 pv h8g8
457,360<--1:info score cp -910 depth 2 nodes 2 time 0 pv h8g8 c3c4
457,360<--1:info score cp -910 depth 3 nodes 3 time 0 pv h8g8 c3c4 e8f8
457,360<--1:info score cp -910 depth 4 nodes 4 time 0 pv h8g8 c3c4 e8f8 f4e5
457,386<--1:info score cp -915 depth 5 nodes 23393 time 29 pv e8d8 c3c4 h8g8 c4c5 d8f8
457,420<--1:info score cp -920 depth 6 nodes 67348 time 62 pv e8a8 c3c4 a8b8 f4b8
457,511<--1:info score cp -955 depth 7 nodes 197068 time 153 pv e8a8 c3c4 a6a5 f4c7 h7h6 c7b8 a8b8
457,539<--1:bestmove e8a8
457,539*1*Found move:Re8-a8
457,706*2*Start calc, move no: 84
457,946-->2:time 508
457,946-->2:otim 375
457,946-->2:e8a8
457,950<--2:1 907 0 36 c3c4
457,950<--2:2 892 0 261 c3c4 a8d8
457,951<--2:3 915 0 2498 c3c4 a8d8 c4c5
457,968<--2:4 905 2 15896 c3c4 a8d8 c4c5 h8g8
458,104<--2:5 919 15 144155 f4c7 a6a5 c3c4 h8g8 c4c5
458,117<--2:move f4c7
458,117*2*Found move:Qf4-c7
458,279*1*Start calc, move no: 85
458,279-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2 c5c4 b1d1 e5e8 d1d5 g8h8 d5f5 e8b8 f2e3 a7a6 f5f4 b8e8 c3e4 c4c3 b2c3 e8a8 f4c7
458,279-->1:go wtime 4905 btime 3746 winc 100 binc 100
458,283<--1:info score cp -955 depth 1 nodes 1 time 0 pv a6a5
458,284<--1:info score cp -955 depth 2 nodes 2 time 0 pv a6a5 e3d4
458,284<--1:info score cp -955 depth 3 nodes 3 time 0 pv a6a5 e3d4 h8g8
458,284<--1:info score cp -955 depth 4 nodes 4 time 0 pv a6a5 e3d4 h8g8 c7g7
458,284<--1:info score cp -955 depth 5 nodes 5 time 0 pv a6a5 e3d4 h8g8 c7g7 g8g7
458,310<--1:info score cp -955 depth 6 nodes 34846 time 29 pv h7h6 c7c6 a8b8 c6c8 b8c8 e3d4
458,424<--1:info score cp -990 depth 7 nodes 177970 time 144 pv a6a5 c7c6 a8b8 e4d6 h7h6 d6c4 b8d8
458,457<--1:bestmove a6a5
458,457*1*Found move:a6-a5
458,644*2*Start calc, move no: 86
458,884-->2:time 491
458,884-->2:otim 358
458,884-->2:a6a5
458,890<--2:1 906 0 41 c3c4
458,890<--2:2 896 0 445 c3c4 h8g8
458,890<--2:3 919 0 2880 c3c4 h8g8 c4c5
458,914<--2:4 909 2 22008 c3c4 h8g8 c4c5 g8f8
459,051<--2:move e4d6
459,051*2*Found move:Ne4-d6
459,203*1*Start calc, move no: 87
459,203-->1:position startpos moves g1f3 d7d5 d2d4 e7e6 b1c3 g8f6 e2e3 f8b4 c1d2 b8c6 f1b5 e8g8 b5c6 b7c6 e1g1 c8a6 f1e1 a8b8 f3e5 d8e8 a1b1 b4d6 e3e4 c6c5 d2f4 c5d4 d1d4 c7c5 d4d2 d5d4 c3d1 f6h5 e5g6 d6f4 g6f4 h5f4 d2f4 e8a4 a2a3 a4a5 c2c3 d4c3 d1c3 a6d3 b1d1 d3c2 f4c1 c2d1 e1d1 f8d8 d1d8 a5d8 c3a4 d8d4 a4c3 f7f5 e4f5 e6f5 c1c2 b8e8 c2b1 d4d2 g1f1 e8e5 a3a4 d2f4 f1g1 f4f2 g1f2 c5c4 b1d1 e5e8 d1d5 g8h8 d5f5 e8b8 f2e3 a7a6 f5f4 b8e8 c3e4 c4c3 b2c3 e8a8 f4c7 a6a5 e4d6
459,203-->1:go wtime 4743 btime 3573 winc 100 binc 100
459,207<--1:info score cp -955 depth 1 nodes 1 time 0 pv h7h6
459,207<--1:info score cp -955 depth 2 nodes 2 time 0 pv h7h6 c7g7
459,207<--1:info score cp -955 depth 3 nodes 3 time 0 pv h7h6 c7g7 h8g7
459,212<--1:info score cp -995 depth 4 nodes 7084 time 7 pv g7g6 d6c4 a8e8 e3d3
459,252<--1:info score cp -1005 depth 5 nodes 55201 time 47 pv a8f8 c7a5 f8b8 d6f7 h8g8
459,275<--1:info score cp -1010 depth 6 nodes 84116 time 71 pv a8f8 c7a5 f8b8 e3d4 b8b2 a5d8
459,375<--1:bestmove a8f8
459,375*1*Found move:Ra8-f8
459,375*1*---------> Arena Adjudication (UCI):Black resigns
459,529********Game end: 1-0 {Black resigns}
459,531********Last game won by Tscp 1.81 with White in 44 moves
459,532********LiSHeX  -  Tscp 1.81:
459,533********  10 W 2    10.0:0.0       1.0:9.0       15:52:34   +10.10    44 5.816 :4.445  1-9-0
459,551********Saving file /home/mkjm/Tournaments/Testing.pgn
459,571-->2:?
459,577<--2:Error (unknown command): ?
459,591-->2:result 1-0
459,595<--2:Error (unknown command): result
460,696********Tournament is finished
