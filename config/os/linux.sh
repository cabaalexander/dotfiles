#!/bin/bash

linuxOsInstall(){
  # Set TimeZone to America/Santo_Domingo
  echo "[Setting Timezone]"
  sudo timedatectl set-timezone America/Santo_Domingo

  echo "[Installing] Apps"
  iterateOver "${LINUX}" redirectToNull appInstall

  echo "[Installing] PPAs"
  iterateOver "${PPA}" redirectToNull addPPA

  echo "[Updating APT]"
  redirectToNull updateAPT

  echo "[Installing] Apps"
  iterateOver "${AFTER_PPA}" redirectToNull appInstall

  echo "[Installing] NVM ${NVM}"
  redirectToNull nvmInstall

  echo "[Installing] Ruby ${RUBY}"
  redirectToNull rvmInstall
}

# This meant to be used when `install-it.sh` script is executed :'V

