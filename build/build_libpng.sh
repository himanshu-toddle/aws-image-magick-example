#!/usr/bin/env bash
set -e

cd /root
curl http://prdownloads.sourceforge.net/libpng/libpng-1.6.37.tar.xz -L -o tmp-libpng.tar.xz
tar xf tmp-libpng.tar.xz
cd libpng*

PKG_CONFIG_PATH=/root/build/cache/lib/pkgconfig \
  ./configure \
    CXXFLAGS="-std=c++11" \
    CPPFLAGS=-I/root/build/cache/include \
    LDFLAGS=-L/root/build/cache/lib \
    --disable-dependency-tracking \
    --disable-shared \
    --enable-static \
    --prefix=/root/build/cache

make
make install