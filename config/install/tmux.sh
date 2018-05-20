#!/bin/bash

. ~/bin/io.sh

tmuxInstall(){
  TEMP_TMUX_PATH="/tmp/tmux"

  rm -rf ${TEMP_TMUX_PATH}

  git clone https://github.com/tmux/tmux.git ${TEMP_TMUX_PATH}

  cd ${TEMP_TMUX_PATH}

  sh autogen.sh

  ./configure && make

  sudo make install

  cd -

  rm -vrf ${TEMP_TMUX_PATH}
}

# If this file is running in terminal call the function `tmuxInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "tmux.sh" ]
then
  tmuxInstall "${@}"
fi


