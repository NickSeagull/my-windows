; Remap Caps to Esc
Capslock::
Send {Esc}
return

; Assign Ctrl-Alt-R as a hotkey to restart the script.
^!r::
Reload
TrayTip, AHK Main Reloaded ✅, ✨✨✨, 0, 16
return

; Enable layers using Ctrl-Alt-E
^!e::
Gosub, initialize_layers
return

initialize_layers:
  #Include layers.ahk
  TrayTip, Layers initialized ✅, ✨✨✨, 0, 16