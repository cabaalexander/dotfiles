#!/bin/bash

rvmInstall(){
  local RUBY="2.2"

  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash -s stable --ruby="${RUBY}"
}

# If this file is running in terminal call the function `rvmInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "rvm.sh" ]
then
  rvmInstall "${@}"
fi

