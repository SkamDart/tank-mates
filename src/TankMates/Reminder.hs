{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module TankMates.Reminder (
  Reminder(..)
) where

import Data.Aeson (FromJSON, ToJSON)

import Data.Time (UTCTime)

import qualified Data.Text as T

import GHC.Generics

data Frequency = Never 
               | Daily
               | Weekly
               | Monthly
               deriving (Eq, Generic, Show)

instance ToJSON Frequency
instance FromJSON Frequency

data Reminder = Reminder { reminderFrequency :: Frequency
                         , reminderStartDate :: UTCTime 
                         , reminderEndDate :: Maybe UTCTime
                         , reminderName :: T.Text
                         }
                deriving (Eq, Generic, Show)

instance ToJSON Reminder
instance FromJSON Reminder
