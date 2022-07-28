#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf gcc-11.2.0.tar.xz
cd gcc-11.2.0

ln -s gthr-posix.h libgcc/gthr-default.h

mkdir -v build
cd       build

../libstdc++-v3/configure            \
    CXXFLAGS="-g -O2 -D_GNU_SOURCE"  \
    --prefix=/usr                    \
    --disable-multilib               \
    --disable-nls                    \
    --host=$(uname -m)-lfs-linux-gnu \
    --disable-libstdcxx-pch

make 

make install

# Footer
cd $LFS/sources
rm -rf gcc-11.2.0
echo "Done - gcc-11.2.0.tar.xz"
