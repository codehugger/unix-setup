earl#!/usr/bin/env bash

dir=$(pwd)/dotfiles
olddir=~/dotfiles_old
files="zshrc gitignore vimrc inputrc gitconfig gemrc"

mkdir -p $olddir

cd $dir

# Symlink all dotfiles
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
