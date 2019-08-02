:: note use ::
@echo off
echo "TEST!"
::no use chinese
echo %errorlevel%
::ִstop
echo a:%~d0
echo %cd%
set dirPath=%cd%
echo %dirPath%
echo %0
echo %~dp0
echo %~sdp0

::pause