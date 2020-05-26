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
if %ERRORLEVEL% == 0 goto :setupproxy
echo ====================Status=====================
echo [%time%] Error..  Exited with status: %errorlevel%
echo [%time%]       ->You need abd to continue...
echo.
goto :endfail
:inputError
echo [%time%] Only numbers, please..
echo.
:setupproxy
SET /P port=Please enter device port:
echo(%port%|findstr "^[0-9-][0-9]*$" >nul && echo [%time%] Selected port %port% || goto:inputError
echo.
echo ====================Status=====================
echo [%time%] Status:Connectig...
call adb connect 10.1.1.%port%:5555
if %ERRORLEVEL% == 0 goto :endsucess
echo ====================Status=====================
echo [%time%] Error..  Exited with status: %errorlevel%
echo [%time%]       ->Cant connect to device 10.1.1.%port%:5555
echo.
goto :endfail
:endsucess
goto :endofscript
:endfail
echo ====================Status=====================
echo [%time%] Status: Error!
:endofscript
pause