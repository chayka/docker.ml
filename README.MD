# About

This repo contains docker images handy for running tensorflow, keras, opencv on GPU instance

# Installation

## 1. Install/Update docker

```
./install-docker-ce.sh
```

## 2. Install nvidia drivers

Run
```
./install-nvidia-drivers.sh
```

Now reboot your server
```
sudo shutdown -r now
```

Check if drivers are working:
```
lsmod | grep nvidia
```
or
```
nvidia-smi
```

## 3. Install nvidia-docker

```
./install-nvidia-docker.sh
```

## 4. Build docker image

For GPU instance:
```
cd ./docker.gpu.py35.cv2.tf.keras
nvidia-docker build -t chayka/ml:gpu.gpu.py35.cv2.tf.keras .
```

For non-GPU instance:
```
cd ./docker.cpu.py35.cv2.tf.keras
nvidia-docker build -t chayka/ml:cpu.gpu.py35.cv2.tf.keras .
```

## 5. Install screen (optional)

That is optional but might be handy for running
```
[sudo] apt-get install -y screen 
```

# Run

## Enable nvidia gpu persistent mode

```
sudo nvidia-smi -pm 1
```

## Run screen

If you plan to run time consuming task, say neural network training, better run it in connection independent environment:
```
screen
```

When disconnected and reconnected to the server, you can reconnect to your screen session:
```
screen -r
```

## Run jupyter notebook

```
nvidia-docker run --rm -p 8888:8888 --mount type=bind,source=/home/$(whoami)/,target=/host/ chayka/ml:gpu.py35.cv2.tf.keras
```

## Run bash

```
nvidia-docker run --rm -it --mount type=bind,source=/home/$(whoami)/,target=/host/ chayka/ml:gpu.py35.cv2.tf.keras /bin/bash
```

## Attach to bash console in running container

Get running container id or alias:
```
docker ps -a
```

Let's say ours is nostalgic_fermat, then:
```
docker exec -it nostalgic_fermat /bin/bash
```