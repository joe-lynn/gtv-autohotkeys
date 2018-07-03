; GTA Online macros to apply armor, eat a snack or toggle passive.

; Basic settings and such for AHK

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; common errors
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ; Necessary to match on the name of the window instead of window class in IfWinActive.

; shift+control+alt+r becomes a hotkey to reload this script. For me it is necessary to
; reload it after starting the game - with the hotkey I can do it without ever going to 
; the desktop. Please note if you have any other program that uses this particular long
; key combo this will replace it througout your Windows.

+^!r::Reload ; Assign Shift-Ctrl-Alt-R as a hotkey to restart the script.
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached. 
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing? 
	IfMsgBox, Yes, Edit 
return

; Grand Theft Auto V / Online specific macros begin here. Everything below the IfWinActive statement
; only happens if the GTA window is open and on top.

#IfWinActive Grand Theft Auto V 

; Why all these manual pauses and explicitly specifying both button press and button release,
; when I could be using SetKeyDelay? Because I couldn't get SetKeyDelay to work reliably in
; GTAO. This may be ugly, but if it's ugly and works perfectly its good enough for me. 

; I made the steps into gosubs, just to make the actual macros below more readable and easy
; to edit. If your computer can handle even faster menu interaction, change the 60 in the 
; Sleep statements to 50 or less. You'll probably start seeing lower reliability.

Down:
	Send {Down down}
	Sleep, 60
	Send {Down up}
	Sleep, 60
Return

Up:
	Send {up down}
	Sleep, 60
	Send {up up}
	Sleep, 60
Return

Enter:
	Send {Enter down}
	Sleep, 60
	Send {Enter up}
	Sleep, 60
Return

Menu:
	Send {M down}
	Sleep, 60
	Send {M up}
Return

; I use the 0 key on the numpad, the dot on the numpad and the + on the numpad to 
; activate these macros. see https://www.autohotkey.com/docs/KeyList.htm if you need
; to find other keys. Also note that these don't work inside apartments or in any situation
; where the menu changes, like when you become a VIP.

Numpad4:: ; Apply ceo armor
	Gosub, Menu
	Sleep, 250		; Extra long sleep just to make sure the menu has time to appear properly.
	Gosub, Down
	Gosub, Down
	Gosub, Enter
	Gosub, Down
	Gosub, Enter
	Gosub, Down
	Gosub, Down
	Gosub, Down
	Gosub, Down
	Gosub, Enter
	Gosub, Menu
return

Numpad5:: ; open ceo snack
	Gosub, Menu
	Sleep, 250
	Gosub, Down
	Gosub, Down
	Gosub, Enter
	Gosub, Down
	Gosub, Down
	Gosub, Enter
return

NumpadAdd:: ; ceo buzzard spawn!
	Gosub, Menu
	Sleep, 250
	Gosub, Enter
	Gosub, Down
	Gosub, Down
	Gosub, Down
	Gosub, Down
	Gosub, Down
	Gosub, Enter
	Gosub, Down
	Gosub, Down
	Gosub, Down
	Gosub, Down
	Gosub, Enter
return

Numpad1:: ; Apply normal armor
	Gosub, Menu
	Sleep, 250		; Extra long sleep just to make sure the menu has time to appear properly.
	Gosub, Down
	Gosub, Enter
	Gosub, Down
	Gosub, Enter
	Gosub, Down
	Gosub, Down
	Gosub, Down
	Gosub, Down
	Gosub, Enter
	Gosub, Menu
return

Numpad2:: ; Eat a normal snack. This will cycle through them as they run out.
	Gosub, Menu
	Sleep, 250
	Gosub, Down
	Gosub, Enter
	Gosub, Down
	Gosub, Down
	Gosub, Enter
return


#IfWinActive