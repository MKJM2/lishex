#ifndef THREADS_H_
#define THREADS_H_

#include <thread>
#include <iostream>
#include <string>
#include <atomic>

#include "types.h"
#include "board.h"
#include "search.h"
#include "time.h" // now()

enum { ENGINE_SEARCHING, ENGINE_PONDERING, ENGINE_STOPPED, ENGINE_QUIT };

// extern volatile int state;

// The search thread checks up the engine status
// every CHECKUP_INTERVAL nodes visited, i.e. nodes % CHECKUP_INTERVAL == 0.
// When CHECKUP_INTERVAL is a power of 2, the modulo op can be optimized
// down to nodes & (CHECKUP_INTERVAL - 1)
constexpr int CHECKUP_INTERVAL = 1 << 12; // == 4096

// Checks whether the search thread should checkup with the UCI thread
inline bool checkup_needed(const searchinfo_t *info) {
    return (info->nodes & (CHECKUP_INTERVAL-1)) == 0;
}

// Checks if the search was stopped
inline bool search_stopped(const searchinfo_t *info) {
    return info->state != ENGINE_SEARCHING || (info->time_set && now() >= info->end);
}

/**
 @brief Main loop executed by a thread performing the search
 @param board position to be searched
 @param info pointer to a searchinfo_t struct storing search requirements
 like depth, time, etc.
 */
void engine_loop(board_t *board, searchinfo_t *info);

/**
 @brief Starts the search on the provided thread for the given
board and search information provided
 @param search_thread thread to execute the search routine
 @param board board struct representing the position to be searched
 @param info pointer to a searchinfo_t struct storing search requirements
 like depth, time, etc.
 */
inline void search_start(std::thread &search_thread, board_t *board,
                         searchinfo_t *info) {
  info->state = ENGINE_SEARCHING;
  LOG("Starting search");
  search_thread = std::thread(engine_loop, board, info);
}

/**
 @brief Stops any search on the provided thread
 @param search_thread thread currently executing a search routine
 */
inline void search_stop(std::thread &search_thread, searchinfo_t *info) {
    info->state = ENGINE_STOPPED;
    if (!search_thread.joinable()) {
        return;
    }

    LOG("Blocking until thread stops the search...");
    search_thread.join();
    LOG("Done!");
}

#endif // THREADS_H_
