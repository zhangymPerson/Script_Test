#!/bin/bash

ipfile=/tmp/ip.info
echo "查询中..."
echo "******************ip**************" >> $ipfile
# 可以使用以下命令替换查找
# curl ifconfig.me
#curl 得到所有IP细节 （挖掘机）
#curl ifconfig.me/all
curl httpbin.org/ip >> $ipfile
echo "" >> $ipfile 
echo "******************ip**************" >> $ipfile
echo "结果如下:"
cat $ipfile && rm -rf $ipfile
