module MaterialUI.Button
  ( button, ButtonProps, ButtonPropsO, ButtonClasses
  , Color, primary, accent, default, inherit, contrast
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
  , dense :: Boolean
  , disableFocusRipple :: Boolean
  , disableRipple :: Boolean
  , disabled :: Boolean
  , fab :: Boolean
  , href :: String
  , raised :: Boolean
  , onClick    :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , onTouchTap :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  , mini :: Boolean
  )

newtype Color = Color String

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"

default :: Color
default = Color "default"

inherit :: Color
inherit = Color "inherit"

contrast :: Color
contrast = Color "contrast"


type ButtonClasses =
  ( root :: Styles
  , dense :: Styles
  , label :: Styles
  , flatPrimary :: Styles
  , flatAccent :: Styles
  , flatContrast :: Styles
  , colorInherit :: Styles
  , raised :: Styles
  , keyboardFocused :: Styles
  , raisedPrimary :: Styles
  , raisedAccent :: Styles
  , raisedContrast :: Styles
  , disabled :: Styles
  , fab :: Styles
  )

createClasses :: forall classes
               . Subrow classes ButtonClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


button :: forall o eff componentProps
         . Subrow o (ButtonPropsO eff componentProps)
        => ButtonProps o -> Array ReactElement -> ReactElement
button = createElement buttonImpl
