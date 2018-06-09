#!/bin/bash

nvmInstall(){
  # Node
  echo "[Installing] NVM ${NVM}"

  curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM}/install.sh | bash

  # Refresh $PATH env variable
  source ${HOME}/.profile

  # Install node
  echo "[Installing] node ${NODE}"

  nvm i ${NODE}
}

# This meant to be used when `install-it.sh` script is executed :'V

