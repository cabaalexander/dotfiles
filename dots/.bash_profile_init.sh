#!/bin/bash

#######################################################
#                                                     #
# Run all when you log in to bash i.e. (/bin/bash -l) #
#                                                     #
#######################################################

# Runs `TMUX` when it is `down` or already `on`
# =============================================
if ! pgrep tmux &> /dev/null && type tmux &> /dev/null
then
  tmux
elif [ -z "$TMUX" ]
then
  tmux attach
fi

