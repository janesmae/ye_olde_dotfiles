# Starting with symlinks
ln -sfv ~/.dotfiles/system/.aliases ~
ln -sfv ~/.dotfiles/system/.zshrc ~
ln -sfv ~/.dotfiles/system/.vimrc ~

# Git symlinks and default config
ln -sfv ~/.dotfiles/git/.gitconfig ~
ln -sfv ~/.dotfiles/git/.gitignore_global ~
git config --global core.excludesfile ~/.gitignore_global

# Finally, set zsh as default shell
chsh -s $(which zsh)

