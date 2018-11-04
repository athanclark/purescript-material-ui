module MaterialUI.Toolbar
  ( toolbar, ToolbarProps, ToolbarPropsO, ToolbarClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import toolbarImpl :: forall props. ReactClass props


type ToolbarProps o =
  {
  | o }


type ToolbarPropsO =
  ( disableGutters :: Boolean
  , classes :: Classes
  , style :: Styles
  )

type ToolbarClasses =
  ( root :: Styles
  , gutters :: Styles
  )

createClasses :: forall classes
               . SubRow classes ToolbarClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


toolbar :: forall o
         . SubRow o ToolbarPropsO
        => ToolbarProps o -> Array ReactElement -> ReactElement
toolbar = unsafeCreateElement toolbarImpl
