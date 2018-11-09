module MaterialUI.CardActionArea
  ( cardActionArea, CardActionAreaProps, CardActionAreaPropsO, CardActionAreaClasses
  , createClasses
  ) where

import MaterialUI.ButtonBase (ButtonBasePropsO)
import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Type.Row (class RowToList, class ListToRow, class RowListRemove, type (+))
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


cardActionArea :: forall o componentProps touchRippleProps buttonBaseList buttonBaseList'
                  buttonBaseProps
                . SubRow o (CardActionAreaPropsO + buttonBaseProps)
               => RowToList (ButtonBasePropsO componentProps touchRippleProps ()) buttonBaseList
               => RowListRemove "classes" buttonBaseList buttonBaseList'
               => ListToRow buttonBaseList' buttonBaseProps
               => CardActionAreaProps o -> Array ReactElement -> ReactElement
cardActionArea = unsafeCreateElement cardActionAreaImpl
