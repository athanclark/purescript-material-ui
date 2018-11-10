module MaterialUI.Icon
  ( icon, IconProps, IconPropsO, IconClasses
  , Color, inheritColor, primary, secondary, action, error, disabled
  , FontSize, inheritFontSize, default, small, large
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import iconImpl :: forall props. ReactClass props


type IconProps o =
  {
  | o }

newtype Color = Color String

inheritColor :: Color
inheritColor = Color "inherit"

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"

action :: Color
action = Color "action"

error :: Color
error = Color "error"

disabled :: Color
disabled = Color "disabled"

newtype FontSize = FontSize String

inheritFontSize :: FontSize
inheritFontSize = FontSize "inherit"

default :: FontSize
default = FontSize "primary"

small :: FontSize
small = FontSize "small"

large :: FontSize
large = FontSize "large"

type IconPropsO componentProps =
  ( classes :: Classes
  , color :: Color -- ^ Default: `inherit`
  , component :: ReactClass componentProps -- ^ Default: `span`
  , fontSize :: FontSize -- ^ Default: `default`
  )

type IconClasses =
  ( root :: Styles
  , colorPrimary :: Styles
  , colorSecondary :: Styles
  , colorAction :: Styles
  , colorError :: Styles
  , colorDisabled :: Styles
  , fontSizeInherit :: Styles
  , fontSizeSmall :: Styles
  , fontSizeLarge :: Styles
  )

createClasses :: forall classes
               . SubRow classes IconClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


icon :: forall o componentProps
      . SubRow o (IconPropsO componentProps)
     => IconProps o -> Array ReactElement -> ReactElement
icon = unsafeCreateElement iconImpl
