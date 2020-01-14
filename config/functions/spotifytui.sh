#!/bin/bash -e
# shellcheck disable=2064

spotifytuiInstall() {
    mkdir ~/spotify-tui 2> /dev/null || true
    "${PWD}"/config/managers/aur.sh spotify-tui
}

# If this file is on the terminal $PATH's just run the function `spotifytuiInstall`
# Otherwise just source it and run
if [ "$(basename "$0")" = "spotifytui.sh" ]; then
    spotifytuiInstall "${@}"
fi

