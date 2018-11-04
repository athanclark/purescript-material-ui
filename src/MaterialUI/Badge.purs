module MaterialUI.Badge
  ( badge, BadgeProps, BadgePropsO, BadgeClasses
  , Color, primary, accent, default
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import badgeImpl :: forall props. ReactClass props


type BadgeProps o =
  {
  | o }


type BadgePropsO =
  ( badgeContent :: ReactElement
  , color :: Color
  , classes :: Classes
  )

newtype Color = Color String

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"

default :: Color
default = Color "default"


type BadgeClasses =
  ( root :: Styles
  , badge :: Styles
  , colorPrimary :: Styles
  , colorAccent :: Styles
  )

createClasses :: forall classes
               . SubRow classes BadgeClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


badge :: forall o
         . SubRow o BadgePropsO
        => BadgeProps o -> Array ReactElement -> ReactElement
badge = unsafeCreateElement badgeImpl
