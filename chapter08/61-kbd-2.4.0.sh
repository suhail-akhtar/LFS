#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf kbd-2.4.0-backspace-1.patch
cd kbd-2.4.0-backspace-1.patch
patch -Np1 -i ../kbd-2.4.0-backspace-1.patch

sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

./configure --prefix=/usr --disable-vlock

make

make check

make install

mkdir -pv           /usr/share/doc/kbd-2.4.0
cp -R -v docs/doc/* /usr/share/doc/kbd-2.4.0


# Footer
cd $LFS/sources
rm -rf kbd-2.4.0-backspace-1.patch
echo "Done - kbd-2.4.0-backspace-1.patch"