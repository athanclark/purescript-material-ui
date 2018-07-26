module MaterialUI.DialogContent
  ( dialogContent, DialogContentProps, DialogContentPropsO, DialogContentClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogContentImpl :: forall props. ReactClass props


type DialogContentProps o =
  {
  | o }


type DialogContentPropsO =
  ( children :: Array ReactElement
  , classes :: Classes
  , style :: Styles
  )

type DialogContentClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes DialogContentClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialogContent :: forall o
         . Subrow o DialogContentPropsO
        => DialogContentProps o -> Array ReactElement -> ReactElement
dialogContent = createElement dialogContentImpl
