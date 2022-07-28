#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf psmisc-23.4.tar.xz
cd psmisc-23.4
./configure --prefix=/usr

make

make install


# Footer
cd $LFS/sources
rm -rf psmisc-23.4
echo "Done - psmisc-23.4.tar.xz"