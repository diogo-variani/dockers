#!/bin/bash

###########################################
###       Prepare environment           ###
###########################################

#src=/media/sf_host-files/git/btafarelo/dockers/bin/tmp/
src=/tmp/


mkdir -p ${src}broker8/mq ${src}broker8/runtime ${src}broker8/toolkit ${src}fixpack

tar -xvf bin/8.0.0-WS-MB-LINUXX64-FP0007.tar -C ${src}fixpack
tar -xvzf bin/8.0.0-WS-MBT-LINUXIA32-FP0007.tar.gz -C ${src}fixpack
cp bin/8.0.0-WS-MBX-LINUXIA32-FP0007.bin mbt_response.xml ${src}fixpack

tar -zvxf bin/MQ_CZJ3ZML.tar.gz -C ${src}broker8/mq
tar -zvxf bin/WMB_V8.0_LINUX_X86-64.gz -C ${src}broker8/runtime
tar -zvxf bin/WMB_TOOLKIT_V8.0_LINUX_X86_1.gz -C ${src}broker8/toolkit
tar -zvxf bin/WMB_TOOLKIT_V8.0_LINUX_X86_2.gz -C ${src}broker8/toolkit
tar -zvxf bin/WMB_TOOLKIT_V8.0_LINUX_X86_3.gz -C ${src}broker8/toolkit


###########################################
###       Run Build Script              ###
###########################################

./build-dockerfile.sh


