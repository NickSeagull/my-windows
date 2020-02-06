; Basic AHK configuration
#Include init.ahk

; Libraries
#Include <TapHoldManager>
#Include <RunOrActivate>

; Remappings (not layers)
#Include remappings.ahk




initialize_layers:
  #Include layers.ahk
  TrayTip, Layers initialized ✅, ✨✨✨, 0, 16