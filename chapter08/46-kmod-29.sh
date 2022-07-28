#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf kmod-29.tar.xz
cd kmod-29
./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --with-openssl         \
            --with-xz              \
            --with-zstd            \
            --with-zlib

make 

make install

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
done

ln -sfv kmod /usr/bin/lsmod


# Footer
cd $LFS/sources
rm -rf kmod-29
echo "Done - kmod-29.tar.xz"