module MaterialUI.CardHeader
  ( cardHeader, CardHeaderProps, CardHeaderPropsO, CardHeaderClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, unsafeCreateElement, ReactElement)
import Row.Class (class SubRow)
import Unsafe.Coerce (unsafeCoerce)


foreign import cardHeaderImpl :: forall props. ReactClass props


type CardHeaderProps o =
  {
  | o }


type CardHeaderPropsO =
  ( avatar :: ReactElement
  , classes :: Classes
  , subheader :: ReactElement
  , title :: ReactElement
  )

type CardHeaderClasses =
  ( root :: Styles
  , avatar :: Styles
  , content :: Styles
  )

createClasses :: forall classes
               . SubRow classes CardHeaderClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardHeader :: forall o
         . SubRow o CardHeaderPropsO
        => CardHeaderProps o -> Array ReactElement -> ReactElement
cardHeader = unsafeCreateElement cardHeaderImpl
