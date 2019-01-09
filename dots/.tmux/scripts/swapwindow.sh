#!/bin/bash

# Swap current window for an existing one

tmux lsw -F " #I #{window_name}" \
  | tr '\n' ' ' \
  | sed -E 's/[ ]+$//'

