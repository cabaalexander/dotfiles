#!/bin/bash

ohmyzshInstall(){
  local USER="https://raw.githubusercontent.com/cabaalexander"
  local URL="${USER}/oh-my-zsh/master/tools/install.sh"

  sh -c "$(curl -fsSL $URL)"
}

# If this file is running in terminal call the function `ohmyzshInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "ohmyzsh.sh" ]
then
  ohmyzshInstall "${@}"
fi

