;***********CHEAT SHEET***********
;****** ^ - Ctrl
;****** + - Shift
;****** ! - Alt
;****** # - Win
;**********************************
; `	Escape character (backtic upper left on keyboard below Esc character)
;**********************************
; %userprofile%\.cfg\ahk\work.ahk
; Other AHK scripts:
SetWorkingDir, %userprofile%\.cfg\ahk
#Include work.ahk	; Work related AHK scripts:
;#Include misc.ahk


;***********Variables ***********
;userprofile := EnvGet("userprofile")
;Keypirinha := "%userprofile%\Google Drive\TEK\Keypirinha\keypirinha.exe"
;***********GENERAL***********

RAlt::AppsKey			; Right alt key acts as Shift+F10
+CapsLock::CapsLock		; Remap Shift-Capslock to represent Capslock
CapsLock::Enter			; Remap Capslock to represent Enter

Launch_App2::Home	;**** Calc => Home
F9::End				;**** F9 (and +/- is end)
;Media_Prev::End    ;**** <<   => End

#s::Run explorer.exe "%USERPROFILE%\Google Drive\rabota"
#E::Run explorer.exe "D:\PA\AnacondaMigration"
+#E:: Sendinput, D:\PA\AnacondaMigration
#F::Run explorer.exe "%USERPROFILE%\Google Drive"
+#F:: Sendinput, %USERPROFILE%\Google Drive
#W::Run explorer.exe "%USERPROFILE%\DOWNLOADS"
+#W:: Sendinput, %USERPROFILE%\DOWNLOADS
#O::Run explorer.exe "%USERPROFILE%\økonomi"
#T::Run explorer.exe "%USERPROFILE%\Google Drive"\TEK
+#T::Run explorer.exe "%USERPROFILE%\Google Drive"\TEK

#M:: Sendinput, msiljuberg@slb.com

;***********Copy highlighted text and execute in cmd ***********
#^c::
Send ^c
ClipWait, 2
Run, cmd.exe,,,myCMD
WinWaitActive, ahk_pid %myCMD%
Send %Clipboard%
Send {Enter}
return

;********** Copy and open marked registry path in registry editor************
#J:: 
Send ^c
ClipWait, 2
Run regjump.exe %CLIPBOARD%

;***********Copy highlighted text and execute in Windows Run ***********
#^r::
Send ^c
ClipWait, 2
Send ,#r
WinWaitActive Run
Send ^v
;Send !{Tab}
Send {Enter}
Return
;***********
;****Open, Save and Reload ahk script:***********
#q::
Run, "C:\Program Files\Notepad++\notepad++.exe" "%USERPROFILE%\.cfg\ahk\winConfig.ahk",,,myCMD
WinWaitActive, ahk_exe notepad++.exe
Send,^s
Reload
return
; Works also when in work.ahk:
#+q::
Send,^s
Reload
return
;***********
;**************Pass highlighted text to Google Chrome******************
; The second line works for searches and the first works for URL's
#^g::
Send, ^c
ClipWait, 2
;parameter = C:\Program Files\Google\Chrome\Application\chrome.exe "%clipboard%"
parameter = C:\Program Files\Google\Chrome\Application\chrome.exe https://www.google.com/search?q="%clipboard%"
Run %parameter%
return
;***********
;**************Pass highlighted text to ldap******************
; The second line works for searches and the first works for URL's
#^l::
Send, ^c
parameter = C:\Program Files\Google\Chrome\Application\chrome.exe https://directory.slb.com/query.cgi?query="%clipboard%"
Run %parameter%
return
;***********
;**************Pass highlighted text to intouch******************
; The second line works for searches and the first works for URL's
#^i::
Send, ^c
parameter = C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://intouchsupport.com/index.cfm?event=ITE.edit&contentid="%clipboard%"
Run %parameter%
return

;****Copy and (alt-d) search for text in notepad++ ***********
#^z::
Send,^c
WinActivate ahk_exe notepad++.exe
sleep, 200
Send,^f
sleep, 200
Send,^v
Send,!o
Reload
return
;***********

