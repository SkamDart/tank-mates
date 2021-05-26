{-# LANGUAGE OverloadedStrings #-}

import Data.Monoid (mconcat)

import Web.Scotty

main :: IO ()
main = do
  scotty 3000 $ do
    get "/:name" $ do
      name <- param "name"
      html $ mconcat ["<h1> Hello ", name, " bones jones</h1>"]

