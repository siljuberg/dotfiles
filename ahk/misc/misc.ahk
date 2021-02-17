; Workaround written in AHK for windows user:
SetTitleMatchMode,2
while(true){
WinGetActiveTitle,at
; wrong IfWinActive,ahk_class Notepad++,Keep this file in editor?
IfWinActive,Keep non existing file ahk_class #32770
WinClose,
WinWaitNotActive,% at
}


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
