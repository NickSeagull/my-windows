module Main where

import Layering
import Data.String.Interpolate (i)

main :: IO ()
main = render
  []
  [ Layer {
    key = W,
    onHold = none,
    description = "General apps",
    rules = [
      (V, activate "C:\\Program Files\\Microsoft VS Code\\Code.exe" "Visual Studio Code")
    ]
    }
  ]

activate :: String -> String -> String
activate path title = [i|RunOrActivateTitle("#{path}", "#{title}")|]
