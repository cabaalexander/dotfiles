#!/bin/bash

__function(){
  local FUNC=""
  for FUNC in $@
  do
    ${FUNC}Install
  done
}

