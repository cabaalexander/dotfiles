#!/bin/bash

. ./bin/normalizePath.sh
. ./bin/utils.sh

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

# If this file is running in terminal call the function `normalizePath`
if [ "$(basename ${0})" = "lndir.sh" ]
then
  lnDir "${@}"
fi

