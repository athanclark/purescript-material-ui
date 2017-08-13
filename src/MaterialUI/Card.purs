module MaterialUI.Card
  ( card, CardProps, CardPropsO, CardClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import cardImpl :: forall props. ReactClass props


type CardProps o =
  {
  | o }


type CardPropsO =
  ( raised :: Boolean
  , classes :: Classes
  )

type CardClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes CardClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


card :: forall o classes
         . Subrow o CardPropsO
        => CardProps o -> Array ReactElement -> ReactElement
card = createElement cardImpl
