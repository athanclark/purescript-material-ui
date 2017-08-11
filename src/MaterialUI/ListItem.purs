module MaterialUI.ListItem
  ( listItem', ListItemProps, ListItemPropsO, ListItemClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import listItemImpl :: forall props. ReactClass props


type ListItemProps o =
  {
  | o }


type ListItemPropsO componentProps classes =
  ( button :: Boolean
  , children :: Array ReactElement
  , classes :: classes
  , component :: ReactClass componentProps
  , dense :: Boolean
  , disableGutters :: Boolean
  , divider :: Boolean
  )

type ListItemClasses =
  ( root :: Styles
  , container :: Styles
  , keyboardFocused :: Styles
  , "default" :: Styles
  , dense :: Styles
  , disabled :: Styles
  , divider :: Styles
  , gutters :: Styles
  , button :: Styles
  )


listItem' :: forall o componentProps classes
         . Subrow o (ListItemPropsO componentProps { | classes })
        => Subrow classes ListItemClasses
        => ListItemProps o -> Array ReactElement -> ReactElement
listItem' = createElement listItemImpl
