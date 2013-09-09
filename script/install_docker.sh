#!/bin/bash
#
# Script based on instructions located here:
#   http://docs.docker.io/en/latest/installation/ubuntulinux/
#

is_complete() {
    if [[ "$(sudo docker run -i -t busybox echo 'success')" =~ 'success' ]]; then
	echo "Docker installed correctly."
	return 0
    else
	echo "Docker NOT installed correctly."
	return 1
    fi
}

exit_success() {
    echo "*********************************************************************"
    echo "Docker Install Complete"
    echo "*********************************************************************"    

    exit 0
}

exit_failure() {
    echo "Failed to install docker!"

    exit 1
}

is_complete && exit_success

echo "Installing docker"

# Adding ubuntu user to docker group
sudo groupadd docker
sudo gpasswd -a ubuntu docker

# Add the Docker repository key to your local keychain
# using apt-key finger you can check the fingerprint matches 36A1 D786 9245 C895 0F96 6E92 D857 6A8B A88D 21E9
sudo sh -c "curl https://get.docker.io/gpg | apt-key add -"

# Add the Docker repository to your apt sources list.
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

# Update your sources
sudo apt-get update

# Install, you will see another warning that the package cannot be authenticated. Confirm install.
sudo apt-get install -q -y lxc-docker

is_complete || exit_failure
exit_success
