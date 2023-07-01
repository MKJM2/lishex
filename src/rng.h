#ifndef RNG_H_
#define RNG_H_

#include "types.h"

//extern rng_state;

void seed_rng(uint64_t rng_seed = 69420ULL);

uint64_t rand_uint64();

// Assumes PRNG has been seeded (init_keys)
// Returns a random sparse (low number of set bits) 64-bit integer
inline uint64_t sparse_uint64() {
    return rand_uint64() &
           rand_uint64() &
           rand_uint64();
}

#endif // RNG_H_
