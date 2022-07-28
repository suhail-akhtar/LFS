#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf make-4.3.tar.gz
cd make-4.3
./configure --prefix=/usr

make 

make check

make install


# Footer
cd $LFS/sources
rm -rf make-4.3
echo "Done - make-4.3.tar.gz"