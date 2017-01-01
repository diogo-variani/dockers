#!/bin/bash

###########################################
### YUM Multithread downloads plugin... ###
###########################################

mv /tmp/multithread.py /usr/lib/yum-plugins/multithread.py

mv /tmp/multithread.conf /etc/yum/pluginconf.d/multithread.conf


###########################################
###          EPEL Repository            ###
###########################################

rpm -ivh http://download.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm


###########################################
###     Prerequisites packages          ###
###########################################

yum install -y libgtk-x11-2.0.so.0 libcanberra-gtk2.i686 libcanberra-gtk2.x86_64 \
		PackageKit-gtk-module.i686 PackageKit-gtk-module.x86_64 \
		compat-libstdc++-33.i686 compat-libstdc++-33.x86_64 \
		libXtst.so.6 unzip

yum groupinstall -y -q Fonts


###########################################
###       Prepare environment           ###
###########################################

#cd /tmp

#rm -rf MQ_CZJ3ZML.tar.gz WMB_V8.0_LINUX_X86-64.gz WMB_TOOLKIT_V8.0_LINUX_X86_*.gz

groupadd mqm && groupadd mqbrkrs && useradd mqm -g mqm -G mqbrkrs


###########################################
###  Installing MQ, Broker and Toolkit  ###
###########################################

cd /tmp/broker8/runtime/messagebroker_ia_runtime1/sample-scripts

./installAllSilent.sh -ACCEPT_ALL_LICENSES -WMQ_INSTALL_IMAGE /tmp/broker8/mq -WMB_INSTALL_IMAGE /tmp/broker8/runtime/messagebroker_ia_runtime1 -WMBX_INSTALL_IMAGE /tmp/broker8/runtime/messagebroker_ia_runtime1/MBExplorer -WMBTK_INSTALL_IMAGE /tmp/broker8/toolkit/disk1

cd /tmp && rm -rf /tmp/broker8


########################################
### Updating Installation Manager... ###
########################################

cd /opt/IBM/InstallationManager/eclipse/tools/

./imcl install com.ibm.cic.agent


##########################################
### Updating Message Broker Toolkit... ###
##########################################

/opt/IBM/InstallationManager/eclipse/tools/imcl input /tmp/fixpack/mbt_response.xml -acceptLicense

rm -rf /tmp/fixpack/mbt_response.xml
rm -rf /tmp/fixpack/MB8000_8007


##################################
### Updating Message Broker... ###
##################################

/tmp/fixpack/disk1/setuplinuxx64.bin -i silent -DLICENSE_ACCEPTED=TRUE

rm -rf /tmp/fixpack/disk1


###########################################
### Updating Message Broker Explorer... ###
###########################################

chmod +x /tmp/fixpack/8.0.0-WS-MBX-LINUXIA32-FP0007.bin

/tmp/fixpack/8.0.0-WS-MBX-LINUXIA32-FP0007.bin -i silent -DLICENSE_ACCEPTED=TRUE

rm -f /tmp/fixpack/8.0.0-WS-MBX-LINUXIA32-FP0007.bin

##############################
### Setting up environment ###
##############################

#Eclipse workaroung...
echo "-Dorg.eclipse.swt.internal.gtk.disablePrinting" >> /opt/IBM/WMBT800/eclipse.ini

#Setting up mqm environment...
echo "# Configuring MQM Profile..." >> /home/mqm/.bash_profile
echo ". /opt/ibm/mqsi/8.0.0.7/bin/mqsiprofile" >> /home/mqm/.bash_profile


###########################################
###      Removing unecessary files      ###
###########################################

rm -rf /tmp/broker /tmp/fixpack

yum clean all