#!/usr/bin/env bash
set -e

cd /root
curl https://github.com/strukturag/libheif/releases/download/v1.19.5/libheif-1.19.5.tar.gz -L -o tmp-libheif.tar.gz
tar xf tmp-libheif.tar.gz
cd libheif*

# Export build flags
export PKG_CONFIG_PATH=/root/build/cache/lib/pkgconfig
export CXXFLAGS="-std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -fPIC"
export CFLAGS="-D_GLIBCXX_USE_CXX11_ABI=0 -fPIC"
export LDFLAGS="-L/root/build/cache/lib"

mkdir -p build
cd build

cmake .. \
  -DWITH_EXAMPLES=no \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/root/build/cache \
  -DBUILD_SHARED_LIBS:bool=off \
  -DCMAKE_C_COMPILER=/usr/bin/gcc10-gcc \
  -DCMAKE_CXX_COMPILER=/usr/bin/gcc10-g++ \
  -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
  -DCMAKE_C_FLAGS="$CFLAGS" \
  -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
  -DCMAKE_SHARED_LINKER_FLAGS="-ldl" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DENABLE_PKGCONFIG=ON

make clean || true
make VERBOSE=1 -j$(nproc)
make install