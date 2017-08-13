module MaterialUI.CardContent
  ( cardContent, CardContentProps, CardContentPropsO, CardContentClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import cardContentImpl :: forall props. ReactClass props


type CardContentProps o =
  {
  | o }


type CardContentPropsO =
  ( classes :: Classes
  )

type CardContentClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes CardContentClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardContent :: forall o classes
         . Subrow o CardContentPropsO
        => CardContentProps o -> Array ReactElement -> ReactElement
cardContent = createElement cardContentImpl
