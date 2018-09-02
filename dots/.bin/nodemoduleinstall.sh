#!/bin/bash

# Relative require
nodemoduleinstall=${BASH_SOURCE%/*}
if [[ ! -d "$nodemoduleinstall" ]]
then
  nodemoduleinstall=$(dirname $0)
fi

. $nodemoduleinstall/io.sh

nodeModuleInstall(){
  # Install modules for python
  [ -n "$1" ] \
    && local NODE=$1 \
    || die "What node module do you want to install?"

  yarn global add ${NODE}
}


# If this file is running in terminal call the function `nodeModuleInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "nodemoduleinstall.sh" ]
then
  nodeModuleInstall "${@}"
fi


