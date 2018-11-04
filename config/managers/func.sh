#!/bin/bash

__function(){
  local FUNC=""
  for FUNC in "$@"
  do
    "${FUNC}"Install
  done
}

# If this file is running in terminal call the function `__function`
# Otherwise just source it
if [ "$(basename "${0}")" = "func.sh" ]
then
  __function "${@}"
fi

