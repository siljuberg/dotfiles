@echo off

**************** Explorer ************************************************
**Disabled due to suspected misbehaviour
** cmd /c taskkill /F >nul 2>nul /im explorer.exe && start C:\Windows\explorer.exe

**************** Service dependent processses************************************************
** Probably also kills the service(defined as process), hence should not be killed.
** Same for keypirinha-x64
** Should probably find a way to just shut down the GUI.
rem taskkill /IM everything.exe /F >nul 2>nul


taskkill /IM SLBLicensing.exe /F >nul 2>nul

**************** CHROME ************************************************

rem taskkill /F /im chrome.exe
rem start call C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'


**************** OUTLOOK ************************************************
**** Muligens treig
rem taskkill /IM OUTLOOK.exe /F
rem start call C:\Users\msiljuberg\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\OUTLOOK.EXE - Shortcut.lnk
**************** OUTLOOK ************************************************
rem taskkill /IM lync.exe /F
rem taskkill /IM "Skype Meetings App.exe" /F
rem C:\Program Files (x86)\Microsoft Office\root\Office16\lync.EXE

****** Frequently switched ************************************
taskkill /IM mstsc.exe /F >nul 2>nul
taskkill /IM devenv.exe /F >nul 2>nul
taskkill /IM powershell.exe /F >nul 2>nul
taskkill /IM Teams.exe /F >nul 2>nul
taskkill /IM Taskmgr.exe /F >nul 2>nul
taskkill /IM notepad++.exe /F >nul 2>nul
taskkill /IM procmon64.exe /F >nul 2>nul
************************************************************************

********** Causing unknown trouble ********
rem taskkill /IM conhost.exe /F >nul 2>nul
*******************************************

************ Suspect misbehaviour due to killing:*********
rem taskkill /IM Everything.exe /F >nul 2>nul

********************* Other ************************************

taskkill /IM perfmon.exe /F >nul 2>nul
taskkill /IM Fiddler.exe /F >nul 2>nul
taskkill /IM mmc.exe /F >nul 2>nul
taskkill /IM firefox.exe /F >nul 2>nul
taskkill /IM python.exe /F >nul 2>nul
taskkill /IM jupyter-notebook.exe /F >nul 2>nul
taskkill /IM jupyter-lab.exe /F >nul 2>nul
taskkill /IM bash.exe /F >nul 2>nul
taskkill /IM windirstat.exe /F >nul 2>nul
taskkill /IM vim.exe /F >nul 2>nul
taskkill /IM wslhost.exe /F >nul 2>nul

taskkill /IM depends.exe /F >nul 2>nul
taskkill /IM Calculator.exe /F >nul 2>nul
taskkill /IM notepad.exe /F >nul 2>nul
rem start notepad.exe

rem taskkill /IM "conhost.exe" /F >nul 2>nul
taskkill /IM "windirstat.exe" /F >nul 2>nul
taskkill /IM "vim.exe" /F >nul 2>nul
taskkill /IM "wslhost.exe" /F >nul 2>nul

taskkill /IM "Calculator.exe" /F >nul 2>nul

taskkill /IM Code.exe /F >nul 2>nul
taskkill /IM MicrosoftEdge.exe /F >nul 2>nul

taskkill /IM Microsoft.Photos.exe /F >nul 2>nul
taskkill /IM mmc.exe /F >nul 2>nul
taskkill /IM mspaint.exe /F >nul 2>nul
taskkill /IM ScreenSketch.exe /F >nul 2>nul
taskkill /IM FoxitReader.exe /F >nul 2>nul
taskkill /IM taskmgr.exe /F >nul 2>nul
taskkill /IM compactview.exe /F >nul 2>nul
taskkill /IM regedit.exe /F >nul 2>nul

taskkill /IM winword.exe /F >nul 2>nul
taskkill /IM powerpnt.exe /F >nul 2>nul
taskkill /IM Excel.exe /F >nul 2>nul
taskkill /IM snippingtool.exe /F >nul 2>nul

taskkill /IM sublime_text.exe /F >nul 2>nul
taskkill /IM WinMergeU.exe /F >nul 2>nul
taskkill /IM OPGFramework.exe /F >nul 2>nul
taskkill /IM Fluiddeftool.exe /F >nul 2>nul

taskkill /IM gap.exe /F >nul 2>nul
taskkill /IM Slb.Icp.EspDesign.App.exe /F >nul 2>nul
taskkill /IM Slb.OneFluid.Shell.exe /F >nul 2>nul
taskkill /IM SlbLicensing.exe /F >nul 2>nul
taskkill /IM Multiflash.exe /F >nul 2>nul
taskkill /IM mfbj01.exe /F >nul 2>nul
taskkill /IM PSPlotX.exe /F >nul 2>nul
taskkill /IM Psim2000.exe /F >nul 2>nul

taskkill /IM Slb.Production.Engineering.desktop.exe /F >nul 2>nul
taskkill /IM pnetstub.exe /F >nul 2>nul
taskkill /IM psimstub.exe /F >nul 2>nul

taskkill /IM spotify.exe /F >nul 2>nul
taskkill /IM Microsoft.Photos.exe /F >nul 2>nul
taskkill /IM winzip32.exe /F >nul 2>nul
taskkill /IM hh.exe /F >nul 2>nul
taskkill /IM SystemSettings.exe /F >nul 2>nul

taskkill /IM "mspaint.exe" /F >nul 2>nul
taskkill /IM "ScreenSketch.exe" /F >nul 2>nul
taskkill /IM "FoxitReader.exe" /F >nul 2>nul
taskkill /IM "taskmgr.exe" /F >nul 2>nul
taskkill /IM "procmon64.exe" /F >nul 2>nul
taskkill /IM "compactview.exe" /F >nul 2>nul
taskkill /IM "regedit.exe" /F >nul 2>nul

taskkill /IM "winword.exe" /F >nul 2>nul
taskkill /IM "powerpnt.exe" /F >nul 2>nul
taskkill /IM "Excel.exe" /F >nul 2>nul
taskkill /IM "snippingtool.exe" /F >nul 2>nul

taskkill /IM "sublime_text.exe" /F >nul 2>nul
taskkill /IM "WinMergeU.exe" /F >nul 2>nul
taskkill /IM "OPGFramework.exe" /F >nul 2>nul
taskkill /IM "Fluiddeftool.exe" /F >nul 2>nul


taskkill /IM "gap.exe" /F >nul 2>nul
taskkill /IM "Slb.Icp.EspDesign.App.exe" /F >nul 2>nul
taskkill /IM "Slb.OneFluid.Shell.exe" /F >nul 2>nul
taskkill /IM "SlbLicensing.exe" /F >nul 2>nul
taskkill /IM "Slb.Production.Engineering.desktop.exe" /F >nul 2>nul
taskkill /IM "Multiflash.exe" /F >nul 2>nul
taskkill /IM "mfbj01.exe" /F >nul 2>nul
taskkill /IM "pnetstub.exe" /F >nul 2>nul
taskkill /IM "psimstub.exe" /F >nul 2>nul
taskkill /IM "PSPlotX.exe" /F >nul 2>nul
taskkill /IM "Psim2000.exe" /F >nul 2>nul

taskkill /IM "powershell.exe" /F >nul 2>nul
taskkill /IM "spotify.exe" /F >nul 2>nul
taskkill /IM "Microsoft.Photos.exe" /F >nul 2>nul
taskkill /IM "winzip32.exe" /F >nul 2>nul
taskkill /IM "devenv.exe" /F >nul 2>nul
taskkill /IM "hh.exe" /F >nul 2>nul
taskkill /IM "SystemSettings.exe" /F >nul 2>nul

taskkill /IM "Taskmgr.exe" /F >nul 2>nul

rem timeout /t 1

taskkill /IM cmd.exe /F >nul 2>nul