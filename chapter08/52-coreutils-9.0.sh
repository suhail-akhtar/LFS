#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf coreutils-9.0.tar.xz
cd coreutils-9.0
patch -Np1 -i ../coreutils-9.0-i18n-1.patch

patch -Np1 -i ../coreutils-9.0-chmod_fix-1.patch

autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

make 

make NON_ROOT_USERNAME=tester check-root

echo "dummy:x:102:tester" &gt;&gt; /etc/group

chown -Rv tester . 

su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"

sed -i '/dummy/d' /etc/group

make install

mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8


# Footer
cd $LFS/sources
rm -rf coreutils-9.0
echo "Done - coreutils-9.0.tar.xz"