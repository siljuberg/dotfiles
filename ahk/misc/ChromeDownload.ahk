;**************Script to download pages in chrome browser******************
; When looped all tabs, it will cause no harm. The prompt to override will answer no and it will try again and loop.
#^p::
Loop {
	Send, ^s
	sleep, 3900
	Send, {Enter}
	sleep, 1900
	Send, ^`t
	sleep, 1900
}
return