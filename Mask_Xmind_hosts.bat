@echo off
rem ��������Աģʽ, ��������������
rem ������win10��ò�Ʋ���Ҫ��������Աģʽ���������·�����
rem ������:Admin���ϵ����еĴ���ע�͵�����
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin


@echo off
c:
cd %SystemRoot%\system32\drivers\etc\

echo. >> hosts
echo # mask the xmind websit >> hosts 
echo 127.0.0.1 www.xmind.net  >> hosts
