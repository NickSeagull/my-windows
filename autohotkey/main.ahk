﻿; Autoreload script on changes
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