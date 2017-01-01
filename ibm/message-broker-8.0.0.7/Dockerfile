#
# Run:
# 	Executar no host o comando: xhost +
#
#	Escolha entra o método 1 ou 2
#
# Build 1 - Apartir do container, permite uma imagem menor
#	docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/mnt --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.6 centos:6
#
#	Após o build, efetuar o commit se quiser salvar como imagem
#
#	docker commit <id container> btafarelo/ibm-message-broker:8.0.0.6
#
# Build 2 - Apartir do Dockfile
#
# 	docker build -t ibm/message-broker:8.0.0.6 .
#
#	docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.6 ibm/message-broker:8.0.0.6

FROM centos:6

#MAINTAINER Bruno Tafarelo <btafarelo@gmail.com>
LABEL authors="Diogo Variani <diogo.variani@gmail.com>, Bruno Tafarelo <btafarelo@gmail.com>"

ADD installers/MQ_CZJ3ZML.tar.gz /tmp/broker8/mq/

ADD installers/WMB_V8.0_LINUX_X86-64.gz /tmp/broker8/runtime/

ADD installers/WMB_TOOLKIT_V8.0_LINUX_X86_1.gz /tmp/broker8/toolkit/

ADD installers/WMB_TOOLKIT_V8.0_LINUX_X86_2.gz /tmp/broker8/toolkit/

ADD installers/WMB_TOOLKIT_V8.0_LINUX_X86_3.gz /tmp/broker8/toolkit/

ADD fixpack/8.0.0-WS-MB-LINUXX64-FP0007.tar /tmp/fixpack/

ADD fixpack/8.0.0-WS-MBT-LINUXIA32-FP0007.zip /tmp/fixpack/

ADD fixpack/8.0.0-WS-MBX-LINUXIA32-FP0007.bin fixpack/mbt_response.xml /tmp/fixpack/

ADD multithread.conf multithread.py script-build.sh /tmp/

#RUN sh /tmp/script-build.sh

#CMD /opt/IBM/WMBT800/eclipse