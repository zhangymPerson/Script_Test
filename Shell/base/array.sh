#!/bin/bash
#####################################
#shell中的数组
#定义方法
#array_name=(a b c 1 2 "aaaaa")
#数组对象之间用空格隔开
#数组读取
#读取第n+1位的元素:  ${array_name[n]}
#####################################


array_name=(a b c 1 2 "aaaaa")


echo ${array_name[0]}

echo ${array_name[3]}

#变量方式1 直接遍历元素
for line in ${array_name[@]}
do
	echo $line
done

#遍历方式2 
for line in ${array_name[*]}
do
	echo $line
done

echo "数组长度:"${#array_name[@]}
# 通过下标遍历数组
#${#array_name[@]} 获取数组长度
for ((i = 0;i<${#array_name[@]};i++))
do
	echo ${array_name[i]}
done



