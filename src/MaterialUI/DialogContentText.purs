module MaterialUI.DialogContentText
  ( dialogContentText, DialogContentTextProps, DialogContentTextPropsO, DialogContentTextClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogContentTextImpl :: forall props. ReactClass props


type DialogContentTextProps o =
  {
  | o }


type DialogContentTextPropsO =
  ( classes :: Classes
  )

type DialogContentTextClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes DialogContentTextClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialogContentText :: forall o
         . SubRow o DialogContentTextPropsO
        => DialogContentTextProps o -> Array ReactElement -> ReactElement
dialogContentText = unsafeCreateElement dialogContentTextImpl
