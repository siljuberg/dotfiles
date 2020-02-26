reg add "HKEY_CLASSES_ROOT\Unknown\shell\openas\command" /v "ASDF" /t DWORD /d "TEST" /f

setx _MSCRIPT "%userprofile%\.cfg\scripts"

rem %AppData%\Microsoft\Windows\Start Menu\Programs\Startup