#!/bin/bash

__aur(){
  case "$OS" in
      mac) brew cask install "$@" ;;
      *) yay --noconfirm -S "$@" ;;
  esac
}

# If this file is running in terminal call the function `__aur`
# Otherwise just source it
if [ "$(basename "${0}")" = "aur.sh" ]
then
  __aur "${@}"
fi

