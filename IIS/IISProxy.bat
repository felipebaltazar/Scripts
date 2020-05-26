@echo off
echo =================Proxy setup script=================
echo Author: Felipe Baltazar
echo Github:https://github.com/felipebaltazar
echo Creation Date: 28/08/2018
echo.
echo.
echo ======================Status=========================
CD %HomePath%\AppData\Roaming\npm
echo [%time%] Trying start npm module
echo.
call npm help
if %ERRORLEVEL% == 0 goto :setupproxy
echo ======================Status=========================
echo [%time%] Error! [Status-Code:%errorlevel%]
echo [%time%]    You need Node.js to continue
echo [%time%]    If you dont have it, please install before debug
echo.
goto :endfail
:inputError
echo [%time%] Only numbers, please..
echo.
:setupproxy
SET /P port=Please enter port to redirect:
echo(%port%|findstr "^[0-9-][0-9]*$" >nul && echo [%time%] Selected port %port% || goto:inputError
echo.
echo ======================Status=========================
echo [%time%] Setting up iisexpress-proxy internal port to external
echo.
call iisexpress-proxy %port% to 3000
if %ERRORLEVEL% == 0 goto :endsucess
echo ======================Status=========================
echo [%time%] Error! [Status-Code: %errorlevel%]
echo [%time%]   You need iisexpress-proxy to continue
echo [%time%]   Use node to install install -g iisexpress-proxy
echo.
goto :endfail
:endsucess
echo ======================Status=========================
echo [%time%] Success!
echo.
goto :endofscript
:endfail
echo ======================Status=========================
echo [%time%] Fail!
echo.
:endofscript
pause