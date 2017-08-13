module MaterialUI.CardHeader
  ( cardHeader, CardHeaderProps, CardHeaderPropsO, CardHeaderClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
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


cardHeader :: forall o classes
         . Subrow o CardHeaderPropsO
        => CardHeaderProps o -> Array ReactElement -> ReactElement
cardHeader = createElement cardHeaderImpl
