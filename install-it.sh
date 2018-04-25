#!/bin/bash

. ./bin/appinstall.sh
. ./bin/getos.sh
. ./bin/utils.sh
. ./bin/updateapt.sh
. ./bin/geminstall.sh
. ./bin/pipinstall.sh
. ./bin/addppa.sh
. ./config/constants.sh

COMMON="tree git tmux curl"

LINUX="\
  build-essential \
  python3 \
  python3-pip \
  software-properties-common \
  haskell-platform \
"

PPA="\
  neovim-ppa/unstable \
  ultradvorka/ppa \
"

AFTER_PPA="neovim hh"

MAC="neovim hh"

OS="$(getOS)"

installNVM(){
  # Node
  echo "[Installing] NVM ${NVM}"
  (
  curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM}/install.sh | bash
  ) &> /dev/null

  # Refresh $PATH env variable
  source ${HOME}/.profile

  # Install node
  echo "[Installing] node ${NODE}"
  (
  nvm i ${NODE}
  ) &> /dev/null
}

installRVM(){
  # Ruby
  echo "[Installing] Ruby ${RUBY}"
  (
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable --ruby=${RUBY}
  ) &> /dev/null
  source ${HOME}/.rvm/scripts/rvm
}

iterateOver(){
  LIST=$1
  CALLBACK=$2
  for ITEM in ${LIST}
  do
    ${CALLBACK} ${ITEM}
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


iterateOver "${COMMON}" appInstall

# Install Yarn
echo "[Installing] Yarn"
(
curl -o- -L https://yarnpkg.com/install.sh | bash
) &> /dev/null

case "${OS}" in
  linux)
    iterateOver "${LINUX}" appInstall

    iterateOver "${PPA}" addPPA

    updateAPT

    iterateOver "${AFTER_PPA}" appInstall

    # Special installs
    installNVM
    installRVM
    ;;
  mac)
    iterateOver "${MAC}" appInstall
    ;;
  *)
    die "Operative System not supported ¯\_(ツ)_/¯"
esac

# TMUX package manager
TMUX_PATH=${HOME}/.tmux/plugins/tpm
if [ ! -f ${TMUX_PATH} ]
then
  echo "[Cloning] TPM"
  git clone https://github.com/tmux-plugins/tpm ${TMUX_PATH} &> /dev/null
else
  echo "[TPM already cloned]"
fi

# Copy and paste the script `after.sh` from my `devagrant` repo ¯\_(ツ)_/¯

# Gems
gemInstall neovim

# pip Install
pipInstall neovim

# Prepare yare for VIM plugins
source ${HOME}/.profile

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

# This removes the ruby import on the ~/.bashrc because it is already on ~/.profile
git checkout .

echo "Ready to use :D Reload the terminal to continue"

