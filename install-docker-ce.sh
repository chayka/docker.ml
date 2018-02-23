#!/bin/bash

# scenario taken from official docker doc
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce

# Uninstall old versions
apt-get remove docker docker-engine docker.io

# Update the apt package index:
apt-get update

# Install packages to allow apt to use a repository over HTTPS:
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.
apt-key fingerprint 0EBFCD88 | grep "9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"
if [$? -eq 1]; then
    echo "Fingerprint is invalid"
    exit 1
fi

# Use the following command to set up the stable repository.
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package index.
apt-get update

# Install the latest version of Docker CE
apt-get install docker-ce