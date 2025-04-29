#!/usr/bin/env bash
set -e

cd /root
curl https://github.com/strukturag/libde265/releases/download/v1.0.15/libde265-1.0.15.tar.gz -L -o tmp-libde265
tar xf tmp-libde265
cd libde265*

# Export build flags
export PKG_CONFIG_PATH=/root/build/cache/lib/pkgconfig
export CXXFLAGS="-std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -fPIC"
export CFLAGS="-D_GLIBCXX_USE_CXX11_ABI=0 -fPIC"
export LDFLAGS="-L/root/build/cache/lib"

sh autogen.sh

./configure \
  --disable-dependency-tracking \
  --disable-shared \
  --enable-static \
  --prefix=/root/build/cache

make clean
make -j$(nproc)
make install