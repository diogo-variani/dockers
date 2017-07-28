# Docker images for IBM Broker

This repository stores Dockerfiles and scripts to build Docker images for IBM Broker product. 

## **Important:** We don't store or distribute any proprietary binaries or package neither any copyright resources.

This image/container was created for development environment, it's a all-in-one, it keeps all softwares inside the same container MQ, Broker, Toolkit, MBExplorer.

## How to build and run (Dockerfile method)
```bash
docker build -t ibm/broker:8.0.0.1 .
```
```bash
docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.1 ibm/broker:8.0.0.1
```
## Alternative

This method generates a smaller image size, 6G or almost 50% instead 10G from the traditional method.

* First we create the container and map the repo folder as a volume

docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/mnt/host --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.1 centos:6

So, inside the container execute the script to install the packages

* cd /mnt

* ./build-container.sh

To save the container as image, execute after process finish

* docker commit < id container > ibm/broker:8.0.0.1

=======
```bash
docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/mnt/host --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.1 centos:6
```
So, inside the container execute the script to install the packages
```bash
cd /mnt/host
./build-container.sh
```
To save the container as image, execute it after process finish
```bash
=======
docker commit < id container > ibm/broker:8.0.0.1
```

>>>>>>> c36a733adad4ee3c47ac37f1e93c925a6c71bb09
## Common steps

It is necessary to disable the SELinux and xhost

### On Fedora:

* Edit the file: /etc/sysconfig/selinux and set the property SELINUX=disabled
* On command line, execute: xhost +
