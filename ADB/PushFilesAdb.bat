
@echo off
echo ===========Adb device connect script===========
echo Author: Felipe Baltazar
echo Github:https://github.com/felipebaltazar
echo Creation Date: 25/09/2018
echo.
echo.
echo ====================Status=====================
echo [%time%] Checking adb default path...
call CD C:\Program Files (x86)\Android\android-sdk\platform-tools\
echo.
if %ERRORLEVEL% == 0 goto :getpath
echo ====================Status=====================
echo [%time%] Error..  Exited with status: %errorlevel%
echo [%time%]       ->You need abd to continue...
echo.
goto :endfail
:getpath
SET /P path=Please enter file full path to copy:
CD C:\Program Files (x86)\Android\android-sdk\platform-tools\
call adb push %path% /sdcard/
if %ERRORLEVEL% == 0 goto :endofscript
echo ====================Status=====================
echo [%time%] Error..  Exited with status: %errorlevel%
echo [%time%]       ->Error on copying file...
echo.
goto :endfail
:endfail
echo ====================Status=====================
echo [%time%] Status: Error!
:endofscript
pause