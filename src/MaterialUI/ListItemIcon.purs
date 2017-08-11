module MaterialUI.ListItemIcon
  ( listItemIcon', ListItemIconProps, ListItemIconPropsO, ListItemIconClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import listItemIconImpl :: forall props. ReactClass props


type ListItemIconProps o =
  {
  | o }


type ListItemIconPropsO classes =
  ( children :: Array ReactElement
  , classes :: classes
  )

type ListItemIconClasses =
  ( root :: Styles
  )


listItemIcon' :: forall o classes
         . Subrow o (ListItemIconPropsO { | classes })
        => Subrow classes ListItemIconClasses
        => ListItemIconProps o -> Array ReactElement -> ReactElement
listItemIcon' = createElement listItemIconImpl
