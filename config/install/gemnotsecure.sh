#!/bin/bash -e

gemnotsecureInstall(){
    gem source -r https://rubygems.org/
    gem source -a http://rubygems.org/
}

# If this file is running in terminal call the function `gemnotsecureInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "gemnotsecure.sh" ]
then
  gemnotsecureInstall "${@}"
fi

