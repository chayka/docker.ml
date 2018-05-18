#!/bin/bash

# scenario is taken from: http://www.linuxandubuntu.com/home/how-to-install-latest-nvidia-drivers-in-linux

apt-get purge -y nvidia*
add-apt-repository -y ppa:graphics-drivers
apt-get update
nvidia_latest_driver=$(apt-cache search "nvidia-[0-9]{1,}\s" | grep -E "^nvidia-[0-9]{1,4}" -o | tail -1)
apt-get install -y ${nvidia_latest_driver}

echo "Now need to REBOOT your server for the new drivers to kick in"
echo "AFTER REBOOT check if drivers are working:"
echo "  lsmod | grep nvidia"