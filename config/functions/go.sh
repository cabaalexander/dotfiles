#!/bin/bash -e
# shellcheck disable=SC2064

REPO_URL="https://github.com/cabaalexander/another-go-installer.git"

goInstall(){
    local temp_dir
    local options

    temp_dir=$(mktemp -d)
    options=$*

    # TRAP: delete temp folder ;)
    trap "{ rm -rf $temp_dir ; }" SIGINT SIGTERM EXIT

    echo "Cloning 'another-go-installer'..."
    git clone "$REPO_URL" "$temp_dir" &> /dev/null

    eval "$temp_dir/another-go-installer.sh ${options:-"-q"}"
}

# If this file is running in terminal call the function `goInstall`
# Otherwise just source it
if [ "$(basename "$0")" = "go.sh" ]
then
    goInstall "${@}"
fi
