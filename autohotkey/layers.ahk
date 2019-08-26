#Include <TapHoldManager>

thm := new TapHoldManager(0, 150, 1, "$*")
thm.Add("F", Func("StickyF"))

;; TODO: FIX DELAY
;; Remap Sticky-F to Ctrl
StickyF(isHold, taps, state){
  if (isHold){
    Send % "{Ctrl" (state? "down" : "up") "}"
  } else {
    Send f
  }
}
