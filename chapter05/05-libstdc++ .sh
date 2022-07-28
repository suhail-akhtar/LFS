#!/bin/bash
if [ "$(whoami)" != "lfs" ]; then
 echo "Script must be run as user: lfs"
 exit 255
fi
#Header

mkdir -v build
cd       build

../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/11.2.0

make -j4

make DESTDIR=$LFS install



# Footer
echo "Done - {0}"