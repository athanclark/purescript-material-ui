module MaterialUI.Button
  ( button, ButtonProps, ButtonPropsO, ButtonClasses
  , Color, primary, secondary, default, inherit, contrast
  , Size, small, medium, large, Variant, flat, raised, fab
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import buttonImpl :: forall props. ReactClass props


type ButtonProps o =
  {
  | o }


type ButtonPropsO eff componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
  , style :: Styles
  , color :: Color
  , component :: ReactClass componentProps
  , disableFocusRipple :: Boolean
  , disableRipple :: Boolean
  , disabled :: Boolean
  , href :: String
  , variant :: Variant
  , onClick    :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onTouchTap :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , mini :: Boolean
  , fullWidth :: Boolean
  , size :: Size
  )

newtype Color = Color String

primary :: Color
primary = Color "primary"

secondary :: Color
secondary = Color "secondary"

default :: Color
default = Color "default"

inherit :: Color
inherit = Color "inherit"

contrast :: Color
contrast = Color "contrast"


newtype Variant = Variant String

flat :: Variant
flat = Variant "flat"

raised :: Variant
raised = Variant "raised"

fab :: Variant
fab = Variant "fab"


newtype Size = Size String

small :: Size
small = Size "small"

medium :: Size
medium = Size "medium"

large :: Size
large = Size "large"


type ButtonClasses =
  ( root :: Styles
  , dense :: Styles
  , label :: Styles
  , flatPrimary :: Styles
  , flatSecondary :: Styles
  , flatContrast :: Styles
  , colorInherit :: Styles
  , raised :: Styles
  , keyboardFocused :: Styles
  , raisedPrimary :: Styles
  , raisedSecondary :: Styles
  , raisedContrast :: Styles
  , disabled :: Styles
  , fab :: Styles
  , mini :: Styles
  )

createClasses :: forall classes
               . Subrow classes ButtonClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


button :: forall o eff componentProps
         . Subrow o (ButtonPropsO eff componentProps)
        => ButtonProps o -> Array ReactElement -> ReactElement
button = createElement buttonImpl
