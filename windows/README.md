# windows脚本的编写

**windows脚本注意:脚本中不要使用中文,否则很容易执行不了**

```bat
::代表注释
::测试 windows脚本需要使用GBK / ANSI编码，否则中文乱码
@echo off
echo "================================= 清理上次构建 ================================="
::执行完后暂停 会出现请按任意键继续
::在BAT文件里面执行Maven的mvn命令后，mvn之后的命令不会被执行，这是由于mvn本身也是BAT文件，并且其结束时执行了exit命令。
::要让mvn命令不使当前脚本自动退出，只需要在mvn之前加上call命令
call mvn clean
echo "================================= 清理成功 ================================="
echo "================================= 开始构建 ================================="
::构建不添加测试
call mvn clean package -Dmaven.test.skip=true
echo "================================= 构建成功 ================================="

::paus
```


- 参数


    ```bat
    @echo off
    ::read arg[0]
    set input=%1%
    set input2=%2%
    
    ::传入普通参数
    echo your's input:%input%,%input2%  

    ::参数使用 set 创建 且 不能加空格，否则读取不到 eg 

    :: set test=%1   写成 set test = %1 则需要%test % 读取 ，且读取的内容是 ”空格+参数1的内容“

    ```

- 读取路径

```bat
echo 当前盘符：%~d0
echo 当前路径：%cd%
echo 当前执行命令行：%0
echo 当前bat文件路径：%~dp0
echo 当前bat文件短路径：%~sdp0

::变量赋值 不加空格
set dirPath=%cd%
::变量读取 前后%变量名%
echo %dirPath%

``