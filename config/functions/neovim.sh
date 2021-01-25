#!/bin/bash -e
# shellcheck disable=1090

neovimInstall(){
    if [ "$OS" == "mac" ]; then
        brew install --HEAD luajit
        brew install --HEAD neovim
    fi
}

# If this file is running in terminal call the function `neovimInstall`
# Otherwise just source it
if [ "$(basename "$0")" = "neovim.sh" ]
then
    neovimInstall "${@}"
fi
