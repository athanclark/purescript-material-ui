module MaterialUI.Card
  ( card', CardProps, CardPropsO, CardClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import cardImpl :: forall props. ReactClass props


type CardProps o =
  {
  | o }


type CardPropsO classes =
  ( raised :: Boolean
  , classes :: classes
  )

type CardClasses =
  ( root :: Styles
  )


card' :: forall o classes
         . Subrow o (CardPropsO { | classes })
        => Subrow classes CardClasses
        => CardProps o -> Array ReactElement -> ReactElement
card' = createElement cardImpl
