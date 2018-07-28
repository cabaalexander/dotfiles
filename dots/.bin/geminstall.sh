#!/bin/bash

# Relative require
geminstall=${BASH_SOURCE%/*}
if [[ ! -d "$geminstall" ]]
then
  geminstall=$(dirname $0)
fi

. $geminstall/io.sh

gemInstall(){
  # Install gems for ruby
  [ -n "$1" ] \
    && GEM=$1 \
    || die "What gem do you want to install?"

  gem install ${GEM}
}

# If this file is running in terminal call the function `gemInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "geminstall.sh" ]
then
  gemInstall "${@}"
fi

