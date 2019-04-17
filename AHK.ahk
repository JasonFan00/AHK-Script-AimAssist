#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#IfWinActive  ; FILL IN THE PROCESS NAME TO WHATEVER WINDOW YOU WANT THIS SCRIPT TO WORK IN, OR LEAVE IT EMPTY

mDown = false
YDrag := 1.5
interval := 50	

~XButton1::
	SetTimer, spamclick, 1
return

~XButton1 up::
	SetTimer, spamclick, Off
return

~lButton::
	SetTimer, crouch, 1
	mDown = true
	loop
	{
		if mDown = false
			break
			
		DllCall("mouse_event", uint, 1, int, 0, int, YDrag, uint, 0, int, 0)
		sleep interval
	}
Return


crouch:
SendInput {lCtrl}
Return

spamclick:
SendInput {lButton}
Return

#IfWinActive
~lButton up::
	SetTimer, crouch, Off
	mDown = false
Return

`:: 
Suspend
return
