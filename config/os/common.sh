#!/bin/bash

commonOsInstall(){
  echo "[Installing] Common"
  iterateOver "${COMMON}" redirectToPath appInstall

  echo "[Installing] Yarn"
  redirectToPath yarnInstall

  echo "[Installing] Docker"
  redirectToPath dockerInstall
}

# This meant to be used when `install-it.sh` script is executed :'V

