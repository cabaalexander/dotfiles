#!/bin/bash

TMUX_SESSION_PATH="/tmp/tmuxp.yaml"

DEFAULT_SESSION_NAME="default-ss"
DEFAULT_WINDOW_NAME="asdf"
DEFAULT_COMMAND="cd"

read -p "Session Name (${DEFAULT_SESSION_NAME}): " SESSION_NAME
read -p "Window Name (${DEFAULT_WINDOW_NAME}): " WINDOW_NAME
read -p "CMD (${DEFAULT_COMMAND}): " CMD

cat << EOF > ${TMUX_SESSION_PATH}
session_name: ${SESSION_NAME:-${DEFAULT_SESSION_NAME}}
windows:
- window_name: ${WINDOW_NAME:-${DEFAULT_WINDOW_NAME}}
  layout: tiled
  shell_command_before:
    - ${CMD:-${DEFAULT_COMMAND}}
  panes:
    - shell_command:
      - clear
    - clear
EOF

tmuxp load ${TMUX_SESSION_PATH}

