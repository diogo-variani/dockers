#
# Run:
# 	Disable xhost on host machine, doing: xhost +
#
#	Disable selinux on host machine
#
# 	docker build -t ibm/bpm-standard:8.5.7 .
#
#	docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/sda:/dev/sda -v /home/variani/Documents/personal/workspaces/bpm:/tmp/workspace -e DISPLAY=$DISPLAY --name=ibm-bpm-8.5.7-standard ibm/bpm-standard:8.5.7
#
FROM centos:7

LABEL authors="Diogo Variani <diogo.variani@gmail.com>, Bruno Tafarelo <btafarelo@gmail.com>"

COPY bin /tmp/bpm

RUN sh /tmp/bpm/build-container.sh