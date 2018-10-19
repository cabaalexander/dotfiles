#!/bin/bash

__node(){
  local YARN_PATH=~/.yarn/bin/yarn
  $YARN_PATH global add $@
}

