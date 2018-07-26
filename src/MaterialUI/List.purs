module MaterialUI.List
  ( list, ListProps, ListPropsO, ListClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import listImpl :: forall props. ReactClass props


type ListProps o =
  {
  | o }


type ListPropsO componentProps =
  ( children :: Array ReactElement
  , classes :: Classes
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
               . Subrow classes ListClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


list :: forall o componentProps
         . Subrow o (ListPropsO componentProps)
        => ListProps o -> Array ReactElement -> ReactElement
list = createElement listImpl
