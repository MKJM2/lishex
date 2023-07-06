/**
 * Implementation of move ordering logic
*/
#include "order.h"

#include <cstring> // memmove

// TODO: Move ordering (MVV-LVA, killer, history)
//
namespace {

inline void score(movelist_t *moves) {
    (void) moves;
}


inline void sort(movelist_t *moves) {
    // TODO: Insertion sort for move scores (https://stackoverflow.com/a/52818393)
    int swaps = 0;
    move_t tmp;
    for (int j = 1, n = moves->size(); j < n; ++j) {
        tmp = moves->moveList[j];
        swaps = 0;
        for (int i = j-1; (i >= 0) && moves->moveList[i] > tmp; --i) {
            ++swaps;
        }
        if (swaps) {
            std::memmove(moves->moveList+j+2, moves->moveList+j+1, swaps);
            moves->moveList[j+1] = tmp;
        }
    }

}

}

// TODO:
void score_and_sort(movelist_t *moves) {
    (void) moves;
}
