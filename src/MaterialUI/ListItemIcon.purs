module MaterialUI.ListItemIcon
  ( listItemIcon, ListItemIconProps, ListItemIconPropsO, ListItemIconClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import listItemIconImpl :: forall props. ReactClass props


type ListItemIconProps o =
  {
  | o }


type ListItemIconPropsO =
  ( classes :: Classes
  )

type ListItemIconClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes ListItemIconClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


listItemIcon :: forall o
         . SubRow o ListItemIconPropsO
        => ListItemIconProps o -> ReactElement -> ReactElement
listItemIcon p = unsafeCreateElement listItemIconImpl p <<< unsafeCoerce
