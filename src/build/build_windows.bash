#!/bin/bash

SRC_DIR=".."
OUT_DIR="./bin/windows"

# for clean build
rm -rf ${OUT_DIR}/*

# Build for windows
cmake -S ../ -G "Visual Studio 17 2022" -A x64 -B ${OUT_DIR} \
    -D CMAKE_BUILD_TYPE=Release

cmake --build ${OUT_DIR} --config Release -j 4
