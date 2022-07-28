#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header

perl Makefile.PL

make

make test

make install



# Footer
echo "Done - {0}"