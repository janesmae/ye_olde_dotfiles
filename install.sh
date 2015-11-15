# Starting with symlinks
ln -sfv "~/.dotfiles/system/.aliases" ~
ln -sfv "~/.dotfiles/system/.zshrc" ~
ln -sfv "~/.dotfiles/system/.vimrc" ~
ln -sfv "~/.dotfiles/git/.gitconfig" ~
ln -sfv "~/.dotfiles/git/.gitignore_global" ~

# Finally, set zsh as default shell
chsh -s $(which zsh)