
;***********GENERAL***********

RAlt::AppsKey
+CapsLock::CapsLock
CapsLock::Enter	


; **** ctrl V and enter:

#Y::Run explorer.exe %USERPROFILE%\.cfg
+#Y:: Sendinput, %USERPROFILE%\.cfg
#F::Run explorer.exe "%USERPROFILE%\Google Drive"
+#F:: Sendinput, %USERPROFILE%\Google Drive
#W::Run explorer.exe "%USERPROFILE%\DOWNLOADS"
+#W:: Sendinput, %USERPROFILE%\DOWNLOADS
#M::Run explorer.exe "%USERPROFILE%\Google Drive\mba"
+#M:: Sendinput, %USERPROFILE%\Google Drive\mba
#O::Run explorer.exe "%USERPROFILE%\økonomi"
#Z::Run explorer.exe "%USERPROFILE%"ss


;***********WORK***********
#E::Run explorer.exe "D:\OD\TIC"
+#E:: Sendinput, D:\OD\TIC
#U::Run explorer.exe "C:\Program Files\Schlumberger\PIPESIM2019.3\Programs"
+#U:: Sendinput, C:\Program Files\Schlumberger\PIPESIM2019.3\Programs
#I::Run explorer.exe "C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs"
+#I:: Sendinput, C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs
#A::Run explorer.exe "D:\tmp"
+#A:: Sendinput, D:\tmp

;*********** F-Buttons ***********
#F1::Run explorer.exe "%TEMP%\PIPESIM"
+#F1:: Sendinput, %TEMP%\PIPESIM
#F2::Run explorer.exe "%USERPROFILE%\OneDrive - Schlumberger\Documents" ; For pictures stored with windows+shift+S
+#F2:: Sendinput, "%USERPROFILE%\OneDrive - Schlumberger\Documents"	; For pictures stored with windows+shift+S
<<<<<<< HEAD
#F3::Run explorer.exe %USERPROFILE%\.cfg
+#F3:: Sendinput, %USERPROFILE%\.cfg
#F4::Run explorer.exe "%userprofile%\.cfg\shortcuts"
+#F4:: Sendinput, "%userprofile%\.cfg\shortcuts"
=======
#F3::Run explorer.exe %USERPROFILE%
+#F3:: Sendinput, %USERPROFILE%
>>>>>>> parent of 91b9143... a

;#F11:: Sendinput, 
#F12::Run %_MSCRIPT%\clearAll.cmd

#s::Run explorer.exe "D:\DIV\setup\SLB\PIPESIM_setup"

#C::Run explorer.exe "E:\P2\"
+#C:: Sendinput, E:\P2

;***********Copy highlighted text and execute in cmd ***********
#Q::
Send ^c
Run, cmd.exe,,,myCMD
WinWaitActive, ahk_pid %myCMD%
Send %Clipboard%
Send {Enter}
return

;***********
;****Open, Save and Reload ahk script:***********
^q::
Run "C:\Program Files (x86)\Notepad++\notepad++.exe" "%USERPROFILE%\.cfg\ahk\winConfig.ahk"
Send,^s
Reload
;********************************