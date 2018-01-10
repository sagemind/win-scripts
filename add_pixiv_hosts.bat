@echo off
rem 开启管理员模式, 如果出现闪退情况
rem 例如在win10中貌似不需要开启管理员模式即可运行下方命令
rem 则将下面:Admin以上到本行的代码注释掉即可
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
echo #www.pixiv.net >> hosts
echo 210.129.120.41 pixiv.net >> hosts
echo 210.129.120.44 accounts.pixiv.net >> hosts
echo 210.140.131.145 source.pixiv.net >> hosts
echo 210.140.131.160 d.pixiv.org >> hosts
echo 210.140.131.144 imgaz.pixiv.net >> hosts
echo 210.129.120.41 www.pixiv.net >> hosts