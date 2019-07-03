@echo off
:: dir c:\*.* > a.txt
::dir c:\*.* > b.txt
::dir c:\*.* >> c.txt
::自动关机命令
echo 半小时后即将自动关机
shutdown -s -t 1800
::pause