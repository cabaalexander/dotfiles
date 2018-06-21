#!/bin/bash

nvmInstall(){
  curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM}/install.sh | bash

  # Refresh $PATH env variable
  source ${HOME}/.profile

  nvm i "v${NODE}"
}

# This meant to be used when `install-it.sh` script is executed :'V

