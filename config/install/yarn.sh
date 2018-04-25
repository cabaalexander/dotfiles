#!/bin/bash

yarnInstall(){
  echo "[Installing] Yarn"
  (
  curl -o- -L https://yarnpkg.com/install.sh | bash
  ) &> /dev/null
}

# This meant to be used when `install-it.sh` script is executed :'V

