# ¯\_(ツ)_/¯
[[ $- != *i* ]] && return

# Script to source (¯\_(ツ)_/¯)
. ~/.scripts/sourceifexists

# Import configurations
sourceIfExists -imac ~/.zsh/*

# Mac related (¯\\_(ツ)_/¯)
case "$(uname -s)" in
    [Dd]arwin) sourceIfExists ~/.zsh/mac ;;
esac

# Package manager for `zsh`
sourceIfExists ~/.antigenrc

# Use VI mode in bash
setopt VI
setopt MENU_COMPLETE

# Autoexecute double bang history
unsetopt HIST_VERIFY

# Press enter once to execute
bindkey -M menuselect '^M' .accept-line

# Source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# File Descriptor stuff
unsetopt MULTIOS
