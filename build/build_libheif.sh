#!/usr/bin/env bash
set -e


gcc --version
gcc10-gcc --version
g++ --version


cd /root
curl https://github.com/strukturag/libheif/releases/download/v1.18.2/libheif-1.18.2.tar.gz -L -o tmp-libheif.tar.gz
tar xf tmp-libheif.tar.gz
cd libheif*

# sh autogen.sh

mkdir -p build
cd build

PKG_CONFIG_PATH=/root/build/cache/lib/pkgconfig \
   cmake .. \
    --preset=release \
    -DCMAKE_C_COMPILER=/usr/bin/gcc10-gcc \
    -DCMAKE_CXX_COMPILER=/usr/bin/gcc10-g++ \
     && make && make install
    # -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_C_FLAGS="-fPIC" \

    #  -DCMAKE_INSTALL_PREFIX=/root/build/cache \
    # -DBUILD_SHARED_LIBS:bool=off \
    # -DBUILD_CODEC:bool=off \
    # -DCMAKE_CXX_STANDARD=20 \
   
   
  # ./configure
    # CPPFLAGS=-I/root/build/cache/include \
    # LDFLAGS=-L/root/build/cache/lib 
    # --disable-dependency-tracking \
    # --disable-shared \
    # --enable-static \
    # --prefix=/root/build/cache

# make
# make install