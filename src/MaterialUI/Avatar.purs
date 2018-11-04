module MaterialUI.Avatar
  ( avatar, AvatarProps, AvatarPropsO, AvatarClasses, createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import avatarImpl :: forall props. ReactClass props


type AvatarProps o =
  {
  | o }


type AvatarPropsO componentProps =
  ( alt :: String
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
               . SubRow classes AvatarClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


avatar :: forall o componentProps
         . SubRow o (AvatarPropsO componentProps)
        => AvatarProps o -> Array ReactElement -> ReactElement
avatar = unsafeCreateElement avatarImpl
