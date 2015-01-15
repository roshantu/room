#!/bin/bash

#setting colorscheme in gnome
#git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git gnome-terminal

vim_rc=${HOME}/.vimrc
vim_path=${HOME}/.vim/bundle/Vundle.vim
if [ ! -d ${vim_path} ];then
    git clone https://github.com/gmarik/Vundle.vim.git "${vim_path}"
fi

cat vimrc >> "${vim_rc}"
