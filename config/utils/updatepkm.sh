#!/bin/bash -e

__updatepkm() {
    case "$OS" in
        ubuntu) sudo apt-get update ;;
        arch) sudo pacman -Syu --noconfirm ;;
        mac) brew update && brew upgrade ;;
	*) echo "plop" ; exit 1 ;;
    esac
}

# If this file is on the terminal $PATH's just run the function `__updatepkm`
# Otherwise just source it and run
if [ "$(basename "$0")" = "updatepkm.sh" ]; then
    __updatepkm "${@}"
fi
