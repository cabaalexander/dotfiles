#!/bin/bash -e

__go_pkg() {
    go get -v -u "$@"
}

# If this file is on the terminal $PATH's just run the function `__go_pkg`
# Otherwise just source it and run
if [ "$(basename "$0")" = "gopkm.sh" ]; then
    __go_pkg "${@}"
fi
