#!/usr/bin/env bash

# We use cutechess-cli to play Gauntlet-style tournaments
# against opponents of similar strength

ROUNDS=1
CORES=$(($(nproc) < 4 ? $(nproc) : 4))

CUTECHESS="cutechess-cli"
CUTECHESS_FLAGS=" "

# Engine to test
CUTECHESS_FLAGS+=" -engine conf=Lishex_v2"

# Engines to test against
ENGINES=("Vice_1.1" "TSCP_1.82" "Lishex_v1")

for engine in "${ENGINES[@]}"; do
    CUTECHESS_FLAGS+=" -engine conf=$engine"
done

# Play games concurrently
CUTECHESS_FLAGS+=" -tournament gauntlet"
CUTECHESS_FLAGS+=" -concurrency ${CORES}"

# Debug output?
# CUTECHESS_FLAGS+=" -debug"


### Engine settings

# Time controls
CUTECHESS_FLAGS+=" -each tc=inf/10+0.1 timemargin=10"

### Run the tournament
${CUTECHESS} ${CUTECHESS_FLAGS}
