module MaterialUI.Toolbar
  ( toolbar, ToolbarProps, ToolbarPropsO, ToolbarClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import toolbarImpl :: forall props. ReactClass props


type ToolbarProps o =
  {
  | o }


type ToolbarPropsO =
  ( disableGutters :: Boolean
  , classes :: Classes
  , children :: Array ReactElement
  , style :: Styles
  )

type ToolbarClasses =
  ( root :: Styles
  , gutters :: Styles
  )

createClasses :: forall classes
               . Subrow classes ToolbarClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


toolbar :: forall o
         . Subrow o ToolbarPropsO
        => ToolbarProps o -> Array ReactElement -> ReactElement
toolbar = createElement toolbarImpl
