#!/bin/bash

. ~/bin/io.sh

functionName(){
  [ -n "$1" ] \
    && FIRST_ARG=$1 \
    || die "[functionName] Error message?"
}

# If this file is running in terminal call the function `functionName`
# Otherwise just source it
if [ "$(basename ${0})" = "scriptname.sh" ]
then
  functionName "${@}"
fi

