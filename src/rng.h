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

#ifndef RNG_H_
#define RNG_H_

#include "types.h"

//extern rng_state;

void seed_rng(uint64_t rng_seed = 42069ULL);

uint64_t rand_uint64();

// Assumes PRNG has been seeded (init_keys)
// Returns a random sparse (low number of set bits) 64-bit integer
inline uint64_t sparse_uint64() {
    return rand_uint64() &
           rand_uint64() &
           rand_uint64();
}

#endif // RNG_H_
