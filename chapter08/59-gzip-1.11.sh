#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf gzip-1.11.tar.xz
cd gzip-1.11
./configure --prefix=/usr

make 

make check

make install


# Footer
cd $LFS/sources
rm -rf gzip-1.11
echo "Done - gzip-1.11.tar.xz"