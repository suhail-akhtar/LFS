#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf iproute2-5.16.0.tar.xz
cd iproute2-5.16.0
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

make 

make SBINDIR=/usr/sbin install

mkdir -pv             /usr/share/doc/iproute2-5.16.0
cp -v COPYING README* /usr/share/doc/iproute2-5.16.0


# Footer
cd $LFS/sources
rm -rf iproute2-5.16.0
echo "Done - iproute2-5.16.0.tar.xz"