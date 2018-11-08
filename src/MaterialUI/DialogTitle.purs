module MaterialUI.DialogTitle
  ( dialogTitle, DialogTitleProps, DialogTitlePropsO, DialogTitleClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogTitleImpl :: forall props. ReactClass props


type DialogTitleProps o =
  {
  | o }


type DialogTitlePropsO =
  ( classes :: Classes
  , disableTypography :: Boolean -- ^ Default: `false`
  )

type DialogTitleClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes DialogTitleClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialogTitle :: forall o
         . SubRow o DialogTitlePropsO
        => DialogTitleProps o -> Array ReactElement -> ReactElement
dialogTitle = unsafeCreateElement dialogTitleImpl
