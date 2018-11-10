module MaterialUI.CardActionArea
  ( cardActionArea, CardActionAreaProps, CardActionAreaPropsO, CardActionAreaClasses
  , createClasses
  ) where

import MaterialUI.ButtonBase (ButtonBasePropsO)
import MaterialUI.Types (Styles, Classes, class RemoveSymbol)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Type.Row (type (+))
import Unsafe.Coerce (unsafeCoerce)


foreign import cardActionAreaImpl :: forall props. ReactClass props


type CardActionAreaProps o =
  {
  | o }


type CardActionAreaPropsO r =
  ( classes :: Classes
  | r)

type CardActionAreaClasses =
  ( root :: Styles
  , focusVisible :: Styles
  , focusHighlight :: Styles
  )

createClasses :: forall classes
               . SubRow classes CardActionAreaClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardActionArea :: forall o componentProps touchRippleProps
                  buttonBaseProps
                . SubRow o (CardActionAreaPropsO + buttonBaseProps)
               => RemoveSymbol "classes" (ButtonBasePropsO componentProps touchRippleProps) buttonBaseProps
               => CardActionAreaProps o -> Array ReactElement -> ReactElement
cardActionArea = unsafeCreateElement cardActionAreaImpl
