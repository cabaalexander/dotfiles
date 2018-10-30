#!/bin/bash
# shellcheck disable=1090

__gem(){
  . ~/.rvm/scripts/rvm
  gem install "$@"
}

