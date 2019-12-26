#!/bin/bash

__is_installed(){
  local LOG_FILE=${1:?"No file provided"}
  local APP=${2:?"No app name provided"}
  local TYPE=$3

  local PATTERN_TRUE="^$TYPE :: $APP :: 0$"
  local PATTERN_FALSE="^$TYPE :: $APP :: 1$"

  if grep -E "$PATTERN_TRUE" &> /dev/null < "$LOG_FILE"; then
      echo "✔ $APP ($TYPE)"
      return 0
  elif grep -E "$PATTERN_FALSE" &> /dev/null < "$LOG_FILE"; then
      echo "✗ $APP ($TYPE) <----"
      return 0
  fi

  return 1
}

# If this file is running in terminal call the function `__is_installed`
# Otherwise just source it
if [ "$(basename "${0}")" = "isinstalled.sh" ]
then
  __is_installed "${@}"
fi

