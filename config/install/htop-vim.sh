#!/bin/bash

htopVIMInstall(){
  local TEMP_HTOP_PATH="/tmp/htop-vim"

  rm -rf ${TEMP_HTOP_PATH}

  git clone https://github.com/KoffeinFlummi/htop-vim.git ${TEMP_HTOP_PATH}

  cd ${TEMP_HTOP_PATH}

  sh autogen.sh

  ./configure --disable-unicode && make

  sudo make install

  cd -

  rm -rf ${TEMP_HTOP_PATH}
}

# If this file is running in terminal call the function `htopVIMInstall`
# Otherwise just source it
if [ "$(basename ${0})" = "htop-vim.sh" ]
then
  htopVIMInstall "${@}"
fi

