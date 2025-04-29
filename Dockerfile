# syntax=docker/dockerfile:1
FROM amazonlinux:2

# Install OS packages...
RUN yum install -y git gcc10 gcc10-c++ cpp cpio make automake autoconf chkconfig clang clang-libs dos2unix zlib zlib-devel zip unzip tar perl libxml2 bzip2 bzip2-libs xz xz-libs pkgconfig libtool wget tar gzip zlib-devel openssl-devel 
RUN yum groupinstall "Development Tools" -y
ADD build /root/build

ENV CC=/usr/bin/gcc10-gcc
ENV CXX=/usr/bin/gcc10-g++

RUN chmod +x /root/build/*.sh

# Remove the ones you don't need...
RUN /root/build/build_cmake.sh
RUN /root/build/build_libjpeg.sh
RUN /root/build/build_libpng.sh
RUN /root/build/build_libwebp.sh
RUN /root/build/build_libde265.sh
RUN /root/build/build_libheif.sh
RUN /root/build/build_libopenjp2.sh
RUN /root/build/build_libtiff.sh
RUN /root/build/build_libbz2.sh
RUN /root/build/build_lcms.sh
RUN /root/build/build_libxml.sh

# And finally...
# RUN /root/build/build_imagemagick.sh