#!/bin/bash

echo "脚本名练习"
#脚本名和启动命令相关 可能是全路径 ./*.sh *.sh
echo "脚本名:"$0

# 不管怎么启动，脚本名为 *.sh
name=$(basename $0)
echo "脚本名:"$name
#去掉以.sh 结尾的内容
echo "脚本名:"${name%.sh}

