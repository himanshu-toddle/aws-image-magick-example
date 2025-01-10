#!/usr/bin/env bash
set -e

CMAKE_VERSION=3.31.3


# Download, extract, and build CMake from source
# Download and use precompiled CMake binary
wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz && \
    tar -xzf cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz && \
    mv cmake-${CMAKE_VERSION}-linux-x86_64 /usr/local/cmake && \
    ln -s /usr/local/cmake/bin/cmake /usr/bin/cmake && \
    rm cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz

# Verify installation
cmake --version
