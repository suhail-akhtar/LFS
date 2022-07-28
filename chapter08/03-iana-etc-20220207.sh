#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf iana-etc-20220207.tar.gz
cd iana-etc-20220207
cp services protocols /etc


# Footer
cd $LFS/sources
rm -rf iana-etc-20220207
echo "Done - iana-etc-20220207.tar.gz"