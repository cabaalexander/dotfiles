#!/bin/bash

# Source script to source (¯\_(ツ)_/¯)
# ===================================
. ~/.scripts/sourceifexists

# Source BEGINS
# ======================
sourceIfExists ~/.bin/*.sh
sourceIfExists ./config/{.,install,utils}/*.sh

# Strip comments and empty lines
# ==============================
CSV=$(mktemp)
sed -e '/^#/d' -e '/^$/d' ./config/apps.csv > $CSV
trap "{ rm -f $CSV; }" SIGINT SIGTERM EXIT

__package_manager(){
  sudo pacman --needed --noconfirm -S $@
}

__gem(){
  . ~/.rvm/scripts/rvm
  gem install $@
}

__pip(){
  pip3 install --user $@
}

__node(){
  yarn global add $@
}

__function(){
  local FUNC=""
  for FUNC in $@
  do
    ${FUNC}Install
  done
}

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

__aur(){
  yay --noconfirm -S $@
}

# Prepare log files
# =================
rm -f install*.log
LOG_DST="install.log"
LOG_DST_STATUS="install-status.log"
touch $LOG_DST
touch $LOG_DST_STATUS

#########
#       #
# Begin #
#       #
#########
echo "[Installing]"
IFS=,
while read -rs TYPE NAME STATE DESCRIPTION
do
  [[ "$STATE" == "off" ]] && continue

  case $TYPE in
    a) FUNC=__aur ;;
    f) FUNC=__function ;;
    m) FUNC=__make_pkg ;;
    "") FUNC=__package_manager ;;
    gem) FUNC=__gem ;;
    pip) FUNC=__pip ;;
    node) FUNC=__node ;;
  esac

  TYPE=$([[ "$TYPE" ]] && echo "($TYPE)")
  echo "- $NAME $TYPE" | tee -a $LOG_DST

  $FUNC $NAME >> $LOG_DST 2>&1

  echo -e "$NAME :: $?\n" >> $LOG_DST_STATUS
done < $CSV

