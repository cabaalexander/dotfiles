#!/bin/bash

plugInstall(){
  # Prepare yarn for VIM plugins
  source ${HOME}/.profile

  # Install NVIM Plugins
  echo "[Installing] NVIM Plugins"
  nvim -c PlugInstall -c qa! &> /dev/null
}

# This meant to be used when `install-it.sh` script is executed :'V

