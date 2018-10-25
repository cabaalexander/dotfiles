#!/bin/bash

__is_installed(){
  LOG_FILE=${1:?"No file provided"}
  APP=$2
  TYPE=$3

  PATTERN="^$TYPE :: $APP :: 0$"

  cat $LOG_FILE | egrep $PATTERN &> /dev/null

  return $?
}

# If this file is running in terminal call the function `__is_installed`
# Otherwise just source it
if [ "$(basename ${0})" = "isinstalled.sh" ]
then
  __is_installed "${@}"
fi

