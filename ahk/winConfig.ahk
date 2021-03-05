;***********CHEAT SHEET***********
;****** ^ - Ctrl
;****** + - Shift
;****** ! - Alt
;****** # - Win
;**********************************
; `	Escape character (backtic upper left on keyboard below Esc character)
;**********************************

;***********Variables ***********
#NoEnv
EnvGet, USERPROFILE, USERPROFILE
EnvGet, TEMP, TEMP


; Other AHK scripts:
SetWorkingDir, %userprofile%\.cfg\ahk
#Include work.ahk	; Work related AHK scripts
#Include FeelingLucky.ahk

; Abort any script:
^Escape::
;ExitApp
Return

;::[ ::å

::btw::by the way

#X::
	selection := FC("explorer","","selection")
	Loop % selection.len()
		run % "notepad.exe """ selection[A_Index] """"
return

#c:: ; Windows and C closes active window
WinGetTitle, Title, A
WinKill, %Title%
;PostMessage, 0x112, 0xF060,,, %Title%
return

#z:: ; Trim data for Excel
Send, ^c
clipwait,2 	
StringReplace, Clipboard, Clipboard,%A_Space%, , All; Remove spaces
StringReplace, Clipboard, Clipboard,–,%A_Tab%, All	; Replace hyphen with tab
Clipboard:=RegExReplace(Clipboard, "[A-zæøåÆØÅ]")			; Removes letters
msgbox %clipboard%
return

;***********GENERAL***********

;*******************************************
;***********Num Lock to searches ***********
;*******************************************
SetNumLockState, AlwaysOn ;Forces Num Lock to stay on permanently
numlock::
If WinActive("ahk_exe notepad++.exe"){
	Send ^c
	Send ^f
	Send ^v
	Send !o
}
Else If WinActive("ahk_exe Chrome.exe"){
	Send ^c
	Send ^f
	Send ^v
}
Else If WinActive("ahk_exe devenv.exe"){
	Send +^f
	Send {end}
	Send .*
}
return

+CapsLock::CapsLock		; Remap Shift-Capslock to represent Capslock
CapsLock::Enter			; Remap Capslock to represent Enter

Launch_App2::Home	;**** Calc => Home
F9::End				;**** F9 (and +/- is end)
;Media_Prev::End    ;**** <<   => End

#s::Run explorer.exe "%USERPROFILE%\Google Drive\rabota"
#E::Run explorer.exe "D:\TIC"
+#E:: Sendinput, D:\TIC
#F::Run explorer.exe "%USERPROFILE%\Google Drive"
+#F:: Sendinput, %USERPROFILE%\Google Drive
#W::Run explorer.exe "%USERPROFILE%\DOWNLOADS"
+#W:: Sendinput, %USERPROFILE%\DOWNLOADS
#O::Run explorer.exe "%USERPROFILE%\økonomi"
;#T::Run explorer.exe "%USERPROFILE%\Google Drive"\TEK
;+#T::Run explorer.exe "%USERPROFILE%\Google Drive"\TEK

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
#+q::
Run, "C:\Program Files\Notepad++\notepad++.exe" "%USERPROFILE%\.cfg\ahk\winConfig.ahk",,,myCMD
WinWaitActive, ahk_exe notepad++.exe
Run, "C:\Program Files\Notepad++\notepad++.exe" "%USERPROFILE%\.cfg\ahk\FeelingLucky.ahk",,,myCMD
WinWaitActive, ahk_exe notepad++.exe
Send,^s
Reload
return
; Works also when in work.ahk:
#q::
Send,^s
Reload
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