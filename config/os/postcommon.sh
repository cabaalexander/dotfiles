#!/bin/bash

postCommonOsInstall(){
  echo "[Installing] TMUX"
  redirectToNull tmuxInstall

  echo "[Installing] Gems"
  iterateOver "${GEMS}" redirectToNull gemInstall

  echo "[Installing] PIPs"
  iterateOver "${PIP}" redirectToNull pipInstall

  echo "[Installing] TMUX Plugins"
  redirectToNull tpmInstall

  echo "[Installing] NVIM Plugins"
  redirectToNull plugInstall

  # This removes the ruby import on the ~/.bashrc because it is already on ~/.profile
  git checkout .
}

# This meant to be used when `install-it.sh` script is executed :'V

