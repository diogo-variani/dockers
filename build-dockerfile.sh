#!/bin/bash

###########################################
### YUM Multithread downloads plugin... ###
###########################################

cp multithread.py /usr/lib/yum-plugins/multithread.py

cp multithread.conf /etc/yum/pluginconf.d/multithread.conf


###########################################
###          EPEL Repository            ###
###########################################

rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm


###########################################
###     Prerequisites packages          ###
###########################################

yum install -y libgtk-x11-2.0.so.0 libcanberra-gtk2.i686 libcanberra-gtk2.x86_64 PackageKit-gtk-module.i686 PackageKit-gtk-module.x86_64 compat-libstdc++-33.i686 compat-libstdc++-33.x86_64 libXtst.so.6 unzip

yum groupinstall -y Fonts


###########################################
###       Prepare environment           ###
###########################################

cd /tmp

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

rm -rf /tmp/fixpack/mbt_response.xml /tmp/fixpack/MB8000_8007


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

echo "-Dorg.eclipse.swt.internal.gtk.disablePrinting" >> /opt/IBM/WMBT800/eclipse.ini


###########################################
###      Removing unecessary files      ###
###########################################

rm -rf /tmp/broker /tmp/fixpack

yum clean all
