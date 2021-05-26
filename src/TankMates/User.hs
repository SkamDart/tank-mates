{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module TankMates.User (
  Email
, Password
, Token
, Username
, Auth(..)
, Register(..)
, UpdateUser(..)
, User(..)
, Profile(..)
) where

import GHC.Generics
import Data.Text
import Data.Time (UTCTime)

type Email = Text
type Password = Text
type Token = Text
type Username = Text

data Auth = Auth
  { authEmail :: Email
  , authPassword :: Password
  } deriving (Generic, Eq, Show)

data Register = Register
  { registerUsername :: Username
  , registerEmail :: Email
  , registerPassword :: Text
  } deriving (Generic, Show)

data UpdateUser = UpdateUser
  { updateUserEmail :: Maybe Email
  , updateUserUsername :: Maybe Username
  , updateUserPassword :: Maybe Password
  , updateUserImage :: Maybe Text
  , updateUserBio :: Maybe Text
  } deriving (Generic, Eq, Show)

data User = User
  { userEmail :: Email
  , userToken :: Token
  , userUsername :: Username
  , userBio :: Text
  , userImage :: Text
  } deriving (Generic, Eq, Show)

data Profile = Profile
  { profileUsername :: Username
  , profileBio :: Text
  , profileImage :: Text
  , profileFollowing :: Bool
  } deriving (Generic, Eq, Show)

data UserError
  = UserErrorBadAuth Auth
  | UserErrorNotFound Username
  | UserErrorNameTaken Username
  | UserErrorEmailTaken Email
  deriving (Eq, Show)
