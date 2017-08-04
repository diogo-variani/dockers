#!/bin/sh

cp /tmp/bpm/multithread.py /usr/lib/yum-plugins/multithread.py && rm -rf /tmp/bpm/multithread.py
cp /tmp/bpm/multithread.conf /etc/yum/pluginconf.d/multithread.conf && rm -rf /tmp/bpm/multithread.conf

tar -xvf /tmp/bpm/installer/BPM_Std_V857_Linux_x86_1_of_3.tar.gz -C /tmp/bpm/installer/ && rm -rf /tmp/bpm/installer/BPM_Std_V857_Linux_x86_1_of_3.tar.gz
tar -xvf /tmp/bpm/installer/BPM_Std_V857_Linux_x86_2_of_3.tar.gz -C /tmp/bpm/installer/ && rm -rf /tmp/bpm/installer/BPM_Std_V857_Linux_x86_2_of_3.tar.gz
tar -xvf /tmp/bpm/installer/BPM_Std_V857_Linux_x86_3_of_3.tar.gz -C /tmp/bpm/installer/ && rm -rf /tmp/bpm/installer/BPM_Std_V857_Linux_x86_3_of_3.tar.gz

yum install -y libgtk-x11-2.0.so.0 libcanberra-gtk2.i686 libcanberra-gtk2.x86_64 PackageKit-gtk-module.i686 PackageKit-gtk-module.x86_64 compat-libstdc++-33.i686 compat-libstdc++-33.x86_64 libXtst.so.6 libaio-devel-0.3.109-13.el7.i686 libaio-devel-0.3.109-13.el7.x86_64 pam-devel-1.1.8-18.el7.i686 pam-devel-1.1.8-18.el7.x86_64 file which numactl-libs-2.0.9-6.el7_2.x86_64 numactl-libs-2.0.9-6.el7_2.i686 pam-1.1.8-18.el7.i686 pam-1.1.8-18.el7.x86_64

yum groupinstall -y Fonts

echo cic.override.disk.space=true >> /tmp/bpm/installer/IM64/configuration/config.ini
/tmp/bpm/installer/IM64/tools/imcl install com.ibm.bpm.STD.v85_8.5.7000.20160301_1551 com.ibm.websphere.IBMJAVA.v70_7.0.9010.20151112_0100 com.ibm.websphere.ND.v85_8.5.5008.20151112_0939 -acceptLicense -repositories /tmp/bpm/installer/repository/repos_64bit -properties user.select.64bit.image,,com.ibm.websphere.ND.v70=true,user.bpm.admin.username=admin,user.bpm.admin.password=tTTKjysjbznw1L7s7wZ0Uw== -showVerboseProgress -log silentinstall.log

/opt/IBM/WebSphere/AppServer/bin/BPMConfig.sh -create -de /tmp/bpm/Standard-PC-SingleCluster-DB2.properties

/opt/IBM/WebSphere/AppServer/profiles/DmgrProfile/bin/bootstrapProcessServerData.sh -clusterName SingleCluster

rm -rf /tmp/bpm