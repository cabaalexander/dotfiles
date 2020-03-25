#!/bin/bash -e
# shellcheck disable=SC2064


yayInstall(){
    local REPO_URL
    local destination_path

    REPO_URL="https://aur.archlinux.org/yay.git"
    destination_path=$(mktemp -d)

    trap "{ rm -rf $destination_path ; }" SIGINT SIGTERM EXIT

    git clone "$REPO_URL" "$destination_path"

    cd "$destination_path" || return 1

    makepkg --noconfirm -si
}

# If this file is running in terminal call the function `yayInstall`
# Otherwise just source it
if [ "$(basename "$0")" = "yay.sh" ]
then
    yayInstall "${@}"
fi
