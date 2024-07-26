#!/bin/bash

SRC_DIR=".."
OUT_DIR="./bin/linux"
LIB_DIR="hts_engine_API-linux-x64-static_lib"

# for clean build
rm -rf ${OUT_DIR}/*

# Build for linux
cmake -S ../ -G "Unix Makefiles" -B ${OUT_DIR} \
    -D CMAKE_BUILD_TYPE=Release

cmake --build ${OUT_DIR} --config Release -j 4

# collect lib & header
mkdir -p ${OUT_DIR}/${LIB_DIR}/{lib,include}
cp ${OUT_DIR}/lib/libhts_engine_API.a ${OUT_DIR}/${LIB_DIR}/lib/
cp ${SRC_DIR}/include/HTS_engine.h ${OUT_DIR}/${LIB_DIR}/include/

echo "Build fin. --> ${OUT_DIR}/${LIB_DIR}"
