module MaterialUI.CardActions
  ( cardActions', CardActionsProps, CardActionsPropsO, CardActionsClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import cardActionsImpl :: forall props. ReactClass props


type CardActionsProps o =
  {
  | o }


type CardActionsPropsO classes =
  ( children :: Array ReactElement
  , classes :: classes
  , disableActionSpacing :: Boolean
  )

type CardActionsClasses =
  ( root :: Styles
  , actionSpacing :: Styles
  )


cardActions' :: forall o classes
         . Subrow o (CardActionsPropsO { | classes })
        => Subrow classes CardActionsClasses
        => CardActionsProps o -> Array ReactElement -> ReactElement
cardActions' = createElement cardActionsImpl
