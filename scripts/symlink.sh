#!/bin/bash

opts=''
verbose='false'

while getopts 'ihv' flag; do
  case "${flag}" in
    h) opts='true' ;;
    v) verbose='true' ;;
    *) exit 1 ;;
  esac
done

if [ $opts ]
then
  echo -v for verbose
  echo -h to display this help
  exit 1
fi

if [ $verbose ]
then
  echo clearing ~/config/old
fi
rm -rf ~/config/old/*

for file in $(ls -A ~/config/dotfiles); do
  if [ $verbose ]
  then
    echo "Moving $file from home to ~/config/old/ and creating symlink"
  fi
  mv ~/$file ~/config/old
  ln -s ~/config/dotfiles/$file ~/$file
done

