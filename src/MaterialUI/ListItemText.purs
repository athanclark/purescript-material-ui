module MaterialUI.ListItemText
  ( listItemText', ListItemTextProps, ListItemTextPropsO, ListItemTextClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import listItemTextImpl :: forall props. ReactClass props


type ListItemTextProps o =
  {
  | o }


type ListItemTextPropsO classes =
  ( disableTypography :: Boolean
  , classes :: classes
  , inset :: Boolean
  , primary :: String
  , secondary :: String
  )

type ListItemTextClasses =
  ( root :: Styles
  , inset :: Styles
  , dense :: Styles
  , text :: Styles
  , textDense :: Styles
  )


listItemText' :: forall o classes
         . Subrow o (ListItemTextPropsO { | classes })
        => Subrow classes ListItemTextClasses
        => ListItemTextProps o -> Array ReactElement -> ReactElement
listItemText' = createElement listItemTextImpl
