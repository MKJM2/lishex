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

#ifndef SGD_H_
#define SGD_H_

#include <string>
#include <vector>

#include "types.h"

typedef struct {
    std::string fen;
    double result;
    double error;
} datapoint_t;

// TODO: Multiple threads can handle separate batches
typedef struct {
    std::vector<double> errors;
    std::vector<datapoint_t> datapoints;
} batch_t;


typedef struct {
    std::string name;
    int *value;
} param_t;

void tune();

#endif // SGD_H_
