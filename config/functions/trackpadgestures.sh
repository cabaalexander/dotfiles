#!/bin/bash -e

trackpadgestures() {
    # this line below is not needed for arch users but not 100% sure
    # sudo gpasswd -a $USER input

    # dependencies
    sudo pacman --needed --noconfirm -S xdotool wmctrl

    # install
    "${PWD}"/config/managers/aur.sh libinput-gestures

    # start
    libinput-gestures-setup autostart
    libinput-gestures-setup start
}

# If this file is on the terminal $PATH's just run the function `trackpadgestures`
# Otherwise just source it and run
if [ "$(basename "$0")" = "trackpadgestures.sh" ]; then
    trackpadgestures "${@}"
fi
