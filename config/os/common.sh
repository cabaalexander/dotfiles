#!/bin/bash

commonOsInstall(){
  echo "[Installing] Common"
  iterateOver "${COMMON}" redirectToPath appInstall

  echo "[Installing] Yarn"
  redirectToPath yarnInstall

  echo "[Installing] Docker"
  redirectToPath dockerInstall

  echo "[Installing] HTOP-VIM"
  redirectToPath htopVIMInstall

  echo "[Installing] GOTOP"
  redirectToPath gotopInstall
}

# This meant to be used when `install-it.sh` script is executed :'V

