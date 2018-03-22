#!/bin/bash

updateAPT(){
  # Update APT repositories
  echo "[Updating APT]"
  apt-get update &> /dev/null
}


# If this file is running in terminal call the function `updateAPT`
# Otherwise just source it
if [ "$(basename ${0})" = "updateapt.sh" ]
then
  updateAPT "${@}"
fi


