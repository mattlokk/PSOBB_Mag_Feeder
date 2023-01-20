#IfWinActive Ephinea: Phantasy Star Online Blue Burst
SetKeyDelay, 920, 80

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

	MAGS[1]:= {}
	MAGS[1][1]:= { itemName: "monofluid", count: 427 } ; 128100 meseta
	;MAGS[1][2]:= { itemName: "difluid", count: 2 }
	;MAGS[1][3]:= { itemName: "trifluid", count: 1 }

	MAGS[2]:= {}
	MAGS[2][1]:= { itemName: "monomate", count: 26 } ; 3900 meseta
	;MAGS[2][2]:= { itemName: "dimate", count: 3 }
	;MAGS[2][3]:= { itemName: "trimate", count: 3 }

	; -------------------------------------------------
	; -------------------------------------------------



	While KEEPGOING{
		i:= 1
		isMagsLastFeed:= []
		Loop % MAGS.Length(){
			isMagsLastFeed[i]:= true
			j:= 1
			previousItemCount:= 0
			length:= MAGS[i].Length()
			Loop % length{
				count:=  MAGS[i][j]["count"]
				if (FEEDCOUNT >= (previousItemCount + count)){
					previousItemCount+= count
				}
				else{
					Buy(MAGS[i][j]["itemName"])
					isMagsLastFeed[i]:= false
					break
				}
				j++
			}
			i++
		}
		if (FeedCount > 0){
			waitTime:= lastFeedTime + 211000 - A_TickCount
			Sleep % waitTime
		}
		lastFeedTime:= A_TickCount
		isLastFeed:= true
		Loop % MAGS.Length(){
			if !(isMagsLastFeed[A_Index]){
				Feed(A_Index)
				isLastFeed:= false
			}
		}
		if (isLastFeed)
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
		Sleep 1000
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
		Sleep 1000
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
			Sleep 1000
			Send {F4}
		}
	}
Return