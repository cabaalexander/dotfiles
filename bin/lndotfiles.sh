#!/bin/bash

. ./bin/normalizepath.sh
. ./bin/utils.sh

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

# If this file is running in terminal call the function `normalizePath`
if [ "$(basename ${0})" = "lndotfiles.sh" ]
then
  lnDotFiles "${@}"
fi

