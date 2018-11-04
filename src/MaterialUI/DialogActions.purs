module MaterialUI.DialogActions
  ( dialogActions, DialogActionsProps, DialogActionsPropsO, DialogActionsClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogActionsImpl :: forall props. ReactClass props


type DialogActionsProps o =
  {
  | o }


type DialogActionsPropsO =
  ( classes :: Classes
  )

type DialogActionsClasses =
  ( root :: Styles
  , action :: Styles
  , button :: Styles
  )

createClasses :: forall classes
               . SubRow classes DialogActionsClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialogActions :: forall o
         . SubRow o DialogActionsPropsO
        => DialogActionsProps o -> Array ReactElement -> ReactElement
dialogActions = unsafeCreateElement dialogActionsImpl
