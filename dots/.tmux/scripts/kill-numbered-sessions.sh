#!/bin/bash -e

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

FIRST_NO_NUMBER_SESSION=$(__get_numbered_sessions -v | head -n1)

tmux switch-client -t "$FIRST_NO_NUMBER_SESSION"

__get_numbered_sessions | __to_tmux_kill

