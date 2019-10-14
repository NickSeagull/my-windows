RunOrActivate(appName, className){
 	IfWinExist ahk_class %className%
	{
	    WinActivateBottom, ahk_class %className%
	}
	Else
	{
	  Run %appName%
	    WinActivate
  }
	Return
}

RunOrActivateTitle(appName, titleName){
 	IfWinExist %titleName%
	{
	    WinActivateBottom, %titleName%
	}
	Else
	{
	  Run %appName%
	    WinActivate
  }
	Return
}

RunOrActivateEdge(appName){
	WinActivate, ahk_exe MicrosoftEdgeCP.exe
}