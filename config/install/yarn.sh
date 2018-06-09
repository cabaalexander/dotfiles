#!/bin/bash

yarnInstall(){
  echo "[Installing] Yarn"

  curl -o- -L https://yarnpkg.com/install.sh | bash
}

# If this file is running in terminal call the function `yarnInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "yarn.sh" ]
then
  yarnInstall "${@}"
fi

