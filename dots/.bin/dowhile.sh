#!/bin/bash

doWhile(){
  set -e

  TIME_RE="^[0-9]+[smh]?$"

  if [[ "$1" == "-t" ]]
  then
    [[ $2 =~ $TIME_RE ]] || {
      echo "Option (-t) valid format: [0-9]+s|m|h"
      exit 1
    }
    TIME=$2
    shift 2
  fi

  while :
  do
    "$@"
    sleep "${TIME:-1}"
  done
}

# If this file is running in terminal call the function `doWhile`
# Otherwise just source it
if [ "$(basename "${0}")" = "dowhile.sh" ]
then
  doWhile "${@}"
fi

