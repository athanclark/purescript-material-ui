module MaterialUI.Card
  ( card, CardProps, CardPropsO, CardClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
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
               . SubRow classes CardClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


card :: forall o
         . SubRow o CardPropsO
        => CardProps o -> Array ReactElement -> ReactElement
card = unsafeCreateElement cardImpl
