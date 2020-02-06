; Remap Caps to Esc
Capslock::
Send {Esc}
return

^!r::
Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.
TrayTip, AHK Main Reloaded ✅, ✨✨✨, 0, 16
return

^!e::
Gosub, initialize_layers
return

initialize_layers:
  #Include layers.ahk
  TrayTip, Layers initialized ✅, ✨✨✨, 0, 16