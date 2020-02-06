; Basic AHK configuration
#Include init.ahk

; Libraries
#Include <TapHoldManager>
#Include <RunOrActivate>

; 
#Include remappings.ahk




initialize_layers:
  #Include layers.ahk
  TrayTip, Layers initialized ✅, ✨✨✨, 0, 16