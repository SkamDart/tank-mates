{-# LANGUAGE OverloadedStrings #-}

import Data.Maybe (fromMaybe)

import Data.Monoid (mconcat)

import TankMates (routes)

import Text.Read

import System.Environment (lookupEnv)

import Web.Scotty
import Web.Scotty.Trans (scottyT)

main :: IO ()
main = do
  port <- findPort
  scotty port routes

findPort :: IO Int
findPort = do
  port <- fromMaybe "" <$> lookupEnv "TANK_MATES_PORT"
  return . fromMaybe 3000 $ readMaybe port 
