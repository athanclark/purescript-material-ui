module MaterialUI.CardMedia
  ( cardMedia, CardMediaProps, CardMediaPropsO, CardMediaClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import cardMediaImpl :: forall props. ReactClass props


type CardMediaProps o =
  {
  | o }


type CardMediaPropsO componentProps =
  ( classes :: Classes
  , component :: ReactClass componentProps
  , image :: String
  , src :: String
  )

type CardMediaClasses =
  ( root :: Styles
  , media :: Styles
  )

createClasses :: forall classes
               . SubRow classes CardMediaClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardMedia :: forall o componentProps
         . SubRow o (CardMediaPropsO componentProps)
        => CardMediaProps o -> Array ReactElement -> ReactElement
cardMedia = unsafeCreateElement cardMediaImpl
