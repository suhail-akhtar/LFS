#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf libcap-2.63.tar.xz
cd libcap-2.63
sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib

make test

make prefix=/usr lib=lib install


# Footer
cd $LFS/sources
rm -rf libcap-2.63
echo "Done - libcap-2.63.tar.xz"