::代表注释
::测试 windows脚本需要使用GBK / ANSI编码，否则中文乱码
@echo off
echo "你好TEST!"
::命令执行状态码 与shell中 $? 类似
echo %errorlevel%
::执行完后暂停 会出现请按任意键继续
pause