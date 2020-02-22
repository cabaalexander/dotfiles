# Script to source (¯\_(ツ)_/¯)
. ~/.scripts/sourceifexists

# Import configurations
sourceIfExists ~/.bash/*

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI mode in bash
set -o vi
export EDITOR=nvim

# Change GIT_PS1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose"
export GIT_PS1_STATESEPARATOR=" "
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWCOLORHINTS=1


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
