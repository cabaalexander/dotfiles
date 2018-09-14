#!/bin/bash

iterateOver(){
  local LIST=$1
  shift

  for ITEM in ${LIST}
  do
    echo "- ${ITEM}"
    $@ ${ITEM}
  done
}



# If this file is running in terminal call the function `iterateOver`
# Otherwise just source it
if [ "$(basename ${0})" = "iterateOver.sh" ]
then
  iterateOver "${@}"
fi

