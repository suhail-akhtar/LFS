#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf procps-ng-3.3.17.tar.xz
cd procps-ng-3.3.17
./configure --prefix=/usr                            \
            --docdir=/usr/share/doc/procps-ng-3.3.17 \
            --disable-static                         \
            --disable-kill

make

make check

make install


# Footer
cd $LFS/sources
rm -rf procps-ng-3.3.17
echo "Done - procps-ng-3.3.17.tar.xz"