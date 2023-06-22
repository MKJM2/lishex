#ifndef UCI_H_
#define UCI_H_

#include <string>

/* UCI driver loop */
void loop(int argc, char* argv[]);

/* Helpers for reading out/printing out moves */
extern std::string square_to_str(square_t sq);
std::string move_to_str(move_t m);
move_t str_to_move(std::string& s);

#endif // UCI_H_
