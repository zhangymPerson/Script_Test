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

logs ERROR error-info
log log-info
log $$
