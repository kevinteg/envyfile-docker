#!/bin/bash
#
# Script based on instructions located here:
#   http://docs.docker.io/en/latest/installation/ubuntulinux/
#


# Install 3.8 linux kernel (lxc and aufs requirement)
sudo apt-get update
sudo apt-get install -y linux-image-generic-lts-raring linux-headers-generic-lts-raring

# Note:  Steps above require a reboot to activate.  Make sure you do that after initial envy up!

# Add the Docker repository key to your local keychain
# using apt-key finger you can check the fingerprint matches 36A1 D786 9245 C895 0F96 6E92 D857 6A8B A88D 21E9
sudo sh -c "curl https://get.docker.io/gpg | apt-key add -"

# Add the Docker repository to your apt sources list.
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

# Update your sources
sudo apt-get update

# Install, you will see another warning that the package cannot be authenticated. Confirm install.
sudo apt-get install -y lxc-docker

# download the base 'ubuntu' container and run bash inside it while setting up an interactive shell
sudo docker run -i -t busybox echo 'hello from busybox on docker!' || echo "docker command failed.  Make sure you rebooted after initial envy up"
