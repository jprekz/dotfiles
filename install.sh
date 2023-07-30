#!/bin/sh

script_path=$(readlink -f "$0")
script_dir=$(dirname "$script_path")

for file in .vimrc .bashrc .inputrc .gitconfig
do
  if [ -e ~/$file ]; then
    mv ~/$file ~/${file}.origin
  fi
  ln -s $script_dir/$file ~/$file
done
