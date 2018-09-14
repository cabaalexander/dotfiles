#!/bin/bash

# Binaries
. ~/.bin/appinstall.sh
. ~/.bin/io.sh
. ~/.bin/updateapt.sh
. ~/.bin/geminstall.sh
. ~/.bin/pipinstall.sh
. ~/.bin/nodemoduleinstall.sh
. ~/.bin/addppa.sh
. ~/.bin/iterateover.sh
. ~/.bin/redirecttopath.sh

# Configs
. ./config/constants.sh

# OS Specific
. ./config/os/linux.sh
. ./config/os/common.sh
. ./config/os/postcommon.sh

# Install Scripts
. ./config/install/rvm.sh
. ./config/install/nvm.sh
. ./config/install/yarn.sh
. ./config/install/tpm.sh
. ./config/install/plug.sh
. ./config/install/docker.sh
. ./config/install/tmux.sh
. ./config/install/htop-vim.sh
. ./config/install/gotop.sh

# Begin install process

# Update package manager repositories (I should one of this for mac ¯\_(ツ)_/¯ *brew related*)
if [ "${OS}" == "linux" ]
then
  echo "[Updating APT]"
  redirectToPath updateAPT
fi

commonOsInstall

case "${OS}" in
  linux)
    linuxOsInstall
    ;;
  mac)
    iterateOver "${MAC}" redirectToPath appInstall
    ;;
  *)
    die "Operative System not supported ¯\_(ツ)_/¯"
esac

postCommonOsInstall

echo "Ready to use :D Reload the terminal to continue"

