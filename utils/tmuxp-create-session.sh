#!/bin/bash

TMUX_SESSION_PATH="/tmp/tmuxp.yaml"

read -p "Session Name (default-ss): " SESSION_NAME
read -p "Window Name (Code): " WINDOW_NAME
read -p "CMD (echo): " CMD

cat << EOF > ${TMUX_SESSION_PATH}
session_name: ${SESSION_NAME:-default-ss}
windows:
- window_name: ${WINDOW_NAME:-Code}
  layout: tiled
  shell_command_before:
    - ${CMD:-echo}
  panes:
    - shell_command:
      - clear
    - clear
    - clear
EOF

tmuxp load ${TMUX_SESSION_PATH}

