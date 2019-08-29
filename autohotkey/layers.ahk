#Include <TapHoldManager>
#Include <RunOrActivate>

global enabledLayer := ""
thm := new TapHoldManager(0, 250, 1, "$*")
thm.Add("A", Func("AKey"))
thm.Add("B", Func("NoOpKey").Bind("b"))
thm.Add("C", Func("NoOpKey").Bind("c"))
thm.Add("D", Func("DKey"))
thm.Add("E", Func("EKey"))
thm.Add("F", Func("FKey"))
thm.Add("G", Func("NoOpKey").Bind("g"))
thm.Add("H", Func("NoOpKey").Bind("h"))
thm.Add("I", Func("NoOpKey").Bind("i"))
thm.Add("J", Func("JKey"))
thm.Add("K", Func("KKey"))
thm.Add("L", Func("LKey"))
thm.Add("M", Func("MKey"))
thm.Add("N", Func("NKey"))
thm.Add("O", Func("NoOpKey").Bind("o"))
thm.Add("P", Func("NoOpKey").Bind("p"))
thm.Add("Q", Func("NoOpKey").Bind("q"))
thm.Add("R", Func("NoOpKey").Bind("r"))
thm.Add("S", Func("SKey"))
thm.Add("T", Func("NoOpKey").Bind("t"))
thm.Add("U", Func("NoOpKey").Bind("u"))
thm.Add("V", Func("VKey"))
thm.Add("W", Func("WKey"))
thm.Add("X", Func("NoOpKey").Bind("x"))
thm.Add("Y", Func("NoOpKey").Bind("y"))
thm.Add("Z", Func("NoOpKey").Bind("z"))
thm.Add("Space", Func("NoOpKey").Bind("{Space}"))
thm.Add(".", Func("NoOpKey").Bind("."))
thm.Add(",", Func("NoOpKey").Bind(","))
thm.Add(";", Func("SemicolonKey"))

;; Remap Sticky-F to Ctrl
FKey(isHold, taps, state){
  if (isHold){
    Send % "{Ctrl " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "app"){
      RunOrActivate("C:\Program Files\Mozilla Firefox\firefox.exe", "MozillaWindowClass")
    } else {
      PassthroughKey("f")
    }
  }
}

;; Remap Sticky-J to Ctrl
JKey(isHold, taps, state){
  if (isHold){
    Send % "{Ctrl " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "app"){
    } else {
      PassthroughKey("j")
    }
  }
}

;; Remap Sticky-D to Alt
DKey(isHold, taps, state){
  if (isHold){
    Send % "{Alt " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "app"){
    } else {
      PassthroughKey("d")
    }
  }
}

;; Remap Sticky-K to Alt
KKey(isHold, taps, state){
  if (isHold){
    Send % "{Alt " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "app"){
    } else {
      PassthroughKey("k")
    }
  }
}

;; Remap Sticky-S to Win
SKey(isHold, taps, state){
  if (isHold){
    Send % "{LWin " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "app"){
    } else {
      PassthroughKey("s")
    }
  }
}

;; Remap Sticky-L to Win
LKey(isHold, taps, state){
  if (isHold){
    Send % "{RWin " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "app"){
      RunOrActivateTitle("C:\Users\Nick\AppData\Local\slack\slack.exe", "Slack")
    } else {
      PassthroughKey("l")
    }
  }
}

;; Remap Sticky-A to Shift
AKey(isHold, taps, state){
  if (isHold){
    Send % "{Shift " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "app"){
    } else {
      PassthroughKey("a")
    }
  }
}

;; Remap Sticky-; to Shift
SemicolonKey(isHold, taps, state){
  if (isHold){
    Send % "{Shift " (state? "down" : "up") "}"
  } else {
    if (enabledLayer == "app"){
    } else {
      PassthroughKey(";")
    }
  }
}

;; Media keys
VKey(isHold, taps, state){
  BindKey("media", isHold, state)
  if (!isHold) {
    if (enabledLayer == "app"){
      RunOrActivateTitle("C:\Users\Nick\AppData\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe", "Visual Studio Code")
    }
    PassthroughKey("v")
  }
}

;; App keys
WKey(isHold, taps, state){
  BindKey("app", isHold, state)
  if (!isHold) {
    PassthroughKey("w")
  }
}

EKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "app"){
      Run "explorer.exe"
    } else {
      PassthroughKey("e")
    }
  }
}

NKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "media") {
      Send {Volume_Down}
    } else {
      PassthroughKey("n")
    }
  }
}

MKey(isHold, taps, state){
  if (!isHold) {
    if (enabledLayer == "media") {
      Send {Volume_Up}
    } else {
      PassthroughKey("m")
    }
  }
}

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
