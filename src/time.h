#ifndef TIME_H_
#define TIME_H_

#include <chrono>

#include "types.h"

// Getting current time (in milliseconds)
inline uint64_t now() {
    using namespace std::chrono;
    return duration_cast<milliseconds>(system_clock::now().time_since_epoch())
        .count();
}

// Time management for search
// TODO:

#endif // TIME_H_
