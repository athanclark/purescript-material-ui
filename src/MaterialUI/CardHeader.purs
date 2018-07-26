module MaterialUI.CardHeader
  ( cardHeader, CardHeaderProps, CardHeaderPropsO, CardHeaderClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import React (ReactClass, createElement, ReactElement)
import Data.Record.Class (class Subrow)
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
               . Subrow classes CardHeaderClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


cardHeader :: forall o
         . Subrow o CardHeaderPropsO
        => CardHeaderProps o -> Array ReactElement -> ReactElement
cardHeader = createElement cardHeaderImpl
