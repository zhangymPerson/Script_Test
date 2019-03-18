#!/usr/bin/bash
#######################################
#Bash 中的 {花括号} 
#######################################

# 调用方式 logs level级别(全部大写) 日志信息
function logs(){
	date=$(date +'%Y-%m-%d %H:%M:%S')
	level=$1
	echo "${date}" $*
}


# 打印日志 调用方式 log info 
function log(){
	logs INFO $*
}

# 编辑测试代码
# 输出日志
#logs ERROR error-info


test="test test test"
echo $test
log $test


#测试
# 0到10
log "echo {0..10} 结果为:"
echo {0..10}

# 10到0
log "echo {10..0} 结果为:"
echo {10..0}

# 10到0偶数 
log "echo {10..0..2} 结果为:"
echo {10..0..2}

# 每隔两位输出一次
log "echo {z..a..2} 结果为:"
echo {z..a..2}

# 输出aa ab ... zz
log "echo {a..z}{a..z} 结果为:"
echo {a..z}{a..z}

month=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")

# 输出Apr 第n+1位
echo ${month[3]} 
# 数组索引从 0 开始，因此 [3] 对应第 4 个元素

letter_combos=({a..z}{a..z})

echo ${dec2bin[25]}

a="Too longgg"
log 'a="Too longgg"'
log " \${a%gg} 结果为:"
echo ${a%gg}

# ${...} 告诉 shell 展开花括号里的内容
# a 就是需要操作的变量
# % 告诉 shell 需要在展开字符串之后从字符串的末尾去掉某些内容
# gg 是被去掉的内容


i=image.jpg
echo $i ${i%jpg}png
#这实际上是将变量 i 末尾的 "jpg" 去掉，然后加上 "png"，最终将整个命令拼接成 convert image.jpg image.png。

#for i in *.jpg; do convert $i ${i%jpg}png; done

# 如果需要去掉字符串开头的部分，就要将上面的 % 改成 # 了：
a="Hello World!"
log "a=${a}"
log "Goodbye\${a#Hello} 结果为:"
echo Goodbye${a#Hello}

#需要注意的是，花括号与命令之间需要有空格隔开。因为这里的花括号 { 和 } 是作为 shell 中的保留字，shell 会将这两个符号之间的输出内容组合到一起。

log log-info
