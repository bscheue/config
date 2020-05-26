#!/usr/bin/env bash

[ -f $HOME/config/old ] || mkdir $HOME/config/old
rm -rf $HOME/config/old/*

for dotfile in $(ls -A $HOME/config/dotfiles); do
  [ -f $dotfile ] && mv $HOME/$dotfile $HOME/config/old
  ln -s $HOME/config/dotfiles/$dotfile $HOME/$dotfile
done

