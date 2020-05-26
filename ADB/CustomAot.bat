@echo off
echo ===========Adb device connect script===========
echo Author: Felipe Baltazar
echo Github:https://github.com/felipebaltazar
echo Creation Date: 25/09/2018
echo.
echo.
echo ====================Status=====================
echo Iniciando construcao do perfil de inicializacao

SET /P port=Insira o diretorio do csproj:
echo(%port% >nul && echo [%time%] Diretorio %port%

CD %port%
msbuild /t:BuildAndStartAotProfiling

echo.
echo.
echo ====================Status=====================
echo Aguardando aplicação iniciar
pause

set PATH=%PATH%;"C:\Program Files (x86)\Android\android-sdk\platform-tools"
msbuild -t:FinishAotProfiling

echo.
echo.
echo ====================Status=====================
echo Resumo da inicializacao
aprofutil -s custom.aprof

echo.
echo.
echo ====================Status=====================
echo Informacoes detalhadas de inicializacao
aprofutil -a custom.aprof

echo.
echo.
pause