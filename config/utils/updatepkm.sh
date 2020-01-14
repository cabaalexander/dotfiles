#!/bin/bash -e

__updatepkm() {
    case "$OS" in
        mac) brew update && brew upgrade ;;
        *) sudo pacman -Syu --noconfirm ;;
    esac
}

# If this file is on the terminal $PATH's just run the function `__updatepkm`
# Otherwise just source it and run
if [ "$(basename "$0")" = "updatepkm.sh" ]; then
    __updatepkm "${@}"
fi
