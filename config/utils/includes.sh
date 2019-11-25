#!/bin/bash -e

__includes() {
    local FILES LOOK_UP FILES_LENGTH

    FILES_LENGTH=${#@}
    FILES=${*:1:$((FILES_LENGTH - 1))}
    LOOK_UP=${*:$FILES_LENGTH}

    if [[ "$FILES" =~ $LOOK_UP ]]; then
        return 0
    else
        return 1
    fi
}

# If this file is on the terminal $PATH's just run the function `__includes`
# Otherwise just source it and run
if [ "$(basename "$0")" = "includes.sh" ]; then
    __includes "${@}"
fi
