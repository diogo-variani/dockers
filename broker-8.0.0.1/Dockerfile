#
# Run:
# 	Disable xhost on host machine, doing: xhost +
#
#	Disable selinux on host machine
#
# 	docker build -t ibm/broker:8.0.0.1 .
#
#	docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/mnt/host --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.1 -e UID=$(id -u) -e GID=$(id -g) ibm/broker:8.0.0.1
#
#	docker exec -ti broker-8.0.0.1 /bin/bash

FROM centos:6

LABEL authors="Diogo Variani <diogo.variani@gmail.com>, Bruno Tafarelo <btafarelo@gmail.com>"

COPY bin /tmp/bin

RUN sh /tmp/bin/build-container.sh

CMD sh /var/mqm/run-container.sh ${UID} ${GID}

