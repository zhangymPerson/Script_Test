#!/bin/bash

echo "启动jar项目脚本"

export JAVA_HOME=/usr/local/jdk
export JRE_HOME=$JAVA_HOME/jre

#判断命令是否存在
is_command(){
command=$1
which $command

if [ $? -eq 0 ];then
        echo  "[INFO] 命令 "$command " 存在"
	return 0
else
        echo "[ERROR] 命令 "$command " 不存在,请安装相关命令所需软件后执行本脚本"  
	return 
fi
}

#检查程序是否在运行
is_exist(){
  appName=$1
  pid=`ps -ef|grep $appName|grep -v grep|awk '{print $2}' `
  #如果不存在返回1，存在返回0     
  if [ -z "${pid}" ]; then
   echo "[INFO] 程序 " $appName  " 未运行"
   return 1
  else
   echo "[INFO] 程序 " $appName  " 已启动运行"
    return $pid
  fi
}

# 启动jar包
start_app(){
 app=$1
 echo "[INFO] application: " $app " starting ..."
 nohup java -jar $app > /var/log/$app.log &
 pids=is_exist $app
 echo "[INFO] application: " $app "start success! pid="$pids
}

#停止jar包
stop_app(){
 app=$1
 pids=is_exist $app;
}

#重启jar包
restart_app(){
 app=$1
 echo $app
}

#启动程序，如果启动失败则报错，提示报错信息所在位置


if [ $# -eq 2 ];then
        echo "启动的项目路径为:" $1
        echo "启动的项目名为:" $2
        is_command java
	is_exist dockers
	start $1
else
        echo "请传入要启动的jar包"
        exit
fi

