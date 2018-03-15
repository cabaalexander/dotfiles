#!/bin/bash

echo "[Linking]"

. ./bin/lndotfiles.sh
. ./bin/lndir.sh

# If no '~/.config' directory create it (Just in this case)
CONFIG_PATH=${HOME}/.config
[ ! -d ${CONFIG_PATH} ] && mkdir -pv ${CONFIG_PATH}

# Dot files
lnDotFiles dot-files

# Directory symlinks
lnDir nvim/ ${CONFIG_PATH}/
lnDir bin/ ${HOME}/

# Basic settings for VIM (Not neovim)
# This needs to be at the bottom becase is a symlink of a symlink ¯\_(ツ)_/¯
ln -sfv ${CONFIG_PATH}/nvim/plugins/settings.vim ${HOME}/.vimrc

