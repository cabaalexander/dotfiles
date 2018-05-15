#!/bin/bash

# This needs to be the first thing that runs 'cause
# all the bin and configuration files are available on the system
echo "[Symlin-ing] dot-files"
./symlink-it.sh &> /dev/null


# Binaries
. ~/bin/appinstall.sh
. ~/bin/utils.sh
. ~/bin/updateapt.sh
. ~/bin/geminstall.sh
. ~/bin/pipinstall.sh
. ~/bin/addppa.sh
. ~/bin/iterateover.sh

# Utils
. ~/utils/appendto.sh

# Configs
. ./config/constants.sh

# OS Specific
. ./config/os/linux.sh
. ./config/os/common.sh

# Install Scripts
. ./config/install/rvm.sh
. ./config/install/nvm.sh
. ./config/install/yarn.sh
. ./config/install/tpm.sh
. ./config/install/plug.sh
. ./config/install/docker.sh

# Begin install process

# Update package manager repositories (I should one of this for mac ¯\_(ツ)_/¯ *brew related*)
[ "${OS}" == "linux" ] && updateAPT

commonOsInstall

case "${OS}" in
  linux)
    linuxOsInstall
    ;;
  mac)
    iterateOver "${MAC}" appInstall
    ;;
  *)
    die "Operative System not supported ¯\_(ツ)_/¯"
esac

# Gems
iterateOver "${GEMS}" gemInstall

# pip Install
iterateOver "${PIP}" pipInstall

# TMUX Plugins
tpmInstall

# NVIM Plugins
plugInstall

# This removes the ruby import on the ~/.bashrc because it is already on ~/.profile
git checkout .

echo "Ready to use :D Reload the terminal to continue"

