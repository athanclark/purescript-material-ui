module MaterialUI.IconButton
  ( iconButton, IconButtonProps, IconButtonPropsO, IconButtonClasses
  , Color, inherit, primary, secondary, default
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes, class RemoveSymbol)
import MaterialUI.ButtonBase (ButtonBasePropsO)

import Prelude ((<<<))
import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Type.Row (type (+))
import Unsafe.Coerce (unsafeCoerce)


foreign import iconButtonImpl :: forall props. ReactClass props


type IconButtonProps o =
  {
  | o }


type IconButtonPropsO r =
  ( classes :: Classes
  , style :: Styles
  , color :: Color
  , disabled :: Boolean
  , disableRipple :: Boolean
  | r)

newtype Color = Color String

default :: Color
default = Color "default"

inherit :: Color
inherit = Color "inherit"

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"


type IconButtonClasses =
  ( root :: Styles
  , colorInherit :: Styles
  , colorPrimary :: Styles
  , colorSecondary :: Styles
  , disabled :: Styles
  , label :: Styles
  )

createClasses :: forall classes
               . SubRow classes IconButtonClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


iconButton :: forall o componentProps touchRippleProps buttonBaseProps
         . SubRow o (IconButtonPropsO + buttonBaseProps)
        => RemoveSymbol "classes" (ButtonBasePropsO componentProps touchRippleProps) buttonBaseProps
        => IconButtonProps o -> ReactElement -> ReactElement
iconButton p = unsafeCreateElement iconButtonImpl p <<< unsafeCoerce
