# ¯\_(ツ)_/¯
[[ $- != *i* ]] && return

# Script to source (¯\_(ツ)_/¯)
. ~/.scripts/sourceifexists

# Mac related (¯\\_(ツ)_/¯)
case "$(uname -s)" in
    [Dd]arwin) sourceIfExists ~/.zsh/mac ;;
esac

# Import configurations
sourceIfExists -imac -ihooks ~/.zsh/*
sourceIfExists ~/.zsh/hooks # this order matters

# Package manager for `zsh`
sourceIfExists ~/.antigenrc

# Use VI mode in bash
setopt VI
setopt MENU_COMPLETE

# Autoexecute double bang history
unsetopt HIST_VERIFY

# Source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# File Descriptor stuff
unsetopt MULTIOS

# google cloud platform
sourceIfExists /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
sourceIfExists /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/cabaalexander/Library/Caches/heroku/autocomplete/zsh_setup \
    && test -f $HEROKU_AC_ZSH_SETUP_PATH \
    && source $HEROKU_AC_ZSH_SETUP_PATH;

# bun completions
[ -s "/Users/cabaalexander/.bun/_bun" ] && source "/Users/cabaalexander/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"
