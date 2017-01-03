# Docker images for IBM Broker

This repository stores Dockerfiles and scripts to build Docker images for IBM Broker product. 

## **Important:** We don't store or distribute any proprietary binaries or package neither any copyright resources.

This image/container was created for developer environment, it's a all-in-one, keep all softwares inside the same container MQ, Broker, Eclipse, MBExplorer.

## How to build and run (Dockerfile method)

docker build -t ibm/broker:8.0.0.6 .

docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.6 ibm/broker:8.0.0.6

## Alternative

This method generates a smaller image size, 6G or almost 50% instead 10G from the traditional method.

* First we create the container and map the repo folder as a volume

docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/mnt --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.6 centos:6

So, inside the container execute the script to install the packages

* cd /mnt

* ./script-run.sh

To save the container as image, execute after process finish

* docker commit < id container > ibm/broker:8.0.0.6

## Common steps

Is necessary to disable the SELinux and xhost

### On Fedora:

* Edit the file: /etc/sysconfig/selinux and set the property SELINUX=disabled
* On command line, execute: xhost +
