#/bin/sh

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

#logs ERROR error-info
#log log-info

VERSION=0.1
#处理参数对 
ARGS=`getopt -o hv --long help,version -n $0 -- "$@"`

#初步校验参数的合法性
if [ $? != 0 ]; then
    echo "Terminating..."
    exit 1
fi
 
#将规范化后的命令行参数分配至位置参数（$1,$2,...)
eval set -- "${ARGS}"


#解析参数 
# 如 -h -v 
while true
do
    case "$1" in
        -h|--help) 
            echo "$0的作用是:代替maven的命令";
            shift
	    exit 1
            ;;
        -v|--version)
            echo "$0的版本是:" $VERSION;
            shift
	    exit 1
            ;;
        *)
            echo "Internal error!"
            exit 1
            ;;
    esac
done
 
#处理剩余的参数(不带斜杠的参数)
for arg in $@
do
    echo "processing $arg"
done
