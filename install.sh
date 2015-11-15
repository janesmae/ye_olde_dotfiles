#!/usr/bin/env zsh

### Zsh

ln -sfv ~/.dotfiles/zsh/.aliases ~
ln -sfv ~/.dotfiles/zsh/.zshrc ~
ln -sfv ~/.dotfiles/zsh/.zshenv ~

### Vim

ln -sfv ~/.dotfiles/vim/.vimrc ~

### Git

ln -sfv ~/.dotfiles/git/.gitconfig ~
ln -sfv ~/.dotfiles/git/.gitignore ~
git config --global core.excludesfile ~/.gitignore

### Default Shell

chsh -s $(which zsh)