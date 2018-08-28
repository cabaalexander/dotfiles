# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

addToPath(){
  PATH="$1:$PATH"
}

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f ~/.bashrc ]; then
      . ~/.bashrc
    fi
fi

[ -f ~/.profile_init.sh -a -z "$PROFILE_INIT" ] && . ~/.profile_init.sh

# This loads nvm
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh

# Load RVM into a shell session *as a function*
[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm

# BIN
addToPath ~/.bin
addToPath ~/.local/bin

# RVM
addToPath ~/.rvm/bin

# Yarn
addToPath ~/.yarn/bin
addToPath ~/.config/yarn/global/node_modules/.bin

# Flutter
addToPath ~/flutter/bin

