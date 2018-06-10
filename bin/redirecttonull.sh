#!/bin/bash

redirectToNull(){
  ( $@ ) &> /dev/null
}

# If this file is running in terminal call the function `redirectToNull`
# Otherwise just source it
if [ "$(basename ${0})" = "redirecttonull.sh" ]
then
  redirectToNull "${@}"
fi


