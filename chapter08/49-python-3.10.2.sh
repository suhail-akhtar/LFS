#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf python-3.10.2-docs-html.tar.bz2
cd python-3.10.2-docs-html
./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --with-system-ffi    \
            --with-ensurepip=yes \
            --enable-optimizations

make 

make install

install -v -dm755 /usr/share/doc/python-3.10.2/html

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.10.2/html \
    -xvf ../python-3.10.2-docs-html.tar.bz2


# Footer
cd $LFS/sources
rm -rf python-3.10.2-docs-html
echo "Done - python-3.10.2-docs-html.tar.bz2"