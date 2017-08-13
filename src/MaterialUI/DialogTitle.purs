module MaterialUI.DialogTitle
  ( dialogTitle, DialogTitleProps, DialogTitlePropsO, DialogTitleClasses
  , createClasses
  ) where

import MaterialUI.Types (Styles, Classes)

import Prelude
import React (Event, ReactClass, createElement, ReactElement, ReactProps, ReactState, ReactRefs, ReadOnly, ReadWrite)
import Data.Record.Class (class Subrow)
import Control.Monad.Eff.Uncurried (EffFn1)
import Unsafe.Coerce (unsafeCoerce)


foreign import dialogTitleImpl :: forall props. ReactClass props


type DialogTitleProps o =
  {
  | o }


type DialogTitlePropsO =
  ( children :: Array ReactElement
  , classes :: Classes
  , disableTypography :: Boolean
  )

type DialogTitleClasses =
  ( root :: Styles
  )

createClasses :: forall classes
               . Subrow classes DialogTitleClasses
              => { | classes } -> Classes
createClasses = unsafeCoerce


dialogTitle :: forall o
         . Subrow o DialogTitlePropsO
        => DialogTitleProps o -> Array ReactElement -> ReactElement
dialogTitle = createElement dialogTitleImpl
