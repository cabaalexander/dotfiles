#!/bin/bash

redirectToPath(){
  if [ "${INSTALL_LOG}" == "true" ]
  then
    $@ &>> /tmp/install-it.log
  else
    TEMP_PATH=$1
    shift

    $@ &>> ${TEMP_PATH:-/dev/null}
  fi
}

# If this file is running in terminal call the function `redirectToPath`
# Otherwise just source it
if [ "$(basename ${0})" = "redirecttopath.sh" ]
then
  redirectToPath "${@}"
fi


