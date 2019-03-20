#!/bin/bash
export JAVA_HOME=/usr/local/jdk
export JRE_HOME=$JAVA_HOME/jre
#自定义日志文件位置
logfile=/var/log/jar.log


PIDS=

#启动程序，如果启动失败则报错，提示报错信息所在位置


logs(){
 dates=$(date +'%Y-%m-%d %H:%M:%S')
 echo $dates " [INFO] " $1 >> $logfile
 echo $dates " [INFO] " $1 
}

error(){
 dates=$(date +'%Y-%m-%d %H:%M:%S')
 echo $dates " [ERROR] " $1 >> $logfile
 echo $dates " [INFO] " $1
 exit
}

#判断命令是否存在
is_command(){
	command=$1
	which $command
	if [ $? -eq 0 ];then
		#logs  " 命令 $command 存在"
		return 0
	else
		error "命令 $command 不存在,请安装相关命令所需软件后执行本脚本"  
		return 1
	fi
}

is_file(){
	file=$1
	if [ -f $file ];then
		return 0
	else
		error "$file 文件不存在，请查证相关文件后重启脚本"
		return -1
	fi
}


#检查程序是否在运行
is_exist(){
	appName=$1
	PIDS=$(jps|grep $appName|awk '{print $1}')
}

# 启动jar包
start_app(){
 apppath=$1
 app=$2
 logs " application: $app starting ..."
 is_command java
 is_exist $app
 if [ -z "$PIDS" ];then
 	nohup java -jar $apppath >> $logfile  2>&1  &
	is_exist $app
 	logs " application:  $app start success! pid = $PIDS"
 else
 	error " application:  $app is exits! pid = $PIDS"
 fi
}

#停止jar包
stop_app(){
	app=$1
	is_exist $app;
	if [ -z "$PIDS" ];then
		error " application:  $app is not exits ! "
	else
		kill $PIDS
		if [ $? -eq 0 ];then
			logs "application:  $app is stop"
		else
			error " application:  $app  stop false"
		fi
	fi
}

#重启jar包
restart_app(){
 app=$1
 echo $app
}


if [ $# -eq 3 ];then
	comm=$1
	jarpath=$2
	jarname=$3
	case "$comm" in
	start )
		logs "start ..."
		is_file $jarpath
		start_app $jarpath $jarname
		;;
	stop )
		logs "stop ..."
		stop_app $jarname
		;;
	restart )
		stop_app $jarname
		start_app $jarpath $jarname
		logs "restart ..."
		;;
	status )
		is_exist $jarname
		PIDS=0
		PIDS=$(jps|grep $appName|awk '{print $1}')
		if [[  ${PIDS}  -eq "" ]];then
			echo "application is norunging!"
		else
			echo "application is running!"
		fi
		;;
	* )
		echo "======================================"
		echo "主要是用来启动jar包"
		echo "启动命令如下"
		echo "java -jar ***.jar"
		echo "脚本启动命令如下："
		echo "sh *.sh {start|stop|restart|status} /*/*/*.jar *.jar"
		echo "脚本输出位置：$logfile"
		echo "======================================"
		exit
		;;
	esac
else
        echo "======================================"
        echo "主要是用来启动jar包"
        echo "启动命令如下"
        echo "java -jar ***.jar"
        echo "脚本启动命令如下："
        echo "sh *.sh {start|stop|restart|status} /*/*/*.jar *.jar"
	echo "脚本输出位置：$logfile"
        echo "======================================"
        exit
fi

