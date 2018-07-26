module MaterialUI.Avatar
  ( avatar, AvatarProps, AvatarPropsO, AvatarClasses, createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import avatarImpl :: forall props. ReactClass props


type AvatarProps o =
  {
  | o }


type AvatarPropsO componentProps =
  ( children :: ReactElement
  , alt :: String
  , component :: ReactClass componentProps
  , imgProps :: Styles
  , sizes :: String
  , src :: String
  , srcSet :: String
  , classes :: Classes
  )


type AvatarClasses =
  ( root :: Styles
  , colorDefault :: Styles
  , img :: Styles
  )


createClasses :: forall classes
               . Subrow classes AvatarClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


avatar :: forall o componentProps
         . Subrow o (AvatarPropsO componentProps)
        => AvatarProps o -> Array ReactElement -> ReactElement
avatar = createElement avatarImpl
