#ifndef POLYGLOT_H_
#define POLYGLOT_H_

#include "Board.h"

#ifdef _MSC_VER
#  define U64_POLY(u) (u##ui64)
#else
#  define U64_POLY(u) (u##ULL)
#endif

extern const u64 Random64Poly[781];

typedef struct {
    u64 key;
    unsigned short move;
    unsigned short weight;
    unsigned int learn;
} polyentry_t;

#endif // POLYGLOT_H_
