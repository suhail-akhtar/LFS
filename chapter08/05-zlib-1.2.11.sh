#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf zlib-1.2.11.tar.xz
cd zlib-1.2.11
./configure --prefix=/usr

make

make check

make install

rm -fv /usr/lib/libz.a


# Footer
cd $LFS/sources
rm -rf zlib-1.2.11
echo "Done - zlib-1.2.11.tar.xz"