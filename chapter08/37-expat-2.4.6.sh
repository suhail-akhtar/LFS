#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf expat-2.4.6.tar.xz
cd expat-2.4.6
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.4.6

make

make check

make install

install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.4.6


# Footer
cd $LFS/sources
rm -rf expat-2.4.6
echo "Done - expat-2.4.6.tar.xz"