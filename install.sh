#!/bin/bash

# Source script to source (¯\_(ツ)_/¯)
# ===================================
. ~/.scripts/sourceifexists

# Source BEGINS
# ======================
sourceIfExists ~/.bin/*.sh
sourceIfExists ./config/{.,install,managers,utils}/*.sh

# Strip comments and empty lines
# ==============================
CSV=$(mktemp)
sed -e '/^#/d' -e '/^$/d' ./config/apps.csv > $CSV
trap "{ rm -f $CSV; }" SIGINT SIGTERM EXIT

#####################
#                   #
# Prepare log files #
#                   #
#####################
BASE_PATH=~/.dots
LOG_DST="${BASE_PATH}/install.log"
LOG_DST_STATUS="${BASE_PATH}/install-status.log"
mkdir -p $BASE_PATH
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

  # Format `type` for loggin purposes
  [[ "$TYPE" ]] \
    && TYPE="- $TYPE -"

  # If the app is already installed do nothing
  __is_installed $LOG_DST_STATUS $NAME $TYPE \
    && continue

  [[ "$STATE" == "off" ]] && continue

  case $TYPE in
    a) MAPPER=__aur ;;
    f) MAPPER=__function ;;
    m) MAPPER=__make_pkg ;;
    "") MAPPER=__package_manager ;;
    gem) MAPPER=__gem ;;
    pip) MAPPER=__pip ;;
    node) MAPPER=__node ;;
  esac

  # Mapper's header (Log)
  echo "- $NAME $TYPE" | tee -a $LOG_DST

  $MAPPER $NAME >> $LOG_DST 2>&1

  # Status (Log)
  echo -e "$TYPE :: $NAME :: $?\n" >> $LOG_DST_STATUS

done < $CSV

