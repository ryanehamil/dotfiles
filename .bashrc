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

# ------------------------------ bash shell opts -----------------------

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob
shopt -s histappend

set -o vi

# ------------------------------ aliases -------------------------------
unalias -a
alias dot="cd $DOTFILES"
alias scripts="cd $SCRIPTS"
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

export PATH=$GOBIN:$SCRIPTS:$PATH
