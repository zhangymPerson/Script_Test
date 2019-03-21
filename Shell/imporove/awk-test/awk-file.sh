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

filepath=/usr/local/git-progect/Script_Test/Shell/imporove/awk-test/test-file

#logs ERROR error-info
#log log-info
log 测试awk命令

log "打印 ${filepath} 下的文件第一列字符"
#awk '{print $1}' $filepath/a.txt
# -F指定文件的分隔符
#awk -F , '{print $1,$5}' $filepath/c.txt
# NF NR 行数 $0  FILENAME 文件名 
#awk '{print NF ,"====",NR,"====",$0}END{print FILENAME}' ${filepath}/c.txt

awk '{print FILENAME,"NR="NR,"FNR="FNR,"$"NF"="$NF}' ${filepath}/a.txt ${filepath}/b.txt


log 测试完成
