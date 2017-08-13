module MaterialUI.ListItem
  ( listItem, ListItemProps, ListItemPropsO, ListItemClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import listItemImpl :: forall props. ReactClass props


type ListItemProps o =
  {
  | o }


type ListItemPropsO componentProps =
  ( button :: Boolean
  , children :: Array ReactElement
  , classes :: Classes
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

createClasses :: forall classes
               . Subrow classes ListItemClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


listItem :: forall o componentProps
         . Subrow o (ListItemPropsO componentProps)
        => ListItemProps o -> Array ReactElement -> ReactElement
listItem = createElement listItemImpl
