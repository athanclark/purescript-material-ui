module MaterialUI.Badge
  ( badge, BadgeProps, BadgePropsO, BadgeClasses
  , Color, primary, secondary, default, error
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import badgeImpl :: forall props. ReactClass props


type BadgeProps o =
  { badgeContent :: ReactElement
  | o }


type BadgePropsO componentProps =
  ( color :: Color
  , classes :: Classes
  , component :: ReactClass componentProps
  )

newtype Color = Color String

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"

default :: Color
default = Color "default"

error :: Color
error = Color "error"


type BadgeClasses =
  ( root :: Styles
  , badge :: Styles
  , colorPrimary :: Styles
  , colorSecondary :: Styles
  , colorError :: Styles
  )

createClasses :: forall classes
               . SubRow classes BadgeClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


badge :: forall o componentProps
         . SubRow o (BadgePropsO componentProps)
        => BadgeProps o -> Array ReactElement -> ReactElement
badge = unsafeCreateElement badgeImpl
