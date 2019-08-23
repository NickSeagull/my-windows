#Include <TapHoldManager>
#Include <JSON>

thm := new TapHoldManager(0, 150, -1, "$*")
thm.Add("F", Func("StickyF"))

;; TODO: FIX DELAY
;; Remap Sticky-F to Ctrl
StickyF(isHold, taps, state)
{
  if (isHold == 0) and (taps >= 1){
    Send f
  } else if (taps >= 1) and (state == 1){
    Send {Ctrl down}
  } else {
    Send {Ctrl up}
  }
}
