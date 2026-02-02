#!/bin/bash

# -----------------------------------------------

# build llvm from source at workspace
git submodule update --init --recursive
mkdir -p build && cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE="Debug" \
  -DLLVM_TARGETS_TO_BUILD="X86;RISCV" \
  -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi" \
  ../llvm
ninja