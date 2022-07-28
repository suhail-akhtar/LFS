#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf texinfo-6.8.tar.xz
cd texinfo-6.8
./configure --prefix=/usr

sed -e 's/__attribute_nonnull__/__nonnull/' \
    -i gnulib/lib/malloc/dynarray-skeleton.c

make 

make check

make install

make TEXMF=/usr/share/texmf install-tex

pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2&gt;/dev/null
  done
popd


# Footer
cd $LFS/sources
rm -rf texinfo-6.8
echo "Done - texinfo-6.8.tar.xz"