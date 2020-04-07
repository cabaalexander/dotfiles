#!/bin/bash

__aur(){
  case "$OS" in
      ubuntu) <ubuntu comunity manager goes here> "$@" ;;
      arch) yay --noconfirm -S "$@" ;;
      mac) brew cask install "$@" ;;
      *) echo "plop" ; exit 1 ;;
  esac
}

# If this file is running in terminal call the function `__aur`
# Otherwise just source it
if [ "$(basename "${0}")" = "aur.sh" ]
then
  __aur "${@}"
fi

