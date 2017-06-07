#
# Run:
# 	Disable xhost on host machine, doing: xhost +
#
#	Disable selinux on host machine
#
# 	docker build -t ibm/broker:8.0.0.7 .
#
#	docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.7 ibm/broker:8.0.0.7

FROM centos:6

LABEL authors="Diogo Variani <diogo.variani@gmail.com>, Bruno Tafarelo <btafarelo@gmail.com>"

ADD bin/MQ_CZJ3ZML.tar.gz /tmp/broker8/mq/

ADD bin/WMB_V8.0_LINUX_X86-64.gz /tmp/broker8/runtime/

ADD bin/WMB_TOOLKIT_V8.0_LINUX_X86_1.gz /tmp/broker8/toolkit/

ADD bin/WMB_TOOLKIT_V8.0_LINUX_X86_2.gz /tmp/broker8/toolkit/

ADD bin/WMB_TOOLKIT_V8.0_LINUX_X86_3.gz /tmp/broker8/toolkit/

ADD bin/8.0.0-WS-MB-LINUXX64-FP0007.tar /tmp/fixpack/

ADD bin/8.0.0-WS-MBT-LINUXIA32-FP0007.tar.gz /tmp/fixpack/

ADD bin/8.0.0-WS-MBX-LINUXIA32-FP0007.bin bin/mbt_response.xml /tmp/fixpack/

ADD multithread.conf multithread.py build-dockerfile.sh /tmp/

RUN sh /tmp/build-dockerfile.sh

CMD /opt/IBM/WMBT800/eclipse
