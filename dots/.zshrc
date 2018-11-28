# ¯\_(ツ)_/¯
[[ $- != *i* ]] && return

# Script to source (¯\_(ツ)_/¯)
. ~/.scripts/sourceifexists

# Import configurations
sourceIfExists ~/.zsh/zshenv
sourceIfExists ~/.zsh/alias
sourceIfExists ~/.zsh/utils
sourceIfExists ~/.zsh/path

# Package manager for `zsh`
sourceIfExists ~/.antigenrc

# Use VI mode in bash
setopt VI
setopt MENU_COMPLETE

# Autoexecute double bang history
unsetopt HIST_VERIFY

# Press enter once to execute
bindkey -M menuselect '^M' .accept-line
