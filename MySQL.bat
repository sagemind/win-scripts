:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::    ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off
CLS

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B
:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::     ����Ϊ��Ҫ���е��������ļ�����     ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:���ô���������ɫ
:color 0a 
:���ô��ڱ���
TITLE MySQL�������
 
call :checkAdmin
 
goto menu
:�˵�
:menu
cls
echo. 
echo.=-=-=-=-��ѡ����Ҫ��MySQL�Ĳ���-=-=-=-=-
echo.
echo.1: ����MySQL
echo.
echo.2: �ر�MySQL
echo. 
echo.3: ����MySQL
echo. 
echo.4: �� ��
echo.
echo.=-=-=-=-��������Ҫѡ�����Ŀ��š�-=-=-=-
set /p id=
if "%id%"=="1" goto startup
if "%id%"=="2" goto shutdown
if "%id%"=="3" goto reboot
if "%id%"=="4" exit
pause
 
:����
:startup
echo.
call :checkMySQL 1
echo.����MySQL......
net start "MySQL"
echo.����MySQL�ɹ���
pause 
goto menu 
 
:ֹͣ
:shutdown
echo.
call :checkMySQL 2
echo.�ر�MySQL......
net stop "MySQL"
echo.�ر�MySQL�ɹ���
pause 
goto menu
 
:����
:reboot
echo.
call :checkMySQL 2
echo.�ر�MySQL......
net stop "MySQL"
echo.�ر�MySQL�ɹ���
goto startup
goto menu
 
:�˳�
:goout
pause
goto menu
 
:���MySQL�����Ƿ����
:checkMySQL
set /a count=0
for /f "tokens=1 delims= " %%i in ('tasklist /nh ^| find /i "MySQL"') do (set /a count+=1)
if %count% neq 0 if "%1" equ "1" (
  echo ���棺MySQL������
  goto goout
)
if %count% equ 0 if "%1" equ "2" (
  echo ���棺MySQLδ����
  goto goout
)
 
:����Ƿ����Թ���Ա�������
:checkAdmin
echo test am i admin? > %SystemRoot%\System32\test.sunhao
if not exist %SystemRoot%\System32\test.sunhao (
  echo ���棺���Թ���Ա������У�
  pause
  exit
)
del %SystemRoot%\System32\test.sunhao