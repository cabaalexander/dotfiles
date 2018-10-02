#!/bin/bash

# Source script to source (¯\_(ツ)_/¯)
. ~/.scripts/sourceifexists

# Source all `bin` files
sourceIfExists ~/.bin/*.sh

# Source `utils`
sourceIfExists ./config/utils/*.sh

# Source all `config` files
sourceIfExists ./config/*.sh
sourceIfExists ./config/**/*.sh

# Begin install process

# Update package manager repositories (I should one of this for mac ¯\_(ツ)_/¯ *brew related*)
if [ "${OS}" == "linux" ]
then
  echo "[Updating APT]"
  redirectToPath updateAPT
fi

commonOsInstall

case "${OS}" in
  linux)
    linuxOsInstall
    ;;
  mac)
    iterateOver "${MAC}" redirectToPath appInstall
    ;;
  *)
    die "Operative System not supported ¯\_(ツ)_/¯"
esac

postCommonOsInstall

echo "Ready to use :D Reload the terminal to continue"

