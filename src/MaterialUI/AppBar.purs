module MaterialUI.AppBar
  ( appBar', AppBarProps, AppBarPropsO, AppBarClasses
  , Color, inherit, primary, accent, default'
  , Position, static, fixed, absolute
  ) where

import MaterialUI.Types (Styles)
import MaterialUI.Unsafe (unsafeApplyProps)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import appBarImpl :: forall props. ReactClass props


type AppBarProps o =
  {
  | o }


newtype Color = Color String

inherit :: Color
inherit = Color "inherit"

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"

default' :: Color
default' = Color "default"

newtype Position = Position String

static :: Position
static = Position "static"

fixed :: Position
fixed = Position "fixed"

absolute :: Position
absolute = Position "absolute"


type AppBarPropsO classes =
  ( children :: Array ReactElement
  , color :: Color
  , position :: Position
  , classes :: classes
  , web :: Styles
  )


type AppBarClasses =
  ( root :: Styles
  , positionFixed :: Styles
  , positionAbsolute :: Styles
  , positionStatic :: Styles
  , colorDefault :: Styles
  , colorPrimary :: Styles
  , colorAccent :: Styles
  )


appBar' :: forall o classes
                   . Subrow o (AppBarPropsO { | classes })
                  => Subrow classes AppBarClasses
                  => AppBarProps o -> Array ReactElement -> ReactElement
appBar' p = createElement appBarImpl (unsafeApplyProps p)
