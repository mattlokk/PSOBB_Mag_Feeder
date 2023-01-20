#IfWinActive Ephinea: Phantasy Star Online Blue Burst
SendMode Event
SetKeyDelay 150, 50

^p::pause	; Ctrl+P to pause the script
^r::Reload	; Ctrl+R to restart the script
^e::ExitApp	; Ctrl+E will exit the script

; Ctrl+J to start script
^j::
	Sleep 500
	FEEDCOUNT:= 0



	; -------------------------------------------------
	; ---------------Make Changes Here-----------------

	BuyAndFeed("monofluid", 300)

	; -------------------------------------------------
	; -------------------------------------------------




	; just in case there's any items leftover
	FeedAndWait()

	; all done!
	MsgBox Mag Feeding Complete!
	ExitApp




	; --------------------------------------------
	; functions below here
	BuyAndFeed(itemName, count){
		global FEEDCOUNT
		i := 0

		while i < count{
			qty:= 0
			if (Mod(FEEDCOUNT, 3) = 0) {
				if (i  < count - 2)
					qty:= 3
				else
					qty:= % (count - i)
			}
			else{
				qty = % (3 - Mod(FEEDCOUNT, 3))
				if (qty > (count - i))
					qty = % (count - i)
			}

			if (itemName = "monomate")
				BuyItem("down", 0, qty)
			else if (itemName = "dimate")
				BuyItem("down", 1, qty)
			else if (itemName = "trimate")
				BuyItem("down", 2, qty)
			else if (itemName = "monofluid")
				BuyItem("down", 3, qty)
			else if (itemName = "difluid")
				BuyItem("down", 4, qty)
			else if (itemName = "trifluid")
				BuyItem("down", 5, qty)
			else if (itemName = "sol atomizer")
				BuyItem("up", 7, qty)
			else if (itemName = "moon atomizer")
				BuyItem("up", 6, qty)
			else if (itemName = "star atomizer")
				BuyItem("up", 5, qty)
			else if (itemName = "antidote")
				BuyItem("up", 4, qty)
			else if (itemName = "antiparalysis")
				BuyItem("up", 3, qty)

			FEEDCOUNT+= qty

			if (Mod(FEEDCOUNT, 3) = 0)
				FeedAndWait()

			i+= qty
		}
	}

	BuyItem(dir, steps, qty){
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
		qtySteps:= qty - 1
		Loop %qtySteps%{
			Send {Up}
		}
		Send {Enter}
		Send {Enter}
		Send {Backspace}
		Send {Backspace}
		Send {Backspace}
		Sleep 1000
	}

	FeedAndWait(){
		Loop 3{
			Send {F4}
			Send {Enter}
			Send {Enter}
			Send {Enter}
			Sleep 1000
			Send {F4}
		}
		Sleep 185000
	}

Return