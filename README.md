# Docker images for IBM Broker

This repository stores Dockerfiles and samples to build Docker images for IBM Broker product.
We only delivery the instructions and scripts to build a Docker image and container. We don't store or distribute any proprietary binaries or package neither any copyright resources.
To build a IBM Broker image/container you have 2 options:

Download the repo content

1) Usualy process

docker build -t ibm/broker-8.0.0.6 .

docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.6 ibm/broker:8.0.0.6

Image size: 10G

2) Container first

docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/mnt --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.6 centos:6

So, inside the container execute:

cd /mnt

./script-run.sh

Save the container as image

docker commit <id container> ibm/broker:8.0.0.6

<id container> docker ps -a

Image size: 6G
