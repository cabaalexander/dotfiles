#!/bin/bash

die(){
  echo_red "$@"
  exit 1
}

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

lnDir(){
  SOURCE=$(normalizePath ${1}) || die "[lnDir] Give me a valid source dir to make a symlink"
  TARGET_DIRECTORY=$(normalizePath ${2}) || die "[lnDir] What directory do you want this to go? (A valid one)"

  # Just the name of the source directory
  SOURCE_BASENAME=$(basename ${SOURCE})

  # Absolute path of the new created symlink
  NEW_TARGET=${TARGET_DIRECTORY}/${SOURCE_BASENAME}

  # This removes the directory to avoid `ln` overwrite error
  [ -d ${NEW_TARGET} ] && rm -rvf ${NEW_TARGET}

  # Aaaaand... Action!
  ln -sfv ${SOURCE} ${NEW_TARGET}
}

lnDotFiles(){
  SOURCE_DIR=$(normalizePath ${1}) || die "[lnDotFiles] Give me a valid source dir (Where dot files are)"
  TARGET_DIR=$(normalizePath ${2})

  FILE_NAMES=$(ls ${SOURCE_DIR})

  [ -n "${TARGET_DIR}" ] \
    && NEW_TARGET=${TARGET_DIR} \
    || NEW_TARGET=${HOME}

  for FILE_NAME in ${FILE_NAMES}
  do
    ln -sfv ${SOURCE_DIR}/${FILE_NAME} ${NEW_TARGET}/.${FILE_NAME}
  done
}

