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

# Install gems for ruby
gemInstall(){
  GEM=$1
  echo "[Installing Gem] ${GEM}"
  gem install ${GEM} &> /dev/null
}

# Install modules for python
pipInstall(){
  MODULE=$1
  echo "[Installing Python] ${MODULE}"
  pip3 install ${MODULE} &> /dev/null
}

# This is to install apps without showing a bunch stuffs on the stdout
installApp(){
  local APP=$1

  echo "[Installing] ${APP}"
  apt-get install -y ${APP} &> /dev/null
}

# Update APT repositories
updateAPT(){
  echo "[Updating APT]"
  apt-get update &> /dev/null
}

# If this file is running in terminal call the function `normalizePath`
if [ "$(basename ${0})" = "utils.sh" ]
then
  UTIL=${1}
  shift
  case "${UTIL}" in
    "die")
      die "${@}"
      ;;
    "echo_green")
      echo_green "${@}"
      ;;
    "echo_red")
      echo_red "${@}"
      ;;
    "echo_yellow")
      echo_yellow "${@}"
      ;;
    "gemInstall")
      gemInstall "${@}"
      ;;
    "installApp")
      installApp "${@}"
      ;;
    "updateAPT")
      updateAPT "${@}"
      ;;
    "pipInstall")
      pipInstall "${@}"
      ;;
  esac
fi

