#!/bin/bash
#
# Script based on instructions located here:
#   http://docs.docker.io/en/latest/installation/ubuntulinux/
#

is_complete() {
  if [ "$(uname -r)" == '3.8.0-30-generic' ]; then
    echo "running correct kernel with aufs and lxc support"
    return 0
  else
    echo "NOT running correct kernel."
    return 1
  fi
}

exit_success() {
    echo "*********************************************************************"
    echo "Kernel Install Complete"
    echo "*********************************************************************"    

    exit 0
}

is_complete && exit_success

echo "Installing Linux 3.8 kernel (this requires a reboot)"

# Install 3.8 linux kernel (lxc and aufs requirement)
sudo apt-get update
sudo apt-get install -q -y linux-image-generic-lts-raring linux-headers-generic-lts-raring

echo "**** REBOOTING INSTANCE - you will need to run envy up again after instance is back up ****"
sudo reboot
