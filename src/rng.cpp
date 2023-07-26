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

#include "rng.h"

/*
 * Adapted from: https://en.wikipedia.org/wiki/Xorshift
 */
namespace {

// We use the SplitMix64 generator to initialize xoshiro256+
uint64_t x; /* The state can be seeded with any value. */

inline uint64_t splitmix_next() {
	uint64_t z = (x += 0x9e3779b97f4a7c15);
	z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9;
	z = (z ^ (z >> 27)) * 0x94d049bb133111eb;
	return z ^ (z >> 31);
}

inline uint64_t rol64(uint64_t v, int k) {
    return (v << k) | (v >> (64 - k));
}

typedef struct xoshiro256ss_state {
    uint64_t s[4];
} xoshiro256ss_state;

xoshiro256ss_state rng_state[1];

uint64_t xoshiro256ss(xoshiro256ss_state *state) {
    uint64_t *s = state->s;
    uint64_t const result = rol64(s[1] * 5, 7) * 9;
    uint64_t const t = s[1] << 17;

    s[2] ^= s[0];
    s[3] ^= s[1];
    s[1] ^= s[2];
    s[0] ^= s[3];

    s[2] ^= t;
    s[3] = rol64(s[3], 45);

    return result;
}

} // namespace

void seed_rng(uint64_t rng_seed) {
    // Seed the RNG
    x = rng_seed;
    rng_state->s[0] = splitmix_next();
    rng_state->s[1] = splitmix_next();
    rng_state->s[2] = splitmix_next();
    rng_state->s[3] = splitmix_next();
}

uint64_t rand_uint64() {
    return xoshiro256ss(rng_state);
}
