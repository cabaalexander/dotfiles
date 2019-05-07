#!/bin/bash
set -Eeuo pipefail

REPO_URL="https://github.com/cabaalexander/another-go-installer.git"

goInstall(){
    temp_dir=$(mktemp -d)

    echo "Cloning 'another-go-installer'..."
    git clone "$REPO_URL" "$temp_dir" &> /dev/null
    "$temp_dir/another-go-installer.sh" -q
    rm -rf "$temp_dir"
}

# If this file is running in terminal call the function `goInstall`
# Otherwise just source it
if [ "$(basename "$0")" = "go.sh" ]
then
    goInstall "${@}"
fi
