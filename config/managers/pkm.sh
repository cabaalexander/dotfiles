#!/bin/bash

__package_manager(){
  sudo pacman --needed --noconfirm -S "$@"
}

# If this file is running in terminal call the function `__package_manager`
# Otherwise just source it
if [ "$(basename "${0}")" = "pkm.sh" ]
then
  __package_manager "${@}"
fi

