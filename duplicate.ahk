#Include %A_ScriptDir%\common\editor.ahk

#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#IfWinNotActive ahk_exe Code.exe ; Run everywhere except on vscode
^+d:: Duplicate() ; Ctrl + Shift + d
; ^+d:: CheckForShift() ; Ctrl + Shift + d
#IfWinNotActive

; CheckForShift()
; {
;     if GetKeyState("Shift") ; Check if Shift is pressed
;     {
;         Duplicate()
;     }
;     Else
;     {
;         Send ^d
;     }
; }

Duplicate()
{
	old_clipboard = %clipboard%		; Store clipboard
    selection := GetSelection()
    if !selection                   ; if anything is not selected, then copy-paste line
        CopyPasteLine()
    Else
        Send {Right}%selection%     ; else paste selection on right
	clipboard = %old_clipboard%		; Restore clipboard
}

CopyPasteLine()
{
    SetKeyDelay, -1
    Clipboard := "" ; Clear clipboard for ClipWait to function.
    Send {End}+{home}^c ; Copy entire line
    ClipWait, 2 ; Wait for data to fill clipboard
    Send {End}{Enter}%Clipboard% ; Paste Clipboard in next line
}

