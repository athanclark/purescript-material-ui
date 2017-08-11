module MaterialUI.List
  ( list', ListProps, ListPropsO, ListClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import listImpl :: forall props. ReactClass props


type ListProps o =
  {
  | o }


type ListPropsO componentProps classes =
  ( children :: Array ReactElement
  , classes :: classes
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


list' :: forall o componentProps classes
         . Subrow o (ListPropsO componentProps { | classes })
        => Subrow classes ListClasses
        => ListProps o -> Array ReactElement -> ReactElement
list' = createElement listImpl
