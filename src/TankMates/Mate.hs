{-# LANGUAGE DeriveGeneric #-}
module TankMates.Mate (
  Mate(..)
) where

import Data.Aeson (FromJSON, ToJSON)

import GHC.Generics

data Mate = Fish
          | Plant
          | Ambhibian
          | Invertebrate
  deriving (Eq, Generic, Show)

instance FromJSON Mate
instance ToJSON Mate

