module MaterialUI.CardMedia
  ( cardMedia, CardMediaProps, CardMediaPropsO, CardMediaClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import cardMediaImpl :: forall props. ReactClass props


type CardMediaProps o =
  {
  | o }


type CardMediaPropsO =
  ( classes :: Classes
  )

type CardMediaClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes CardMediaClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardMedia :: forall o classes
         . Subrow o CardMediaPropsO
        => CardMediaProps o -> Array ReactElement -> ReactElement
cardMedia = createElement cardMediaImpl
