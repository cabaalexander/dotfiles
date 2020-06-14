#!/bin/bash -e
# shellcheck disable=1090

plugInstall(){
  # Prepare yarn for VIM plugins
  [ -f "${HOME}/.profile" ] && source "${HOME}/.profile"

  nvim -u ~/.config/nvim/init-plugin-manager.vim -c PlugInstall -c qa!
}

# If this file is running in terminal call the function `plugInstall`
# Otherwise just source it
if [ "$(basename "$0")" = "plug.sh" ]
then
    plugInstall "${@}"
fi
