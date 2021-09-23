# If not running interactively, dont do anything
[[ $- != *i* ]] && return

# ------------------------------ local util functions ------------------

_have()	{ type "$1" &>/dev/null; }

# ------------------------------ env variables -------------------------

export GITUSER="$USER"
export REPOS="$HOME/Repos"
export TERM=xterm-256color
export DOTFILES="$REPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export HRULEWIDTH=73
export EDITOR=vi
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'
# history
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000
# path
export PATH="$GOPATH/bin:$GOBIN:$SCRIPTS:$HOME/bin:/usr/local/share/gems:$USER/.gem/ruby:/usr/share/gems:$PATH"

# ------------------------------ bash shell opts -----------------------

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob
shopt -s histappend

set -o vi

# ------------------------------ dircolors ----------------------------

if _have dircolors; then
  if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
fi

# ------------------------------ aliases -------------------------------
unalias -a
alias dot="cd $DOTFILES"
alias scripts="cd $SCRIPTS"
alias repo="cd $REPOS"
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias vb="$EDITOR $HOME/.bashrc"
alias vv="$EDITOR $HOME/.vimrc"
alias free='free -h'
alias df='df -h'
alias chmox='chmod +x'
alias c='printf "\e[H\e[2J"'
alias clear='printf "\e[H\e[2J"'

_have vim && alias vi=vim

# ------------------------------ Sourcing ------------------------------
VENV="$HOME/.local/bin/virtualenvwrapper.sh"
[[ -f "$VENV" ]] && . "$VENV"

# ------------------------------ PS1 Prompt ----------------------------
__ps1() {
  u='\[\e[33m\]' b='\[\e[36m\]' h='\[\e[34m\]'
  g='\[\e[37m\]' w='\[\e[35m\]' x='\[\e[0m\]'
  c='\[\e[31m\]' v=''

  B=$(git branch --show-current 2>/dev/null)
  C=$(git status --porcelain 2>/dev/null)
  [[ -n $VIRTUAL_ENV ]] && v="(${VIRTUAL_ENV##*/})"
  if [[ -z "$B" ]]; then
    PS1="$u\u$g@$h\h$g:$w\W\$$x "
  else
    if [[ -z "$C" ]]; then
      c='\[\e[32m\]'
    fi
    PS1="$v$u\u$g@$h\h$g:$w\W $b($c$B$b)\$$x "
  fi
}

PROMPT_COMMAND="__ps1"

