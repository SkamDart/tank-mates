{-# LANGUAGE OverloadedStrings #-}
module TankMates.DB (
  lookupOrDefault
, DB
) where

import Database.PostgreSQL.Simple

import Data.Maybe

import System.Environment


newtype DB = DB { dbConn :: Connection }

lookupOrDefault :: IO DB
lookupOrDefault = do 
  conn <- connect defaultConnectInfo
  pure (DB conn)
