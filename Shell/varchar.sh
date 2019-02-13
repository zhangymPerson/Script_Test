#!/bin/bash 
#######################################
#查找shell中 bash所在位置:  which bash
#shell中定义变量
#命名只能使用英文字母，数字和下划线，首个字符不能以数字开头
#中间不能有空格，可以使用下划线（_）
#不能使用标点符号。
#不能使用bash里的关键字（可用help命令查看保留关键字）。
#######################################

# 定义变量
nums=1
vars="abs"


echo $nums

echo $vars

# 其他方式
# 定义数组
array=(a b c d 12 "a a  a a")

for a in ${array[@]}
do
	echo $a

done
