#!/bin/bash -e

brewInstall() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

# If this file is running in terminal call the function `brewInstall`
# Otherwise just source it
if [ "$(basename "$0")" = "brew.sh" ]; then
    brewInstall "${@}"
fi
