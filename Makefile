CXX = g++
CXXFLAGS = -march=native -Wall -Wextra -Wpedantic -std=c++17
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
TARGET = lishex

### Optimizations (on by default)
optimize ?= yes
ifeq ($(optimize),yes)
	CXXFLAGS += -O3
endif

### Debugging (gdb)
debug ?= no
ifeq ($(debug),yes)
	CXXFLAGS += -g -w
endif

# List of source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)

# List of object files
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

# Include directories
INC_DIRS = -I$(INCLUDE_DIR)

all: $(TARGET)

# Compile source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INC_DIRS) -c $< -o $@

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
