#!/bin/bash

dockerInstall(){
    bash -c "$(curl -fsSL 321get.docker.com)" || {
      echo "Something went wrong" >&2
      return $?
  }

  sudo usermod -a -G docker "$USER"

  echo "I would relog the account or restart the OS ¯\\_(ツ)_/¯"
}

# If this file is running in terminal call the function `dockerInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "docker.sh" ]
then
  dockerInstall "${@}"
fi

