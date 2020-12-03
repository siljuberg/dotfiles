I found description here.

[https://www.addictivetips.com/windows-tips/automatically-extract-zip-files-windows-10/](https://www.addictivetips.com/windows-tips/automatically-extract-zip-files-windows-10/)

Final solution was with a Windows service.

The service did not work when running with Local System account. I had to run it with the DIR.SLB.COM\msiljuberg account.

Tool is here: 

%USERPROFILE%\Google Drive\TEK\Tools\FileWatcherUtilities

Install Service with:

"%USERPROFILE%\Google Drive\TEK\Tools\FileWatcherUtilities\InstallFileWatcherWindowsService.bat"