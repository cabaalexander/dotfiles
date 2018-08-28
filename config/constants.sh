. ~/.bin/getos.sh

INSTALL_LOG="true"
PROFILE_INIT="false"

NVM="0.33.8"
NODE="10.8.0"
RUBY="2.2"
TMUX_PATH="${HOME}/.tmux/plugins/tpm"
OS="$(getOS)"

COMMON="
  curl
  git
  jq
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
  lolcat
  neovim
"

PIP="
  docker-compose
  doge
  grip
  neovim
  tmuxp
  pip
"

NODE_MODULES="
  peerflix
"

# This meant to be used when `install-it.sh` script is executed :'V

