@echo off
setlocal EnableDelayedExpansion

:menu
	echo.
	set cmd=""
	echo ----------------------------------------------
	echo 1 - Disable shortcut arrow;
	echo 2 - Enable shortcut arrow;
	echo 3 - Disable " - shortcut" lable;
	echo 4 - Enable " - shortcut" labe;
	echo 0 - Restart explorer and exit;
	echo.
	set /p cmd=Please enter the operation number: 

	if !cmd!==1 goto cmd1
	if !cmd!==2 goto cmd2
	if !cmd!==3 goto cmd3
	if !cmd!==4 goto cmd4
	if !cmd!==0 goto exit
goto menu

:cmd1
	echo.
	reg delete "HKEY_CLASSES_ROOT\lnkfile" /v "IsShortcut" /f
	reg delete "HKEY_CLASSES_ROOT\piffile" /v "IsShortcut" /f
	reg delete "HKEY_CLASSES_ROOT\InternetShortCut" /v "IsShortcut" /f
goto confirm

:cmd2
	echo.
	reg add "HKEY_CLASSES_ROOT\lnkfile" /v "IsShortcut" /t REG_SZ /f
	reg add "HKEY_CLASSES_ROOT\piffile" /v "IsShortcut" /t REG_SZ /f
	reg add "HKEY_CLASSES_ROOT\InternetShortCut" /v "IsShortcut" /t REG_SZ /f
goto confirm

:cmd3
	echo.
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /d 00000000 /t REG_binary /f
goto menu

:cmd4
	echo.
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /d 1f000000 /t REG_binary /f
goto menu

:confirm
	echo.
	echo This program needs to restart you explorer for the changes to take effect^^!
	set yn=""
	set /p yn=Do you want to restart explorer now? (y/n) 
	if !yn!==y goto restartexplorer
	if !yn!==n goto menu
goto confirm

:restartexplorer
	taskkill /f /im explorer.exe 1>nul
	start explorer.exe
goto menu

:exit
	echo.
	set yn=""
	set /p yn=restart explorer first? (y/n)
	if !yn!==y (
		taskkill /f /im explorer.exe 1>nul
		start explorer.exe
		exit
	)
	if !yn!==n exit
goto exit
