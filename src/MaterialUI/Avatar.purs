module MaterialUI.Avatar
  ( avatar', AvatarProps, AvatarPropsO, AvatarClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import avatarImpl :: forall props. ReactClass props


type AvatarProps o =
  {
  | o }


type AvatarPropsO componentProps classes =
  ( children :: ReactElement
  , alt :: String
  , component :: ReactClass componentProps
  , imgProps :: Styles
  , sizes :: String
  , src :: String
  , srcSet :: String
  , classes :: classes
  )


type AvatarClasses =
  ( root :: Styles
  , colorDefault :: Styles
  , img :: Styles
  )


avatar' :: forall o classes componentProps
         . Subrow o (AvatarPropsO componentProps { | classes })
        => Subrow classes AvatarClasses
        => AvatarProps o -> ReactElement
avatar' props = createElement avatarImpl props []
