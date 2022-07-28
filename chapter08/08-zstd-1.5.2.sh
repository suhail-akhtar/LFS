#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf zstd-1.5.2.tar.gz
cd zstd-1.5.2
make

make check

make prefix=/usr install

rm -v /usr/lib/libzstd.a


# Footer
cd $LFS/sources
rm -rf zstd-1.5.2
echo "Done - zstd-1.5.2.tar.gz"