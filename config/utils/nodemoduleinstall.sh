#!/bin/bash

nodeModuleInstall(){ # Install modules for python
  local NODE=${1:?"What node module do you want to install?"}

  yarn global add ${NODE}
}


# If this file is running in terminal call the function `nodeModuleInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "nodemoduleinstall.sh" ]
then
  nodeModuleInstall "${@}"
fi


