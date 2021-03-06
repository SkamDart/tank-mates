{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module TankMates (
  routes
) where

import Control.Monad.IO.Class (liftIO)

import Data.Aeson (FromJSON, ToJSON)

import Data.Text

import GHC.Generics

import Network.HTTP.Types.Status

import qualified TankMates.Tank as Tank
import TankMates.DB

import Web.Scotty
import Web.Scotty.Trans (ScottyT)

data ServerStatus = Starting
            | Stopping
            | Healthy
            deriving (Eq, Generic, Show)

instance ToJSON ServerStatus
instance FromJSON ServerStatus

routes :: DB -> ScottyM ()
routes db = do
  defaultHandler $ \str -> do
    status status500
    json str

  Tank.routes db

  -- health
  get "/health" $
    json Healthy
