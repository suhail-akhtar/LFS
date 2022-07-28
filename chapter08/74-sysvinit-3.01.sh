#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf sysvinit-3.01.tar.xz
cd sysvinit-3.01
patch -Np1 -i ../sysvinit-3.01-consolidated-1.patch

make 

make install


# Footer
cd $LFS/sources
rm -rf sysvinit-3.01
echo "Done - sysvinit-3.01.tar.xz"