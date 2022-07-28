#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf python-3.10.2-docs-html.tar.bz2
cd python-3.10.2-docs-html
./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make

make install


# Footer
cd $LFS/sources
rm -rf python-3.10.2-docs-html
echo "Done - python-3.10.2-docs-html.tar.bz2"