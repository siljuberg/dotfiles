mklink /H "%APPDATA%\Code\User\settings.json" vsCode\settings.json
mklink /H "%APPDATA%\Code\User\keybindings.json" vsCode\keybindings.json
mklink /H "%APPDATA%\Code\User\tasks.json" vsCode\tasks.json
mklink /H "%USERPROFILE%\.vimrc" .vimrc
mklink /J "%USERPROFILE%\.jupyter" .jupyter
rem mklink /H "C:\Windows\System32\notepad.exe" "C:\Program Files\Sublime Text 3\sublime_text.exe"
timeout 10