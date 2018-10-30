#!/bin/bash

__package_manager(){
  sudo pacman --needed --noconfirm -S "$@"
}

