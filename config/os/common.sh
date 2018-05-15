#!/bin/bash

commonOsInstall(){
  iterateOver "${COMMON}" appInstall

  yarnInstall

  dockerInstall

  echo "[Append] hosts to /etc/hosts"
  sudo appendTo /etc/hosts ./config/hosts.sh &> /dev/null
}

# This meant to be used when `install-it.sh` script is executed :'V

