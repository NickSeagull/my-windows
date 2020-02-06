#Include remappings.ahk

setTitleMatchMode, 2

^!r::
Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.
TrayTip, AHK Main Reloaded ✅, ✨✨✨, 0, 16
return

^!e::
Gosub, initialize_layers
return

return
initialize_layers:
#Include layers.ahk
TrayTip, Layers initialized ✅, ✨✨✨, 0, 16