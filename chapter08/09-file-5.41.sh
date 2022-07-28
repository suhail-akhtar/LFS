#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf file-5.41.tar.gz
cd file-5.41
./configure --prefix=/usr

make

make check

make install


# Footer
cd $LFS/sources
rm -rf file-5.41
echo "Done - file-5.41.tar.gz"