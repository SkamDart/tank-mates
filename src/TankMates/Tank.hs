{-# LANGUAGE DeriveGeneric #-}
module TankMates.Tank ( Tank(..)
                      ) where

import Data.Text as T

import GHC.Generics

import TankMates.Mate
import TankMates.User

import Web.Scotty

data Tank = Tank { tankUsername :: Username
                 , tankMates :: [Mate]
                 , tankId :: Maybe Text
                 } deriving (Eq, Generic, Show)

