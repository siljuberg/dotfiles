CaseConversionMenu()
{
	Gui, Add, Text,, Enter the text:
	Gui, Add, Edit, text,
	Gui, Add, Text,, What to do?
	Gui, Add, DropdownList,whattodo,Nothing||Nothing at all|Just nothing
	Gui,Add,Button,default,Ok
	Gui, Show,,This is the title
	return
}

#a::CaseConversionMenu()

#q::
Run "C:\Program Files (x86)\Notepad++\notepad++.exe" "C:\Users\msiljuberg\.cfg\ahk\test.ahk"
Send,^s
;CaseConversionMenu()
Reload
return