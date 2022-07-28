#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf mpc-1.2.1.tar.gz
cd mpc-1.2.1
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.2.1

make
make html

make check

make install
make install-html


# Footer
cd $LFS/sources
rm -rf mpc-1.2.1
echo "Done - mpc-1.2.1.tar.gz"