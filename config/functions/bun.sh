#!/bin/bash

bunInstall(){
  curl -fsSL https://bun.sh/install | bash
  return $?
}

# If this file is running in terminal call the function `bunInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "bun.sh" ]
then
  bunInstall "${@}"
fi

