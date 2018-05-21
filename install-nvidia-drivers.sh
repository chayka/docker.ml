#!/bin/bash

# scenario is taken from: http://www.linuxandubuntu.com/home/how-to-install-latest-nvidia-drivers-in-linux

apt-get purge -y nvidia*
add-apt-repository -y ppa:graphics-drivers
apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
# wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.2.88-1_amd64.deb
# wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.0.5.15-1+cuda9.0_amd64.deb
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.1.4.18-1+cuda9.2_amd64.deb
# wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7-dev_7.0.5.15-1+cuda9.0_amd64.deb
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7-dev_7.1.4.18-1+cuda9.2_amd64.deb
# wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnccl2_2.1.4-1+cuda9.0_amd64.deb
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnccl2_2.2.12-1+cuda9.2_amd64.deb
# wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnccl-dev_2.1.4-1+cuda9.0_amd64.deb
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnccl-dev_2.2.12-1+cuda9.2_amd64.deb
dpkg -i cuda-repo-ubuntu1604_9.2.88-1_amd64.deb
dpkg -i libcudnn7_7.1.4.18-1+cuda9.2_amd64.deb
dpkg -i libcudnn7-dev_7.1.4.18-1+cuda9.2_amd64.deb
dpkg -i libnccl2_2.2.12-1+cuda9.2_amd64.deb
dpkg -i libnccl-dev_2.2.12-1+cuda9.2_amd64.deb
apt-get update
nvidia_latest_driver=$(apt-cache search "nvidia-[0-9]{1,}\s" | grep -E "^nvidia-[0-9]{1,4}" -o | tail -1)
apt-get install -y nvidia-390 cuda libcudnn7-dev libnccl-dev

echo "Now need to REBOOT your server for the new drivers to kick in"
echo "AFTER REBOOT check if drivers are working:"
echo "  lsmod | grep nvidia"