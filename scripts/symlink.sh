#!/bin/bash

for file in $(ls -A ~/config/dotfiles); do
  echo "Moving $file from home to ~/config/old/"
  mv ~/$file ~/config/old
  ln -s ~/config/dotfiles/$file ~/$file
done
