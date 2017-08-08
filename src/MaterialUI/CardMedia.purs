module MaterialUI.CardMedia
  ( cardMedia', CardMediaProps, CardMediaPropsO, CardMediaClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import cardMediaImpl :: forall props. ReactClass props


type CardMediaProps o =
  {
  | o }


type CardMediaPropsO classes =
  ( classes :: classes
  )

type CardMediaClasses =
  ( root :: Styles
  )


cardMedia' :: forall o classes
         . Subrow o (CardMediaPropsO { | classes })
        => Subrow classes CardMediaClasses
        => CardMediaProps o -> Array ReactElement -> ReactElement
cardMedia' = createElement cardMediaImpl
