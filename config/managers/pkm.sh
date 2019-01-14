#!/bin/bash

__package_manager(){
  case "$OS" in
      mac) brew install "$@" ;;
      *) sudo pacman --needed --noconfirm -S "$@" ;;
  esac
}

# If this file is running in terminal call the function `__package_manager`
# Otherwise just source it
if [ "$(basename "${0}")" = "pkm.sh" ]
then
  __package_manager "${@}"
fi

