module MaterialUI.CardActions
  ( cardActions, CardActionsProps, CardActionsPropsO, CardActionsClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
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


cardActions :: forall o classes
         . Subrow o CardActionsPropsO
        => CardActionsProps o -> Array ReactElement -> ReactElement
cardActions = createElement cardActionsImpl
