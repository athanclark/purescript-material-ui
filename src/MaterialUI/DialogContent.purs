module MaterialUI.DialogContent
  ( dialogContent, DialogContentProps, DialogContentPropsO, DialogContentClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogContentImpl :: forall props. ReactClass props


type DialogContentProps o =
  {
  | o }


type DialogContentPropsO =
  ( classes :: Classes
  )

type DialogContentClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes DialogContentClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialogContent :: forall o
         . SubRow o DialogContentPropsO
        => DialogContentProps o -> Array ReactElement -> ReactElement
dialogContent = unsafeCreateElement dialogContentImpl
