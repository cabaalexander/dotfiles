#!/bin/bash

updateAPT(){
  sudo apt-get update
}


# If this file is running in terminal call the function `updateAPT`
# Otherwise just source it
if [ "$(basename ${0})" = "updateapt.sh" ]
then
  updateAPT "${@}"
fi


