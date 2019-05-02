#!/bin/bash
# shellcheck disable=1090

__gem(){
    . ~/.rvm/scripts/rvm 2> /dev/null
    gem install "$@"
}

# If this file is running in terminal call the function `__gem`
# Otherwise just source it
if [ "$(basename "${0}")" = "gem.sh" ]
then
  __gem "${@}"
fi

