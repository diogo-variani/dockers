#!/bin/bash

###########################################
###       Prepare environment           ###
###########################################

mkdir -p /tmp/fixpack

cd /tmp/bin

tar -xvf 8.0.0-WS-MB-LINUXX64-FP0007.tar -C /tmp/fixpack
tar -xvzf 8.0.0-WS-MBT-LINUXIA32-FP0007.tar.gz -C /tmp/fixpack
cp 8.0.0-WS-MBX-LINUXIA32-FP0007.bin mbt_response.xml /tmp/fixpack

sed -i 's/8.0.0.1/8.0.0.7/g' /var/mqm/.bash_profile

cd /tmp


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


###########################################
###      Removing unecessary files      ###
###########################################

cd /tmp && rm -rf /tmp/broker8 && rm -rf /tmp/bin

yum clean all
