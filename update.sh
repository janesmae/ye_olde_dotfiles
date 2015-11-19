#!/usr/bin/env zsh

### Reset local copy from git and pull new copy.

cd ~/.dotfiles
git reset --hard HEAD
git pull
cd ~