@echo off
:: dir c:\*.* > a.txt
::dir c:\*.* > b.txt
::dir c:\*.* >> c.txt
::??????????
echo delete shutdown
shutdown -a
echo shutdown after 1800
shutdown -s -t 1800
::pause