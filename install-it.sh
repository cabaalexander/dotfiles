#!/bin/bash

. ./bin/appinstall.sh
. ./bin/getos.sh
. ./bin/utils.sh
. ./bin/updateapt.sh
. ./bin/geminstall.sh
. ./bin/pipinstall.sh

COMMON="tree git tmux"
LINUX="build-essential python3 python3-pip software-properties-common"
MAC="neovim"
OS="$(getOS)"

installNVM(){
  # Node
  echo "[Installing] NVM"
  (
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
  ) &> /dev/null

  # Refresh $PATH env variable
  source ${HOME}/.profile

  # Install node v9.5.0
  echo "[Installing] node v9.5.0"
  (
  nvm i 9.5
  ) &> /dev/null
}

installRVM(){
  # Ruby
  echo "[Installing] Ruby"
  (
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2
  ) &> /dev/null
  source ${HOME}/.rvm/scripts/rvm
}

iterateOverApps(){
  local APPS=$@
  for APP in ${APPS}
  do
    appInstall ${APP}
  done
}

if [ "${OS}" == "linux" ]
then
  # Set TimeZone to America/Santo_Domingo
  echo "[Setting Timezone]"
  sudo timedatectl set-timezone America/Santo_Domingo

  # Update APT-get
  updateAPT
fi

# Begin install process

echo "[Symlin-ing] dot-files"
./symlink-it.sh &> /dev/null


iterateOverApps ${COMMON}

case "${OS}" in
  linux)
    iterateOverApps ${LINUX}

    # Add NVIM `ppa` repository
    sudo add-apt-repository -y ppa:neovim-ppa/unstable

    updateAPT

    # NVIM Needs to be installed after the `ppa` repo
    # is added to the registry ¯\_(ツ)_/¯
    appInstall neovim

    # After system apps are installed
    installNVM
    installRVM
    ;;
  mac)
    iterateOverApps ${MAC}
    ;;
  *)
    die "Operative System not supported ¯\_(ツ)_/¯"
esac

# TMUX package manager
TMUX_PATH=${HOME}/.tmux/plugins/tpm
if [ ! -f ${TMUX_PATH} ]
then
  echo "[Cloning] TPM"
  git clone https://github.com/tmux-plugins/tpm ${TMUX_PATH}
else
  echo "[TPM already cloned]"
fi

# Copy and paste the script `after.sh` from my `devagrant` repo ¯\_(ツ)_/¯

# Gems
gemInstall neovim

# pip Install
pipInstall neovim

# Install NVIM Plugins
echo "[Installing] NVIM Plugins"
nvim -c PlugInstall -c qa! &> /dev/null

# Install TMUX plugins :: Taken from -> (https://github.com/tmux-plugins/tpm/issues/6#issuecomment-54520698)

# start a server but don't attach to it
tmux start-server

# create a new session but don't attach to it either
tmux new-session -d

# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# killing the server is not required, I guess
tmux kill-server

echo "Ready to use :D Reload the terminal to continue"

