#Include %A_ScriptDir%\common\editor.ahk


#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

$^+q::QuoteSelection() ; Ctrl+Shift+Q

QuoteSelection()
{
    selection := GetSelection() ; Get selected text.
    PasteText(Quote(selection)) ; Quote the text and paste it back.
}

PasteText(s)
{
    Clipboard := s ; Put the text on the clipboard.
    Send ^v ; Paste the text with Ctrl+V.
}

Quote(s)
{
    return """" . s . """"
}