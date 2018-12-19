#!/bin/bash

tivInstall(){
    gpg --recv-keys 1D1F0DC78F173680
}

# If this file is running in terminal call the function `tivInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "tiv.sh" ]
then
  tivInstall "${@}"
fi

