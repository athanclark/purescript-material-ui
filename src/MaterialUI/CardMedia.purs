module MaterialUI.CardMedia
  ( cardMedia, CardMediaProps, CardMediaPropsO, CardMediaClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
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


cardMedia :: forall o
         . Subrow o CardMediaPropsO
        => CardMediaProps o -> Array ReactElement -> ReactElement
cardMedia = createElement cardMediaImpl
