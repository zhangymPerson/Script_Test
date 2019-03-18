#!/bin/bash
#来源:https://blog.csdn.net/abel_dwh/article/details/78467699
#主要是用来查看系统的基本信息
systemfile=/tmp/systemInfo.log
machine_model=`dmidecode -t system | grep "Product Name"| awk -F":" '{print $2}'`
serial_num=`dmidecode -t system | grep "Serial Number"| awk -F":" '{print $2}'`
adapter_watch=`lspci | egrep -i --color 'network|ethernet'`
#disk=`lsblk | awk '/^(sd|vd|hd)/'|awk '{print $1,"",$4}'`
disk=`fdisk -l |grep Disk|egrep '/sd|vd|hd/'|awk -F"," '{print $1}'|awk '{print $2,$3}'`
disk_mount=`df -Th`
physical_id=`cat /proc/cpuinfo |grep "physical id"|sort|uniq|wc -l`
cpu_core=` grep 'cpu cores' /proc/cpuinfo | wc -l`
cpu_model_name=`cat /proc/cpuinfo|grep "model name"|uniq`
ip_route=`ip route|grep default |awk '{print "Gateway         : "$3}'`
mem_size=$(dmidecode | grep -A 16 "Memory Device$" |grep Size:|grep -v "No Module Installed"|sort|uniq -c|awk '{printf $1"*"$3" MB" "\n" "\t\t" "  "}')
mem_type=$(dmidecode | grep -A 16 "Memory Device$" |grep Type:|sort|uniq -c|awk '{print $3}')
cron_tab=`crontab -l`
system_version=`cat /etc/*-release |egrep 'Server|Linux|release' |uniq`
kernel_version=`cat /proc/version  |awk -F"(" '{print $1}'| awk -F" " '{print $3}'`
system_info=`dmidecode -t system | head -n 15`
comm_users=`awk -F: '{if($3>=1000) {printf "|%-16s| %-14s|\n", $1,$3}}' /etc/passwd`


echo "=============================================================================" >>$systemfile
echo "*****************This is the statistical information system!*****************" >>$systemfile
echo "=============================================================================" >>$systemfile
echo "" >>$systemfile
echo "###############################00.Machine-Info###############################" >>$systemfile
echo "Machine model   :$machine_model" >>$systemfile
echo "Serial number   :$serial_num" >>$systemfile
echo "" >>$systemfile
echo "#################################01.CPU-Info#################################" >>$systemfile
echo "Physical_id     : $physical_id" >>$systemfile
echo "$cpu_model_name" >>$systemfile
echo "CPU_core_num    : $cpu_core" >>$systemfile
echo "" >>$systemfile
echo "###############################02.Memory-Info################################" >>$systemfile
echo "memory_size     : $mem_size">>$systemfile
echo "memory_type     : $mem_type">>$systemfile
echo "" >>$systemfile
echo "################################03.DISK-INFO#################################" >>$systemfile
echo "Name Size" >>$systemfile
echo "$disk" >> $systemfile
echo "" >>$systemfile
echo "###############################04.Adapter-Info###############################" >>$systemfile
echo "$adapter_watch" >>$systemfile
echo "" >>$systemfile
echo "#################################05.HBA-Info#################################" >>$systemfile
for i in `ls -lh /sys/class/fc_host/ | grep -v "total 0"|awk '{print $9}'`
do 
echo "$i           : `cat /sys/class/fc_host/$i/port_name`" >>$systemfile
done
echo "" >>$systemfile
echo "####################06.System-Version And Kernel-Version#####################" >>$systemfile
echo "System-Version  : $system_version" >>$systemfile
echo "Kernel-Version  : $kernel_version" >> $systemfile
echo "" >>$systemfile
echo "##################################07.IP-Info#################################" >>$systemfile
for i in $(cat /proc/net/dev|sed '1,2d'|grep -v "lo"|awk -F ":" '{print $1}')
do
/sbin/ifconfig $i|egrep "inet"|grep -v "inet6"|awk '{print "'$i'            :",$2,"/ "$4}' >>$systemfile
/sbin/ifconfig $i|egrep "ether|HWaddr" |awk '{if( $1=="ether" ) {print "'$i'_HWaddr     :",$2} else {print "'$i'_HWaddr     :",$5}}' >>$systemfile
echo "----------------------------------------------------------------------------" >>$systemfile
done
echo "$ip_route" >> $systemfile
echo "" >>$systemfile
echo "##############################08.Disk-Mount-Info#############################" >>$systemfile
echo "$disk_mount" >>$systemfile
echo "" >>$systemfile
echo "################################09.Comm-users################################" >>$systemfile
echo "Comm-Users      : " >>$systemfile
echo -e '|NAME \t\t | UID \t\t |'>>$systemfile
echo "$comm_users" >>$systemfile
echo "" >>$systemfile
echo "###################################10.Java###################################" >>$systemfile


ps -ef | grep java |grep -v grep &>/dev/null
if [ $? -eq 0 ];then
echo "Java is Ok!" >> $systemfile
echo "##################################11.Oracle##################################" >>$systemfile
echo "" >>$systemfile
else  
echo "Java is Down!" >> $systemfile
echo "" >>$systemfile
echo "##################################11.Oracle##################################" >>$systemfile
fi


ps -ef | grep oracle |grep -v grep &>/dev/null
if [ $? -eq 0 ];then
echo "Oracle is Ok！" >> $systemfile
echo "" >>$systemfile
echo "#################################12.Crontab##################################" >>$systemfile
else
echo "Oracle is Down！" >> $systemfile
echo "" >>$systemfile
echo "#################################12.Crontab##################################" >>$systemfile
fi


crontab -l &>/dev/null
if [ $? -eq 0 ];then
echo "cron_tab: $cron_tab" >>$systemfile
echo "#############################################################################" >>$systemfile
else
echo "no cron_tab!" >>$systemfile
echo "#############################################################################" >>$systemfile
fi

cat $systemfile &&  rm -rf $systemfile

