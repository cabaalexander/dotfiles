#!/bin/bash

postCommonOsInstall(){
  echo "[Installing] TMUX"
  redirectToPath tmuxInstall

  echo "[Installing] Gems"
  iterateOver "${GEMS}" redirectToPath gemInstall

  echo "[Installing] PIPs"
  iterateOver "${PIP}" redirectToPath pipInstall

  echo "[Installing] NVIM Plugins"
  redirectToPath plugInstall

  echo "[Installing] TMUX Plugins"
  redirectToPath tpmInstall

  # This removes the ruby import on the ~/.bashrc because it is already on ~/.profile
  git checkout .
}

# This meant to be used when `install-it.sh` script is executed :'V

