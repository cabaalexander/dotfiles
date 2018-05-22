#!/bin/bash

postCommonOsInstall(){
  tmuxInstall

  # Gems
  iterateOver "${GEMS}" gemInstall

  # pip Install
  iterateOver "${PIP}" pipInstall

  # TMUX Plugins
  tpmInstall

  # NVIM Plugins
  plugInstall

  # This removes the ruby import on the ~/.bashrc because it is already on ~/.profile
  git checkout .
}

# This meant to be used when `install-it.sh` script is executed :'V

