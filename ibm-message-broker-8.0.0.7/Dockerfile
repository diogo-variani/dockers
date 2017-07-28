#
# Run:
# 	Disable xhost on host machine, doing: xhost +
#
#	Disable selinux on host machine
#
# 	docker build -t ibm/broker:8.0.0.7 .
#
<<<<<<< HEAD
#	docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/mnt/host -u mqm:$(id -u) --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.7 ibm/broker:8.0.0.7
=======
#       docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e UID=$(id -u) -e GID=$(id -g) -v $(pwd):/mnt/host --name=broker-8.0.0.7 ibm/broker:8.0.0.7
#
#	If you need exec some command as root
#
#	docker exec -ti -u 0 reip-broker /bin/bash
>>>>>>> c36a733adad4ee3c47ac37f1e93c925a6c71bb09

FROM ibm/broker:8.0.0.1

LABEL authors="Diogo Variani <diogo.variani@gmail.com>, Bruno Tafarelo <btafarelo@gmail.com>"

COPY bin /tmp/bin

RUN sh /tmp/bin/build-container.sh

#CMD /opt/IBM/WMBT800/eclipse
