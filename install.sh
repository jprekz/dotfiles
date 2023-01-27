#!/bin/sh

for file in .vimrc .bashrc .inputrc .gitconfig
do
  [ ! -e $file ] && ln -s ./$file ~/$file
done
