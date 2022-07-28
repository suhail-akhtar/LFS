#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf libtool-2.4.6.tar.xz
cd libtool-2.4.6
./configure --prefix=/usr

make 

make check

make install

rm -fv /usr/lib/libltdl.a


# Footer
cd $LFS/sources
rm -rf libtool-2.4.6
echo "Done - libtool-2.4.6.tar.xz"