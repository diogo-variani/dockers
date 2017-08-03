#!/bin/bash

###########################################
###       Prepare environment           ###
###########################################

SRC=/tmp

MQM_HOME=/var/mqm

WMQ_INSTALL_IMAGE=${SRC}/broker8/mq

WMB_INSTALL_IMAGE=${SRC}/broker8/runtime/messagebroker_ia_runtime1

WMBX_INSTALL_IMAGE=${WMB_INSTALL_IMAGE}/MBExplorer

WMBTK_INSTALL_IMAGE=${SRC}/broker8/toolkit/disk1

groupadd mqm

groupadd mqbrkrs

useradd -g mqm -G mqbrkrs -d ${MQM_HOME} mqm


printf ". /opt/ibm/mqsi/8.0.0.1/bin/mqsiprofile\n\n" >> ${MQM_HOME}/.bash_profile
printf "LD_LIBRARY_PATH=/opt/mqm/java/lib:\$LD_LIBRARY_PATH\n\n" >> ${MQM_HOME}/.bash_profile
printf "PATH=\$PATH:\$HOME/bin:/opt/mqm/bin\n\n" >> ${MQM_HOME}/.bash_profile

mkdir -p ${SRC}/broker8/mq ${SRC}/broker8/runtime ${SRC}/broker8/toolkit

cd /tmp/bin

tar -zxf MQ_CZJ3ZML.tar.gz -C ${SRC}/broker8/mq
tar -zxf WMB_V8.0_LINUX_X86-64.gz -C ${SRC}/broker8/runtime
tar -zxf WMB_TOOLKIT_V8.0_LINUX_X86_1.gz -C ${SRC}/broker8/toolkit
tar -zxf WMB_TOOLKIT_V8.0_LINUX_X86_2.gz -C ${SRC}/broker8/toolkit
tar -zxf WMB_TOOLKIT_V8.0_LINUX_X86_3.gz -C ${SRC}/broker8/toolkit

cp multithread.py /usr/lib/yum-plugins/multithread.py

cp multithread.conf /etc/yum/pluginconf.d/multithread.conf

cp run-container.sh /var/mqm/run-container.sh


###########################################
###     Prerequisites packages          ###
###########################################

yum install -y libgtk-x11-2.0.so.0 libcanberra-gtk2.i686 libcanberra-gtk2.x86_64 PackageKit-gtk-module.i686 PackageKit-gtk-module.x86_64 compat-libstdc++-33.i686 compat-libstdc++-33.x86_64 libXtst.so.6 util-linux-ng-2.17.2-12.28.el6.x86_64

yum groupinstall -y Fonts

###########################################
###  Installing MQ, Broker and Toolkit  ###
###########################################

cd ${WMB_INSTALL_IMAGE}/sample-scripts

./installAllSilent.sh -ACCEPT_ALL_LICENSES -WMQ_INSTALL_IMAGE ${WMQ_INSTALL_IMAGE} -WMB_INSTALL_IMAGE ${WMB_INSTALL_IMAGE} -WMBX_INSTALL_IMAGE ${WMBX_INSTALL_IMAGE} -WMBTK_INSTALL_IMAGE ${WMBTK_INSTALL_IMAGE}

echo "-Dorg.eclipse.swt.internal.gtk.disablePrinting" >> /opt/IBM/WMBT800/eclipse.ini


########################################
### Updating Installation Manager... ###
########################################

cd /opt/IBM/InstallationManager/eclipse/tools/

./imcl install com.ibm.cic.agent


###########################################
###      Removing unecessary files      ###
###########################################

cd /tmp

rm -rf *

yum clean all
