#!/bin/bash

# Show the windows for the current TMUX session

tmux lsw -F " #I #{window_name}" \
  | tr '\n' ' ' \
  | sed -E 's/[ ]+$//'

