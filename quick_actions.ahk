#IfWinActive Ephinea: Phantasy Star Online Blue Burst
SetKeyDelay, 100, 50

^p::pause	; Ctrl+P to pause the script
^r::Reload	; Ctrl+R to restart the script
^e::ExitApp	; Ctrl+E will exit the script

; Ctrl+J to start script
^j::
	Loop 3{
		Send {F4}
		Send {Enter}
		Send {Enter}
		Send {Enter}
		Send {F4}
	}
return

^k::
	Send {Space}
	Send {/}
	Send {b}
	Send {a}
	Send {n}
	Send {k}
	Send {Enter}
return