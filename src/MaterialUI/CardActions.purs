module MaterialUI.CardActions
  ( cardActions, CardActionsProps, CardActionsPropsO, CardActionsClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import cardActionsImpl :: forall props. ReactClass props


type CardActionsProps o =
  {
  | o }


type CardActionsPropsO =
  ( classes :: Classes
  , disableActionSpacing :: Boolean
  )

type CardActionsClasses =
  ( root :: Styles
  , actionSpacing :: Styles
  )

createClasses :: forall classes
               . SubRow classes CardActionsClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardActions :: forall o
         . SubRow o CardActionsPropsO
        => CardActionsProps o -> Array ReactElement -> ReactElement
cardActions = unsafeCreateElement cardActionsImpl
