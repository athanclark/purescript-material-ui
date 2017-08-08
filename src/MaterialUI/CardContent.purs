module MaterialUI.CardContent
  ( cardContent', CardContentProps, CardContentPropsO, CardContentClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import cardContentImpl :: forall props. ReactClass props


type CardContentProps o =
  {
  | o }


type CardContentPropsO classes =
  ( classes :: classes
  )

type CardContentClasses =
  ( root :: Styles
  )


cardContent' :: forall o classes
         . Subrow o (CardContentPropsO { | classes })
        => Subrow classes CardContentClasses
        => CardContentProps o -> Array ReactElement -> ReactElement
cardContent' = createElement cardContentImpl
