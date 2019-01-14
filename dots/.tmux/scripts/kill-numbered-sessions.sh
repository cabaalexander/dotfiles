#!/bin/bash

# Kills all numbered/random TMUX sessions

function __get_numbered_sessions(){
    tmux ls -F "#{session_name}" | grep "$@" '^[0-9]\+$'
}

function __to_tmux_kill(){
    local SESSION
    while read -r SESSION
    do
        tmux kill-session -t "$SESSION"
    done
}

__exit_if_only_one_session(){
    if [ "$(tmux ls | wc -l | tr -d ' ')" -eq 1 ]; then
        exit 1
    fi
}

# If TMUX has only one session this script exits
[[ "$(tmux ls | wc -l)" == 1 ]] && exit 1

# We need to change to a secure session (One that will remain)
FIRST_NO_NUMBER_SESSION=$(__get_numbered_sessions -v | head -n1)

# Change to the secure session
tmux switch-client -t "$FIRST_NO_NUMBER_SESSION"

__exit_if_only_one_session

__get_numbered_sessions | __to_tmux_kill

exit 0

