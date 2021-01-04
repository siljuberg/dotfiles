;***********CHEAT SHEET***********
;****** ^ - Ctrl
;****** + - Shift
;****** ! - Alt
;****** # - Win
; %USERPROFILE%\.cfg\ahk\work.ahk

SetWorkingDir, %userprofile%\.cfg\ahk

; Work related AHK scripts:
#Include work.ahk

^Q:
Sleep 100
;Run, C:\Users\msiljuberg\src\actnPip\actnPip\actnPip.py, "asfd"

; Workaround written in AHK for windows user:

SetTitleMatchMode,2
while(true){
WinGetActiveTitle,at
; wrong IfWinActive,ahk_class Notepad++,Keep this file in editor?
IfWinActive,Keep non existing file ahk_class #32770
WinClose,
WinWaitNotActive,% at
}



;***********Variables ***********
;userprofile := EnvGet("userprofile")
;Keypirinha := "%userprofile%\Google Drive\TEK\Keypirinha\keypirinha.exe"
;Keypirinha := "C:\Users\" . A_username . "\Google Drive\TEK\Keypirinha\keypirinha.exe"
;***********GENERAL***********

RAlt::AppsKey
; Remap Shift-Capslock to represent Capslock
+CapsLock::CapsLock
; Remap Capslock to represent Enter
CapsLock::Enter

Launch_App2::Home	;**** Calc => Home
F9::End				;**** F9 (and +/- is end)
;Media_Prev::End   ;**** <<   => End

;#Y::Run explorer.exe %Keypirinha%


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
Run, cmd.exe,,,myCMD
WinWaitActive, ahk_pid %myCMD%
Send %Clipboard%
Send {Enter}
return
;***********Copy highlighted text and execute in Windows Run ***********
#^r::
Send ^c
Send ,#r
WinWaitActive Run
Send ^v
;Send !{Tab}
Send {Enter}
Return
;***********
;****Open, Save and Reload ahk script:***********
#+q::
Run "C:\Program Files\Notepad++\notepad++.exe" "%USERPROFILE%\.cfg\ahk\winConfig.ahk"
Send,^s
Reload
return
; Works also when in work.ahk
#q::
Send,^s
Reload
return
;***********
;**************Pass highlighted text to Google Chrome******************
; The second line works for searches and the first works for URL's
#^g::
Send, ^c
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

;;**** Open keypirinha ***********
;; Currently disabled
;
;~LCtrl::
;if !Triggered
;{
;  TimeNow := A_TickCount
;  Triggered := 1
;}
;Return
;
;~LCtrl Up::
;if (A_PriorKey = "LControl") and (TimeNow > 0) and (A_TickCount - TimeNow < 250) {
;   if WinActive("ahk_class keypirinha_wndcls_run") {
;		Send,^c
;		;Next line is hardcoded to current keypirinha shortcut for starting and pasting text from clipboard
;        ;Send ^!#k
;		Run %Keypirinha% --hide
;         }
;   else {
;		Send,^c
;		;Next line is hardcoded to current keypirinha shortcut for starting and pasting text from clipboard
;		;Send ^!#k
;        Run %Keypirinha% --show
;   }
;}
;Triggered := 0
;Return
