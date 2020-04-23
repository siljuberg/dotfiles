
;***********GENERAL***********

RAlt::AppsKey
+CapsLock::CapsLock
CapsLock::Enter	

; **** ctrl V and enter:
;CapsLock::Send ^v {Enter}	

#Y::Run explorer.exe %USERPROFILE%\.cfg
+#Y:: Sendinput, %USERPROFILE%\.cfg
#F::Run explorer.exe "%USERPROFILE%\Google Drive"
+#F:: Sendinput, %USERPROFILE%\Google Drive
#W::Run explorer.exe "%USERPROFILE%\DOWNLOADS"
+#W:: Sendinput, %USERPROFILE%\DOWNLOADS
#M::Run explorer.exe "%USERPROFILE%\Google Drive\mba"
+#M:: Sendinput, %USERPROFILE%\Google Drive\mba
#O::Run explorer.exe "%USERPROFILE%\økonomi"
#Z::Run explorer.exe "%USERPROFILE%"

#F12::Run %_MSCRIPT%\clearAll.cmd

;***********WORK***********
#E::Run explorer.exe "D:\OD\TIC"
+#E:: Sendinput, D:\OD\TIC
#U::Run explorer.exe "C:\Program Files\Schlumberger\PIPESIM2019.3\Programs"
+#U:: Sendinput, C:\Program Files\Schlumberger\PIPESIM2019.3\Programs
#I::Run explorer.exe "C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs"
+#I:: Sendinput, C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs
#A::Run explorer.exe "D:\tmp"
+#A:: Sendinput, D:\tmp

#F1::Run explorer.exe "%TEMP%\PIPESIM"
+#F1:: Sendinput, %TEMP%\PIPESIM
#F2::Run explorer.exe "%USERPROFILE%\OneDrive - Schlumberger\Documents" ; For pictures stored with windows+shift+S
+#F2:: Sendinput, "%USERPROFILE%\OneDrive - Schlumberger\Documents"	; For pictures stored with windows+shift+S
#F3::Run explorer.exe %USERPROFILE%
+#F3:: Sendinput, %USERPROFILE%
#F4::Run explorer.exe "%userprofile%\.cfg\shortcuts"
+#F4:: Sendinput, "%userprofile%\.cfg\shortcuts"

#s::Run explorer.exe "D:\DIV\setup\SLB\PIPESIM_setup"

#C::Run explorer.exe "E:\P2\"
+#C:: Sendinput, E:\P2

;***********Text input***********
;msiljuberg@slb.com
; tbd