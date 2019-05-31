#/bin/sh
# maven相关的操作命令
VERSION=0.1
function logs(){
	date=$(date +'%Y-%m-%d %H:%M:%S')
	echo "${date}" $*
}


# 打印日志 调用方式 log info 
function log(){
	logs INFO $*
}

function maven(){
	log INFO mvn install $1
	log INFO mvn install $2
}


echo "sh maven.sh 1"

if [ $# -eq 2 ]; then
	log "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	log "脚本主要是实现maven的相关操作"
	log 启动命令：sh 叫本名.sh arg1 arg2
	log "	参数1： 1 = clean  2 = install"
	log "	参数2： mavne项目位置 (pom.xml文件所在位置路径) "
	log "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	log "第一个参数是:" $1
	log "第二个参数是:" $2
	maven $1 $2
	exit 1
else
	log "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	log "脚本主要是实现maven的相关操作"
	log 启动命令：sh 叫本名.sh arg1 arg2
	log "	参数1： 1 = clean  2 = install"
	log "	参数2： mavne项目位置 (pom.xml文件所在位置路径) "
	log "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	logs ERROR "启动脚本需要两个参数"
	exit 1
fi


