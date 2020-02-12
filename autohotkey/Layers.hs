module Main where

import Data.String.Interpolate (i)
import Layering

main :: IO ()
main =
  render
    []
    [ Layer
        { key = W,
          onHold = none,
          description = "General apps",
          rules =
            [ (V, activate "C:\\Program Files\\Microsoft VS Code\\Code.exe" "Visual Studio Code")
            ]
        }
    ]

activate :: String -> String -> RuleAction
activate path title = RuleAction [i|RunOrActivateTitle("#{path}", "#{title}")|]
