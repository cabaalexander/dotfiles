#!/bin/bash

nginxInstall(){
  nginx=stable # use nginx=development for latest development version
  sudo add-apt-repository -y ppa:nginx/$nginx
  sudo apt-get update
  sudo apt-get install -y nginx
}

# If this file is running in terminal call the function `nginxInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "nginx.sh" ]
then
  nginxInstall "${@}"
fi


