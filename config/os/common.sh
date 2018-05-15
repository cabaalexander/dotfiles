#!/bin/bash

commonOsInstall(){
  iterateOver "${COMMON}" appInstall

  yarnInstall

  dockerInstall
}

# This meant to be used when `install-it.sh` script is executed :'V

