
setx _MSCRIPT "%userprofile%\.cfg\scripts"
rem %AppData%\Microsoft\Windows\Start Menu\Programs\Startup


REM ************* Set default text editor across Windows ***********
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\txtfile\shell\open\command"  /f /t REG_EXPAND_SZ /d "\"C:\Program Files\Notepad++\notepad++.exe\" \"%%1\""