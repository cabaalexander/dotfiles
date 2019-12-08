#!/bin/bash

rvmInstall(){
  bash -c "$(curl -sL get.rvm.io)" -s --ruby
  return $?
}

# If this file is running in terminal call the function `rvmInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "rvm.sh" ]
then
  rvmInstall "${@}"
fi

