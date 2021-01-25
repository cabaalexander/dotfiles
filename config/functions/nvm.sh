#!/bin/bash
# shellcheck disable=1090

nvmInstall(){
  local NVM="v0.37.2"

  bash -c "$(curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM}/install.sh)"

  # Source `nvm`
  [[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh

  nvm install --lts
}

# If this file is running in terminal call the function `nvmInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "nvm.sh" ]
then
  nvmInstall "${@}"
fi

