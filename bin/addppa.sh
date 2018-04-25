#!/bin/bash

. ~/bin/utils.sh

addPPA(){
  [ -n "$1" ] \
    && PPA=$1 \
    || die "What PPA do you want to add?"
  echo "[Adding Repository] ${PPA}"
  sudo add-apt-repository -y ppa:${PPA} &> /dev/null
}

# If this file is running in terminal call the function `addPPA`
# Otherwise just source it
if [ "$(basename ${0})" = "addppa.sh" ]
then
  addPPA "${@}"
fi

