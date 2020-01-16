#!/bin/bash -e
# shellcheck disable=2064

spotifynowInstall() {
    local GIT_URL
    local temp_dir

    GIT_URL="https://github.com/micahco/spotify-now.git"
    temp_dir=$(mktemp -d)

    trap "{ rm -rf $temp_dir ; }" SIGINT SIGTERM EXIT

    git clone "$GIT_URL" "$temp_dir"

    cd "$temp_dir"

    mkdir ~/.bin 2> /dev/null || true
    cp ./spotify-now ~/.bin
}

# If this file is on the terminal $PATH's just run the function `spotifynowInstall`
# Otherwise just source it and run
if [ "$(basename "$0")" = "spotifynow.sh" ]; then
    spotifynowInstall "${@}"
fi
