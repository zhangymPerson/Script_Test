# 脚本调用的几种方式

fork: 如果脚本有执行权限的话，path/to/foo.sh。如果没有，sh path/to/foo.sh。
exec: exec path/to/foo.sh
source: source path/to/foo.sh
