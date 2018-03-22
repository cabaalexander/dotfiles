#!/bin/bash

TARGET_DIR="./cp"
CP_FILES=$(ls ${TARGET_DIR})

# These files will be unsync
for FILE in ${CP_FILES}
do
  cp -fv ${TARGET_DIR}/${FILE} ${HOME}/.${FILE}
done

# Add global gitignore to the gitconfig
# `${HOME}` will be expanded correctly for every OS
[ -f ${HOME}/.gitignore_global ] && \
  git config --global core.excludesfile ${HOME}/.gitignore_global

