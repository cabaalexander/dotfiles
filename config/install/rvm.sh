#!/bin/bash

installRVM(){
  # Ruby
  echo "[Installing] Ruby ${RUBY}"
  (
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable --ruby=${RUBY}
  ) &> /dev/null
  source ${HOME}/.rvm/scripts/rvm
}

# This meant to be used when `install-it.sh` script is executed :'V

