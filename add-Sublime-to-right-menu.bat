@echo off
echo Input you sunlime exe path......
set /p st3Path=
echo Your st3Path  is %st3Path%

rem add it for all file types

@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3" /t REG_SZ /v "" /d "Open with Sublime Text 3" /f

@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3" /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f

@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text 3\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f


rem add it for folders

@reg add "HKEY_CLASSES_ROOT\Directory\shell\Open with Sublime Text 3" /t REG_SZ /v "" /d "Open with Sublime Text 3" /f

@reg add "HKEY_CLASSES_ROOT\Directory\shell\Open with Sublime Text 3" /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f

@reg add "HKEY_CLASSES_ROOT\Directory\shell\Open with Sublime Text 3\command" /t REG_SZ /v "" /d "%st3Path% \"%%1\"" /f


rem add it for current folder

@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Open with Sublime Text 3" /t REG_SZ /v "" /d "Open with Sublime Text 3" /f

@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Open with Sublime Text 3" /t REG_EXPAND_SZ /v "Icon" /d "%st3Path%,0" /f

@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Open with Sublime Text 3\command" /t REG_SZ /v "" /d "%st3Path% \"%%v\"" /f

pause


