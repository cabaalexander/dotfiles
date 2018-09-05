#!/bin/bash

# "Swap window - New window index:"
tmux list-windows \
  | cut -d' ' -f1-2 \
  | sed -r 's/:|[*-]$//g' \
  | tr '\n' ' ' \
  | sed -r 's/[ ]+$//'

