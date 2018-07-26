module MaterialUI.ListItemText
  ( listItemText, ListItemTextProps, ListItemTextPropsO, ListItemTextClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
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


listItemText :: forall o
         . Subrow o ListItemTextPropsO
        => ListItemTextProps o -> ReactElement
listItemText p = createElement listItemTextImpl p []
