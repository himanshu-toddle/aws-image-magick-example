#!/usr/bin/env bash
set -e

cd /root
curl https://github.com/uclouvain/openjpeg/archive/v2.4.0.tar.gz -L -o tmp-libopenjp2.tar.gz
tar xf tmp-libopenjp2.tar.gz
cd openjpeg*

mkdir -p build
cd build

PKG_CONFIG_PATH=/root/build/cache/lib/pkgconfig \
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/root/build/cache \
    -DCMAKE_C_COMPILER=/usr/bin/gcc10-gcc \
    -DCMAKE_CXX_COMPILER=/usr/bin/gcc10-g++ \
    -DCMAKE_CXX_FLAGS="-std=c++11" \
    -DBUILD_SHARED_LIBS:bool=off \
    -DBUILD_CODEC:bool=off

make clean
make install