#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf xz-5.2.5.tar.xz
cd xz-5.2.5
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.5

make 

make check

make install


# Footer
cd $LFS/sources
rm -rf xz-5.2.5
echo "Done - xz-5.2.5.tar.xz"