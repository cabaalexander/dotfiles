. ~/.bin/getos.sh

INSTALL_LOG="true"

NVM="0.33.8"
NODE="8.9.0"
RUBY="2.2"
TMUX_PATH="${HOME}/.tmux/plugins/tpm"
OS="$(getOS)"

COMMON="
  curl
  git
  htop
  tree
"

MAC="
  hh
  neovim
"

LINUX_DEPS="
  libevent-dev
  libncurses5-dev
  software-properties-common
"

LINUX="
  haskell-platform
  ncdu
  python3
  python3-pip
"

PPA="
  neovim-ppa/unstable
  ultradvorka/ppa
"

AFTER_PPA="
  hh
  neovim
"

GEMS="
  neovim
"

PIP="
  docker-compose
  grip
  neovim
  tmuxp
"

# This meant to be used when `install-it.sh` script is executed :'V

