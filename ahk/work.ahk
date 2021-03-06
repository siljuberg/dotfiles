;***********CHEAT SHEET***********
;****** ^ - Ctrl
;****** + - Shift
;****** ! - Alt
;***********
; `	Escape character (backtic upper left on keyboard below Esc character)
;***********Make Calc***********



#U::Run explorer.exe "C:\Program Files\Schlumberger\PIPESIM2019.3\Programs"
+#U:: Sendinput, C:\Program Files\Schlumberger\PIPESIM2019.3\Programs
;#I::Run explorer.exe "C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs"
+#I:: Sendinput, C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs

;*********** F-Buttons ***********
+#F1:: Sendinput, %TEMP%\PIPESIM
#F2::Run explorer.exe "%USERPROFILE%\OneDrive - Schlumberger\Documents"
+#F2:: Sendinput, "%USERPROFILE%\OneDrive - Schlumberger\Documents"
#F3::Run explorer.exe %USERPROFILE%\.cfg
+#F3:: Sendinput, %USERPROFILE%\.cfg
#F4::Run explorer.exe "%userprofile%\.cfg\shortcuts"
+#F4:: Sendinput, %userprofile%\.cfg\shortcuts
#F5::Run explorer.exe "%LOCALAPPDATA%\Packages\Microsoft.Windows.ShellExperienceHost_cw5n1h2txyewy\TempState\ScreenClip"
+#F5:: Sendinput, %LOCALAPPDATA%\Packages\Microsoft.Windows.ShellExperienceHost_cw5n1h2txyewy\TempState\ScreenClip

;#F11:: Sendinput, 
#F12::Run %_MSCRIPT%\clearAll.cmd

;***********Open PIPESIM temp folder, sort by date modified, select latest***********
#F1::
Run explorer.exe "%TEMP%\PIPESIM"
WinWaitActive PIPESIM
;sleep, 200
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

;***********Copy Tic Number from URL, create folder in D:\TIC and add to quick access ***********
#^e::
;*****Fetch ID from browser URL:

Send, !d
Send, {End}
Send, ^+{Left}
Send, ^+{Left}
Send ^c
ClipWait

; Remove clutter
StringReplace, Clipboard, Clipboard, `/general, , All
StringReplace, Clipboard, Clipboard, contentid=, , All

;*****Create folder "ID_":Q

foldername = %clipboard%_
newDir = D:\TIC\%clipboard%_
FileCreateDir, %newDir%
Run explorer.exe %newDir%
WinWaitActive %foldername%,,2
Send, +{Tab}
Send +{Home}
Send +{F10}
Send {Down 2}
Send {enter}
Send !{Up}
Send {F2}
Send {End}
;Send, {Enter}
Return
;***********
;***********
;***********Copy Tic Number from URL, open D:\TIC and search for highlighted text (tic number) ***********
#^+e::
Send, !d
Send, {End}
Send, ^+{Left}
Send ^c
Run "D:\TIC"
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