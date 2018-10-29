#!/bin/bash

libtinfoInstall(){
    BASE="/usr/lib/"
    LIB_NCURSES="${BASE}/libncurses++w.so.6.1"
    LIB_TINFO="${BASE}/libtinfo.so.5"

    [[ -f $LIB_NCURSES ]] || {
        echo "No such file: $LIB_NCURSES" >&2
        exit 1
    }

    sudo ln -fvs $LIB_NCURSES $LIB_TINFO
}

# If this file is running in terminal call the function `libtinfoInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "libtinfo.sh" ]
then
    libtinfoInstall "${@}"
fi

