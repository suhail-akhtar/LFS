#!/bin/bash
if [ "$(whoami)" != "lfs" ]; then
 echo "Script must be run as user: lfs"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf linux-5.16.9.tar.xz
cd linux-5.16.9
make mrproper

make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile


cp -rv usr/include $LFS/usr


# Footer
cd $LFS/sources
rm -rf linux-5.16.9
echo "Done - linux-5.16.9.tar.xz"