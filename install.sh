#!/bin/bash -e
# shellcheck disable=1090,1117

# Source script to source (¯\_(ツ)_/¯)
# ===================================
. ~/.scripts/sourceifexists

# Source BEGINS
# ======================
sourceIfExists ./config/{.,install,managers,utils}/*.sh

case "$(uname -s)" in
    [Dd]arwin)
        export OS="mac"
        export CSV_SUFFIX="-mac"
        ;;
    *) echo ""
esac

# If you pass a file it takes precedence
if [ -n "$1" ]; then
    APPS_FILE="$1"
else
    APPS_FILE="./config/apps${CSV_SUFFIX}.csv"
fi

# Strip comments and empty lines
# ==============================
CSV=$(mktemp)
sed -e '/^#/d' -e '/^$/d' "$APPS_FILE" > "$CSV"
trap '{ rm -f "$CSV" ; }' SIGINT SIGTERM EXIT

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
echo "[Installing]..."
IFS=,
while read -rs TYPE NAME STATE DESCRIPTION
do

  MAPPER_TYPE=$TYPE

  # Format `type` for loggin purposes
  [[ "$TYPE" ]] \
    && TYPE="- $TYPE -"

  # If the app is installed or turned off do nothing
  __is_installed $LOG_DST_STATUS "$NAME" "$TYPE" \
    || [[ "$STATE" == "off" ]] \
    && continue

  case $MAPPER_TYPE in
    a) MAPPER=__aur ;;
    f) MAPPER=__function ;;
    m) MAPPER=__make_pkg ;;
    "") MAPPER=__package_manager ;;
    gem) MAPPER=__gem ;;
    pip) MAPPER=__pip ;;
    node) MAPPER=__node ;;
  esac

  [[ "$DESCRIPTION" ]] \
      && DESCRIPTION="\n\t$DESCRIPTION"

  # Mapper's header (Log)
  echo -e "# $NAME $TYPE $DESCRIPTION" | tee -a $LOG_DST

  # Execute
  $MAPPER "$NAME" | tee -a $LOG_DST 2>&1

  # Status (Log)
  echo -e "$TYPE :: $NAME :: $?\n" >> $LOG_DST_STATUS

done < "$CSV"

