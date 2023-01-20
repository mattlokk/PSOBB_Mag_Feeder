#IfWinActive Ephinea: Phantasy Star Online Blue Burst
SendMode Event
SetKeyDelay 150, 50

^p::pause	; Ctrl+P to pause the script
^r::Reload	; Ctrl+R to restart the script
^e::ExitApp	; Ctrl+E will exit the script

; Ctrl+J to start script
^u::
	Loop 3{
		Send {F4}
		Send {Enter}
		Send {Enter}
		Send {Enter}
		Send {F4}
	}
return

^i::
	Send {Space}
	Send {/}
	Send {b}
	Send {a}
	Send {n}
	Send {k}
	Send {Enter}
return