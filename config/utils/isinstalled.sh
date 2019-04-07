#!/bin/bash

__is_installed(){
  local LOG_FILE=${1:?"No file provided"}
  local APP=$2
  local TYPE=$3

  local PATTERN="^$TYPE :: $APP :: 0$"

  if grep -E "$PATTERN" &> /dev/null < "$LOG_FILE"
  then
      echo "✔ $APP ($TYPE)"
      return 0
  else
      return 1
  fi

  return $?
}

# If this file is running in terminal call the function `__is_installed`
# Otherwise just source it
if [ "$(basename "${0}")" = "isinstalled.sh" ]
then
  __is_installed "${@}"
fi

