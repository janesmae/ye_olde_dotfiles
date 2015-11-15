# Initialize colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Initialize compinit
autoload -U compinit && compinit

# Allow for functions in the prompt
setopt PROMPT_SUBST

# Set other invaluable zsh options
setopt correct
setopt ignoreeof
setopt interactivecomments
setopt noclobber

# Set history params
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt inc_append_history
setopt share_history

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# New prompt
PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{green}%m%f%(!.%F{red}.)%#%f '