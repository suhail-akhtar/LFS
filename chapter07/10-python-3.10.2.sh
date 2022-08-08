#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf Python-3.10.2.tar.xz
cd Python-3.10.2
./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make 

make install


# Footer
cd $LFS/sources
rm -rf Python-3.10.2
echo "Done - Python-3.10.2.tar.xz"
