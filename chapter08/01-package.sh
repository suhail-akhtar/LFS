#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header

grep -l  -e 'libfoo.*deleted' /proc/*/maps |
   tr -cd 0-9\\n | xargs -r ps u

./configure --prefix=/usr/pkg/libfoo/1.1
make
make install

./configure --prefix=/usr
make
make DESTDIR=/usr/pkg/libfoo/1.1 install



# Footer
echo "Done - {0}"