module MaterialUI.CardActions
  ( cardActions, CardActionsProps, CardActionsPropsO, CardActionsClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)


foreign import cardActionsImpl :: forall props. ReactClass props


type CardActionsProps o =
  {
  | o }


type CardActionsPropsO =
  ( children :: Array ReactElement
  , classes :: Classes
  , disableActionSpacing :: Boolean
  )

type CardActionsClasses =
  ( root :: Styles
  , actionSpacing :: Styles
  )

createClasses :: forall classes
               . Subrow classes CardActionsClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardActions :: forall o
         . Subrow o CardActionsPropsO
        => CardActionsProps o -> Array ReactElement -> ReactElement
cardActions = createElement cardActionsImpl
