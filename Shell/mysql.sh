#!/usr/bin/bash 
########################################
#编写shell
#授予权限 chmod +x **.sh
#执行脚本:sh **.sh  或  ./**.sh
########################################
echo "Hello Word"


function getPw {
    local pwFile=$1
    local key=$2
    echo "密码文件:"$pwFile",关键字:"$key
    return grep $key $pwFile|awk '{print $2}'

}



pwFile=passwd.txt
key=one

echo getPw $pwFile $key

mysql_password=$(grep one ${pwFile}|awk '{print $2}')

echo "mysqlPw = "$mysql_password
