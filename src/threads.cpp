/* @TODO: This file will hold thread pool code for LazySMP in the future */
#include "threads.h"

#include "eval.h" // eval_t

// @TODO: volatile vs using std::atomic<int> vs a state variable inside info struct
// volatile int state = ENGINE_STOPPED;

// Engine loop never writes to the state variable, only reads
void engine_loop(board_t *board, searchinfo_t *info) {
    LOG("Search thread started!");
    while (true) {
        switch (info->state) {
            case ENGINE_SEARCHING:
                LOG("Searching...");
                // Inside of search() every CHECKUP_INTERVAL nodes check engine status
                search(board, info);
                break;
            case ENGINE_PONDERING: /* @TODO: Implement pondering */
                LOG("Pondering not implemented...");
                continue;
            case ENGINE_STOPPED: /* @TODO: Might want to handle stop/quit separately */
                LOG("Stopping...");
                break;
            case ENGINE_QUIT: {
                LOG("Quitting...");
                break;
            }
        }
        break;
    }
    LOG("Search thread done!");
}
