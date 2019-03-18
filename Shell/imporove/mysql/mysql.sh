#!/usr/bin/bash 
########################################
#编写shell
#授予权限 chmod +x **.sh
#执行脚本:sh **.sh  或  ./**.sh
########################################
echo "Hello Word"

pwFile=passwd.txt
key=one
mysql_password=$(grep one ${pwFile}|awk '{print $2}')
echo "mysqlPw = "$mysql_password
