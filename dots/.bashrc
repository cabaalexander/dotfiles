# Script to source (¯\_(ツ)_/¯)
. ~/.scripts/sourceifexists

# Import configurations
sourceIfExists ~/.bash/*

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI mode in bash
set -o vi
bind -m vi-insert "\C-l":clear-screen
export EDITOR=nvim

# Change GIT_PS1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose"
export GIT_PS1_STATESEPARATOR=" "
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWCOLORHINTS=1

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

