module MaterialUI.CardHeader
  ( cardHeader', CardHeaderProps, CardHeaderPropsO, CardHeaderClasses
  ) where

import MaterialUI.Types (Styles)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)


foreign import cardHeaderImpl :: forall props. ReactClass props


type CardHeaderProps o =
  {
  | o }


type CardHeaderPropsO classes =
  ( avatar :: ReactElement
  , classes :: classes
  , subheader :: ReactElement
  , title :: ReactElement
  )

type CardHeaderClasses =
  ( root :: Styles
  , avatar :: Styles
  , content :: Styles
  )


cardHeader' :: forall o classes
         . Subrow o (CardHeaderPropsO { | classes })
        => Subrow classes CardHeaderClasses
        => CardHeaderProps o -> Array ReactElement -> ReactElement
cardHeader' = createElement cardHeaderImpl
