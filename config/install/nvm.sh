#!/bin/bash
# shellcheck disable=1090

nvmInstall(){
  local NVM="0.33.8"
  local NODE="10"

  curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM}/install.sh | bash

  # Source `nvm`
  [[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh

  nvm i "v${NODE}"
}

# If this file is running in terminal call the function `nvmInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "nvm.sh" ]
then
  nvmInstall "${@}"
fi

