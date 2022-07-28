#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf meson-0.61.1.tar.gz
cd meson-0.61.1
python3 setup.py build

python3 setup.py install --root=dest
cp -rv dest/* /
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson


# Footer
cd $LFS/sources
rm -rf meson-0.61.1
echo "Done - meson-0.61.1.tar.gz"