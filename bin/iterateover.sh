#!/bin/bash

iterateOver(){
  LIST=$1
  CALLBACK=$2
  for ITEM in ${LIST}
  do
    ${CALLBACK} ${ITEM}
  done
}



# If this file is running in terminal call the function `iterateOver`
# Otherwise just source it
if [ "$(basename ${0})" = "iterateOver.sh" ]
then
  iterateOver "${@}"
fi

