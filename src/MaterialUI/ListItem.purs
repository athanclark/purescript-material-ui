module MaterialUI.ListItem
  ( listItem, ListItemProps, ListItemPropsO, ListItemClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (ReactClass, unsafeCreateElement, ReactElement)
import React.SyntheticEvent (SyntheticEvent)
import Row.Class (class SubRow)
import Effect.Uncurried (EffectFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import listItemImpl :: forall props. ReactClass props


type ListItemProps o =
  {
  | o }


type ListItemPropsO eff componentProps =
  ( button :: Boolean
  , classes :: Classes
  , style :: Styles
  , onClick :: EffectFn1 SyntheticEvent Unit
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
               . SubRow classes ListItemClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


listItem :: forall o eff componentProps
         . SubRow o (ListItemPropsO eff componentProps)
        => ListItemProps o -> Array ReactElement -> ReactElement
listItem = unsafeCreateElement listItemImpl
