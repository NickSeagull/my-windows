; Autoreload script on changes
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


; Basic AHK configuration
#Include init.ahk

; Libraries
#Include <RunOrActivate>
#Include <TapHoldManager>

; Remappings (not layers)
#Include remappings.ahk
