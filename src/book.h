#ifndef BOOK_H_
#define BOOK_H_

#include "types.h"
#include "board.h"

typedef struct {
    uint64_t key;
    uint16_t move;
    uint16_t weight;
    uint32_t learn;
} polyentry_t;


#endif // BOOK_H_
