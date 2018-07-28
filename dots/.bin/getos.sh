#!/bin/bash

getOS(){
  UNAME_OUT="$(uname -s)"

  case "${UNAME_OUT}" in
    Linux*)   echo "linux";;
    Darwin*)  echo "mac";;
    CYGWIN*)  echo "cygwin";;
    MINGW*)   echo "mingw";;
    *)        echo "";;
  esac
}

# If this file is running in terminal call the function `getOS`
if [ "$(basename ${0})" = "getos.sh" ]
then
  getOS "${@}"
fi

