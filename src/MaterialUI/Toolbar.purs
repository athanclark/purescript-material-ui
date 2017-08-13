module MaterialUI.Toolbar
  ( toolbar, ToolbarProps, ToolbarPropsO, ToolbarClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import toolbarImpl :: forall props. ReactClass props


type ToolbarProps o =
  {
  | o }


type ToolbarPropsO =
  ( disableGutters :: Boolean
  , classes :: Classes
  , children :: Array ReactElement
  )

type ToolbarClasses =
  ( root :: Styles
  , gutters :: Styles
  )

createClasses :: forall classes
               . Subrow classes ToolbarClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


toolbar :: forall o classes
         . Subrow o ToolbarPropsO
        => ToolbarProps o -> Array ReactElement -> ReactElement
toolbar = createElement toolbarImpl
