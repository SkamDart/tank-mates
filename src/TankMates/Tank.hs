{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module TankMates.Tank ( Tank(..)
                      , routes
                      ) where

import Control.Monad.IO.Class (liftIO)

import Data.Aeson (FromJSON, ToJSON, fromJSON, toJSON)

import Data.Text as T

import GHC.Generics

import Network.HTTP.Types.Status

import TankMates.Mate
import TankMates.User

import Web.Scotty
import Web.Scotty.Trans (ActionT, ScottyError)

data Tank = Tank { tankName :: Text
                 , tankMates :: [Mate]
                 , tankId :: Maybe Text
                 } deriving (Eq, Generic, Show)

instance ToJSON Tank
instance FromJSON Tank

data TankRequest = TankRequest { tankRequestTankId :: Text
                               , tankRequestMateName :: Text
                               , tankRequestSpecies :: Text
                               , tankRequestReminder :: Bool
                               } deriving (Eq, Generic, Show)

instance ToJSON TankRequest
instance FromJSON TankRequest

fetchTank :: T.Text -> IO [Mate]
-- fetchTank tid = undefined
fetchTank _ = do
  pure [Fish]

postTank :: TankRequest -> IO Bool
postTank tr = do
  putStrLn ("Posted " ++ show tr)
  pure True

routes :: ScottyM ()
routes = do
  post "/api/tank" $ do
    -- TODO
    -- tr :: TankRequest <- jsonData `rescue` text 
    tr :: TankRequest <- jsonData
    d <- liftIO $ postTank tr
    json $ T.pack "success"

  get "/api/tank/:id" $ do
    tid <- param "id"
    mates <- liftIO $ fetchTank tid
    json mates

