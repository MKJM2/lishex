/*
 Lishex (codename 1F98A), a UCI chess engine built in C++
 Copyright (C) 2023 Michal Kurek

 Lishex is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Lishex is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/*
 *  /\ \       __/\  _`\ /\ \/\ \         /\ \ /\ \
 *  \ \ \     /\_\ \,\L\_\ \ \_\ \     __ \ `\`\/'/'
 *   \ \ \  __\/\ \/_\__ \\ \  _  \  /'__`\`\/ > <
 *    \ \ \L\ \\ \ \/\ \L\ \ \ \ \ \/\  __/   \/'/\`\
 *     \ \____/ \ \_\ `\____\ \_\ \_\ \____\  /\_\\ \_\
 *      \/___/   \/_/\/_____/\/_/\/_/\/____/  \/_/ \/_/
 *
 *
 *       A UCI-compliant chess engine written in C++
 */



#include <iostream>
#include "types.h"
#include "board.h"
#include "bitboard.h"
#include "uci.h"
#include "attack.h"
#include "search.h"
#include "sgd.h"
#include "eval.h"
#include <cmath>

int main(int argc, char* argv[]) {

    // Print ASCII logo
    std::cout \
        << "                                                                    \n" \
        << "                      (%       ((((                                 \n" \
        << "                      (((((((  ((((((                               \n" \
        << "                      %(    ((((((#(((                              \n" \
        << "                       &((((((((((((((((                            \n" \
        << "                     ((((((((((((((((((((((                         \n" \
        << "                   (((((((((((//(((((( ((((((                       \n" \
        << "                 %((((((((/**********/(((((((                       \n" \
        << "                  ((((((//****       ****/(((((((((#                \n" \
        << "                 ((((((((*     #(((((((   *******/(                 \n" \
        << "                 ((((((((    ((((  %(((                             \n" \
        << "                 (((((((           #(((((                           \n" \
        << "                 ((((((( (         ((((((((((((                     \n" \
        << "                 ( ((((((           (((((((((((((((((               \n" \
        << "                    (((((((          (((((((((((((((((((            \n" \
        << "                     ((((((       (  %(((((((((((((((((((((         \n" \
        << "                        (((     %((  (((((((((((((((((((((((&       \n" \
        << "                          (     ((((((((((((((((((((((((((((((      \n" \
        << "                                 ((((((((((((((((((((((((((((((     \n" \
        << "              %((((((((((((((((%   (((((((((((((((((((((((((((((    \n" \
        << "           (((((((((((((((((((((((((((# ((((((((((( ((((((((((((    \n" \
        << "        ((((((((         ((((((((((((((((((((        ((((((((((((   \n" \
        << "      ((((((                 %(((((((((((((((((((((((((((((((((((   \n" \
        << "    %(((((((((                  ((((((((((((((((((((((((((((((((    \n" \
        << "   ((((    ((((((((((                (((((((( ((((((((((((((((((    \n" \
        << "                  (((((((                %((((((((((((( (((((((     \n" \
        << "                      ((((((&        (((((((((((     #(((((((       \n" \
        << "                          (((((((                 ((((((((          \n" \
        << "                               &(((((((((((((((((((((               \n" \
        << std::endl;

    // Print engine info
    std::cout << NAME << " " << VERSION << " (c) " << AUTHOR << " 2023" << std::endl;
    std::cout << "Built on " << __DATE__ << " " << __TIME__ << std::endl;

    // Initialization
    init_keys();
    init_eval_masks();
    init_leap_attacks();
    init_bishop_occupancies();
    init_rook_occupancies();
    init_magics<BISHOP>();
    init_magics<ROOK>();
    init_reductions();

    //#ifdef TUNING

    PAWN_SHIELD1_BONUS.mg = round(13.9749);
    PAWN_SHIELD1_BONUS.eg = round(-12.1582);
    PAWN_SHIELD2_BONUS.mg = round(5.81382);
    PAWN_SHIELD2_BONUS.eg = round(-11.0732);
    isolated_pawn.mg = round(-7.88362);
    isolated_pawn.eg = round(-6.36803);
    doubled_pawn.mg = round(-9.6257);
    doubled_pawn.eg = round(-27.6081);
    pawn_supported.mg = round(3.93045);
    pawn_supported.eg = round(-2.39989);
    pawn_protected_bonus.mg = round(-1.19012);
    pawn_protected_bonus.eg = round(3.80218);
    SAFE_PAWN_ATTACK.mg = round(57.2369);
    SAFE_PAWN_ATTACK.eg = round(26.9303);
    passed_pawn[1].mg = round(1.57873);
    passed_pawn[2].mg = round(-3.93815);
    passed_pawn[3].mg = round(-6.20476);
    passed_pawn[4].mg = round(8.77562);
    passed_pawn[5].mg = round(34.6322);
    passed_pawn[6].mg = round(54.9344);
    passed_pawn[1].eg = round(-20.9303);
    passed_pawn[2].eg = round(-16.6882);
    passed_pawn[3].eg = round(12.2692);
    passed_pawn[4].eg = round(43.7257);
    passed_pawn[5].eg = round(97.2832);
    passed_pawn[6].eg = round(97.8283);
    pawn_bonuses[1].mg = round(-0.848016);
    pawn_bonuses[2].mg = round(-0.556942);
    pawn_bonuses[3].mg = round(2.84067);
    pawn_bonuses[4].mg = round(7.84986);
    pawn_bonuses[5].mg = round(19.4547);
    pawn_bonuses[6].mg = round(12.713);
    pawn_bonuses[1].eg = round(-0.0787439);
    pawn_bonuses[2].eg = round(-0.0787439);
    pawn_bonuses[3].eg = round(4.92126);
    pawn_bonuses[4].eg = round(21.9213);
    pawn_bonuses[5].eg = round(41.9213);
    pawn_bonuses[6].eg = round(49.9213);

    //tempo = {23, 15};
    //bishop_pair = {15, 37};
    //rook_open_file = {38, 1};
    //rook_semiopen_file = {2, 1};
    //queen_open_file = {-9, 27};
    //queen_semiopen_file = {-9, 27}; // sus
    //KING_PAWN_DIST_BONUS = {-3, 11};
    ///
    tempo.mg = round(22.6958);
    tempo.eg = round(14.6673);
    bishop_pair.mg = round(15.7391);
    bishop_pair.eg = round(46.0069);
    KING_PAWN_DIST_BONUS.mg = round(-2.78737);
    KING_PAWN_DIST_BONUS.eg = round(11.5144);
    open_file[1].mg = round(0);
    open_file[1].eg = round(0);
    semiopen_file[1].mg = round(0);
    semiopen_file[1].eg = round(0);
    open_file[2].mg = round(1.97838);
    open_file[2].eg = round(-9.36814);
    semiopen_file[2].mg = round(2.6441);
    semiopen_file[2].eg = round(-3.01075);
    open_file[3].mg = round(-7.05669);
    open_file[3].eg = round(-10.6636);
    semiopen_file[3].mg = round(3.97823);
    semiopen_file[3].eg = round(-14.6919);
    open_file[4].mg = round(38.6533);
    open_file[4].eg = round(-1.92512);
    semiopen_file[4].mg = round(2.76119);
    semiopen_file[4].eg = round(-0.79056);
    open_file[5].mg = round(-7.87153);
    open_file[5].eg = round(21.3324);
    semiopen_file[5].mg = round(1.07288);
    semiopen_file[5].eg = round(-5.75264);


    // tempo = 0;
    // bishop_pair = 0;
    // rook_open_file = 0;
    // rook_semiopen_file = 0;
    // queen_open_file = 0;
    // queen_semiopen_file = 0;
    // KING_PAWN_DIST_BONUS = 0;

    value[1].mg = round(99.7583);
    value[1].eg = round(105.365);
    value[2].mg = round(367.777);
    value[2].eg = round(304.315);
    value[3].mg = round(389.631);
    value[3].eg = round(316.845);
    value[4].mg = round(522.426);
    value[4].eg = round(558.004);
    value[5].mg = round(1101.77);
    value[5].eg = round(1000.5);
    pawn_psqt[8].mg = round(-39.9326);
    pawn_psqt[8].eg = round(3.40177);
    pawn_psqt[9].mg = round(-12.0631);
    pawn_psqt[9].eg = round(-5.16189);
    pawn_psqt[10].mg = round(-26.7731);
    pawn_psqt[10].eg = round(-3.49952);
    pawn_psqt[11].mg = round(-39.1623);
    pawn_psqt[11].eg = round(-2.20886);
    pawn_psqt[12].mg = round(-30.5554);
    pawn_psqt[12].eg = round(1.75905);
    pawn_psqt[13].mg = round(7.03633);
    pawn_psqt[13].eg = round(-7.63402);
    pawn_psqt[14].mg = round(20.1372);
    pawn_psqt[14].eg = round(-14.7902);
    pawn_psqt[15].mg = round(-33.8677);
    pawn_psqt[15].eg = round(-18.3568);
    pawn_psqt[16].mg = round(-33.1726);
    pawn_psqt[16].eg = round(-3.34608);
    pawn_psqt[17].mg = round(-19.0802);
    pawn_psqt[17].eg = round(-3.2774);
    pawn_psqt[18].mg = round(-14.7087);
    pawn_psqt[18].eg = round(-11.0014);
    pawn_psqt[19].mg = round(-22.0998);
    pawn_psqt[19].eg = round(-6.63687);
    pawn_psqt[20].mg = round(-10.1967);
    pawn_psqt[20].eg = round(-6.1503);
    pawn_psqt[21].mg = round(-6.59257);
    pawn_psqt[21].eg = round(-8.65533);
    pawn_psqt[22].mg = round(13.1021);
    pawn_psqt[22].eg = round(-13.3215);
    pawn_psqt[23].mg = round(-22.576);
    pawn_psqt[23].eg = round(-15.8944);
    pawn_psqt[24].mg = round(-35.9815);
    pawn_psqt[24].eg = round(2.54589);
    pawn_psqt[25].mg = round(-24.2333);
    pawn_psqt[25].eg = round(-3.31321);
    pawn_psqt[26].mg = round(-15.608);
    pawn_psqt[26].eg = round(-13.3467);
    pawn_psqt[27].mg = round(-1.63625);
    pawn_psqt[27].eg = round(-18.7725);
    pawn_psqt[28].mg = round(2.90471);
    pawn_psqt[28].eg = round(-17.9595);
    pawn_psqt[29].mg = round(-5.87533);
    pawn_psqt[29].eg = round(-18.7518);
    pawn_psqt[30].mg = round(-12.2121);
    pawn_psqt[30].eg = round(-13.3405);
    pawn_psqt[31].mg = round(-35.8053);
    pawn_psqt[31].eg = round(-13.7322);
    pawn_psqt[32].mg = round(-17.6713);
    pawn_psqt[32].eg = round(10.5936);
    pawn_psqt[33].mg = round(-0.988039);
    pawn_psqt[33].eg = round(-3.01372);
    pawn_psqt[34].mg = round(-7.87138);
    pawn_psqt[34].eg = round(-11.9316);
    pawn_psqt[35].mg = round(8.01809);
    pawn_psqt[35].eg = round(-23.2511);
    pawn_psqt[36].mg = round(8.24692);
    pawn_psqt[36].eg = round(-19.607);
    pawn_psqt[37].mg = round(3.38886);
    pawn_psqt[37].eg = round(-17.2858);
    pawn_psqt[38].mg = round(4.31393);
    pawn_psqt[38].eg = round(-6.75341);
    pawn_psqt[39].mg = round(-24.1934);
    pawn_psqt[39].eg = round(-3.76147);
    pawn_psqt[40].mg = round(-1.88029);
    pawn_psqt[40].eg = round(33.9622);
    pawn_psqt[41].mg = round(0.191574);
    pawn_psqt[41].eg = round(29.339);
    pawn_psqt[42].mg = round(19.4773);
    pawn_psqt[42].eg = round(10.1257);
    pawn_psqt[43].mg = round(4.10281);
    pawn_psqt[43].eg = round(-12.2618);
    pawn_psqt[44].mg = round(47.597);
    pawn_psqt[44].eg = round(-22.1322);
    pawn_psqt[45].mg = round(65.1295);
    pawn_psqt[45].eg = round(-6.87246);
    pawn_psqt[46].mg = round(34.4007);
    pawn_psqt[46].eg = round(7.57586);
    pawn_psqt[47].mg = round(-5.05847);
    pawn_psqt[47].eg = round(20.4595);
    pawn_psqt[48].mg = round(76.8101);
    pawn_psqt[48].eg = round(109.248);
    pawn_psqt[49].mg = round(104.017);
    pawn_psqt[49].eg = round(100.809);
    pawn_psqt[50].mg = round(41.8024);
    pawn_psqt[50].eg = round(91.8762);
    pawn_psqt[51].mg = round(74.5451);
    pawn_psqt[51].eg = round(66.5381);
    pawn_psqt[52].mg = round(66.2055);
    pawn_psqt[52].eg = round(85.2683);
    pawn_psqt[53].mg = round(125.425);
    pawn_psqt[53].eg = round(66.7231);
    pawn_psqt[54].mg = round(11.0698);
    pawn_psqt[54].eg = round(106.323);
    pawn_psqt[55].mg = round(-29.9991);
    pawn_psqt[55].eg = round(122.047);
    knight_psqt[0].mg = round(-113.055);
    knight_psqt[0].eg = round(-19.9729);
    knight_psqt[1].mg = round(-29.4197);
    knight_psqt[1].eg = round(-43.2751);
    knight_psqt[2].mg = round(-49.7592);
    knight_psqt[2].eg = round(-22.9466);
    knight_psqt[3].mg = round(-36.1385);
    knight_psqt[3].eg = round(-8.77938);
    knight_psqt[4].mg = round(-18.7878);
    knight_psqt[4].eg = round(-19.6361);
    knight_psqt[5].mg = round(-20.674);
    knight_psqt[5].eg = round(-21.4718);
    knight_psqt[6].mg = round(-25.8865);
    knight_psqt[6].eg = round(-47.8215);
    knight_psqt[7].mg = round(-33.0154);
    knight_psqt[7].eg = round(-60.1435);
    knight_psqt[8].mg = round(-35.5042);
    knight_psqt[8].eg = round(-30.832);
    knight_psqt[9].mg = round(-48.9931);
    knight_psqt[9].eg = round(-19.9553);
    knight_psqt[10].mg = round(-12.5708);
    knight_psqt[10].eg = round(-8.93793);
    knight_psqt[11].mg = round(-5.91194);
    knight_psqt[11].eg = round(-3.3598);
    knight_psqt[12].mg = round(-2.94357);
    knight_psqt[12].eg = round(-0.082473);
    knight_psqt[13].mg = round(14.7869);
    knight_psqt[13].eg = round(-18.8728);
    knight_psqt[14].mg = round(-13.6738);
    knight_psqt[14].eg = round(-20.0922);
    knight_psqt[15].mg = round(-22.0682);
    knight_psqt[15].eg = round(-41.8872);
    knight_psqt[16].mg = round(-28.8041);
    knight_psqt[16].eg = round(-19.5541);
    knight_psqt[17].mg = round(-11.4192);
    knight_psqt[17].eg = round(-5.29068);
    knight_psqt[18].mg = round(3.25732);
    knight_psqt[18].eg = round(-3.84491);
    knight_psqt[19].mg = round(10.9319);
    knight_psqt[19].eg = round(10.3735);
    knight_psqt[20].mg = round(18.7409);
    knight_psqt[20].eg = round(3.40251);
    knight_psqt[21].mg = round(10.895);
    knight_psqt[21].eg = round(-9.78358);
    knight_psqt[22].mg = round(21.8926);
    knight_psqt[22].eg = round(-21.8933);
    knight_psqt[23].mg = round(-22.1723);
    knight_psqt[23].eg = round(-22.0171);
    knight_psqt[24].mg = round(-16.4616);
    knight_psqt[24].eg = round(-14.0142);
    knight_psqt[25].mg = round(14.6907);
    knight_psqt[25].eg = round(-9.40405);
    knight_psqt[26].mg = round(15.7377);
    knight_psqt[26].eg = round(13.9403);
    knight_psqt[27].mg = round(8.75143);
    knight_psqt[27].eg = round(23.7168);
    knight_psqt[28].mg = round(22.1256);
    knight_psqt[28].eg = round(15.129);
    knight_psqt[29].mg = round(14.3635);
    knight_psqt[29].eg = round(11.3647);
    knight_psqt[30].mg = round(18.3138);
    knight_psqt[30].eg = round(0.760123);
    knight_psqt[31].mg = round(-9.17933);
    knight_psqt[31].eg = round(-18.9569);
    knight_psqt[32].mg = round(-8.65744);
    knight_psqt[32].eg = round(-16.6939);
    knight_psqt[33].mg = round(14.6217);
    knight_psqt[33].eg = round(1.00297);
    knight_psqt[34].mg = round(20.2427);
    knight_psqt[34].eg = round(18.7233);
    knight_psqt[35].mg = round(51.145);
    knight_psqt[35].eg = round(21.6157);
    knight_psqt[36].mg = round(28.9763);
    knight_psqt[36].eg = round(20.7984);
    knight_psqt[37].mg = round(71.6898);
    knight_psqt[37].eg = round(11.2178);
    knight_psqt[38].mg = round(16.9871);
    knight_psqt[38].eg = round(4.89678);
    knight_psqt[39].mg = round(30.8884);
    knight_psqt[39].eg = round(-14.8615);
    knight_psqt[40].mg = round(-45.4691);
    knight_psqt[40].eg = round(-21.9362);
    knight_psqt[41].mg = round(45.2594);
    knight_psqt[41].eg = round(-15.774);
    knight_psqt[42].mg = round(32.3089);
    knight_psqt[42].eg = round(8.50678);
    knight_psqt[43].mg = round(65.3638);
    knight_psqt[43].eg = round(7.07364);
    knight_psqt[44].mg = round(85.6712);
    knight_psqt[44].eg = round(2.28166);
    knight_psqt[45].mg = round(124.976);
    knight_psqt[45].eg = round(-4.67423);
    knight_psqt[46].mg = round(71.7234);
    knight_psqt[46].eg = round(-17.3585);
    knight_psqt[47].mg = round(67.6698);
    knight_psqt[47].eg = round(-37.3495);
    knight_psqt[48].mg = round(-78.6884);
    knight_psqt[48].eg = round(-27.5912);
    knight_psqt[49].mg = round(-33.0688);
    knight_psqt[49].eg = round(-9.4452);
    knight_psqt[50].mg = round(81.4396);
    knight_psqt[50].eg = round(-26.9648);
    knight_psqt[51].mg = round(25.7233);
    knight_psqt[51].eg = round(3.27711);
    knight_psqt[52].mg = round(26.7214);
    knight_psqt[52].eg = round(-6.95816);
    knight_psqt[53].mg = round(58.7866);
    knight_psqt[53].eg = round(-24.2688);
    knight_psqt[54].mg = round(5.27393);
    knight_psqt[54].eg = round(-15.9334);
    knight_psqt[55].mg = round(-20.0642);
    knight_psqt[55].eg = round(-55.5954);
    knight_psqt[56].mg = round(-172.094);
    knight_psqt[56].eg = round(-69.183);
    knight_psqt[57].mg = round(-84.4333);
    knight_psqt[57].eg = round(-39.8011);
    knight_psqt[58].mg = round(-41.5125);
    knight_psqt[58].eg = round(-15.8688);
    knight_psqt[59].mg = round(-55.5504);
    knight_psqt[59].eg = round(-20.391);
    knight_psqt[60].mg = round(53.6582);
    knight_psqt[60].eg = round(-21.4467);
    knight_psqt[61].mg = round(-101.094);
    knight_psqt[61].eg = round(-33.1422);
    knight_psqt[62].mg = round(-23.0266);
    knight_psqt[62].eg = round(-57.0624);
    knight_psqt[63].mg = round(-104.709);
    knight_psqt[63].eg = round(-88.5918);
    bishop_psqt[0].mg = round(-34.0261);
    bishop_psqt[0].eg = round(-13.903);
    bishop_psqt[1].mg = round(-8.25178);
    bishop_psqt[1].eg = round(-10.2201);
    bishop_psqt[2].mg = round(-20.1157);
    bishop_psqt[2].eg = round(-13.9964);
    bishop_psqt[3].mg = round(-14.5438);
    bishop_psqt[3].eg = round(-3.77644);
    bishop_psqt[4].mg = round(-16.0982);
    bishop_psqt[4].eg = round(-1.24606);
    bishop_psqt[5].mg = round(-18.5435);
    bishop_psqt[5].eg = round(-13.7801);
    bishop_psqt[6].mg = round(-57.8316);
    bishop_psqt[6].eg = round(-2.73707);
    bishop_psqt[7].mg = round(-25.6775);
    bishop_psqt[7].eg = round(-10.2827);
    bishop_psqt[8].mg = round(-1.32672);
    bishop_psqt[8].eg = round(-9.51751);
    bishop_psqt[9].mg = round(8.48324);
    bishop_psqt[9].eg = round(-14.4229);
    bishop_psqt[10].mg = round(6.86514);
    bishop_psqt[10].eg = round(-7.68393);
    bishop_psqt[11].mg = round(-5.53586);
    bishop_psqt[11].eg = round(-0.482093);
    bishop_psqt[12].mg = round(3.42659);
    bishop_psqt[12].eg = round(1.11701);
    bishop_psqt[13].mg = round(14.8541);
    bishop_psqt[13].eg = round(-11.5582);
    bishop_psqt[14].mg = round(27.7844);
    bishop_psqt[14].eg = round(-17.587);
    bishop_psqt[15].mg = round(-12.5315);
    bishop_psqt[15].eg = round(-29.8702);
    bishop_psqt[16].mg = round(-9.36219);
    bishop_psqt[16].eg = round(-10.1998);
    bishop_psqt[17].mg = round(10.6888);
    bishop_psqt[17].eg = round(-2.41594);
    bishop_psqt[18].mg = round(14.0734);
    bishop_psqt[18].eg = round(5.85241);
    bishop_psqt[19].mg = round(6.46445);
    bishop_psqt[19].eg = round(8.4237);
    bishop_psqt[20].mg = round(8.5267);
    bishop_psqt[20].eg = round(10.5258);
    bishop_psqt[21].mg = round(21.5987);
    bishop_psqt[21].eg = round(-6.58796);
    bishop_psqt[22].mg = round(10.5408);
    bishop_psqt[22].eg = round(-6.19109);
    bishop_psqt[23].mg = round(-2.59136);
    bishop_psqt[23].eg = round(-14.0512);
    bishop_psqt[24].mg = round(-12.4016);
    bishop_psqt[24].eg = round(-2.17538);
    bishop_psqt[25].mg = round(11.2863);
    bishop_psqt[25].eg = round(-1.83934);
    bishop_psqt[26].mg = round(9.41199);
    bishop_psqt[26].eg = round(10.6939);
    bishop_psqt[27].mg = round(23.1136);
    bishop_psqt[27].eg = round(15.9213);
    bishop_psqt[28].mg = round(31.1372);
    bishop_psqt[28].eg = round(2.30249);
    bishop_psqt[29].mg = round(2.7824);
    bishop_psqt[29].eg = round(2.38324);
    bishop_psqt[30].mg = round(8.67045);
    bishop_psqt[30].eg = round(-9.189);
    bishop_psqt[31].mg = round(0.475284);
    bishop_psqt[31].eg = round(-3.25499);
    bishop_psqt[32].mg = round(-0.560031);
    bishop_psqt[32].eg = round(-2.94502);
    bishop_psqt[33].mg = round(5.05187);
    bishop_psqt[33].eg = round(5.16845);
    bishop_psqt[34].mg = round(11.9682);
    bishop_psqt[34].eg = round(8.16871);
    bishop_psqt[35].mg = round(52.2493);
    bishop_psqt[35].eg = round(6.92923);
    bishop_psqt[36].mg = round(31.2166);
    bishop_psqt[36].eg = round(12.4106);
    bishop_psqt[37].mg = round(31.47);
    bishop_psqt[37].eg = round(4.77574);
    bishop_psqt[38].mg = round(3.0948);
    bishop_psqt[38].eg = round(-2.00347);
    bishop_psqt[39].mg = round(4.17564);
    bishop_psqt[39].eg = round(0.953783);
    bishop_psqt[40].mg = round(-3.64627);
    bishop_psqt[40].eg = round(-1.39911);
    bishop_psqt[41].mg = round(25.2614);
    bishop_psqt[41].eg = round(-5.52198);
    bishop_psqt[42].mg = round(41.3671);
    bishop_psqt[42].eg = round(-1.47545);
    bishop_psqt[43].mg = round(37.2317);
    bishop_psqt[43].eg = round(-6.35195);
    bishop_psqt[44].mg = round(37.72);
    bishop_psqt[44].eg = round(0.335152);
    bishop_psqt[45].mg = round(49.9633);
    bishop_psqt[45].eg = round(1.26513);
    bishop_psqt[46].mg = round(49.2762);
    bishop_psqt[46].eg = round(-1.95845);
    bishop_psqt[47].mg = round(16.2991);
    bishop_psqt[47].eg = round(-2.35749);
    bishop_psqt[48].mg = round(-38.4995);
    bishop_psqt[48].eg = round(-0.598903);
    bishop_psqt[49].mg = round(19.2034);
    bishop_psqt[49].eg = round(-5.05648);
    bishop_psqt[50].mg = round(-24.7695);
    bishop_psqt[50].eg = round(5.37843);
    bishop_psqt[51].mg = round(-26.1654);
    bishop_psqt[51].eg = round(-5.12975);
    bishop_psqt[52].mg = round(22.6921);
    bishop_psqt[52].eg = round(-3.33145);
    bishop_psqt[53].mg = round(55.5338);
    bishop_psqt[53].eg = round(-8.16699);
    bishop_psqt[54].mg = round(15.7466);
    bishop_psqt[54].eg = round(2.2012);
    bishop_psqt[55].mg = round(-51.2978);
    bishop_psqt[55].eg = round(-8.7017);
    bishop_psqt[56].mg = round(-39.4571);
    bishop_psqt[56].eg = round(-14.4392);
    bishop_psqt[57].mg = round(-14.8238);
    bishop_psqt[57].eg = round(-19.8868);
    bishop_psqt[58].mg = round(-85.7966);
    bishop_psqt[58].eg = round(-6.02717);
    bishop_psqt[59].mg = round(-59.177);
    bishop_psqt[59].eg = round(-6.7442);
    bishop_psqt[60].mg = round(-22.0121);
    bishop_psqt[60].eg = round(-5.05201);
    bishop_psqt[61].mg = round(-58.3199);
    bishop_psqt[61].eg = round(-7.13015);
    bishop_psqt[62].mg = round(-0.0483645);
    bishop_psqt[62].eg = round(-9.67253);
    bishop_psqt[63].mg = round(-7.43682);
    bishop_psqt[63].eg = round(-25.489);
    rook_psqt[0].mg = round(-14.2564);
    rook_psqt[0].eg = round(-3.74);
    rook_psqt[1].mg = round(-8.58645);
    rook_psqt[1].eg = round(2.06544);
    rook_psqt[2].mg = round(-2.43438);
    rook_psqt[2].eg = round(4.30981);
    rook_psqt[3].mg = round(11.3366);
    rook_psqt[3].eg = round(-5.75935);
    rook_psqt[4].mg = round(10.6953);
    rook_psqt[4].eg = round(-9.54971);
    rook_psqt[5].mg = round(10.4174);
    rook_psqt[5].eg = round(-12.1147);
    rook_psqt[6].mg = round(-35.6808);
    rook_psqt[6].eg = round(4.35068);
    rook_psqt[7].mg = round(-28.8622);
    rook_psqt[7].eg = round(-13.6278);
    rook_psqt[8].mg = round(-38.4295);
    rook_psqt[8].eg = round(-1.12693);
    rook_psqt[9].mg = round(-12.3912);
    rook_psqt[9].eg = round(-7.50346);
    rook_psqt[10].mg = round(-16.4044);
    rook_psqt[10].eg = round(-2.30728);
    rook_psqt[11].mg = round(-6.55554);
    rook_psqt[11].eg = round(-4.98982);
    rook_psqt[12].mg = round(-2.15828);
    rook_psqt[12].eg = round(-12.7716);
    rook_psqt[13].mg = round(11.0676);
    rook_psqt[13].eg = round(-14.7008);
    rook_psqt[14].mg = round(-6.40346);
    rook_psqt[14].eg = round(-15.8304);
    rook_psqt[15].mg = round(-74.8125);
    rook_psqt[15].eg = round(-3.89105);
    rook_psqt[16].mg = round(-37.4462);
    rook_psqt[16].eg = round(-1.79271);
    rook_psqt[17].mg = round(-17.2439);
    rook_psqt[17].eg = round(-1.73935);
    rook_psqt[18].mg = round(-14.0889);
    rook_psqt[18].eg = round(-9.6712);
    rook_psqt[19].mg = round(-18.3465);
    rook_psqt[19].eg = round(-7.87547);
    rook_psqt[20].mg = round(-6.39165);
    rook_psqt[20].eg = round(-13.3098);
    rook_psqt[21].mg = round(2.05886);
    rook_psqt[21].eg = round(-20.4955);
    rook_psqt[22].mg = round(-7.72688);
    rook_psqt[22].eg = round(-11.2086);
    rook_psqt[23].mg = round(-30.2256);
    rook_psqt[23].eg = round(-20.8148);
    rook_psqt[24].mg = round(-28.1926);
    rook_psqt[24].eg = round(2.65554);
    rook_psqt[25].mg = round(-17.9638);
    rook_psqt[25].eg = round(2.49315);
    rook_psqt[26].mg = round(-13.0506);
    rook_psqt[26].eg = round(2.81025);
    rook_psqt[27].mg = round(-3.43852);
    rook_psqt[27].eg = round(-2.42937);
    rook_psqt[28].mg = round(4.06039);
    rook_psqt[28].eg = round(-11.4632);
    rook_psqt[29].mg = round(-8.81701);
    rook_psqt[29].eg = round(-9.91409);
    rook_psqt[30].mg = round(4.72753);
    rook_psqt[30].eg = round(-10.259);
    rook_psqt[31].mg = round(-23.3961);
    rook_psqt[31].eg = round(-11.117);
    rook_psqt[32].mg = round(-23.3554);
    rook_psqt[32].eg = round(3.63623);
    rook_psqt[33].mg = round(-8.26);
    rook_psqt[33].eg = round(0.51309);
    rook_psqt[34].mg = round(8.07491);
    rook_psqt[34].eg = round(6.48417);
    rook_psqt[35].mg = round(13.3538);
    rook_psqt[35].eg = round(-6.32001);
    rook_psqt[36].mg = round(8.6453);
    rook_psqt[36].eg = round(-4.09468);
    rook_psqt[37].mg = round(26.0303);
    rook_psqt[37].eg = round(-2.52492);
    rook_psqt[38].mg = round(-14.3439);
    rook_psqt[38].eg = round(-3.57259);
    rook_psqt[39].mg = round(-14.3166);
    rook_psqt[39].eg = round(-1.65413);
    rook_psqt[40].mg = round(-9.44613);
    rook_psqt[40].eg = round(6.71789);
    rook_psqt[41].mg = round(11.2996);
    rook_psqt[41].eg = round(4.31777);
    rook_psqt[42].mg = round(10.3677);
    rook_psqt[42].eg = round(3.88727);
    rook_psqt[43].mg = round(9.12802);
    rook_psqt[43].eg = round(5.02348);
    rook_psqt[44].mg = round(-3.67365);
    rook_psqt[44].eg = round(2.06149);
    rook_psqt[45].mg = round(28.4467);
    rook_psqt[45].eg = round(-6.64237);
    rook_psqt[46].mg = round(45.7233);
    rook_psqt[46].eg = round(-7.43845);
    rook_psqt[47].mg = round(5.48263);
    rook_psqt[47].eg = round(-7.67313);
    rook_psqt[48].mg = round(21.5606);
    rook_psqt[48].eg = round(11.148);
    rook_psqt[49].mg = round(22.4194);
    rook_psqt[49].eg = round(10.6487);
    rook_psqt[50].mg = round(45.6733);
    rook_psqt[50].eg = round(7.25192);
    rook_psqt[51].mg = round(49.7101);
    rook_psqt[51].eg = round(4.64884);
    rook_psqt[52].mg = round(58.1144);
    rook_psqt[52].eg = round(-7.00938);
    rook_psqt[53].mg = round(66.5681);
    rook_psqt[53].eg = round(0.238455);
    rook_psqt[54].mg = round(2.32506);
    rook_psqt[54].eg = round(11.2489);
    rook_psqt[55].mg = round(35.9068);
    rook_psqt[55].eg = round(4.02636);
    rook_psqt[56].mg = round(15.2867);
    rook_psqt[56].eg = round(8.41945);
    rook_psqt[57].mg = round(19.6691);
    rook_psqt[57].eg = round(4.68959);
    rook_psqt[58].mg = round(7.10309);
    rook_psqt[58].eg = round(9.50219);
    rook_psqt[59].mg = round(34.4117);
    rook_psqt[59].eg = round(2.31913);
    rook_psqt[60].mg = round(28.7254);
    rook_psqt[60].eg = round(4.09228);
    rook_psqt[61].mg = round(-5.34268);
    rook_psqt[61].eg = round(7.14925);
    rook_psqt[62].mg = round(5.80798);
    rook_psqt[62].eg = round(4.43439);
    rook_psqt[63].mg = round(25.0562);
    rook_psqt[63].eg = round(-3.73075);
    queen_psqt[0].mg = round(-2.67022);
    queen_psqt[0].eg = round(-11.5923);
    queen_psqt[1].mg = round(-9.72574);
    queen_psqt[1].eg = round(-28.4923);
    queen_psqt[2].mg = round(3.0291);
    queen_psqt[2].eg = round(-17.2017);
    queen_psqt[3].mg = round(17.8127);
    queen_psqt[3].eg = round(-35.3123);
    queen_psqt[4].mg = round(-4.75811);
    queen_psqt[4].eg = round(0.693387);
    queen_psqt[5].mg = round(-11.7832);
    queen_psqt[5].eg = round(-20.6301);
    queen_psqt[6].mg = round(-23.4475);
    queen_psqt[6].eg = round(-14.7537);
    queen_psqt[7].mg = round(-37.0313);
    queen_psqt[7].eg = round(-40.2606);
    queen_psqt[8].mg = round(-23.0404);
    queen_psqt[8].eg = round(0.825177);
    queen_psqt[9].mg = round(-3.64976);
    queen_psqt[9].eg = round(-1.06247);
    queen_psqt[10].mg = round(14.5649);
    queen_psqt[10].eg = round(-25.4568);
    queen_psqt[11].mg = round(11.4464);
    queen_psqt[11].eg = round(-19.3827);
    queen_psqt[12].mg = round(15.8834);
    queen_psqt[12].eg = round(-8.04656);
    queen_psqt[13].mg = round(16.4632);
    queen_psqt[13].eg = round(-14.9536);
    queen_psqt[14].mg = round(2.40235);
    queen_psqt[14].eg = round(-31.1095);
    queen_psqt[15].mg = round(13.1416);
    queen_psqt[15].eg = round(-30.8515);
    queen_psqt[16].mg = round(-9.23404);
    queen_psqt[16].eg = round(0.895951);
    queen_psqt[17].mg = round(7.83605);
    queen_psqt[17].eg = round(-4.27465);
    queen_psqt[18].mg = round(-2.7724);
    queen_psqt[18].eg = round(24.6604);
    queen_psqt[19].mg = round(3.11772);
    queen_psqt[19].eg = round(11.0869);
    queen_psqt[20].mg = round(2.10432);
    queen_psqt[20].eg = round(13.7233);
    queen_psqt[21].mg = round(4.4127);
    queen_psqt[21].eg = round(15.604);
    queen_psqt[22].mg = round(16.1215);
    queen_psqt[22].eg = round(14.0912);
    queen_psqt[23].mg = round(2.5271);
    queen_psqt[23].eg = round(-7.40213);
    queen_psqt[24].mg = round(-4.50237);
    queen_psqt[24].eg = round(5.81948);
    queen_psqt[25].mg = round(-17.0538);
    queen_psqt[25].eg = round(47.4679);
    queen_psqt[26].mg = round(-4.86289);
    queen_psqt[26].eg = round(41.142);
    queen_psqt[27].mg = round(-6.32234);
    queen_psqt[27].eg = round(54.8966);
    queen_psqt[28].mg = round(-4.56491);
    queen_psqt[28].eg = round(18.491);
    queen_psqt[29].mg = round(-3.98646);
    queen_psqt[29].eg = round(26.0011);
    queen_psqt[30].mg = round(-2.68242);
    queen_psqt[30].eg = round(32.9023);
    queen_psqt[31].mg = round(-2.02262);
    queen_psqt[31].eg = round(-4.17772);
    queen_psqt[32].mg = round(-21.5991);
    queen_psqt[32].eg = round(36.5728);
    queen_psqt[33].mg = round(-12.9938);
    queen_psqt[33].eg = round(30.1935);
    queen_psqt[34].mg = round(-16.68);
    queen_psqt[34].eg = round(25.339);
    queen_psqt[35].mg = round(-33.5282);
    queen_psqt[35].eg = round(62.4552);
    queen_psqt[36].mg = round(-34.9003);
    queen_psqt[36].eg = round(43.5989);
    queen_psqt[37].mg = round(-17.3086);
    queen_psqt[37].eg = round(34.2837);
    queen_psqt[38].mg = round(-23.6556);
    queen_psqt[38].eg = round(50.1786);
    queen_psqt[39].mg = round(-8.28674);
    queen_psqt[39].eg = round(26.5137);
    queen_psqt[40].mg = round(-5.97741);
    queen_psqt[40].eg = round(1.10746);
    queen_psqt[41].mg = round(-1.33911);
    queen_psqt[41].eg = round(-2.40261);
    queen_psqt[42].mg = round(-9.9184);
    queen_psqt[42].eg = round(2.58485);
    queen_psqt[43].mg = round(-42.7549);
    queen_psqt[43].eg = round(50.6681);
    queen_psqt[44].mg = round(-18.8753);
    queen_psqt[44].eg = round(52.8086);
    queen_psqt[45].mg = round(-4.29317);
    queen_psqt[45].eg = round(12.1793);
    queen_psqt[46].mg = round(-0.776148);
    queen_psqt[46].eg = round(14.9401);
    queen_psqt[47].mg = round(17.7434);
    queen_psqt[47].eg = round(-5.31218);
    queen_psqt[48].mg = round(-22.4789);
    queen_psqt[48].eg = round(7.89474);
    queen_psqt[49].mg = round(-39.4358);
    queen_psqt[49].eg = round(31.2349);
    queen_psqt[50].mg = round(-17.6586);
    queen_psqt[50].eg = round(33.4478);
    queen_psqt[51].mg = round(-20.3228);
    queen_psqt[51].eg = round(38.5599);
    queen_psqt[52].mg = round(-63.8693);
    queen_psqt[52].eg = round(52.9658);
    queen_psqt[53].mg = round(10.5747);
    queen_psqt[53].eg = round(0.987788);
    queen_psqt[54].mg = round(-2.33824);
    queen_psqt[54].eg = round(1.19515);
    queen_psqt[55].mg = round(43.1556);
    queen_psqt[55].eg = round(-20.6425);
    queen_psqt[56].mg = round(-27.2258);
    queen_psqt[56].eg = round(-14.653);
    queen_psqt[57].mg = round(-12.473);
    queen_psqt[57].eg = round(17.5953);
    queen_psqt[58].mg = round(-2.20253);
    queen_psqt[58].eg = round(4.4658);
    queen_psqt[59].mg = round(-16.3037);
    queen_psqt[59].eg = round(11.9377);
    queen_psqt[60].mg = round(22.3796);
    queen_psqt[60].eg = round(-3.36004);
    queen_psqt[61].mg = round(38.7807);
    queen_psqt[61].eg = round(-1.65292);
    queen_psqt[62].mg = round(17.7013);
    queen_psqt[62].eg = round(-23.9502);
    queen_psqt[63].mg = round(23.7328);
    queen_psqt[63].eg = round(-2.04778);
    king_psqt[0].mg = round(-15.4585);
    king_psqt[0].eg = round(-53.4585);
    king_psqt[1].mg = round(35.5415);
    king_psqt[1].eg = round(-34.4585);
    king_psqt[2].mg = round(11.5415);
    king_psqt[2].eg = round(-21.4585);
    king_psqt[3].mg = round(-54.4585);
    king_psqt[3].eg = round(-11.4585);
    king_psqt[4].mg = round(7.54151);
    king_psqt[4].eg = round(-28.4585);
    king_psqt[5].mg = round(-28.4585);
    king_psqt[5].eg = round(-14.4585);
    king_psqt[6].mg = round(23.5415);
    king_psqt[6].eg = round(-24.4585);
    king_psqt[7].mg = round(13.5415);
    king_psqt[7].eg = round(-43.4585);
    king_psqt[8].mg = round(0.541511);
    king_psqt[8].eg = round(-27.4585);
    king_psqt[9].mg = round(6.54151);
    king_psqt[9].eg = round(-11.4585);
    king_psqt[10].mg = round(-8.45849);
    king_psqt[10].eg = round(3.54151);
    king_psqt[11].mg = round(-64.4585);
    king_psqt[11].eg = round(12.5415);
    king_psqt[12].mg = round(-43.4585);
    king_psqt[12].eg = round(13.5415);
    king_psqt[13].mg = round(-16.4585);
    king_psqt[13].eg = round(3.54151);
    king_psqt[14].mg = round(8.54151);
    king_psqt[14].eg = round(-5.45849);
    king_psqt[15].mg = round(7.54151);
    king_psqt[15].eg = round(-17.4585);
    king_psqt[16].mg = round(-14.4585);
    king_psqt[16].eg = round(-19.4585);
    king_psqt[17].mg = round(-14.4585);
    king_psqt[17].eg = round(-3.45849);
    king_psqt[18].mg = round(-22.4585);
    king_psqt[18].eg = round(10.5415);
    king_psqt[19].mg = round(-46.4585);
    king_psqt[19].eg = round(20.5415);
    king_psqt[20].mg = round(-44.4585);
    king_psqt[20].eg = round(22.5415);
    king_psqt[21].mg = round(-30.4585);
    king_psqt[21].eg = round(15.5415);
    king_psqt[22].mg = round(-15.4585);
    king_psqt[22].eg = round(6.54151);
    king_psqt[23].mg = round(-27.4585);
    king_psqt[23].eg = round(-9.45849);
    king_psqt[24].mg = round(-49.4585);
    king_psqt[24].eg = round(-18.4585);
    king_psqt[25].mg = round(-1.45849);
    king_psqt[25].eg = round(-4.45849);
    king_psqt[26].mg = round(-27.4585);
    king_psqt[26].eg = round(20.5415);
    king_psqt[27].mg = round(-39.4585);
    king_psqt[27].eg = round(23.5415);
    king_psqt[28].mg = round(-46.4585);
    king_psqt[28].eg = round(26.5415);
    king_psqt[29].mg = round(-44.4585);
    king_psqt[29].eg = round(22.5415);
    king_psqt[30].mg = round(-33.4585);
    king_psqt[30].eg = round(8.54151);
    king_psqt[31].mg = round(-51.4585);
    king_psqt[31].eg = round(-11.4585);
    king_psqt[32].mg = round(-17.4585);
    king_psqt[32].eg = round(-8.45849);
    king_psqt[33].mg = round(-20.4585);
    king_psqt[33].eg = round(21.5415);
    king_psqt[34].mg = round(-12.4585);
    king_psqt[34].eg = round(23.5415);
    king_psqt[35].mg = round(-27.4585);
    king_psqt[35].eg = round(26.5415);
    king_psqt[36].mg = round(-30.4585);
    king_psqt[36].eg = round(25.5415);
    king_psqt[37].mg = round(-25.4585);
    king_psqt[37].eg = round(32.5415);
    king_psqt[38].mg = round(-14.4585);
    king_psqt[38].eg = round(25.5415);
    king_psqt[39].mg = round(-36.4585);
    king_psqt[39].eg = round(2.54151);
    king_psqt[40].mg = round(-9.45849);
    king_psqt[40].eg = round(9.54151);
    king_psqt[41].mg = round(23.5415);
    king_psqt[41].eg = round(16.5415);
    king_psqt[42].mg = round(1.54151);
    king_psqt[42].eg = round(22.5415);
    king_psqt[43].mg = round(-16.4585);
    king_psqt[43].eg = round(14.5415);
    king_psqt[44].mg = round(-20.4585);
    king_psqt[44].eg = round(19.5415);
    king_psqt[45].mg = round(5.54151);
    king_psqt[45].eg = round(44.5415);
    king_psqt[46].mg = round(21.5415);
    king_psqt[46].eg = round(43.5415);
    king_psqt[47].mg = round(-22.4585);
    king_psqt[47].eg = round(12.5415);
    king_psqt[48].mg = round(28.5415);
    king_psqt[48].eg = round(-12.4585);
    king_psqt[49].mg = round(-1.45849);
    king_psqt[49].eg = round(16.5415);
    king_psqt[50].mg = round(-20.4585);
    king_psqt[50].eg = round(13.5415);
    king_psqt[51].mg = round(-7.45849);
    king_psqt[51].eg = round(16.5415);
    king_psqt[52].mg = round(-8.45849);
    king_psqt[52].eg = round(16.5415);
    king_psqt[53].mg = round(-4.45849);
    king_psqt[53].eg = round(37.5415);
    king_psqt[54].mg = round(-38.4585);
    king_psqt[54].eg = round(22.5415);
    king_psqt[55].mg = round(-29.4585);
    king_psqt[55].eg = round(10.5415);
    king_psqt[56].mg = round(-65.4585);
    king_psqt[56].eg = round(-74.4585);
    king_psqt[57].mg = round(22.5415);
    king_psqt[57].eg = round(-35.4585);
    king_psqt[58].mg = round(15.5415);
    king_psqt[58].eg = round(-18.4585);
    king_psqt[59].mg = round(-15.4585);
    king_psqt[59].eg = round(-18.4585);
    king_psqt[60].mg = round(-56.4585);
    king_psqt[60].eg = round(-11.4585);
    king_psqt[61].mg = round(-34.4585);
    king_psqt[61].eg = round(14.5415);
    king_psqt[62].mg = round(1.54151);
    king_psqt[62].eg = round(3.54151);
    king_psqt[63].mg = round(12.5415);
    king_psqt[63].eg = round(-17.4585);


    // #endif
    //tune();

    // Start UCI driver loop
    loop(argc, argv);

    return 0;
}
