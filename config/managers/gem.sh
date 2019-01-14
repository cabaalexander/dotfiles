#!/bin/bash
# shellcheck disable=1090

__gem(){
  case "$OS" in
      mac) sudo gem install "$@" ;;
      *)
          . ~/.rvm/scripts/rvm
          gem install "$@"
          ;;

  esac
}

# If this file is running in terminal call the function `__gem`
# Otherwise just source it
if [ "$(basename "${0}")" = "gem.sh" ]
then
  __gem "${@}"
fi

