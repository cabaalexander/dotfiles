#!/bin/bash

installNVM(){
  # Node
  echo "[Installing] NVM ${NVM}"
  (
  curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM}/install.sh | bash
  ) &> /dev/null

  # Refresh $PATH env variable
  source ${HOME}/.profile

  # Install node
  echo "[Installing] node ${NODE}"
  (
  nvm i ${NODE}
  ) &> /dev/null
}

# This meant to be used when `install-it.sh` script is executed :'V

