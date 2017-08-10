module MaterialUI.IconButton
  ( iconButton', IconButtonProps, IconButtonPropsO, IconButtonClasses
  , Color, inherit, primary, accent, default', contrast
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import iconButtonImpl :: forall props. ReactClass props


type IconButtonProps o =
  {
  | o }


type IconButtonPropsO eff classes =
  ( children :: Array ReactElement
  , classes :: classes
  , color :: Color
  , disableRipple :: Boolean
  , disabled :: Boolean
  -- , rootRef FIXME
  , onTouchTap :: EffFn1 (props :: ReactProps, refs :: ReactRefs ReadOnly, state :: ReactState ReadWrite | eff) Event Unit
  )

newtype Color = Color String

default' :: Color
default' = Color "default"

inherit :: Color
inherit = Color "inherit"

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"

contrast :: Color
contrast = Color "contrast"


type IconButtonClasses =
  ( root :: Styles
  , disabled :: Styles
  , colorAccent :: Styles
  , colorContrast :: Styles
  , colorPrimary :: Styles
  , colorInherit :: Styles
  , label :: Styles
  , icon :: Styles
  , keyboardFocused :: Styles
  )


iconButton' :: forall o eff classes
         . Subrow o (IconButtonPropsO eff { | classes })
        => Subrow classes IconButtonClasses
        => IconButtonProps o -> Array ReactElement -> ReactElement
iconButton' = createElement iconButtonImpl
