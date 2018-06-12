#!/bin/bash

preCommonOsInstall(){
  iterateOver "${COMMON}" redirectToNull appInstall

  echo "[Installing] Yarn"
  redirectToNull yarnInstall

  echo "[Installing] Docker"
  redirectToNull dockerInstall
}

# This meant to be used when `install-it.sh` script is executed :'V

