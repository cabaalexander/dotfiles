#!/bin/bash

__package_manager(){
  case "$OS" in
      ubuntu) sudo apt-get install --assume-yes "$@" ;;
      arch) sudo pacman --needed --noconfirm -S "$@" ;;
      mac) brew install "$@" ;;
      *) echo "plop" ; exit 1 ;;
  esac
}

# If this file is running in terminal call the function `__package_manager`
# Otherwise just source it
if [ "$(basename "${0}")" = "pkm.sh" ]
then
  __package_manager "${@}"
fi

