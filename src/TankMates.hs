{-# LANGUAGE OverloadedStrings #-}

module TankMates (
  routes
) where

import Data.Text

import Web.Scotty
import Web.Scotty.Trans (ScottyT)

routes :: ScottyM ()
routes = do
  -- health
  get "/api/health" $
    json True
