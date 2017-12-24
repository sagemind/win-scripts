var WshShell = new ActiveXObject("WScript.Shell");

WshShell.CurrentDirectory = ".";



WshShell.RegWrite("HKCU\\Software\\Classes\\Directory\\Background\\shell\\Cmder\\", "Cmder here", "REG_SZ");
WshShell.RegWrite("HKCU\\Software\\Classes\\Directory\\Background\\shell\\Cmder\\Icon", WshShell.CurrentDirectory + "\\Cmder.exe" );
WshShell.RegWrite("HKCU\\Software\\Classes\\Directory\\Background\\shell\\Cmder\\command\\"
    , WshShell.CurrentDirectory + "\\Cmder.exe", "REG_SZ");

