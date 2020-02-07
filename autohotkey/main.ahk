; Autoreload script on changes
; FIXME: Only checks current file
SetTimer,check_reload,1000

check_reload:
FileGetAttrib,attribs,%A_ScriptFullPath%
IfInString,attribs,A
{
FileSetAttrib,-A,%A_ScriptFullPath%
SplashTextOn,,,Updated script,
Sleep,500
Reload
}
Return

#Include includes.ahk

ToolTip(msg){
  MsgBox, % msg
}

ToolTip("foo")