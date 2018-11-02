#!/bin/bash

rvmInstall(){
  bash -c "$(curl -s get.rvm.io)" --ruby=2.2
}

# If this file is running in terminal call the function `rvmInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "rvm.sh" ]
then
  rvmInstall "${@}"
fi

