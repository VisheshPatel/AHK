#SingleInstance,Force

#IfWinNotActive ahk_exe Code.exe ; Run everywhere except on vscode

Ctrl & Up::
if GetKeyState("Shift") ; Check if Shift is pressed
{
	Send {HOME 2}+{END}^x{Delete}{Up}^v{Enter}{Up}
}
return

Ctrl & Down::
if GetKeyState("Shift") ; Check if Shift is pressed
{
	Send {HOME 2}+{END}^x{Delete}{Down}^v{Enter}{Up}
}
return

#IfWinNotActive