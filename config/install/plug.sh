#!/bin/bash
# shellcheck disable=1090

plugInstall(){
  # Prepare yarn for VIM plugins
  source "${HOME}"/.profile

  nvim -c PlugInstall -c qa!
}

# This meant to be used when `install-it.sh` script is executed :'V

