RAlt::
ImFeelingLucky:
DefaultBrowser = chrome.exe
Search := Clip() ; Capture selected text
Search := RegExReplace(Search, "^\s*([\s\S]*?)\s*$", "$1") ; Trim spaces
If (Search <> "")
	If RegExMatch(Search, "i)^HKEY_|HKCR|HKCU|HKLM|HKU|HKU|HKCC") { ; If it's a registry key, open RegEdit to that key.
		Process, Close, regedit.exe
		RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Applets\Regedit, Lastkey, %Search% ; This key determines where regedit.exe opens
		Run regedit.exe, , Max
	} Else If RegExMatch(Search, "^\d+\.\d+\.\d+\.\d+$") ; If it's an IP address, look it up
		Run %DefaultBrowser% http://whatismyipaddress.com/ip/%Search%
	Else If (InStr(Search, ":\") = 2) or (InStr(Search, "\\") = 1) ; If it appears to be a filepath, run it
		Run %Search%
	Else If (InStr(Search, "http") = 1) or RegExMatch(Search, "^[\w-]+\.[\w-]+(\.[\w-]+){0,3}(/.*)?$") ; If it appears to be a URL then run it with the default browser (sometimes I change mine)
		Run % DefaultBrowser A_Space Search
	Else
		Run % DefaultBrowser A_Space "http://www.google.com/search?q=" EncodeURL(Search) "&btnI=1" ; Otherwise conduct an I'm Feeling Lucky search of the term on wikipedia
Return

;=============================================[Std.ahk]=============================================

Clip(Text="", Reselect="") ; http://www.autohotkey.com/forum/viewtopic.php?p=467710 , modified August 2012
{
	Static BackUpClip, Stored, LastClip
	If (A_ThisLabel = A_ThisFunc) {
		If (Clipboard == LastClip)
			Clipboard := BackUpClip
		BackUpClip := LastClip := Stored := ""
	} Else {
		If !Stored {
			Stored := True
			BackUpClip := ClipboardAll
		} Else
			SetTimer, %A_ThisFunc%, Off
		LongCopy := A_TickCount, Clipboard := "", LongCopy -= A_TickCount
		If (Text = "") {
			Send, ^c
			ClipWait, LongCopy ? 0.5 : 0.25
		} Else {
			Clipboard := LastClip := Text
			ClipWait, 10
			Send, ^v
		}
		SetTimer, %A_ThisFunc%, -700
		If (Text = "")
			Return LastClip := Clipboard
		Else If (ReSelect = True) or (Reselect and (StrLen(Text) < 3000)) {
			Sleep 30
			StringReplace, Text, Text, `r, , All
			SendInput, % "{Shift Down}{Left " StrLen(Text) "}{Shift Up}"
		}
	}
	Return
	Clip:
	Return Clip()
}

EncodeURL(Text, FromURL=False) ; Uberi
{
	FormatInteger := A_FormatInteger, FoundPos := 0, SearchFor := FromURL ? "%.." : "[^\w-.~% ]"
	SetFormat, IntegerFast, Hex
	If !FromURL
		StringReplace, Text, Text, `%, `%25, All
	While (FoundPos := RegExMatch(Text, SearchFor, Char, FoundPos + 1))
		StringReplace, Text, Text, %Char%, % FromURL ? Chr("0x" SubStr(Char, 2)) : "%" SubStr(0 SubStr(Asc(Char), 3), -1), All
	If !FromURL {
		StringReplace, Text, Text, %A_Space%, +, All
		Text := RegExReplace(Text, "%..", "$U0") ; Only necessary on berban's computer so comment this line out.
	}
	SetFormat, IntegerFast, %FormatInteger%
	Return Text
}