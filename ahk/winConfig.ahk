
;***********GENERAL***********

RAlt::AppsKey
+CapsLock::CapsLock
CapsLock::Enter

#G::Run explorer.exe "%USERPROFILE%\Google Drive"
+#G:: Sendinput, "%USERPROFILE%\Google Drive"
#W::Run explorer.exe "%USERPROFILE%\DOWNLOADS"
+#W:: Sendinput, "%USERPROFILE%\DOWNLOADS"
#F::Run explorer.exe "%USERPROFILE%\Downloads"
+#F:: Sendinput, "%USERPROFILE%\Downloads"
#M::Run explorer.exe "%USERPROFILE%\Google Drive\mba"
+#M:: Sendinput, "%USERPROFILE%\Google Drive\mba"
#O::Run explorer.exe "%USERPROFILE%\økonomi"

;***********WORK***********
#E::Run explorer.exe "D:\OD\TIC"
+#E:: Sendinput, "D:\OD\TIC"
#U::Run explorer.exe "C:\Program Files\Schlumberger\PIPESIM2019.2\Programs"
+#U:: Sendinput, "C:\Program Files\Schlumberger\PIPESIM2019.2\Programs"
#I::Run explorer.exe "C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs"
+#I:: Sendinput, "C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs"
#s::Run explorer.exe "D:\DIV\setup\SLB\PIPESIM_setup"


