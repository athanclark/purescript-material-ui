module MaterialUI.List
  ( list, ListProps, ListPropsO, ListClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import listImpl :: forall props. ReactClass props


type ListProps o =
  {
  | o }


type ListPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  , dense :: Boolean
  , disablePadding :: Boolean
  -- , rootRef :: FIXME
  , subheader :: ReactElement
  )

type ListClasses =
  ( root :: Styles
  , padding :: Styles
  , dense :: Styles
  , subheader :: Styles
  )

createClasses :: forall classes
               . SubRow classes ListClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


list :: forall o componentProps
         . SubRow o (ListPropsO componentProps)
        => ListProps o -> Array ReactElement -> ReactElement
list = unsafeCreateElement listImpl
