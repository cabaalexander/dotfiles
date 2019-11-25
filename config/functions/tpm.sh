#!/bin/bash

tpmInstall(){
  local TMUX_PATH="${HOME}/.tmux/plugins/tpm"

  if [ ! -f "${TMUX_PATH}" ]
  then
    git clone https://github.com/tmux-plugins/tpm "${TMUX_PATH}"
  fi

  # Install TMUX plugins :: Taken from ->
  # (https://github.com/tmux-plugins/tpm/issues/6#issuecomment-54520698)

  # start a server but don't attach to it
  tmux start-server

  # create a new session but don't attach to it either
  tmux new-session -d

  # install the plugins
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh

  # killing the server is not required, I guess
  tmux kill-server
}

# If this file is running in terminal call the function `tpmInstall`
# Otherwise just source it
if [ "$(basename "${0}")" = "tpm.sh" ]
then
  tpmInstall "${@}"
fi

