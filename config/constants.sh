. ~/bin/getos.sh

NVM="v0.33.8"
NODE="v9.5.0"
RUBY="2.2"
TMUX_PATH="${HOME}/.tmux/plugins/tpm"
OS="$(getOS)"

COMMON="
  tree
  git
  tmux
  curl
"

MAC="
  neovim
  hh
"

LINUX="
  build-essential
  python3
  python3-pip
  software-properties-common
  haskell-platform
"

PPA="
  neovim-ppa/unstable
  ultradvorka/ppa
"

AFTER_PPA="neovim hh"

GEMS="
  neovim
"

PIP="
  neovim
  docker-compose
  tmuxp
"

# This meant to be used when `install-it.sh` script is executed :'V

