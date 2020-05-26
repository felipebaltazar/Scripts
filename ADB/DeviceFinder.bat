@echo off
echo ===========Adb device finder script===========
echo Author: Felipe Baltazar
echo Github:https://github.com/felipebaltazar
echo Creation Date: 18/09/2018
echo.
echo.
echo ====================Status=====================
echo Checking adb default path...
call CD C:\Program Files (x86)\Android\android-sdk\platform-tools\
echo.
if %ERRORLEVEL% == 0 goto :findDevice
echo ====================Status=====================
echo Error..  Exited with status: %errorlevel%
echo        ->You need abd to continue...
echo.
goto :endfail
:findDevice
echo ====================Status=====================
echo Status:Restarting adb server
adb devices -l
goto :endsucess
:endsucess
goto :endofscript
:endfail
echo ====================Status=====================
echo Status: Error!
:endofscript
pause