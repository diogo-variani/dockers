This docker file instends to installl IBM Message Broker 8 and its fixes pack (8.0.0.7).
It is expected to have the following file system structure:

ROOT
- Dockerfile
- fixpack
	- 8.0.0-WS-MB-LINUXX64-FP0007.tar
	- 8.0.0-WS-MBT-LINUXIA32-FP0007.zip
	- 8.0.0-WS-MBX-LINUXIA32-FP0007.bin
- installers
	- MQ_CZJ3ZML.tar.gz
	- WMB_TOOLKIT_V8.0_LINUX_X86_1.gz
	- WMB_TOOLKIT_V8.0_LINUX_X86_2.gz
	- WMB_TOOLKIT_V8.0_LINUX_X86_3.gz
	- WMB_V8.0_LINUX_X86-64.gz
- multithread.conf
- multithread.py
- script-build.sh

To create the image, it is supposed to run the following command lines:

	- To create the image, from the ROOT directory:

		$ docker build -t ibm/message-broker:8.0.0.7 .

	- To create the container from the image

		$ sudo xhost +
		$ docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/sda:/dev/sda -e DISPLAY=$DISPLAY --name=broker-8.0.0.7 ibm/message-broker:8.0.0.7


The command "sudo xhost +" must be executed in order to share the host X Server to display the IDEs, such as Toolkit and MB Explorer, for instance.