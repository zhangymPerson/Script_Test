#!/bin/bash
###########################################
# 测试脚本输入
# args-test.sh
###########################################

echo "测试需要 启动脚本后面跟一串字符  如 sh args-test.sh a b c  d "
# $?
#
#
for args in $#
do
	echo ${args}
done

