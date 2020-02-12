{-# LANGUAGE OverloadedStrings #-}
module Main where

import Layering

main :: IO ()
main = render
  []
  [ Layer {
    key = W,
    onHold = none,
    description = "General apps",
    rules = [
      (V, "")
    ]
  }
  ]

activate :: String -> String -> String
activate path title =
  "RunOrActivateTitle(\"" <> path <> ", " <>
