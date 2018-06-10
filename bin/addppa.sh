#!/bin/bash

. ~/bin/io.sh

addPPA(){
  [ -n "$1" ] \
    && PPA=$1 \
    || die "What PPA do you want to add?"

  sudo add-apt-repository -y ppa:${PPA}
}

# If this file is running in terminal call the function `addPPA`
# Otherwise just source it
if [ "$(basename ${0})" = "addppa.sh" ]
then
  addPPA "${@}"
fi

