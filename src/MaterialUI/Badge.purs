module MaterialUI.Badge
  ( badge', BadgeProps, BadgePropsO, BadgeClasses
  , Color, primary, accent, default'
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import badgeImpl :: forall props. ReactClass props


type BadgeProps o =
  {
  | o }


type BadgePropsO classes =
  ( children :: ReactElement
  , badgeContent :: ReactElement
  , color :: Color
  , classes :: classes
  )

newtype Color = Color String

primary :: Color
primary = Color "primary"

accent :: Color
accent = Color "accent"

default' :: Color
default' = Color "default"


type BadgeClasses =
  ( root :: Styles
  , badge :: Styles
  , colorPrimary :: Styles
  , colorAccent :: Styles
  )


badge' :: forall o classes
         . Subrow o (BadgePropsO { | classes })
        => Subrow classes BadgeClasses
        => BadgeProps o -> Array ReactElement -> ReactElement
badge' = createElement badgeImpl
