#Include <TapHoldManager>

global enabledKey := ""
thm := new TapHoldManager(0, 250, 1, "$*")
thm.Add("A", Func("NoOpKey").Bind("a"))
thm.Add("B", Func("NoOpKey").Bind("b"))
thm.Add("C", Func("NoOpKey").Bind("c"))
thm.Add("D", Func("NoOpKey").Bind("d"))
thm.Add("E", Func("NoOpKey").Bind("e"))
thm.Add("F", Func("FKey"))
thm.Add("G", Func("NoOpKey").Bind("g"))
thm.Add("H", Func("NoOpKey").Bind("h"))
thm.Add("I", Func("NoOpKey").Bind("i"))
thm.Add("J", Func("NoOpKey").Bind("j"))
thm.Add("K", Func("NoOpKey").Bind("k"))
thm.Add("L", Func("NoOpKey").Bind("l"))
thm.Add("M", Func("MKey"))
thm.Add("N", Func("NKey"))
thm.Add("O", Func("NoOpKey").Bind("o"))
thm.Add("P", Func("NoOpKey").Bind("p"))
thm.Add("Q", Func("NoOpKey").Bind("q"))
thm.Add("R", Func("NoOpKey").Bind("r"))
thm.Add("S", Func("NoOpKey").Bind("s"))
thm.Add("T", Func("NoOpKey").Bind("t"))
thm.Add("U", Func("NoOpKey").Bind("u"))
thm.Add("V", Func("VKey"))
thm.Add("W", Func("NoOpKey").Bind("w"))
thm.Add("X", Func("NoOpKey").Bind("x"))
thm.Add("Y", Func("NoOpKey").Bind("y"))
thm.Add("Z", Func("NoOpKey").Bind("z"))
thm.Add("Space", Func("NoOpKey").Bind("{Space}"))

;; Remap Sticky-F to Ctrl
FKey(isHold, taps, state){
  if (isHold){
    Send % "{Ctrl " (state? "down" : "up") "}"
  } else {
    PassthroughKey("f")
  }
}

;; Media keys
VKey(isHold, taps, state){
  BindKey("media", isHold, state)
  if (!isHold) {
    PassthroughKey("v")
  }
}

NKey(isHold, taps, state){
  if (!isHold) {
    if (enabledKey == "media") {
      Send {Volume_Down}
    } else {
      PassthroughKey("n")
    }
  }
}

MKey(isHold, taps, state){
  if (!isHold) {
    if (enabledKey == "media") {
      Send {Volume_Up}
    } else {
      PassthroughKey("m")
    }
  }
}

BindKey(layerName, isHold, state){
  if (isHold and state){
    enabledKey := layerName
  }
  if (isHold and !state) {
    enabledKey := ""
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
  if (GetKeyState("Win", "P")){
    modifier := modifier . "#"
  }
  sent := modifier . key
  Send % modifier . key
}

NoOpKey(key, isHold, taps, state){
  if (!isHold) {
    PassthroughKey(key)
  }
}
