
#Include FC.ahk
#include Container.ahk
#include Prefs.ahk
#include ShellFileOperation.ahk

#NoEnv
EnvGet, USERPROFILE, USERPROFILE
EnvGet, TEMP, TEMP
RAlt::
	ImFeelingLucky:
	DefaultBrowser = chrome.exe
	Search := Clip() ; Capture selected text
	;Clipboard:=
	;Send, ^c	
	;Search:=Clipboard
	Search := RegExReplace(Search, "^\s*([\s\S]*?)\s*$", "$1") ; Trim spaces
	If WinActive("ahk_exe explorer.exe"){
		paths:=Explorer_GetSelected()	; Get paths of selected files
		strReplace(Explorer_GetSelected(), "`n",, numSelected)	; Return the number of files selected. Shortcuts does not count. I
		numSelected += 1
		selection := FC("explorer","","selection")
		
		If (numSelected==1){ ; 1 can mean none or 1 file selected.
		Run selection[0]
			Clipboard:=paths ; When one file is selected, copy path to clipboard.
		}
		Else If (numSelected>1){
			msgbox %paths%
			
		}
	}
	Else If (Search == ""){
		If WinActive("ahk_exe chrome.exe")or  WinActive("ahk_exe firefox.exe"){
			Send, 93091540
			Send, {tab}
			Send, 101288
			Send, {enter}
			}
		Else
			Run % DefaultBrowser A_Space "https://intouchsupport.com/index.cfm?event=ite.workspace"
		}
	Else If (Search <> "")
		If RegExMatch(Search, "i)^HKEY_|HKCR|HKCU|HKLM|HKU|HKU|HKCC") {	; If it's a registry key, open RegEdit to that key.
			Process, Close, regedit.exe
			RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Applets\Regedit, Lastkey, %Search% ; This key determines where regedit.exe opens
			Run regedit.exe, , Max
		}
		Else If RegExMatch(Search, "^\d+\.\d+\.\d+\.\d+$") ; If IP address
		Run %DefaultBrowser% http://whatismyipaddress.com/ip/%Search%
		Else If (InStr(Search, ":\") = 2) or (InStr(Search, "\\") = 1) or (InStr(Search, "%") = 1) { ; If it appears to be a filepath, run it
			Transform, Search, Deref, %Search%
			Run %Search%
		}
		else  If (RegExMatch(Search, "^\d+$"))  {
			If (Search>5000000)
				Run % DefaultBrowser A_Space "https://intouchsupport.com/index.cfm?event=ITE.edit&contentid="Search
			Else If (Search>5000)
				Run % DefaultBrowser A_Space "https://dev.azure.com/slb-swt/Flow_Assurance/_workitems/edit/"Search	
			;Run % DefaultBrowser A_Space "https://www.customercarecenter.slb.com/saw/Request/"Search
		}
		else  If (InStr(Search, "http") = 1) or RegExMatch(Search, "^[\w-]+\.[\w-]+(\.[\w-]+) {0,3}(/.*)?$") ; If it appears to be a URL then run it with the default browser (sometimes I change mine)
		Run % DefaultBrowser A_Space Search
		Else
			Run % DefaultBrowser A_Space "http://www.google.com/search?q=" EncodeURL(Search) "&btnI=1"
Return

;=============================================[Std.ahk]=============================================


Clip(Text="", Reselect="") ; http://www.autohotkey.com/forum/viewtopic.php?p=467710 , modified August 2012
{
	Static BackUpClip, Stored, LastClip
	If (A_ThisLabel = A_ThisFunc) {
		If (Clipboard == LastClip)
			Clipboard := BackUpClip
		BackUpClip := LastClip := Stored := ""
	}else  {
		If !Stored {
			Stored := True
			BackUpClip := ClipboardAll
		} Else
			SetTimer, %A_ThisFunc%, Off
		LongCopy := A_TickCount, Clipboard := "", LongCopy -= A_TickCount
		If (Text = "") {
			Send, ^c
			ClipWait, LongCopy ? 0.5 : 0.25
		}else  {
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


Explorer_GetPath(hwnd="")
{
	if !(window := Explorer_GetWindow(hwnd))
	return ErrorLevel := "ERROR"
	if (window="desktop")
		return A_Desktop
	path := window.LocationURL
	path := RegExReplace(path, "ftp://.*@","ftp://")
	StringReplace, path, path, file:///
	StringReplace, path, path, /, \, All 
	Loop
	If RegExMatch(path, "i)(?<=%)[\da-f]{1,2}", hex)
	StringReplace, path, path, `%%hex%, % Chr("0x" . hex), All
	Else Break
	return path
}
Explorer_GetAll(hwnd="")
{
	return Explorer_Get(hwnd)
}
Explorer_GetSelected(hwnd="")
{
	return Explorer_Get(hwnd,true)
}
Explorer_GetWindow(hwnd="")
{
	WinGet, process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")
	WinGetClass class, ahk_id %hwnd%
	if (process!="explorer.exe")
		return
	if (class ~= "(Cabinet|Explore)WClass")
	{
		for window in ComObjCreate("Shell.Application").Windows
		if (window.hwnd==hwnd)
			return window
	}
	else if (class ~= "Progman|WorkerW") 
		return "desktop"
}
Explorer_Get(hwnd="",selection=false)
{
	if !(window := Explorer_GetWindow(hwnd))
	return ErrorLevel := "ERROR"
	if (window="desktop")
	{
		ControlGet, hwWindow, HWND,, SysListView321, ahk_class Progman
		if !hwWindow
		ControlGet, hwWindow, HWND,, SysListView321, A
		ControlGet, files, List, % ( selection ? "Selected":"") "Col1",,ahk_id %hwWindow%
		base := SubStr(A_Desktop,0,1)=="\" ? SubStr(A_Desktop,1,-1) : A_Desktop
		Loop, Parse, files, `n, `r
		{
			path := base "\" A_LoopField
			IfExist %path%
			ret .= path "`n"
		}
	}else  {
		if selection
		collection := window.document.SelectedItems
		else
			collection := window.document.Folder.Items
		for item in collection
		ret .= item.path "`n"
	}
	return Trim(ret,"`n")
}            