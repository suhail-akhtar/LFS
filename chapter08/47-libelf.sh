#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header

cd $LFS/sources
tar xvf elfutils-0.186.tar.bz2
cd elfutils-0.186

./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy

make 

make check

make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a



# Footer
cd $LFS/sources
rm -rf elfutils-0.186
echo "Done - {0}"
