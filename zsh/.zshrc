### Colors

autoload -U colors && colors
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

### Completion Rules

zstyle ':completion:*' menu select yes
zstyle ':completion:*:default' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*:descriptions' format "$fg_bold[white]» %d$reset_color"
zstyle ':completion:*' group-name ''

### Completion

setopt COMPLETE_IN_WORD
autoload -Uz compinit && compinit

### History

setopt EXTENDED_HISTORY
setopt HIST_NO_STORE
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

### Invaluable Options

setopt PROMPT_SUBST
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt CORRECT
setopt IGNORE_EOF
setopt COMPLETE_ALIASES
setopt AUTOCD
setopt AUTOPUSHD
setopt PUSHDMINUS
setopt PUSHDSILENT
setopt INTERACTIVECOMMENTS
DIRSTACKSIZE=6

### Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

### Prompt and Title

if (( $+commands[git] ))
then
    git="$commands[git]"
else
    git="/usr/bin/git"
fi

git_branch() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "[ git: %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%} ]"
    else
      echo "[ git: %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%} ]"
    fi
  fi
}

git_prompt_info () {
    ref=$($git symbolic-ref HEAD 2>/dev/null) || return
    echo "${ref#refs/heads/}"
}

PROMPT=$'\n%{$fg_bold[cyan]%}%n%{$reset_color%} at %{$fg_bold[red]%}%m%{$reset_color%} in %{$fg_bold[green]%}%~%{$reset_color%}\n› '

function title() {
    a=${(V)1//\%/\%\%}
    a=$(print -Pn "%40>...>$a" | tr -d "\n")

    case $TERM in
    screen)
        print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
        ;;
    xterm*|rxvt)
        print -Pn "\e]2;$2\a" # plain xterm title ($3 for pwd)
        ;;
    esac
}

set_prompt () {
    RPROMPT="$(git_branch)"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
