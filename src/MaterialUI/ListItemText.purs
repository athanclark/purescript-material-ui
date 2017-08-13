module MaterialUI.ListItemText
  ( listItemText, ListItemTextProps, ListItemTextPropsO, ListItemTextClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import listItemTextImpl :: forall props. ReactClass props


type ListItemTextProps o =
  {
  | o }


type ListItemTextPropsO =
  ( disableTypography :: Boolean
  , classes :: Classes
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

createClasses :: forall classes
               . Subrow classes ListItemTextClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


listItemText :: forall o classes
         . Subrow o ListItemTextPropsO
        => ListItemTextProps o -> ReactElement
listItemText p = createElement listItemTextImpl p []
