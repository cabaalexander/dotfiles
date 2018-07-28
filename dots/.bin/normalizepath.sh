#!/bin/bash

normalizePath(){
  NORMALIZE_ERROR_PATH=/tmp/normalize
  FILE_PATH=${1}

  [ -z "${FILE_PATH}" ] && return 1

  # This saves an error on `/tmp/normalize` or empty if successful
  # ( `2>` redirects only stderr )
  NORMALIZED=$(cd ${FILE_PATH} 2> ${NORMALIZE_ERROR_PATH}; pwd)

  # This reads the first line of `/tmp/normalize` to check the error
  # If empty it means is successful

  # An actual error of cat will be redirected to /dev/null
  # in case the file does not exists
  NORMALIZE_ERROR=$(cat ${NORMALIZE_ERROR_PATH} 2> /dev/null)

  # If no `NORMALIZE_ERROR` is empty return `NORMALIZED`
  if [ -z "${NORMALIZE_ERROR}" ]
  then
    echo "${NORMALIZED}"
    return 0
  fi

  # Removes the temporary file (This can be avoided but... :'V
  rm -rf ${NORMALIZE_ERROR_PATH}
  return 1
}

# If this file is running in terminal call the function `normalizePath`
if [ "$(basename ${0})" = "normalizepath.sh" ]
then
  normalizePath "${@}"
fi

