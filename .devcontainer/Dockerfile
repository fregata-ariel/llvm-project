ARG BASE_IMAGE=mcr.microsoft.com/devcontainers/base:ubuntu-20.04
FROM $BASE_IMAGE AS base

# install dependencies
RUN sudo apt-get update \
    && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        wget \
        software-properties-common \
    && sudo apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER vscode
WORKDIR /home/vscode
ARG BASE_LLVM_VERSION=11
# ------ install latest version of llvm tools ------
# set up llvm apt repo
RUN wget https://apt.llvm.org/llvm.sh \
&& chmod +x llvm.sh \
&& sudo ./llvm.sh ${BASE_LLVM_VERSION} \
&& rm llvm.sh

# ------ install dev dependencies ------
RUN sudo apt-get update \
    && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
        clang-format-${BASE_LLVM_VERSION} \
        build-essential \
        cmake \
        ninja-build \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/lists/*

# ------ set clang-11 as clang and cc ------
RUN sudo update-alternatives --install /usr/bin/clang clang  /usr/bin/clang-${BASE_LLVM_VERSION} 100
RUN sudo update-alternatives --install /usr/bin/clang++ clang++  /usr/bin/clang++-${BASE_LLVM_VERSION} 100
RUN sudo update-alternatives --install /usr/bin/cc cc  /usr/bin/clang-${BASE_LLVM_VERSION} 100
RUN sudo update-alternatives --install /usr/bin/c++ c++  /usr/bin/clang++-${BASE_LLVM_VERSION} 100