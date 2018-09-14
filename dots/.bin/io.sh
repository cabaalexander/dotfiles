#!/bin/bash

# Color variables
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to handle exiting with an error
function die(){
  echo_red "$@"
  exit 1
}

# Function used to color echo text in green
function echo_green(){
  echo -e "${GREEN}$@${NC}"
}

# Function used to color echo text in red
function echo_red(){
  echo -e "${RED}$@${NC}"
}

# Function used to color echo text in yellow
function echo_yellow(){
  echo -e "${YELLOW}$@${NC}"
}

# If runing in terminal execute one of the functions if not just source it
if [ "$(basename ${0})" = "io.sh" ]
then
  IO=${1}
  shift

  case "${IO}" in
    die)          $IO "${@}";;
    echo_green)   $IO "${@}";;
    echo_red)     $IO "${@}";;
    echo_yellow)  $IO "${@}";;
  esac
fi

