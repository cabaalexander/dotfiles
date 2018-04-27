#!/bin/bash

linuxRun(){
  # Set TimeZone to America/Santo_Domingo
  echo "[Setting Timezone]"
  sudo timedatectl set-timezone America/Santo_Domingo

  iterateOver "${LINUX}" appInstall

  iterateOver "${PPA}" addPPA

  updateAPT

  iterateOver "${AFTER_PPA}" appInstall

  # Special installs
  nvmInstall
  rvmInstall
}

# This meant to be used when `install-it.sh` script is executed :'V

