;***********CHEAT SHEET***********
;****** ^ - Ctrl
;****** + - Shift
;****** ! - Alt
;***********
;***********WORK***********
#U::Run explorer.exe "C:\Program Files\Schlumberger\PIPESIM2019.3\Programs"
+#U:: Sendinput, C:\Program Files\Schlumberger\PIPESIM2019.3\Programs
;#I::Run explorer.exe "C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs"
+#I:: Sendinput, C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs

;*********** F-Buttons ***********
+#F1:: Sendinput, %TEMP%\PIPESIM
#F2::Run explorer.exe "%USERPROFILE%\OneDrive - Schlumberger\Documents" ; For pictures stored with windows+shift+S
+#F2:: Sendinput, "%USERPROFILE%\OneDrive - Schlumberger\Documents"	; For pictures stored with windows+shift+S
#F3::Run explorer.exe %USERPROFILE%\.cfg
+#F3:: Sendinput, %USERPROFILE%\.cfg
#F4::Run explorer.exe "%userprofile%\.cfg\shortcuts"
+#F4:: Sendinput, %userprofile%\.cfg\shortcuts

;#F11:: Sendinput, 
#F12::Run %_MSCRIPT%\clearAll.cmd

#s::Run explorer.exe "D:\setup\SLB\PIPESIM_setup"

#C::Run explorer.exe "E:\P2\"
+#C:: Sendinput, E:\P2
;***********Open PIPESIM temp folder, sort by date modified, select latest***********
#F1::
Run explorer.exe "%TEMP%\PIPESIM"
sleep, 850
Send {tab}
Send {enter}
Send {tab}
Send {enter}
Send {End}
Send {Home}	
Send {enter}
return
;*************************************
;******* Misc. TIC related ***********
;*************************************

;#E::Run explorer.exe "D:\OD\TIC"
+#E:: Sendinput, D:\OD\TIC


;***********Copy Tic Number from URL, create folder in D:\OD\TIC and add to quick access ***********
#^e::
Send, !d

Send, {End}

Send, ^+{Left}

Send ^c
foldername = %clipboard%_
newDir = D:\OD\TIC\%clipboard%_
FileCreateDir, %newDir%
Run explorer.exe %newDir%
WinWaitActive %foldername%
Send, +{Tab}
Send +{Home}
Send +{F10}
Send {Down 2}
Send {enter}
Send !{Up}
Send {F2}
Send {End}
Send, {Enter}
Return
;***********
;***********
;***********Copy Tic Number from URL, open D:\OD\TIC and search for highlighted text (tic number) ***********
;#^+e::
#e::
Send, !d
Send, {End}
Send, ^+{Left}
Send ^c
Run "D:\OD\TIC"
WinWaitActive TIC
Sleep, 50
Send ^f
Sleep, 350
Send, ^v
Sleep, 500
Send, {Enter}
WinWaitActive %clipboard%
Send, {Tab}
Send, {Down}
Send, +{F10}
Sleep, 350
Send, {Up}
Send, {Up}
Send, {Enter}
Send, {Enter}
Return
;***********
;**** Open OLGA variable selector***********
#^x::
MouseClick, right
Send, e
Send, {enter}
return
;***********