#!/bin/bash -e

DIR_ARR=(
    dots/.scripts
    dots/.zsh
)

__find_sh_files(){
    local DIR_PATH

    find . -name "*.sh" -type f ! -path "*.git/*"

    for DIR_PATH in ${DIR_ARR[*]}
    do
        if [ -d "$DIR_PATH" ]
        then
            find "$DIR_PATH" -type f
        fi
    done
}

# If this file is running in terminal call the function `__find_sh_files`
# Otherwise just source it
if [ "$(basename "${0}")" = "find-sh-files.sh" ]
then
  __find_sh_files "${@}"
fi

