module MaterialUI.Button
  ( button', ButtonProps, ButtonPropsO, ButtonClasses
  , Color, primary, accent, default', inherit, contrast
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import buttonImpl :: forall props. ReactClass props


type ButtonProps o =
  {
  | o }


type ButtonPropsO componentProps classes =
  ( children :: ReactElement
  , classes :: classes
  , color :: Color
  , component :: ReactClass componentProps
  , dense :: Boolean
  , disableFocusRipple :: Boolean
  , disableRipple :: Boolean
  , disabled :: Boolean
  , fab :: Boolean
  , href :: String
  , raised :: Boolean
  )

newtype Color = Color String

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"

default' :: Color
default' = Color "default"

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


button' :: forall o classes componentProps
         . Subrow o (ButtonPropsO componentProps { | classes })
        => Subrow classes ButtonClasses
        => ButtonProps o -> Array ReactElement -> ReactElement
button' = createElement buttonImpl
