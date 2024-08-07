#!/bin/bash

SRC_DIR=".."
OUT_DIR="./bin/macos"
LIB_DIR="hts_engine_API-osx-coreml-universal-static_lib"

CPU_COUNT=$(sysctl -n hw.physicalcpu)
PARALLEL_JOB_COUNT=${PARALLEL_JOB_COUNT:=$CPU_COUNT}

# for clean build
rm -rf ${OUT_DIR}/*

# Build for macos
cmake -S ../ -G "Ninja" -B ${OUT_DIR} \
    -D CMAKE_OSX_ARCHITECTURES="x86_64;arm64" \
    -D CMAKE_BUILD_TYPE=Release

cmake --build ${OUT_DIR} --parallel ${PARALLEL_JOB_COUNT}

# collect lib & header
mkdir -p ${OUT_DIR}/${LIB_DIR}/{lib,include}
cp ${OUT_DIR}/lib/libhts_engine_API.a ${OUT_DIR}/${LIB_DIR}/lib/
cp ${SRC_DIR}/include/HTS_engine.h ${OUT_DIR}/${LIB_DIR}/include/

echo "Build fin. --> ${OUT_DIR}/${LIB_DIR}"
