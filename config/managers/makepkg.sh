#!/bin/bash

__make_pkg(){
  local REPO_URL=$1
  local BASE_NAME=$(basename $REPO_URL)
  local BASE_NAME_NO_EXT=${BASE_NAME%.*}
  local DST=/tmp/$BASE_NAME_NO_EXT

  git clone $REPO_URL $DST

  cd $DST

  makepkg --noconfirm -si

  cd -

  rm -rf $DST
}

