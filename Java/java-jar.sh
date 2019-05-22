#!/usr/bin/bash
#######################################
#脚本demo
#如果报错使用 which bash 修改上面路径
#######################################

# 调用方式 logs level级别(全部大写) 日志信息
# 函数调用会自动切割参数 如 logs "a b c" 会分割成 3个参数传进来  logs a b c  所以需要使用 $* 来打印所有参数
function logs(){
	date=$(date +'%Y-%m-%d %H:%M:%S')
	echo "${date}" $*
}


# 打印日志 调用方式 log info 
function log(){
	logs INFO $*
}

# 编辑测试代码
# 输出日志
logs Info java运行jar包命令
if [ $# -eq 1 ];then 
	jarname=$1
else
	jarname=null
fi
logs Info 要运行的jar包为${jarname} 
#java -jar ${jarname}
#java -X 可以查看java中有那些参数可以配置
# 指定启动环境 根据不同的配置文件启动
# java -jar target/${project.build.finalname}.jar --spring.profiles.active=xxx 

#java 启动监控
#-Djava.rmi.server.hostname=39.104.82.22 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false 
#参数需要配置

logs ERROR error-info
log log-info
