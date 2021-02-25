#Include FC.ahk
#include Container.ahk
#include Prefs.ahk
#include ShellFileOperation.ahk

#z:: ; testing key
selection := FC("explorer","","selection")
a=selection.toList("`n")
MsgBox %a%
MsgBox % selection.toList("`n")
return