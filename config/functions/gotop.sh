#!/bin/bash

gotopInstall(){
  local TEMP_PATH

  TEMP_PATH=$(mktemp -d)

  cd "$TEMP_PATH" || return 1

  # Begin

  mkdir ~/.bin

  local URL="https://raw.githubusercontent.com/cjbassi/gotop/master/scripts/download.sh"

  bash -c "$(curl -s $URL)"

  mv -v ./* ~/.bin/

  # End

  cd - &> /dev/null || return 1

  rm -rf "$TEMP_PATH"
}

# If this file is running in terminal call the function `gotopInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "gotop.sh" ]
then
  gotopInstall "${@}"
fi


