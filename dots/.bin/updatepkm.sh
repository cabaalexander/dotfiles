#!/bin/bash

updatePKM(){
  sudo pacman -Syu
}


# If this file is running in terminal call the function `updatePKM`
# Otherwise just source it
if [ "$(basename ${0})" = "updatepkm.sh" ]
then
  updatePKM "${@}"
fi


