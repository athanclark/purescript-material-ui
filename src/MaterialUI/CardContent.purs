module MaterialUI.CardContent
  ( cardContent, CardContentProps, CardContentPropsO, CardContentClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import cardContentImpl :: forall props. ReactClass props


type CardContentProps o =
  {
  | o }


type CardContentPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  )

type CardContentClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . SubRow classes CardContentClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardContent :: forall o componentProps
         . SubRow o (CardContentPropsO componentProps)
        => CardContentProps o -> Array ReactElement -> ReactElement
cardContent = unsafeCreateElement cardContentImpl
