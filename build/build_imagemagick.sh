#!/usr/bin/env bash
set -e

cd /root
curl https://imagemagick.org/archive/releases/ImageMagick-6.9.13-25.tar.xz -L -o tmp-imagemagick.tar.xz
tar -xJf tmp-imagemagick.tar.xz
cd ImageMagick*

# Export build flags
# Export build flags
export PKG_CONFIG_PATH=/root/build/cache/lib/pkgconfig
export CXXFLAGS="-std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -fPIC"
export CFLAGS="-D_GLIBCXX_USE_CXX11_ABI=0 -fPIC"
export LDFLAGS="-L/root/build/cache/lib"
export LIBRARY_PATH="/root/build/cache/lib"   # ← This is the key addition
export CPPFLAGS="-I/root/build/cache/include"
export LIBS="-lstdc++ -lde265 -ldl -llcms2 -ltiff -ljpeg -lpng -lwebp -lopenjp2 -lbz2"



./configure \
    --disable-dependency-tracking \
    --disable-shared \
    --enable-static \
    --prefix=/root/result \
    --enable-delegate-build \
    --disable-installed \
    --without-modules \
    --disable-docs \
    --without-magick-plus-plus \
    --without-perl \
    --without-x \
    --disable-openmp \
    --with-heic \
    --with-jpeg \
    --with-png \
    --with-webp \
    --with-tiff \
    --with-openjp2 \
    --with-xml \
    --with-lcms \
    --with-bzlib \
    --enable-zero-configuration \
    CPPFLAGS="-I/root/build/cache/include" \
    LDFLAGS="$LDFLAGS"

make clean
make VERBOSE=1 -j$(nproc)
make install

# Verify installation and supported formats
echo "Verifying ImageMagick installation..."
/root/result/bin/convert -version
echo "Checking supported formats..."
/root/result/bin/convert -list format

