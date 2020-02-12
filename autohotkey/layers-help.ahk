PromoteShortcut(shortcut, key, isHold, taps, state){
  TrayTip, Key Promoter ⚠, Use ' %shortcut% ', 0, 16
  Sleep 1500
  TrayTip
  PassthroughKey(key)
}


WoxSearch(category){
  Send ^!+{Space}
  Sleep 100
  WinActivateBottom, ahk_exe Wox.exe
  Send ^a
  Send {BackSpace}
  Send % category
}
