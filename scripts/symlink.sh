#!/bin/bash

vim_flag=''
opts=''
verbose='false'

while getopts 'ihv' flag; do
  case "${flag}" in
    i) vim_flag='true' ;;
    h) opts='true' ;;
    v) verbose='true' ;;
    *) exit 1 ;;
  esac
done

if [ $opts ]
then
  echo -i include vim symlinks
  echo -v for verbose
  echo -h to display this help
  exit 1
fi

if [ $verbose ]
then
  echo clearing ~/config/old
fi
rm -rf ~/config/old/*


if [ $vim_flag  ]
then
  if [ $verbose ]
  then
    echo creating vim symlinks
  fi

  mv ~/.vim/config ~/config/old
  ln -s ~/config/vim ~/.vim/config

  mv ~/.vim/UltiSnips ~/config/old
  ln -s ~/config/vim/UltiSnips ~/.vim/UltiSnips

  mv ~/.vim/after ~/config/old
  ln -s ~/config/vim/after ~/.vim/after

  exit 1
fi

for file in $(ls -A ~/config/dotfiles); do
  if [ $verbose ]
  then
    echo "Moving $file from home to ~/config/old/ and creating symlink"
  fi
  mv ~/$file ~/config/old
  ln -s ~/config/dotfiles/$file ~/$file
done

