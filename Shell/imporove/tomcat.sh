#!/usr/bin/bash
#######################################
#重启tomcat脚本
#配置tomcat路径
#######################################
function logs(){
	date=$(date +'%Y-%m-%d %H:%M:%S')
	echo "${date}" $*
}

# 打印日志 调用方式 log info 
function log(){
	logs INFO $*
}
tomcat_home=/usr/local/tomcat
#检测tomcat
#ps -ef |grep tomcat
#关闭
sh $tomcat_home/bin/shutdown.sh
if [ $? -eq 0 ]; then
    log "tomcat shutdown success"
else
    log "tomcat shutdown fail"
fi
#开启
sh $tomcat_home/bin/startup.sh
if [ $? -eq 0 ]; then
    log "tomcat start success"
else
    log "tomcat start fail"
fi
