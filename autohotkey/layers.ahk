#Include <TapHoldManager>
#Include <RunOrActivate>

global enabledLayer := ""
thm := new TapHoldManager(0, 175, 1, "$*")
thm.Add("A", Func("AKey"))
thm.Add("B", Func("BKey"))
thm.Add("C", Func("CKey"))
thm.Add("D", Func("DKey"))
thm.Add("E", Func("EKey"))
thm.Add("F", Func("FKey"))
thm.Add("G", Func("NoOpKey").Bind("g"))
thm.Add("H", Func("HKey"))
thm.Add("I", Func("IKey"))
thm.Add("J", Func("JKey"))
thm.Add("K", Func("KKey"))
thm.Add("L", Func("LKey"))
thm.Add("M", Func("MKey"))
thm.Add("N", Func("NKey"))
thm.Add("O", Func("OKey"))
thm.Add("P", Func("PKey"))
thm.Add("Q", Func("QKey"))
thm.Add("R", Func("RKey"))
thm.Add("S", Func("SKey"))
thm.Add("T", Func("TKey"))
thm.Add("U", Func("UKey"))
thm.Add("V", Func("VKey"))
thm.Add("W", Func("WKey"))
thm.Add("X", Func("XKey"))
thm.Add("Y", Func("NoOpKey").Bind("y"))
thm.Add("Z", Func("NoOpKey").Bind("z"))
thm.Add("Space", Func("NoOpKey").Bind("{Space}"))
thm.Add(".", Func("PeriodKey"))
thm.Add(",", Func("ColonKey"))
thm.Add(";", Func("SemicolonKey"))

;; Remap Sticky-A to Shift
AKey(isHold, taps, state){
  if (isHold){
    Send % "{Shift " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "p"){
      Send á
    } else if (enabledLayer == "q"){
      Send Á
    } else {
      PassthroughKey("a")
    }
  }
}

;; Window management keys
BKey(isHold, taps, state){
  BindKey("b", isHold, state)
  if (!isHold) {
    PassthroughKey("b")
  }
}

;; Symbol keys
CKey(isHold, taps, state){
  BindKey("c", isHold, state)
  if (!isHold) {
    if (enabledLayer == "w"){
      RunOrActivateTitle("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", "ahk_exe chrome.exe")
    } else {
      PassthroughKey("c")
    }
  }
}

;; Remap Sticky-D to Alt
DKey(isHold, taps, state){
  if (isHold){
    Send % "{Alt " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "w"){
    } else {
      PassthroughKey("d")
    }
  }
}

EKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "w"){
      Run "explorer.exe"
    } else iF (enabledLayer == "p"){
      Send é
    } else if (enabledLayer == "q"){
      Send É
    } else if (enabledLayer == "x"){
      Send {Home}
    } else {
      PassthroughKey("e")
    }
  }
}

;; Remap Sticky-F to Ctrl
FKey(isHold, taps, state){
  if (isHold){
    Send % "{Ctrl " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "w"){
    } else {
      PassthroughKey("f")
    }
  }
}

HKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
      PassthroughKey("{Left}")
    } else if (enabledLayer == "w"){
    } else if (enabledLayer == "b"){
      Send #{Left}
    } else if (enabledLayer == "v"){
      Send {Media_Prev}
    } else {
      PassthroughKey("h")
    }
  }
}

IKey(isHold, taps, state){
  BindKey("i", isHold, state)
  if (!isHold){
    if (enabledLayer == "p") {
      Send í
    } else if (enabledLayer == "q") {
      Send Í
    } else {
      PassthroughKey("i")
    }
  }
}

;; Remap Sticky-J to Ctrl
JKey(isHold, taps, state){
  if (isHold){
    Send % "{Ctrl " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "x"){
      PassthroughKey("{Down}")
    } else if (enabledLayer == "w"){
    } else if (enabledLayer == "v"){
      Send {Volume_Mute}
    } else {
      PassthroughKey("j")
    }
  }
}

;; Remap Sticky-K to Alt
KKey(isHold, taps, state){
  if (isHold){
    Send % "{Alt " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "x"){
      PassthroughKey("{Up}")
    } else if (enabledLayer == "w"){
    } else if (enabledLayer == "v"){
      Send {Media_Play_Pause}
    } else {
      PassthroughKey("k")
    }
  }
}

;; Remap Sticky-L to Win
LKey(isHold, taps, state){
  if (isHold){
    Send % "{RWin " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "x"){
      PassthroughKey("{Right}")
    } else if (enabledLayer == "w"){
      RunOrActivateTitle("C:\Users\Nick\AppData\Local\slack\slack.exe", "Slack")
    } else if (enabledLayer == "v"){
      Send {Media_Next}
    } else if (enabledLayer == "b"){
      Send #{Right}
    } else {
      PassthroughKey("l")
    }
  }
}

MKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "v") {
      Send {Volume_Up}
    } else if (enabledLayer == "b") {
      Send #{Up}
  } else if (enabledLayer == "c"){
      Send {
    } else if (enabledLayer == "x") {
      Send {Delete}
    } else {
      PassthroughKey("m")
    }
  }
}

NKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "v") {
      Send {Volume_Down}
    } else if (enabledLayer == "c"){
      Send `}
    } else if (enabledLayer == "p"){
      Send ñ
    } else if (enabledLayer == "q"){
      Send Ñ
    } else if (enabledLayer == "w") {
      RunOrActivateTitle("C:\Users\Nick\AppData\Local\Programs\Notion\Notion.exe", "ahk_exe Notion.exe")
    } else if (enabledLayer == "x") {
      Send {BackSpace}
    } else {
      PassthroughKey("n")
    }
  }
}

OKey(isHold, taps, state){
  BindKey("o", isHold, state)
  if (!isHold){
    if (enabledLayer == "p") {
      Send ó
    } else if (enabledLayer == "q") {
      Send Ó
    } else {
      PassthroughKey("o")
    }
  }
}

;; accent layer
PKey(isHold, taps, state){
  BindKey("p", isHold, state)
  if (!isHold){
    if (enabledLayer == "c"){
    } else {
      PassthroughKey("p")
    }
  }
}

;; caps accent layer
QKey(isHold, taps, state){
  BindKey("q", isHold, state)
  if (!isHold){
    if (enabledLayer == "c"){
      Send % "'"
    } else {
      PassthroughKey("q")
    }
  }
}

RKey(isHold, taps, state){
  if (!isHold){
    if (enabledLayer == "c"){
      Send "
    } else if (enabledLayer == "x"){
      Send {End}
    } else {
      PassthroughKey("r")
    }
  }
}

;; Remap Sticky-S to Win
SKey(isHold, taps, state){
  if (isHold){
    Send % "{LWin " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "w"){
    } else if (enabledLayer == "v"){
      RunOrActivateTitle("C:\Users\Nick\AppData\Roaming\Spotify\Spotify.exe", "Spotify")
    } else {
      PassthroughKey("s")
    }
  }
}

TKey(isHold, taps, state){
  if (!isHold){
    if (enabledLayer == "w"){
      RunOrActivateTitle("C:\Users\Nick\AppData\Local\wsltty\bin\mintty.exe", "ahk_exe mintty.exe")
    } else {
      PassthroughKey("t")
    }
  }
}

UKey(isHold, taps, state){
  BindKey("u", isHold, state)
  if (!isHold){
    if (enabledLayer == "p") {
      Send ú
    } else if (enabledLayer == "q") {
      Send Ú
    } else {
      PassthroughKey("u")
    }
  }
}
;; Media keys
VKey(isHold, taps, state){
  BindKey("v", isHold, state)
  if (!isHold) {
    if (enabledLayer == "w"){
      RunOrActivateTitle("C:\Users\Nick\AppData\Local\Programs\Microsoft VS Code\Code.exe", "Visual Studio Code")
    }
    PassthroughKey("v")
  }
}

;; App keys
WKey(isHold, taps, state){
  BindKey("w", isHold, state)
  if (!isHold) {
    if (enabledLayer == "c"){
      Send "
    } else {
      PassthroughKey("w")
    }
  }
}

;; Vim keys
XKey(isHold, taps, state){
  BindKey("x", isHold, state)
  if (!isHold) {
    PassthroughKey("x")
  }
}

;; Remap Sticky-; to Shift
SemicolonKey(isHold, taps, state){
  if (isHold){
    Send % "{Shift " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "x"){
      Send {Enter}
    } else {
      PassthroughKey(";")
    }
  }
}

ColonKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
      Send ^{BackSpace}
    } else {
      PassthroughKey(",")
    }
  }
}

PeriodKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "x"){
      Send ^{Delete}
    } else {
      PassthroughKey(".")
    }
  }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;  H E L P E R S  ;;;;;;;;;;;;;;;;;;;;;;;;;;

BindKey(layerName, isHold, state){
  if (isHold and state){
    enabledLayer := layerName
  }
  if (isHold and !state) {
    enabledLayer := ""
  }
}

PassthroughKey(key){
  modifier := ""
  if (GetKeyState("Shift", "P")){
    modifier := modifier . "+"
  }
  if (GetKeyState("Ctrl", "P")){
    modifier := modifier . "^"
  }
  if (GetKeyState("Alt", "P")){
    modifier := modifier . "!"
  }
  if (GetKeyState("RWin", "P")){
    modifier := modifier . "`#"
  }
  Send % modifier . key
  modifier := ""
}

NoOpKey(key, isHold, taps, state){
  if (!isHold) {
    PassthroughKey(key)
  }
}
