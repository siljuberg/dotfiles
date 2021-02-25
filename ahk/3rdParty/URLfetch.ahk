#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


f8:: 
    WinGetClass, strClass, A
    MsgBox % GetCurrentUrlAcc(strClass)
Return

;------------------------------------------------------------
GetCurrentUrlAcc(strClass)
; Found at https://autohotkey.com/boards/viewtopic.php?f=6&t=3702&start=60
;------------------------------------------------------------
{
	; static or global?
	global nWindow
	global accAddressBar
	
	If (nWindow != WinExist("ahk_class " strClass)) ; reuses accAddressBar if it's the same window
	{
		nWindow := WinExist("ahk_class " strClass)
		accAddressBar := GetAddressBar(GetCurrentUrlAccObjectFromWindow(nWindow))
	}
	Try sURL := accAddressBar.accValue(0)
		If (sURL == "")
		{
			WinGet, nWindows, List, % "ahk_class " strClass ; In case of a nested browser window as in the old CoolNovo (TO DO: check if still needed)
			If (nWindows > 1)
			{
				accAddressBar := GetAddressBar(GetCurrentUrlAccObjectFromWindow(nWindows2))
				Try sURL := accAddressBar.accValue(0)
			}
		}
	If ((sURL != "") and (SubStr(sURL, 1, 4) != "http")) ; Modern browsers omit "http://"
		sURL := "http://" . sURL
	If (sURL == "")
		nWindow := -1 ; Don't remember the window if there is no URL
	Return sURL
}
;------------------------------------------------------------


;------------------------------------------------------------
GetAddressBar(accObj, accPath:="")
; "GetAddressBar" based in code by stealzy
; Found at https://autohotkey.com/boards/viewtopic.php?p=109548#p109548
; IsUrl in this functions above replaced by my own code LocationIsHttp
;------------------------------------------------------------
{
	n := 0
	Try If ((accObj.accRole(0) == 42) and StrLen(accObj.accValue(0)) and LocationIsHttp(accObj.accValue(0)))
		Return accObj
	Try If ((accObj.accRole(0) == 42) and StrLen(accObj.accValue(0)) and LocationIsHttp("http://" . accObj.accValue(0))) ; Modern browsers omit "http://"
		Return accObj
	For nChild, accChild in GetCurrentUrlAccChildren(accObj)
	{
		n++
		currentPath := accPath . n . "."
		If IsObject(accAddressBar := GetAddressBar(accChild, currentPath))
			Return accAddressBar
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
GetCurrentUrlAccInit()
; Part of the Acc.ahk Standard Library by Sean (updated by jethrow) (via Joe Glines)
; Found at http://autohotkey.com/board/topic/77303-/?p=491516
;------------------------------------------------------------
{
	static h
	If Not h
		h := DllCall("LoadLibrary", "Str", "oleacc", "Ptr")
}
;------------------------------------------------------------


;------------------------------------------------------------
GetCurrentUrlAccObjectFromWindow(hWnd, idObject = 0)
; Part of the Acc.ahk Standard Library by Sean (updated by jethrow) (via Joe Glines)
; Found at http://autohotkey.com/board/topic/77303-/?p=491516
;------------------------------------------------------------
{
	GetCurrentUrlAccInit()
	If DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", idObject&=0xFFFFFFFF, "Ptr"
		, -VarSetCapacity(IID, 16) + NumPut(idObject == 0xFFFFFFF0 ? 0x46000000000000C0 : 0x719B3800AA000C81
		, NumPut(idObject == 0xFFFFFFF0 ? 0x0000000000020400 : 0x11CF3C3D618736E0, IID, "Int64"), "Int64"), "Ptr*", pacc) = 0
		Return ComObjEnwrap(9, pacc, 1)
}
;------------------------------------------------------------


;------------------------------------------------------------
GetCurrentUrlAccQuery(objAcc)
; Part of the Acc.ahk Standard Library by Sean (updated by jethrow) (via Joe Glines)
; Found at http://autohotkey.com/board/topic/77303-/?p=491516
;------------------------------------------------------------
{
	Try Return ComObj(9, ComObjQuery(objAcc, "{618736e0-3c3d-11cf-810c-00aa00389b71}"), 1)
}
;------------------------------------------------------------


;------------------------------------------------------------
GetCurrentUrlAccChildren(objAcc)
; Part of the Acc.ahk Standard Library by Sean (updated by jethrow) (via Joe Glines)
; Found at http://autohotkey.com/board/topic/77303-/?p=491516
;------------------------------------------------------------
{
	If ComObjType(objAcc,"Name") != "IAccessible"
		ErrorLevel := "Invalid IAccessible Object"
	Else
	{
		GetCurrentUrlAccInit()
		cChildren := objAcc.accChildCount
		Children := []
		If DllCall("oleacc\AccessibleChildren", "Ptr", ComObjValue(objAcc), "Int", 0, "Int", cChildren, "Ptr"
			, VarSetCapacity(varChildren, cChildren * (8 + 2 * A_PtrSize), 0) * 0 + &varChildren, "Int*", cChildren) = 0
		{
			Loop, %cChildren%
			{
				i := (A_Index - 1) * (A_PtrSize * 2 + 8) + 8
				child := NumGet(varChildren, i)
				Children.Insert(NumGet(varChildren, i - 8) = 9 ? GetCurrentUrlAccQuery(child) : child)
              ¬ (NumGet(varChildren, i - 8) = 9 ? ObjRelease(child) : "")
			}
			Return (Children.MaxIndex() ? Children : "")
		}
		Else
			ErrorLevel := "AccessibleChildren DllCall Failed"
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
LocationIsHTTP(strLocation)
;------------------------------------------------------------
{
	return SubStr(strLocation, 1, 7) = "http://" or SubStr(strLocation, 1, 8) = "https://"
}
;------------------------------------------------------------


;------------------------------------------------------------
GetWebPageTitle(strLocation)
;------------------------------------------------------------
{
	ToolTip, %lToolTipRetrievingWebPageTitle%, 700, -35
	strHTML := Url2Var(strLocation)
	ToolTip
	
	RegExMatch(strHTML, "is)<title>(.*?)</title>", strTitle)
	
	StringReplace, strTitle, strTitle, <title>
	StringReplace, strTitle, strTitle, </title>
	StringReplace, strTitle, strTitle, `r, , A
	StringReplace, strTitle, strTitle, `t, %A_Space%, A
	StringReplace, strTitle, strTitle, `n, %A_Space%, A
	
	return NumDecode(Trim(strTitle, Chr(160))) ; Chr(160) to also trim non-breaking spaces
}
;------------------------------------------------------------


;------------------------------------------------------------
Url2Var(strUrl)
;------------------------------------------------------------
{
	objWebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	/*
	if (A_LastError)
		; an error occurred during ComObjCreate (A_LastError probably is E_UNEXPECTED = -2147418113 #0x8000FFFFL)
		BUT DO NOT ABORT because the following commands will be executed even if an error occurred in ComObjCreate (!)
	*/
	objWebRequest.Open("GET", strUrl)
	objWebRequest.Send()

	return (objWebRequest.StatusText() = "OK" ? objWebRequest.ResponseText() : "")
}
;------------------------------------------------------------


;------------------------------------------------------------
NumDecode(str)
; Extracted from Dec_XML() https://autohotkey.com/board/topic/29866-encoding-and-decoding-functions-v11/
; converts "&#233;" or "&#xE9;" to "é"
;------------------------------------------------------------
{
	Loop
		If RegexMatch(str, "S)(&#(\d+);)", dec) ; matches: &#[dec];
			StringReplace, str, str, %dec1%, % Chr(dec2), All
		Else If RegexMatch(str, "Si)(&#x([\da-f]+);)", hex) ; matches: &#x[hex];
			StringReplace, str, str, %hex1%, % Chr("0x" . hex2), All
		Else
			Break
	
	return str
} 
;------------------------------------------------------------

StdOutStream( sCmd, Callback = "", WorkingDir=0) { ; Modified  :  maz-1
  Static StrGet := "StrGet"           ; Modified  :  SKAN 31-Aug-2013 
                                      ; Thanks to :  HotKeyIt         
                                      ; Original  :  Sean 20-Feb-2007 
  tcWrk := WorkingDir=0 ? "Int" : "Str"
  DllCall( "CreatePipe", UIntP,hPipeRead, UIntP,hPipeWrite, UInt,0, UInt,0 )
  DllCall( "SetHandleInformation", UInt,hPipeWrite, UInt,1, UInt,1 )
  If A_PtrSize = 8
  {
    VarSetCapacity( STARTUPINFO, 104, 0  )      ; STARTUPINFO          ;  
    NumPut( 68,         STARTUPINFO,  0 )      ; cbSize
    NumPut( 0x100,      STARTUPINFO, 60 )      ; dwFlags    =>  STARTF_USESTDHANDLES = 0x100
    NumPut( hPipeWrite, STARTUPINFO, 88 )      ; hStdOutput
    NumPut( hPipeWrite, STARTUPINFO, 96 )      ; hStdError
    VarSetCapacity( PROCESS_INFORMATION, 24 )  ; PROCESS_INFORMATION  ;  
  }
  Else
  {
    VarSetCapacity( STARTUPINFO, 68, 0  )
    NumPut( 68,         STARTUPINFO,  0 )
    NumPut( 0x100,      STARTUPINFO, 44 )
    NumPut( hPipeWrite, STARTUPINFO, 60 )
    NumPut( hPipeWrite, STARTUPINFO, 64 )
    VarSetCapacity( PROCESS_INFORMATION, 16 )
  }

  If ! DllCall( "CreateProcess", UInt,0, UInt,&sCmd, UInt,0, UInt,0 ;  
              , UInt,1, UInt,0x08000000, UInt,0, tcWrk, WorkingDir
              , UInt,&STARTUPINFO, UInt,&PROCESS_INFORMATION ) 
   Return "" 
   , DllCall( "CloseHandle", UInt,hPipeWrite ) 
   , DllCall( "CloseHandle", UInt,hPipeRead )
   , DllCall( "SetLastError", Int,-1 )     

  hProcess := NumGet( PROCESS_INFORMATION, 0 )                 
  hThread  := NumGet( PROCESS_INFORMATION, A_PtrSize )  

  DllCall( "CloseHandle", UInt,hPipeWrite )

  AIC := ( SubStr( A_AhkVersion, 1, 3 ) = "1.0" ) ;  A_IsClassic 
  VarSetCapacity( Buffer, 4096, 0 ), nSz := 0 

  While DllCall( "ReadFile", UInt,hPipeRead, UInt,&Buffer, UInt,4094, UIntP,nSz, Int,0 ) {

   tOutput := ( AIC && NumPut( 0, Buffer, nSz, "Char" ) && VarSetCapacity( Buffer,-1 ) ) 
              ? Buffer : %StrGet%( &Buffer, nSz, "CP0" ) ; formerly CP850, but I guess CP0 is suitable for different locales

   Isfunc( Callback ) ? %Callback%( tOutput, A_Index ) : sOutput .= tOutput

  }                   

  DllCall( "GetExitCodeProcess", UInt,hProcess, UIntP,ExitCode )
  DllCall( "CloseHandle",  UInt,hProcess  )
  DllCall( "CloseHandle",  UInt,hThread   )
  DllCall( "CloseHandle",  UInt,hPipeRead )
  DllCall( "SetLastError", UInt,ExitCode  )
  VarSetCapacity(STARTUPINFO, 0)
  VarSetCapacity(PROCESS_INFORMATION, 0)

Return Isfunc( Callback ) ? %Callback%( "", 0 ) : sOutput      
}