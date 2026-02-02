ARG BASE_IMAGE=mcr.microsoft.com/devcontainers/base:ubuntu-24.04
FROM $BASE_IMAGE AS base

# install dependencies
RUN sudo apt-get update \
    && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
    && sudo apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ------ install latest version of llvm tools ------
# set up llvm apt repo
ARG OS_CODENAME=$(lsb_release -sc)
RUN curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/llvm.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/llvm.gpg] http://apt.llvm.org/${OS_CODENAME}/ llvm-toolchain-$OS_CODENAME main" >> /etc/apt/sources.list.d/llvm.list \
    && echo "deb-src [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/llvm.gpg] http://apt.llvm.org/${OS_CODENAME}/ llvm-toolchain-$OS_CODENAME main" >> /etc/apt/sources.list.d/llvm.list
RUN apt-get update \
&& sudo apt-get install -y \
    clang-11 \
    lldb-11 \
    lld-11 \
    clangd \
    clang-format \
    build-essential \
    cmake \
    ninja-build \
    && sudo apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER vscode
WORKDIR /home/vscode