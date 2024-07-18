#!/bin/bash

SRC_DIR=".."
OUT_DIR="./bin/linux"

# for clean build
rm -rf ${OUT_DIR}/*

# Build for linux
cmake -S ../ -G "Unix Makefiles" -B ${OUT_DIR} \
    -D CMAKE_BUILD_TYPE=Release

cmake --build ${OUT_DIR} --config Release -j 4
