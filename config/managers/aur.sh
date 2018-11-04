#!/bin/bash

__aur(){
  yay --noconfirm -S "$@"
}

# If this file is running in terminal call the function `__aur`
# Otherwise just source it
if [ "$(basename "${0}")" = "aur.sh" ]
then
  __aur "${@}"
fi

