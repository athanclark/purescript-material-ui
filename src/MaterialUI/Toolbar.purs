module MaterialUI.Toolbar
  ( toolbar', ToolbarProps, ToolbarPropsO, ToolbarClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import toolbarImpl :: forall props. ReactClass props


type ToolbarProps o =
  {
  | o }


type ToolbarPropsO classes =
  ( disableGutters :: Boolean
  , classes :: classes
  , children :: Array ReactElement
  )

type ToolbarClasses =
  ( root :: Styles
  , gutters :: Styles
  )


toolbar' :: forall o classes
         . Subrow o (ToolbarPropsO { | classes })
        => Subrow classes ToolbarClasses
        => ToolbarProps o -> Array ReactElement -> ReactElement
toolbar' = createElement toolbarImpl
