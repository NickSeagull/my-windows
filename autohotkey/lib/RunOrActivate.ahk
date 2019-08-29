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