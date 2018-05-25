#!/bin/bash

. ~/bin/getos.sh
. ~/bin/io.sh

appInstallLinux(){
  sudo apt-get install -y ${APP} &> /dev/null
}

appInstallMac(){
  brew install ${APP} &> /dev/null
}

appInstall(){
  # This is to install apps without showing a bunch stuffs on the stdout
  [ -n "$1" ] \
    && APP=$1 \
    || die "What app do you want to install?"

  echo "[Installing] ${APP}"

  case "$(getOS)" in
    linux)
      appInstallLinux
      ;;
    mac)
      appInstallMac
      ;;
    *)
      die "Operative System not supported ¯\_(ツ)_/¯"
      ;;
  esac
}

# If this file is running in terminal call the function `appInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "appinstall.sh" ]
then
  appInstall "${@}"
fi


