sc delete "File Watcher Windows Service"
sc create "File Watcher Windows Service" binPath= "%userprofile%\.cfg\FileWatcherUtilities\FileWatcherWindowsService.exe"
sc description "File Watcher Windows Service" "Watches for file system changes in the system."
sc config "File Watcher Windows Service" start=auto