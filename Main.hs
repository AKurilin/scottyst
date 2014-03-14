{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Data.Monoid

main = scotty 3000 $ do
  get "/" $ do
    text "gotten!"
  get "/:num" $ do
    num <- param "num"
    html $ mconcat ["<h1>Scotty, ", num, " me up!</h1>"]
  delete "/" $ do
    text "deleted!"
  post "/" $ do
    text "posted!"
  put "/" $ do
    text "put-ted!"
  matchAny "/all" $ do
    text "matches all methods"
  notFound $ do
    text "there is no such route."
