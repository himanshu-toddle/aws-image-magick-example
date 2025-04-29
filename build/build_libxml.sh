#!/usr/bin/env bash
set -e

# Go to working directory
cd /root

# Download libxml2 source (adjust version as needed)
curl -L https://download.gnome.org/sources/libxml2/2.10/libxml2-2.10.4.tar.xz -o tmp-libxml2.tar.xz

# Extract and enter directory
tar -xf tmp-libxml2.tar.xz
cd libxml2-*

# Configure build options
./configure \
  --prefix=/root/build/cache \
  --enable-static \
  --disable-shared \
  --without-python \
  CFLAGS="-fPIC" \
  CXXFLAGS="-fPIC"

# Compile and install
make clean || true
make VERBOSE=1 -j$(nproc)
make install
