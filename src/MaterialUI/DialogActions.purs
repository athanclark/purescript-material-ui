module MaterialUI.DialogActions
  ( dialogActions, DialogActionsProps, DialogActionsPropsO, DialogActionsClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogActionsImpl :: forall props. ReactClass props


type DialogActionsProps o =
  {
  | o }


type DialogActionsPropsO =
  ( children :: Array ReactElement
  , classes :: Classes
  )

type DialogActionsClasses =
  ( root :: Styles
  , action :: Styles
  , button :: Styles
  )

createClasses :: forall classes
               . Subrow classes DialogActionsClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialogActions :: forall o
         . Subrow o DialogActionsPropsO
        => DialogActionsProps o -> Array ReactElement -> ReactElement
dialogActions = createElement dialogActionsImpl
