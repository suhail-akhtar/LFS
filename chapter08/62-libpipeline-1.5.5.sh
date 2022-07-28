#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf libpipeline-1.5.5.tar.gz
cd libpipeline-1.5.5
./configure --prefix=/usr

make

make check

make install


# Footer
cd $LFS/sources
rm -rf libpipeline-1.5.5
echo "Done - libpipeline-1.5.5.tar.gz"