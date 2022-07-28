#!/bin/bash
if [ "$(whoami)" != "lfs" ]; then
 echo "Script must be run as user: lfs"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf binutils-2.38-lto_fix-1.patch
cd binutils-2.38-lto_fix-1.patch
mkdir -v build
cd       build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --disable-werror

make

make install


# Footer
cd $LFS/sources
rm -rf binutils-2.38-lto_fix-1.patch
echo "Done - binutils-2.38-lto_fix-1.patch"