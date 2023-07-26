# Lishex (codename 1F98A), a UCI chess engine built in C++
# Copyright (C) 2023 Michal Kurek
#
# Lishex is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Lishex is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

CXX = g++
CXXFLAGS = -march=native -Wall -Wextra -Wpedantic -Wshadow -std=c++20 -mpopcnt -m64 -mbmi2
# For faster compilation
CPUS := $(shell nproc)
MAKEFLAGS += --jobs=$(CPUS)

SRC_DIR = src
BUILD_DIR = build
TARGET = lishex

### Debugging (gdb)
debug ?= no
ifeq ($(debug),yes)
	CXXFLAGS += -ggdb -DDEBUG -w
endif

### Sanitizers
sanitize ?= no
ifeq ($(sanitize),yes)
	CXXFLAGS += -fsanitize=thread
endif

### Optimizations (on by default)
optimize ?= yes
ifeq ($(optimize),yes)
	ifneq ($(debug),yes)
		CXXFLAGS += -Ofast -fno-exceptions -pipe -flto=auto
	endif
endif

# List of source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)

# List of object files
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

all: $(TARGET)

# Compile source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

### $(CXX) $(CXXFLAGS) $(INC_DIRS) -c $< -o $@

# Link object files into executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

.PHONY: help run clean

# Clean the build directory
clean:
	rm -f $(BUILD_DIR)/*.o $(TARGET)

# Run the executable
run: $(TARGET)
	./$(TARGET)

help:
	@echo "To compile LiSHeX, type: "
	@echo "make"
	@echo "To compile with debug options, type: "
	@echo "make debug=yes"
	@echo "To compile without optimizations, type: "
	@echo "make optimize=no"
