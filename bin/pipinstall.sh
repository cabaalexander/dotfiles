#!/bin/bash

. ~/bin/io.sh

pipInstall(){
  # Install modules for python
  [ -n "$1" ] \
    && MODULE=$1 \
    || die "What module do you want to install?"
  echo "[Installing PIP] ${MODULE}"
  pip3 install --user ${MODULE} &> /dev/null
}


# If this file is running in terminal call the function `pipInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "pipinstall.sh" ]
then
  pipInstall "${@}"
fi


