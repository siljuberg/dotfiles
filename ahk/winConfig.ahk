;***********CHEAT SHEET***********
;****** ^ - Ctrl
;****** + - Shift
;****** ! - Alt

;***********Variables ***********
;userprofile := EnvGet("userprofile")
;Keypirinha := "%userprofile%\Google Drive\TEK\Keypirinha\keypirinha.exe"
Keypirinha := "C:\Users\" . A_username . "\Google Drive\TEK\Keypirinha\keypirinha.exe"
;***********GENERAL***********
RAlt::AppsKey
+CapsLock::CapsLock
CapsLock::Enter



;#Y::Run explorer.exe %Keypirinha%


#F::Run explorer.exe "%USERPROFILE%\Google Drive"
+#F:: Sendinput, %USERPROFILE%\Google Drive
#W::Run explorer.exe "%USERPROFILE%\DOWNLOADS"
+#W:: Sendinput, %USERPROFILE%\DOWNLOADS
#M::Run explorer.exe "%USERPROFILE%\Google Drive\mba"
+#M:: Sendinput, %USERPROFILE%\Google Drive\mba
#O::Run explorer.exe "%USERPROFILE%\økonomi"
#Z::Run explorer.exe "%USERPROFILE%"

;***********WORK***********
#E::Run explorer.exe "D:\OD\TIC"
+#E:: Sendinput, D:\OD\TIC
#U::Run explorer.exe "C:\Program Files\Schlumberger\PIPESIM2019.3\Programs"
+#U:: Sendinput, C:\Program Files\Schlumberger\PIPESIM2019.3\Programs
#I::Run explorer.exe "C:\Program Files (x86)\Schlumberger\PIPESIM2012.4\Programs"
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

#s::Run explorer.exe "D:\DIV\setup\SLB\PIPESIM_setup"

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
;***********Copy highlighted text and execute in cmd ***********
#^q::
Send ^c
Run, cmd.exe,,,myCMD
WinWaitActive, ahk_pid %myCMD%
Send %Clipboard%
Send {Enter}
return
;***********
;***********Copy highlighted text, open D:\OD\TIC and create folder with highlighted text ***********
#^e::
Send ^c
sleep, 100
Run "D:\OD\TIC"
sleep, 170
Send ^+n
Send {enter}
sleep, 350
Send {enter}
sleep, 850
Send +{Tab}
Send +{Home}
Send +{F10}
Send {Down 2}
Send {enter}
Send !{Up}
Send {F2}
Send, ^v
;Send, {Backspace}
Send, "_"
Return
;***********
;***********
;***********Copy highlighted text, open D:\OD\TIC and search for highlighted text (ticket number) ***********
#^+e::
Send ^c
sleep, 100
Run "D:\OD\TIC"
sleep, 100
Send ^f
sleep, 100
Send, ^v
sleep, 400
;Send, {Enter}
Return
;***********
;***********Copy highlighted text and execute in Windows Run ***********
#^r::
Send ^c
Send ,#r
Send %Clipboard%
Send {Enter}
Return
;***********
;****Open, Save and Reload ahk script:***********
#q::
Run "C:\Program Files (x86)\Notepad++\notepad++.exe" "%USERPROFILE%\.cfg\ahk\winConfig.ahk"
Send,^s
Reload
return
;***********
;**************Pass highlighted text to Google Chrome******************
; The second line works for searches and the first works for URL's
#^g::
Send, ^c
;parameter = C:\Program Files (x86)\Google\Chrome\Application\chrome.exe "%clipboard%"
parameter = C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://www.google.com/search?q="%clipboard%"
Run %parameter%
return
;***********
;**************Pass highlighted text to ldap******************
; The second line works for searches and the first works for URL's
#^l::
Send, ^c
parameter = C:\Program Files (x86)\Google\Chrome\Application\chrome.exe https://directory.slb.com/query.cgi?query="%clipboard%"
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

;************** To pause and exit the script ****************************
Pause:: Pause
;Escape:: ExitApp
Return


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


;**** Open OLGA variable selector***********
#^x::
MouseClick, right
Send, e
Send, {enter}
return
;***********


;**** Open keypirinha ***********
; Currently disabled

~LCtrl::
if !Triggered
{
  TimeNow := A_TickCount
  Triggered := 1
}
Return

~LCtrl Up::
if (A_PriorKey = "LControl") and (TimeNow > 0) and (A_TickCount - TimeNow < 250) {
   if WinActive("ahk_class keypirinha_wndcls_run") {
		Send,^c
		;Next line is hardcoded to current keypirinha shortcut for starting and pasting text from clipboard
        ;Send ^!#k
		Run %Keypirinha% --hide
         }
   else {
		Send,^c
		;Next line is hardcoded to current keypirinha shortcut for starting and pasting text from clipboard
		;Send ^!#k
        Run %Keypirinha% --show
   }
}
Triggered := 0
Return
