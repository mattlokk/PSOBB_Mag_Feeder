#IfWinActive Ephinea: Phantasy Star Online Blue Burst

SendMode Event        ; REQUIRED!!!! PSOBB won't accept the deemed superior
SetKeyDelay 150, 50   ; default added with v2 'SendInput', revert to old mode

^p::pause	; Ctrl+P to pause the script
^r::Reload	; Ctrl+R to restart the script
^e::ExitApp	; Ctrl+E will exit the script

; Ctrl+J to start script
^j::
	Sleep 500
	FEEDCOUNT:= 0
	KEEPGOING:= true
	lastFeedTime:= 0
	MAGS:= {}


	; -------------------------------------------------
	; ---------------Make Changes Here-----------------
	; note that the count is the number of *feedings*
	; so the number of items fed is count * 3

	MAGS[1]:= {}
	MAGS[1][1]:= { itemName: "monofluid", count: 427 }
	;MAGS[1][2]:= { itemName: "difluid", count: 50 }
	;MAGS[1][3]:= { itemName: "trifluid", count: 70 }

	;MAGS[2]:= {}
	;MAGS[2][1]:= { itemName: "monomate", count: 100 } ; this would feed 300 monomates
	;MAGS[2][2]:= { itemName: "dimate", count: 3 }
	;MAGS[2][3]:= { itemName: "trimate", count: 3 }

	; -------------------------------------------------
	; -------------------------------------------------


	While KEEPGOING{
		i:= 1
		isDoneFeeding:= []
		Loop % MAGS.Length(){
			isDoneFeeding[i]:= true
			j:= 1
			previousItemCount:= 0
			length:= MAGS[i].Length()
			Loop % length{
				count:=  MAGS[i][j]["count"]
				if (FEEDCOUNT >= (previousItemCount + count))
					previousItemCount+= count
				else{
					Buy(MAGS[i][j]["itemName"])
					isDoneFeeding[i]:= false
					break
				}
				j++
			}
			i++
		}
		if (FeedCount > 0){
			waitTime:= lastFeedTime + 220000 - A_TickCount
			Sleep % waitTime
		}
		lastFeedTime:= A_TickCount
		isDone:= true
		Loop % MAGS.Length(){
			if !(isDoneFeeding[A_Index]){
				Feed(A_Index)
				isDone:= false
			}
		}
		if (isDone)
			KEEPGOING:= false
		FEEDCOUNT+= 1
	}
	; all done!
	ExitApp
	; --------------------------------------------
	; functions below here
	Buy(itemName){
		if (itemName = "monomate")
			BuyItem("down", 0)
		else if (itemName = "dimate")
			BuyItem("down", 1)
		else if (itemName = "trimate")
			BuyItem("down", 2)
		else if (itemName = "monofluid")
			BuyItem("down", 3)
		else if (itemName = "difluid")
			BuyItem("down", 4)
		else if (itemName = "trifluid")
			BuyItem("down", 5)
		else if (itemName = "sol atomizer")
			BuyItem("up", 7)
		else if (itemName = "moon atomizer")
			BuyItem("up", 6)
		else if (itemName = "star atomizer")
			BuyItem("up", 5)
		else if (itemName = "antidote")
			BuyItem("up", 4)
		else if (itemName = "antiparalysis")
			BuyItem("up", 3)
	}
	BuyItem(dir, steps){
		Send {Enter}
		Sleep 200
		Send {Enter}
		Loop %steps%{
			if (dir = "down")
				Send, {Down}
			else
				Send, {Up}
		}
		Send {Enter}
		Send {Up}
		Send {Up}
		Send {Enter}
		Send {Enter}
		Send {Backspace}
		Send {Backspace}
		Send {Backspace}
		Sleep 200
	}
	Feed(index){
		magpos:= index - 1
		Loop 3{
			Send {F4}
			Loop % magpos{
				Send {Down}
			}
			Send {Enter}
			Send {Enter}
			Send {Enter}
			Sleep 200
			Send {F4}
		}
	}
Return