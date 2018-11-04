#!/bin/bash

__make_pkg(){
    local \
        REPO_URL \
        BASE_NAME \
        BASE_NAME_NO_EXT DST

    REPO_URL=$1
    BASE_NAME=$(basename "$REPO_URL")
    BASE_NAME_NO_EXT=${BASE_NAME%.*}
    DST=/tmp/$BASE_NAME_NO_EXT

    git clone "$REPO_URL" "$DST"

    cd "$DST" || return 1

    makepkg --noconfirm -si

    cd - || return 1

    rm -rf "$DST"
}

# If this file is running in terminal call the function `__make_pkg`
# Otherwise just source it
if [ "$(basename "${0}")" = "makepkg.sh" ]
then
  __make_pkg "${@}"
fi

