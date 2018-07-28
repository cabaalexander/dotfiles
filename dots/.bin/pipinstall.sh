#!/bin/bash

# Relative require
pipinstall=${BASH_SOURCE%/*}
if [[ ! -d "$pipinstall" ]]
then
  pipinstall=$(dirname $0)
fi

. $pipinstall/io.sh

pipInstall(){
  # Install modules for python
  [ -n "$1" ] \
    && MODULE=$1 \
    || die "What module do you want to install?"

  pip3 install --user ${MODULE}
}


# If this file is running in terminal call the function `pipInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "pipinstall.sh" ]
then
  pipInstall "${@}"
fi


