module MaterialUI.CardContent
  ( cardContent, CardContentProps, CardContentPropsO, CardContentClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
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


cardContent :: forall o
         . Subrow o CardContentPropsO
        => CardContentProps o -> Array ReactElement -> ReactElement
cardContent = createElement cardContentImpl
