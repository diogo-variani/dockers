#!/bin/bash

###########################################
###       Prepare environment           ###
###########################################

mkdir -p /tmp/broker8/mq /tmp/broker8/runtime /tmp/broker8/toolkit /tmp/fixpack

tar -xvf bin/8.0.0-WS-MB-LINUXX64-FP0007.tar -C /tmp/fixpack
tar -xvzf bin/8.0.0-WS-MBT-LINUXIA32-FP0007.tar.gz -C /tmp/fixpack
cp bin/8.0.0-WS-MBX-LINUXIA32-FP0007.bin fixpack/mbt_response.xml /tmp/fixpack

tar -zvxf bin/MQ_CZJ3ZML.tar.gz -C /tmp/broker8/mq
tar -zvxf bin/WMB_V8.0_LINUX_X86-64.gz -C /tmp/broker8/runtime
tar -zvxf bin/WMB_TOOLKIT_V8.0_LINUX_X86_1.gz -C /tmp/broker8/toolkit
tar -zvxf bin/WMB_TOOLKIT_V8.0_LINUX_X86_2.gz -C /tmp/broker8/toolkit
tar -zvxf bin/WMB_TOOLKIT_V8.0_LINUX_X86_3.gz -C /tmp/broker8/toolkit


###########################################
###       Run Build Script              ###
###########################################

./build-dockerfile.sh


