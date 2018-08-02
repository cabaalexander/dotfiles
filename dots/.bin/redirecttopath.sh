#!/bin/bash

redirectToPath(){
  if [ "${INSTALL_LOG}" == "true" ]
  then
    TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
    INSTALL_LOG_PATH_CODE=/var/log/install-it-code-${TIMESTAMP}.log
    INSTALL_LOG_PATH=/var/log/install-it-${TIMESTAMP}.log
    APP_NAME=":: cmd -> $@ ::"

    echo -e "\n${APP_NAME}\n" &>> ${INSTALL_LOG_PATH}
    $@ &>> ${INSTALL_LOG_PATH}

    echo -e "\n$? ${APP_NAME}\n" &>> ${INSTALL_LOG_PATH_CODE}
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


