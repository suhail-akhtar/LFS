#!/bin/bash
if [ "$(whoami)" != "root" ]; then
 echo "Script must be run as user: root"
 exit 255
fi
#Header
cd $LFS/sources
tar xvf vim-8.2.4383.tar.gz
cd vim-8.2.4383
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' &gt;&gt; src/feature.h

./configure --prefix=/usr

make

chown -Rv tester .

su tester -c "LANG=en_US.UTF-8 make -j1 test" &amp;&gt; vim-test.log

make install

ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

ln -sv ../vim/vim82/doc /usr/share/doc/vim-8.2.4383

cat &gt; /etc/vimrc &lt;&lt; "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if (&amp;term == "xterm") || (&amp;term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

vim -c ':options'


# Footer
cd $LFS/sources
rm -rf vim-8.2.4383
echo "Done - vim-8.2.4383.tar.gz"