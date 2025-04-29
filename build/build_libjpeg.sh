#!/usr/bin/env bash
set -e



# Go to working directory
cd /root

# Download libjpeg-turbo source
curl https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/3.1.0.tar.gz -L -o tmp-libjpeg.tar.gz

# Extract and enter directory
tar xf tmp-libjpeg.tar.gz
cd libjpeg-turbo-*

# Create build directory
mkdir build && cd build

# Run CMake with custom install path and static linking
cmake -G"Unix Makefiles" \
  -DCMAKE_INSTALL_PREFIX=/root/build/cache \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DENABLE_SHARED=FALSE \
  -DENABLE_STATIC=TRUE \
  ..

# Compile and install
make clean || true
make VERBOSE=1 -j$(nproc)
make install
