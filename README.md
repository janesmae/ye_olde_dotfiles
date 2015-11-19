# dotfiles

Meant to be used on a fresh installation of OS X. Use this at your own risk :)

## Pre-install (Update System, Install Command Line Tools and Homebrew)

    sudo softwareupdate -i -a
    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Installation

    git clone git://github.com/janesmae/dotfiles ~/.dotfiles
    source ~/.dotfiles/install.sh
    
## update

    source ~/.dotfiles/update.sh