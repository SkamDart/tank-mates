{-# LANGUAGE DeriveGeneric #-}
module TankMates.Mate ( Mate
  ) where

import GHC.Generics

data Mate = Fish
  deriving (Eq, Generic, Show)
