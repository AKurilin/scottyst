{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Data.Monoid
import qualified Data.Text.Lazy as T
import Data.Text.Read
import Control.Monad

main = scotty 3000 $ do
  get "/" $ do
    text "gotten!"
  get "/:num" $ do
    num <- (liftM decimal) (param "num")
    case num of
      Left error -> html $ mconcat ["<h1>error yo: ", T.pack error]
      Right (val, blah) -> html $ mconcat ["<h1>val + 1 == ", (T.pack . show) (val + 1), "</h1>"]
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
