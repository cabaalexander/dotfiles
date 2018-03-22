#!/bin/bash

functionName(){
}

# If this file is running in terminal call the function `functionName`
# Otherwise just source it
if [ "$(basename ${0})" = "scriptname.sh" ]
then
  functionName "${@}"
fi

