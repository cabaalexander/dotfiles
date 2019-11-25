#!/bin/bash -e

brewfontsInstall(){
    brew tap homebrew/cask-fonts
}

# If this file is running in terminal call the function `brewfontsInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "brewfonts.sh" ]
then
  brewfontsInstall "${@}"
fi

