#!/bin/bash

rvmInstall(){
  # Ruby
  echo "[Installing] Ruby ${RUBY}"
  (
  curl -sSL https://get.rvm.io | bash -s stable --ruby=${RUBY}
  ) &> /dev/null
  source ${HOME}/.rvm/scripts/rvm
}

# This meant to be used when `install-it.sh` script is executed :'V

