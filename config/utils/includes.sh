#!/bin/bash -e

__includes() {
    local files
    local look_up
    local files_length

    files_length=${#@}

    if [ "$files_length" -lt 2 ]; then
        return 1
    fi

    files=${*:1:$((files_length - 1))}
    look_up=${*:$files_length}

    for file in $files; do
        if [ "$file" = "$look_up" ]; then
            return 0
        fi
    done

    return 1
}

# If this file is on the terminal $PATH's just run the function `__includes`
# Otherwise just source it and run
if [ "$(basename "$0")" = "includes.sh" ]; then
    __includes "${@}"
fi
