module MaterialUI.ListItemIcon
  ( listItemIcon, ListItemIconProps, ListItemIconPropsO, ListItemIconClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import listItemIconImpl :: forall props. ReactClass props


type ListItemIconProps o =
  {
  | o }


type ListItemIconPropsO =
  ( children :: Array ReactElement
  , classes :: Classes
  )

type ListItemIconClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes ListItemIconClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


listItemIcon :: forall o
         . Subrow o ListItemIconPropsO
        => ListItemIconProps o -> ReactElement -> ReactElement
listItemIcon p = createElement listItemIconImpl p <<< unsafeCoerce
