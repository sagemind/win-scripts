@echo off
c:
cd %SystemRoot%\system32\drivers\etc\

echo. >> hosts
echo # mask the xmind websit >> hosts 
echo 127.0.0.1 www.xmind.net  >> hosts
