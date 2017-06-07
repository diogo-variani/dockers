#
# Run:
# 	Disable xhost on host machine, doing: xhost +
#
#	Disable selinux on host machine
#
# 	docker build -t ibm/broker:8.0.0.1 .
#
#	docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e UID=$(id -u) -e GID=$(id -g) -v $(pwd):/mnt/host --name=broker-8.0.0.1 ibm/broker:8.0.0.1
#
#	If you need exec some command as root
#
#	docker exec -ti -u 0 reip-broker /bin/bash

FROM centos:6

LABEL authors="Diogo Variani <diogo.variani@gmail.com>, Bruno Tafarelo <btafarelo@gmail.com>"

COPY bin /tmp/bin

RUN sh /tmp/bin/build-container.sh

CMD sh /var/mqm/run-container.sh ${UID} ${GID}

