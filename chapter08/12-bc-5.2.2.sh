#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf bc-5.2.2.tar.xz
cd bc-5.2.2
CC=gcc ./configure --prefix=/usr -G -O3

make 

make test

make install


# Footer
cd $LFS/sources
rm -rf bc-5.2.2
echo "Done - bc-5.2.2.tar.xz"