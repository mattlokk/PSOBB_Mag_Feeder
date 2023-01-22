#IfWinActive Ephinea: Phantasy Star Online Blue Burst
#Include JSON.ahk

SendMode Event
SetKeyDelay 440, 60

^p::pause	; Ctrl+P to pause the script
^r::Reload	; Ctrl+R to restart the script
^e::ExitApp	; Ctrl+E will exit the script

; Ctrl+J to start script
^j::
	debug:= true

	Sleep 100
	__Mags:= % LoadData()
	lastFeedTime:= []
	While true{
		isDoneFeeding:= []
		Loop % __Mags.Length(){
			i:= A_Index
			mag:= __Mags[i]
			isDoneFeeding[i]:= true
			previousItemCount:= 0
			Loop % mag.items.Length(){
				item:=	mag.items[A_Index]
				if (mag.feedCount >= (previousItemCount + item.count))
					previousItemCount+= item.count
				else{
					isDoneFeeding[i]:= false
					if (debug){
						msg:= % "Buy " item.name
						WriteText(msg)
						hungerTime:= 10
					}
					else{
						Buy(item.name)
						hungerTime:= 215
					}

					waitTime:= lastFeedTime[i] + (hungerTime * 1000) - A_TickCount
					if (waitTime > 0){
						Sleep % waitTime
					}
					isFirstFeedOfSession[i]:= false
					lastFeedTime[i]:= A_TickCount
					mag.feedCount++
					if (debug){
						msg:= % "Feed " mag.name
						WriteText(msg)
					}
					else
						Feed(i)
					break
				}
				j++
			}
			i++
		}
		isDone:= true
		Loop % __Mags.Length(){
			if (!isDoneFeeding[A_Index]){
				isDone:= false
			}
		}
		if (isDone){
			break
		}
		SaveData(__Mags)

		sleep 500
	}
	WriteText("All done!")
	; all done!
	ExitApp
Return

; --------------------------------------------
; functions below here


LoadData(){
	FileRead jsonString, mags.json
	data := JSON.Load(jsonString)
	Return data
}
SaveData(data){
	FileDelete, mags.json
	dataString:= JSON.Dump(data, ,2)
	;dataString := StrReplace(dataString, ",", ",`r`n")


	FileAppend, %dataString%, mags.json
}
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
WriteText(val){
	Send {Space}
	array:= StrSplit(val)
	Loop % array.Length(){
		char:= array[A_Index]
		if (char = " ")
			Send {Space}
		else Send {%char%}
	}
	Send {Enter}
}