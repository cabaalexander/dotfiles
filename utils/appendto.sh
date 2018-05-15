#!/bin/bash

. ~/bin/normalizepath.sh
. ~/bin/utils.sh

appendTo(){
  # This appends non empty lines ¯\_(ツ)_/¯
  [ -n "$1" ] \
    && SOURCE=$1 \
    || die "[appendTo] What's the source file?"

  [ -n "$2" ] \
    && FILE_TO_APPEND=$2 \
    || die "[appendTo] What's the file to append? (Or a here document)"

  while read -r FILE_TO_APPEND_LINE
  do
    if [ -z "$(cat ${SOURCE} | grep "${FILE_TO_APPEND_LINE}")" ]
    then
      {
        echo ${FILE_TO_APPEND_LINE} >> ${SOURCE}
      } && echo "${SOURCE} << \`${FILE_TO_APPEND_LINE}\`"
    fi
  done < ${FILE_TO_APPEND}
}

# If this file is running in terminal call the function `appendTo`
# Otherwise just source it
if [ "$(basename ${0})" = "appendto.sh" ]
then
  appendTo "${@}"
fi

