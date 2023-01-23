#IfWinActive Ephinea: Phantasy Star Online Blue Burst
#Include JSON.ahk

SetKeyDelay 440, 60
SendMode Event

^p::pause	; Ctrl+P to pause the script
^r::Reload	; Ctrl+R to restart the script
^e::ExitApp	; Ctrl+E will exit the script

; Ctrl+J to start script
^j::
	Sleep 200
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
					Buy(item.name)
					hungerTime:= 220
					waitTime:= lastFeedTime[i] + (hungerTime * 1000) - A_TickCount
					if (waitTime > 0)
						Sleep % waitTime
					isFirstFeedOfSession[i]:= false
					lastFeedTime[i]:= A_TickCount
					mag.feedCount++
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
		if (isDone)
			break
		SaveData(__Mags)
	}
	WriteText("All done!")
	; all done!
	ExitApp
Return

; --------------------------------------------
; functions
LoadData(){
	FileRead jsonString, mags.json
	data := JSON.Load(jsonString)
	Return data
}
SaveData(mags){
	output:= "`[`n"
	Loop % mags.Length(){
		mag:= mags[A_Index]
		output:= % output "  {`n"
		output:= % output "    ""name"": """ mag.name """,`n"
		output:= % output "    ""feedCount"": """ mag.feedCount """,`n"
		output:= % output "    ""items"": [`n"
		Loop % mag.items.Length(){
			item:= mag.items[A_Index]
			output:= % output "      `{""name"": """ item.name """, ""count"": """ item.count """`}"
			if (A_Index < mag.items.Length())
				output:= % output ","
			output:= % output "`n"
		}
		output:= % output "    `]`n"
		output:= % output "  `}"
		if (A_Index < mags.Length())
			output:= % output ","
		output:= % output "`n"
	}
	output:= % output "`]"

	FileDelete, mags.json
	;dataString:= JSON.Dump(data, ,2)
	FileAppend, %output%, mags.json
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
	Sleep 500
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
	Sleep 500
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