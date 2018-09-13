# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI mode in bash
set -o vi
export EDITOR=nvim

sourceIfExists(){
  local ALL=$@
  local IGNORED_FILES=".bash_profile .bash_history"
  for TARGET in ${ALL}
  do
    TARGET_BASENAME=$(basename ${TARGET})
    IS_IGNORED=$(echo ${IGNORED_FILES} | grep ${TARGET_BASENAME})
    if [ -z "${IS_IGNORED}" ]
    then
      [ -f ${TARGET} ] && source ${TARGET}
    fi
  done
}

# Import configurations
sourceIfExists ~/.bash/*

# Change GIT_PS1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose"
export GIT_PS1_STATESEPARATOR=" "
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWCOLORHINTS=1

# HSTR (hh)
export HH_CONFIG=hicolor
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
bind '"\C-r": "\e^ihh \n"'
bind -m vi-insert "\C-l":clear-screen

