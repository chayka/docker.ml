#!/bin/bash

# scenario taken from official nvidia-docker doc
# https://github.com/NVIDIA/nvidia-docker

# If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers
docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
apt-get purge -y nvidia-docker

# Add the package repositories
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  tee /etc/apt/sources.list.d/nvidia-docker.list
apt-get update

# Install nvidia-docker2 and reload the Docker daemon configuration
apt-get install -y nvidia-docker2
pkill -SIGHUP dockerd

# Install libcuda1 and cuda-toolkit
nvidia_latest_driver=$(apt-cache search "nvidia-[0-9]{1,}\s" | grep -E "^nvidia-[0-9]{1,4}" -o | tail -1)
apt-get install -y ${nvidia_latest_driver} nvidia-cuda-toolkit

# Test nvidia-smi with the latest official CUDA image
# docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi