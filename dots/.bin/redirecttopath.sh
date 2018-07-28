#!/bin/bash

redirectToPath(){
  if [ "${INSTALL_LOG}" == "true" ]
  then
    INSTALL_LOG_PATH=/var/log/install-it.log

    echo -e "\n:: cmd -> $@ ::\n" &>> ${INSTALL_LOG_PATH:-/dev/null}
    $@ &>> ${INSTALL_LOG_PATH}
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


