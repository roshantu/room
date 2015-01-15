#!/bin/bash

rpm -qa | grep vim
yum remove vim vim-enhanced vim-common vim-minimal 
wget http://42.96.170.192/download/pub/vim/unix/vim-7.4.tar.bz2  
wget http://42.96.170.192/download/pub/vim/extra/vim-7.2-extra.tar.gz
wget http://42.96.170.192/download/pub/vim/extra/vim-7.2-lang.tar.gz


tar jxvf vim-7.4.tar.bz2 
tar zxvf vim-7.2-extra.tar.gz  
tar zxvf vim-7.2-lang.tar.gz

mv vim72 vim74

yum install ncurses-devel 
yum install gcc

cd vim74/src
./configure --enable-multibyte \--with-features=huge \--disable-selinux  
make && make install
