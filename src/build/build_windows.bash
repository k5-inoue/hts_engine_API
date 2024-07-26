#!/bin/bash

SRC_DIR=".."
OUT_DIR="./bin/windows"
LIB_DIR="hts_engine_API-win-x64-static_lib"

# for clean build
rm -rf ${OUT_DIR}/*

# Build for windows
cmake -S ../ -G "Visual Studio 17 2022" -A x64 -B ${OUT_DIR} \
    -D CMAKE_BUILD_TYPE=Release

cmake --build ${OUT_DIR} --config Release -j 4

# collect lib & header
mkdir -p ${OUT_DIR}/${LIB_DIR}/{lib,include}
cp ${OUT_DIR}/lib/Release/hts_engine_API.lib ${OUT_DIR}/${LIB_DIR}/lib/
cp ${SRC_DIR}/include/HTS_engine.h ${OUT_DIR}/${LIB_DIR}/include/

echo "Build fin. --> ${OUT_DIR}/${LIB_DIR}"
