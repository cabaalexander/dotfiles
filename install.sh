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
    f) FUNC=__function ;;
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

