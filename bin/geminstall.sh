#!/bin/bash

. ./bin/utils.sh

gemInstall(){
  # Install gems for ruby
  [ -n "$1" ] \
    && GEM=$1 \
    || die "What gem do you want to install?"
  echo "[Installing Gem] ${GEM}"
  gem install ${GEM} &> /dev/null
}

# If this file is running in terminal call the function `gemInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "geminstall.sh" ]
then
  gemInstall "${@}"
fi

